package com.medical.paymentservice.models;

import jakarta.persistence.*;
import java.time.Instant;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Getter
@Setter
@EntityListeners(AuditingEntityListener.class)
public class Payment {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  @Column(nullable = false, unique = true)
  private String appointmentId;
  @Column(unique = true)
  private String gatewayReference;
  private Long amount;
  private String description;
  @Enumerated(EnumType.STRING)
  private Gateway gateway;
  @Column(length = 2048)
  private String checkoutUrl;
  private String currency;

  private String patientName;
  private String doctorName;
  private String consultationPurpose;

  @Enumerated(EnumType.STRING)
  private PaymentStatus paymentStatus;
  @Column(nullable = false)
  private String idempotencyKey;
  @CreatedDate
  private Instant createdAt;
  @LastModifiedDate
  private Instant updatedAt;

  @Override
  public String toString() {
    return "Payment{" +
        "id=" + id +
        ", appointmentId='" + appointmentId + '\'' +
        ", gatewayReference='" + gatewayReference + '\'' +
        ", amount=" + amount +
        ", description='" + description + '\'' +
        ", gateway=" + gateway +
        ", checkoutUrl='" + checkoutUrl + '\'' +
        ", currency='" + currency + '\'' +
        ", paymentStatus=" + paymentStatus +
        ", idempotencyKey='" + idempotencyKey + '\'' +
        ", createdAt=" + createdAt +
        ", updatedAt=" + updatedAt +
        '}';
  }
}
