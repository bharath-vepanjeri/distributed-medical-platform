package com.medical.paymentservice.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.medical.paymentservice.service.PaymentService;
import com.stripe.exception.StripeException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/webhook")
public class StripeWebhookController {

  private final PaymentService paymentService;

  public StripeWebhookController(PaymentService paymentService) {
    this.paymentService = paymentService;
  }

  @PostMapping("/stripe")
  public ResponseEntity<String> handleWebhook(
      @RequestBody String payload, @RequestHeader("Stripe-Signature") String signature)
      throws StripeException, JsonProcessingException {
    return paymentService.processStripeEvent(payload, signature);
  }
}
