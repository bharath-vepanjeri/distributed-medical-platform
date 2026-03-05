package com.medical.notificationService.consumers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.medical.notificationService.dtos.WelcomeEmail;
import com.medical.notificationService.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class WelcomeEmailConsumer {

  private final EmailService emailService;
  private final ObjectMapper objectMapper;

  public WelcomeEmailConsumer(EmailService emailService, ObjectMapper objectMapper) {
    this.emailService = emailService;
    this.objectMapper = objectMapper;
  }

  @KafkaListener(topics = "welcomeEmail")
  public void consumeWelcomeEmail(String message) {
    try {
      WelcomeEmail welcomeEmail = objectMapper.readValue(message, WelcomeEmail.class);
      emailService.sendWelcomeEmail(welcomeEmail.getEmail());
    } catch (Exception e) {
      log.error(
          "Failed to process welcome email. Message: {}, Error: {}", message, e.getMessage(), e);
    }
  }
}
