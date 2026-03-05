package com.medical.paymentservice.controllers;

import com.medical.paymentservice.dtos.PaymentRequest;
import com.medical.paymentservice.dtos.PaymentResponse;
import com.medical.paymentservice.service.PaymentService;
import com.stripe.exception.StripeException;
import jakarta.validation.Valid;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/payments")
@Validated
public class PaymentController {

  PaymentService paymentService;

  public PaymentController(PaymentService paymentService) {
    this.paymentService = paymentService;
  }

  @PostMapping("/initiate")
  public PaymentResponse createPaymentLink(@RequestBody @Valid PaymentRequest paymentRequest)
      throws StripeException {
    return paymentService.createPayment(paymentRequest);
  }
}
