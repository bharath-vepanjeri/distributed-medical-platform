package com.medical.core.dto;

import com.medical.core.entity.PaymentStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentResponse {

  // Internal UUID / ID generated in Payment Service
  private String paymentId;

  // Business reference
  private String appointmentId;
  // Hosted checkout page (Stripe session URL)
  private String checkoutUrl;
  // Current state of payment
  private PaymentStatus status;

  @Override
  public String toString() {
    return "PaymentResponse{"
        + "paymentId='"
        + paymentId
        + '\''
        + ", appointmentId='"
        + appointmentId
        + '\''
        + ", checkoutUrl='"
        + checkoutUrl
        + '\''
        + ", status="
        + status
        + '}';
  }
}
