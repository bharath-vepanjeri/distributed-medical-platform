package com.medical.core.entity;

import jakarta.persistence.*;
import java.time.Instant;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(
    name = "appointment",
    uniqueConstraints = {@UniqueConstraint(columnNames = {"doctor_id", "appointment_time"})})
@Getter
@Setter
public class Appointment {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "patient_id")
  private String patientId;

  @Version
  @Column(name = "version")
  private Long version;

  @Column(name = "doctor_id")
  private String doctorId;

  @Column(name = "appointment_time")
  private Instant appointmentTime;

  @Enumerated(EnumType.STRING)
  @Column(name = "status")
  private AppointmentStatus status;

  @Column(name = "payment_id")
  private String paymentId;

  @Column(name = "amount")
  private Long amount;

  @Override
  public String toString() {
    return "Appointment{"
        + "id="
        + id
        + ", patientId='"
        + patientId
        + '\''
        + ", doctorId='"
        + doctorId
        + '\''
        + ", appointmentTime="
        + appointmentTime
        + ", status="
        + status
        + ", paymentId='"
        + paymentId
        + '\''
        + ", amount="
        + amount
        + '}';
  }
}
