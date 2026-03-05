package com.medical.paymentservice.dtos;

import com.medical.paymentservice.models.Payment;
import java.time.Instant;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class GatewayResponse {

  private String paymentReference; // session id / order id
  private String checkoutUrl; // hosted page
  private Instant expiresAt;

  public static void enrichWithGatewayResponse(Payment payment, GatewayResponse gatewayResponse) {
    payment.setGatewayReference(gatewayResponse.getPaymentReference());
    payment.setUpdatedAt(Instant.now());
  }

  @Override
  public String toString() {
    return "GatewayResponse{"
        + "paymentReference='"
        + paymentReference
        + '\''
        + ", checkoutUrl='"
        + checkoutUrl
        + '\''
        + ", expiresAt="
        + expiresAt
        + '}';
  }
}
