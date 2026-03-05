package com.medical.core.exception;

public class PaymentServiceUnavailableException extends RuntimeException {
  public PaymentServiceUnavailableException() {
    super("Payment service is currently unavailable. Please try again.");
  }
}
