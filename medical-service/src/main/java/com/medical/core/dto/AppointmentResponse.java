package com.medical.core.dto;

import com.medical.core.entity.Appointment;
import com.medical.core.entity.AppointmentStatus;
import java.time.Instant;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppointmentResponse {

  private String email;

  private Instant appointmentTime;

  private AppointmentStatus status;

  private Long amount;

  // ✅ Static Mapper Method
  public static AppointmentResponse from(Appointment appointment) {

    AppointmentResponse response = new AppointmentResponse();

    response.setAppointmentTime(appointment.getAppointmentTime());
    response.setStatus(appointment.getStatus());
    response.setAmount(appointment.getAmount());

    return response;
  }
}
