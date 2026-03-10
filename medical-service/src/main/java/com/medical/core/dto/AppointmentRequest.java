package com.medical.core.dto;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppointmentRequest {
  @NotNull(message = "Doctor ID is required")
  private Long doctorId;

  @NotNull(message = "Appointment time is required")
  @Future(message = "Appointment must be in the future")
  private LocalDateTime appointmentTime;

  @NotBlank(message = "Reason is required")
  private String notes;

  @Override
  public String toString() {
    return "AppointmentRequest{" +
        "doctorId='" + doctorId + '\'' +
        ", appointmentTime=" + appointmentTime +
        ", notes='"
        + notes + '\'' +
        '}';
  }

}
