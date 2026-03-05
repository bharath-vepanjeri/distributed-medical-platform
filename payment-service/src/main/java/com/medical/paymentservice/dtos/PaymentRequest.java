package com.medical.paymentservice.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentRequest {
  @NotBlank private String appointmentId;

  @NotNull private Long amount;

  @NotBlank private String currency;

  @NotBlank private String description;

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
