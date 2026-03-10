package com.medical.paymentservice.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.medical.paymentservice.service.PaymentService;
import com.stripe.exception.StripeException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/webhook")
@Tag(name = "Stripe Webhook", description = "Handles incoming Stripe webhook events for payment status updates")
public class StripeWebhookController {

  private final PaymentService paymentService;

  public StripeWebhookController(PaymentService paymentService) {
    this.paymentService = paymentService;
  }

  @PostMapping("/stripe")
  @Operation(summary = "Handle Stripe webhook", description = "Receives Stripe events — updates payment status and notifies medical service via Kafka.")
  public ResponseEntity<String> handleWebhook(
      @RequestBody String payload, @RequestHeader("Stripe-Signature") String signature)
      throws StripeException, JsonProcessingException {
    return paymentService.processStripeEvent(payload, signature);
  }
}
