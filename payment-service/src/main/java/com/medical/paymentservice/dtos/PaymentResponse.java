package com.medical.paymentservice.dtos;

import com.medical.paymentservice.models.Payment;
import com.medical.paymentservice.models.PaymentStatus;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class PaymentResponse {

  private String paymentId;
  private String appointmentId;
  private String checkoutUrl;
  private PaymentStatus status;

  public static PaymentResponse from(Payment payment) {
    return PaymentResponse.builder()
        .paymentId(payment.getId().toString())
        .appointmentId(payment.getAppointmentId())
        .checkoutUrl(payment.getCheckoutUrl())
        .status(payment.getPaymentStatus())
        .build();
  }
}
