package com.medical.notificationService.dtos;

import java.time.Instant;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Appointment {

  private String email;

  private Instant appointmentTime;

  private AppointmentStatus status;

  private Long amount;
}
