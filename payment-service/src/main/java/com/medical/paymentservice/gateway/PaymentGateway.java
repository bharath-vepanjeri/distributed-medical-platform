package com.medical.paymentservice.gateway;

import com.medical.paymentservice.dtos.GatewayResponse;
import com.medical.paymentservice.models.Payment;
import com.stripe.exception.StripeException;

public interface PaymentGateway {
  GatewayResponse createCheckoutSession(Payment payment) throws StripeException;
}
