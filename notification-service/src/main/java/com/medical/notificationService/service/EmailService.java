package com.medical.notificationService.service;

import com.medical.notificationService.dtos.Appointment;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@Slf4j
@Service
public class EmailService {

  private final JavaMailSender mailSender;
  private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm a")
      .withZone(ZoneId.of("Asia/Kolkata"));

  public EmailService(JavaMailSender mailSender) {
    this.mailSender = mailSender;
  }

  public void sendWelcomeEmail(String toEmail) {
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
      helper.setTo(toEmail);
      helper.setSubject("Welcome to MediCare Platform");
      helper.setText(buildWelcomeHtml(toEmail), true);
      mailSender.send(message);
    } catch (MailException | MessagingException e) {
      log.error("Failed to send welcome email to: {}. Error: {}", toEmail, e.getMessage(), e);
    }
  }

  public void sendAppointmentBooked(Appointment appointment) {
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
      helper.setTo(appointment.getEmail());
      helper.setSubject("Appointment Confirmed");
      helper.setText(buildBookingConfirmedHtml(appointment), true);
      mailSender.send(message);
    } catch (MailException | MessagingException e) {
      log.error("Failed to send booking confirmation to: {}. Error: {}",
          appointment.getEmail(), e.getMessage(), e);
    }
  }

  public void sendAppointmentCancelled(Appointment appointment) {
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
      helper.setTo(appointment.getEmail());
      helper.setSubject("Appointment Cancelled");
      helper.setText(buildCancelledHtml(appointment), true);
      mailSender.send(message);
    } catch (MailException | MessagingException e) {
      log.error("Failed to send cancellation email to: {}. Error: {}",
          appointment.getEmail(), e.getMessage(), e);
    }
  }

  private String buildWelcomeHtml(String email) {
    return """
        <html>
        <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;">
          <div style="max-width: 600px; margin: auto; background: white; border-radius: 8px; padding: 30px;">
            <h2 style="color: #2c7be5;">Welcome to MediCare </h2>
            <p>Hi there,</p>
            <p>Your account has been successfully created for <strong>%s</strong>.</p>
            <p>You can now:</p>
            <ul>
              <li>Book appointments with verified doctors</li>
              <li>Search symptoms and medicines</li>
              <li>Manage your health records</li>
            </ul>
            <p style="margin-top: 30px; color: #888; font-size: 12px;">
              If you did not create this account, please contact support immediately.
            </p>
          </div>
        </body>
        </html>
        """.formatted(email);
  }

  private String buildBookingConfirmedHtml(Appointment appointment) {
    String formattedTime = appointment.getAppointmentTime() != null
        ? FORMATTER.format(appointment.getAppointmentTime())
        : "N/A";
    String amount = appointment.getAmount() != null
        ? "₹" + (appointment.getAmount() / 100)
        : "N/A";

    return """
        <html>
        <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;">
          <div style="max-width: 600px; margin: auto; background: white; border-radius: 8px; padding: 30px;">
            <h2 style="color: #28a745;">Appointment Confirmed</h2>
            <p>Your appointment has been successfully booked. Here are your details:</p>
            <table style="width: 100%%; border-collapse: collapse; margin-top: 20px;">
              <tr style="background-color: #f8f9fa;">
                <td style="padding: 10px; border: 1px solid #dee2e6;"><strong>Appointment Time</strong></td>
                <td style="padding: 10px; border: 1px solid #dee2e6;">%s (IST)</td>
              </tr>
              <tr>
                <td style="padding: 10px; border: 1px solid #dee2e6;"><strong>Amount Paid</strong></td>
                <td style="padding: 10px; border: 1px solid #dee2e6;">%s</td>
              </tr>
              <tr style="background-color: #f8f9fa;">
                <td style="padding: 10px; border: 1px solid #dee2e6;"><strong>Status</strong></td>
                <td style="padding: 10px; border: 1px solid #dee2e6; color: #28a745;"><strong>CONFIRMED</strong></td>
              </tr>
            </table>
            <p style="margin-top: 20px;">Please arrive 10 minutes before your scheduled time.</p>
            <p style="margin-top: 30px; color: #888; font-size: 12px;">
              This is an automated message. Please do not reply to this email.
            </p>
          </div>
        </body>
        </html>
        """.formatted(formattedTime, amount);
  }

  private String buildCancelledHtml(Appointment appointment) {
    String formattedTime = appointment.getAppointmentTime() != null
        ? FORMATTER.format(appointment.getAppointmentTime())
        : "N/A";

    return """
        <html>
        <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;">
          <div style="max-width: 600px; margin: auto; background: white; border-radius: 8px; padding: 30px;">
            <h2 style="color: #dc3545;">Appointment Cancelled</h2>
            <p>Unfortunately your appointment has been cancelled.</p>
            <table style="width: 100%%; border-collapse: collapse; margin-top: 20px;">
              <tr style="background-color: #f8f9fa;">
                <td style="padding: 10px; border: 1px solid #dee2e6;"><strong>Appointment Time</strong></td>
                <td style="padding: 10px; border: 1px solid #dee2e6;">%s (IST)</td>
              </tr>
              <tr>
                <td style="padding: 10px; border: 1px solid #dee2e6;"><strong>Status</strong></td>
                <td style="padding: 10px; border: 1px solid #dee2e6; color: #dc3545;"><strong>CANCELLED</strong></td>
              </tr>
            </table>
            <p style="margin-top: 20px;">
              If you believe this is an error or need to rebook, please contact our support team.
            </p>
            <p style="margin-top: 30px; color: #888; font-size: 12px;">
              This is an automated message. Please do not reply to this email.
            </p>
          </div>
        </body>
        </html>
        """.formatted(formattedTime);
  }
}
