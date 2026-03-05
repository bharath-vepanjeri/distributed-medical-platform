package com.medical.core.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentRequest {

  // Business reference from Medical Service
  // Used as idempotency key
  private String appointmentId;
  // Amount in smallest currency unit
  // INR: 50000 = ₹500
  private Long amount;
  // ISO currency code
  // Example: "inr", "usd"
  private String currency;
  // Visible in Stripe checkout page
  private String description;

  @Override
  public String toString() {
    return "PaymentRequest{"
        + "appointmentId='"
        + appointmentId
        + '\''
        + ", amount="
        + amount
        + ", currency='"
        + currency
        + '\''
        + ", description='"
        + description
        + '\''
        + '}';
  }
}
