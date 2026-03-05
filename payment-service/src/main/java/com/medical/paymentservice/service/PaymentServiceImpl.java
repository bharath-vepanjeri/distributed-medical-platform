package com.medical.paymentservice.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.medical.paymentservice.dtos.GatewayResponse;
import com.medical.paymentservice.dtos.PaymentRequest;
import com.medical.paymentservice.dtos.PaymentResponse;
import com.medical.paymentservice.gateway.PaymentGateway;
import com.medical.paymentservice.mapper.PaymentMapper;
import com.medical.paymentservice.models.Payment;
import com.medical.paymentservice.models.PaymentStatus;
import com.medical.paymentservice.repository.PaymentRepository;
import com.stripe.exception.StripeException;
import com.stripe.model.Event;
import com.stripe.model.PaymentIntent;
import com.stripe.model.checkout.Session;
import com.stripe.model.checkout.SessionCollection;
import com.stripe.net.Webhook;
import com.stripe.param.checkout.SessionListParams;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PaymentServiceImpl implements PaymentService {

  private final PaymentGateway paymentGateway;
  private final PaymentRepository paymentRepository;
  private final String webhookSecret;
  private final KafkaTemplate<String, String> kafkaTemplate;
  private final ObjectMapper objectMapper;

  public PaymentServiceImpl(
      PaymentRepository paymentRepository,
      PaymentGateway paymentGateway,
      @Value("${stripe.webhook}") String webhookSecret,
      KafkaTemplate<String, String> kafkaTemplate,
      ObjectMapper objectMapper) {
    this.paymentRepository = paymentRepository;
    this.paymentGateway = paymentGateway;
    this.webhookSecret = webhookSecret;
    this.kafkaTemplate = kafkaTemplate;
    this.objectMapper = objectMapper;
  }

  @Override
  @Transactional
  public PaymentResponse createPayment(PaymentRequest request) throws StripeException {

    Optional<Payment> existing = paymentRepository.findByAppointmentId(request.getAppointmentId());
    if (existing.isPresent()) {
      return PaymentResponse.from(existing.get());
    }

    Payment payment = PaymentMapper.toEntity(request);
    paymentRepository.save(payment);

    GatewayResponse gatewayResponse = paymentGateway.createCheckoutSession(payment);

    payment.setGatewayReference(gatewayResponse.getPaymentReference());
    payment.setCheckoutUrl(gatewayResponse.getCheckoutUrl());

    return PaymentResponse.from(payment);
  }

  @Override
  public void updateMedicalService(Payment payment) throws JsonProcessingException {
    kafkaTemplate.send(
        "appointment-status", objectMapper.writeValueAsString(PaymentResponse.from(payment)));
  }

  @Transactional
  public ResponseEntity<String> processStripeEvent(String payload, String signature)
      throws StripeException, JsonProcessingException {

    Event event = Webhook.constructEvent(payload, signature, webhookSecret);
    Payment payment = null;

    switch (event.getType()) {
      case "checkout.session.completed" -> {
        Session session = (Session) event.getDataObjectDeserializer().getObject().orElseThrow();
        String stripeSessionId = session.getId();

        payment =
            paymentRepository
                .findByGatewayReference(stripeSessionId)
                .orElseThrow(
                    () ->
                        new IllegalStateException(
                            "Payment not found for session: " + stripeSessionId));

        if (payment.getPaymentStatus() == PaymentStatus.SUCCESS) {
          return ResponseEntity.ok("Already processed");
        }
        payment.setPaymentStatus(PaymentStatus.SUCCESS);
      }

      case "payment_intent.payment_failed" -> {
        PaymentIntent intent =
            (PaymentIntent) event.getDataObjectDeserializer().getObject().orElseThrow();

        SessionListParams params =
            SessionListParams.builder().setPaymentIntent(intent.getId()).build();

        SessionCollection sessions = Session.list(params);
        String paymentId = sessions.getData().get(0).getMetadata().get("paymentId");

        payment =
            paymentRepository
                .findById(Long.valueOf(paymentId))
                .orElseThrow(
                    () -> new IllegalStateException("Payment not found for id: " + paymentId));

        if (payment.getPaymentStatus() == PaymentStatus.FAILED) {
          return ResponseEntity.ok("Already processed");
        }
        payment.setPaymentStatus(PaymentStatus.FAILED);
      }

      default -> {
        return ResponseEntity.ok("Event ignored");
      }
    }

    paymentRepository.save(payment);
    updateMedicalService(payment);
    return ResponseEntity.ok("Processed successfully");
  }
}
