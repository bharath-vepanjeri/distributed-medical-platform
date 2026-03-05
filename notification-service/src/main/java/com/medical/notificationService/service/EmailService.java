package com.medical.notificationService.service;

import com.medical.notificationService.dtos.Appointment;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class EmailService {

  private final JavaMailSender mailSender;

  public EmailService(JavaMailSender mailSender) {
    this.mailSender = mailSender;
  }

  public void sendWelcomeEmail(String toEmail) {
    try {
      SimpleMailMessage message = new SimpleMailMessage();
      message.setTo(toEmail);
      message.setSubject("Welcome");
      message.setText("Your account was created successfully.");
      mailSender.send(message);
    } catch (MailException e) {
      log.error("Failed to send welcome email to: {}. Error: {}", toEmail, e.getMessage(), e);
    }
  }

  public void sendAppointmentBooked(Appointment appointment) {
    try {
      SimpleMailMessage message = new SimpleMailMessage();
      message.setTo(appointment.getEmail());
      message.setSubject("Booking confirmed");
      message.setText(
          "Your booking is confirmed\nAppointment time : " + appointment.getAppointmentTime());
      mailSender.send(message);
    } catch (MailException e) {
      log.error(
          "Failed to send booking confirmation to: {}. Error: {}",
          appointment.getEmail(),
          e.getMessage(),
          e);
    }
  }

  public void sendAppointmentCancelled(Appointment appointment) {
    try {
      SimpleMailMessage message = new SimpleMailMessage();
      message.setTo(appointment.getEmail());
      message.setSubject("Booking Cancelled");
      message.setText("Unfortunately your booking is cancelled");
      mailSender.send(message);
    } catch (MailException e) {
      log.error(
          "Failed to send cancellation email to: {}. Error: {}",
          appointment.getEmail(),
          e.getMessage(),
          e);
    }
  }
}
