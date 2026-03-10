package com.medical.notificationService.consumers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.medical.notificationService.dtos.Appointment;
import com.medical.notificationService.dtos.AppointmentStatus;
import com.medical.notificationService.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class AppointmentConsumer {

  private final ObjectMapper objectMapper;
  private final EmailService emailService;

  public AppointmentConsumer(ObjectMapper objectMapper, EmailService emailService) {
    this.objectMapper = objectMapper;
    this.emailService = emailService;
  }

  @KafkaListener(topics = "appointment-status-email")
  public void updateAppointmentStatus(String message) {
    try {
      Appointment appointment = objectMapper.readValue(message, Appointment.class);

      if (appointment.getStatus() == AppointmentStatus.CONFIRMED) {
        emailService.sendAppointmentBooked(appointment);
      } else {
        emailService.sendAppointmentCancelled(appointment);
      }
    } catch (JsonProcessingException e) {
      log.error(
          "Failed to process appointment status email. Message: {}, Error: {}",
          message,
          e.getMessage(),
          e);
    } catch (Exception e) {
      log.error(
          "Unexpected error processing appointment email. Message: {}, Error: {}",
          message,
          e.getMessage(),
          e);
    }
  }
}
