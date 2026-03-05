package com.medical.paymentservice.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.medical.paymentservice.dtos.PaymentRequest;
import com.medical.paymentservice.dtos.PaymentResponse;
import com.medical.paymentservice.models.Payment;
import com.stripe.exception.StripeException;
import org.springframework.http.ResponseEntity;

public interface PaymentService {
  PaymentResponse createPayment(PaymentRequest request) throws StripeException;

  void updateMedicalService(Payment payment) throws JsonProcessingException;

  ResponseEntity<String> processStripeEvent(String payload, String signature)
      throws StripeException, JsonProcessingException;
}
