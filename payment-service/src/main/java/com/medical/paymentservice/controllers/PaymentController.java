package com.medical.paymentservice.controllers;

import com.medical.paymentservice.dtos.PaymentRequest;
import com.medical.paymentservice.dtos.PaymentResponse;
import com.medical.paymentservice.service.PaymentService;
import com.stripe.exception.StripeException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/payments")
@Validated
@Tag(name = "Payments", description = "Initiate Stripe payment for appointments")
public class PaymentController {

  private final PaymentService paymentService;

  public PaymentController(PaymentService paymentService) {
    this.paymentService = paymentService;
  }

  @PostMapping("/initiate")
  @Operation(summary = "Initiate payment", description = "Creates a Stripe checkout session for an appointment.")
  public PaymentResponse createPaymentLink(@RequestBody @Valid PaymentRequest paymentRequest)
      throws StripeException {
    return paymentService.createPayment(paymentRequest);
  }
}
