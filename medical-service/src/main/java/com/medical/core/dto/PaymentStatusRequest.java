package com.medical.core.dto;

import com.medical.core.entity.PaymentStatus;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class PaymentStatusRequest {
  @NotNull private String paymentId;
  @NotNull private String appointmentId;
  private String checkoutUrl;
  private PaymentStatus status;
}
