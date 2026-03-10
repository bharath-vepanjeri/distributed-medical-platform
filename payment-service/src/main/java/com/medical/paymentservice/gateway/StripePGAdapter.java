package com.medical.paymentservice.gateway;

import com.medical.paymentservice.dtos.GatewayResponse;
import com.medical.paymentservice.models.Payment;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.net.RequestOptions;
import com.stripe.param.checkout.SessionCreateParams;
import java.time.Instant;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class StripePGAdapter implements PaymentGateway {

  @Value("${stripe.key}")
  private String stripeKey;

  @Override
  public GatewayResponse createCheckoutSession(Payment payment) throws StripeException {

    Stripe.apiKey = stripeKey;
    SessionCreateParams params = SessionCreateParams.builder()
        .setMode(SessionCreateParams.Mode.PAYMENT)
        .setSuccessUrl("https://medical.com/success?session_id={CHECKOUT_SESSION_ID}")
        .setCancelUrl("https://medical.com/cancel")
        .addLineItem(
            SessionCreateParams.LineItem.builder()
                .setQuantity(1L)
                .setPriceData(
                    SessionCreateParams.LineItem.PriceData.builder()
                        .setCurrency(payment.getCurrency())
                        .setUnitAmount(payment.getAmount())
                        .setProductData(
                            SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                .setName("Doctor Consultation - Dr. " + payment.getDoctorName())
                                .setDescription(
                                    "Patient: " + payment.getPatientName()
                                        + " | Purpose: " + payment.getConsultationPurpose())
                                .build())
                        .build())
                .build())
        .putMetadata("appointmentId", payment.getAppointmentId())
        .putMetadata("paymentId", payment.getId().toString())
        .putMetadata("patientName", payment.getPatientName())
        .putMetadata("doctorName", payment.getDoctorName())
        .putMetadata("consultationPurpose", payment.getConsultationPurpose())
        .build();

    RequestOptions options = RequestOptions.builder().setIdempotencyKey(payment.getIdempotencyKey()).build();

    Session session = Session.create(params, options);

    return GatewayResponse.builder()
        .paymentReference(session.getId())
        .checkoutUrl(session.getUrl())
        .expiresAt(Instant.ofEpochSecond(session.getExpiresAt()))
        .build();
  }
}
