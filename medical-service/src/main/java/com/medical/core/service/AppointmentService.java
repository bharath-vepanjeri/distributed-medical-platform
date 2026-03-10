package com.medical.core.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.medical.core.dto.*;
import com.medical.core.entity.*;
import com.medical.core.exception.AppointmentAlreadyExistsException;
import com.medical.core.exception.InvalidDoctorException;
import com.medical.core.exception.UserNotFoundException;
import com.medical.core.repository.AppointmentRepository;
import com.medical.core.repository.UserRepository;
import java.util.Optional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class AppointmentService {

  private final AppointmentRepository appointmentRepository;
  private final PaymentClient paymentClient;
  private final KafkaTemplate<String, String> kafkaTemplate;
  private final ObjectMapper objectMapper;
  private final UserRepository userRepository;

  @Value("${appointment.consultation.fee:50000}")
  private Long consultationFee;

  public AppointmentService(
      AppointmentRepository appointmentRepository,
      PaymentClient paymentClient,
      KafkaTemplate<String, String> kafkaTemplate,
      ObjectMapper objectMapper,
      UserRepository userRepository) {
    this.appointmentRepository = appointmentRepository;
    this.paymentClient = paymentClient;
    this.kafkaTemplate = kafkaTemplate;
    this.objectMapper = objectMapper;
    this.userRepository = userRepository;
  }

  @Transactional
  public PaymentResponse createAppointment(String patientId, AppointmentRequest request) {
    log.info("Creating appointment for patientId={}, doctorId={}", patientId, request.getDoctorId());

    User doctor = userRepository.findById(request.getDoctorId())
        .orElseThrow(() -> new UserNotFoundException(request.getDoctorId().toString()));

    if (doctor.getRole() != Role.DOCTOR) {
      throw new InvalidDoctorException(request.getDoctorId().toString());
    }

    User patient = userRepository.findById(Long.valueOf(patientId))
        .orElseThrow(() -> new UserNotFoundException(patientId));

    Appointment appointment = createAppointmentRecord(patientId, request, doctor);

    try {
      PaymentResponse paymentResponse = initiatePayment(appointment, doctor, patient);
      appointment.setPaymentId(paymentResponse.getPaymentId());
      appointmentRepository.save(appointment);
      log.info("Appointment created id={}, paymentId={}", appointment.getId(), paymentResponse.getPaymentId());
      return paymentResponse;
    } catch (Exception ex) {
      log.error("Payment failed for appointmentId={}, cancelling", appointment.getId(), ex);
      appointment.setStatus(AppointmentStatus.CANCELLED);
      appointmentRepository.save(appointment);
      throw ex;
    }
  }

  private Appointment createAppointmentRecord(String patientId, AppointmentRequest request, User doctor) {
    Appointment appointment = new Appointment();
    appointment.setPatientId(Long.valueOf(patientId));
    appointment.setDoctorId(doctor.getId());
    appointment.setAppointmentTime(request.getAppointmentTime().toInstant(java.time.ZoneOffset.UTC));
    appointment.setStatus(AppointmentStatus.PENDING_PAYMENT);
    appointment.setAmount(consultationFee);
    appointment.setNotes(request.getNotes());

    try {
      return appointmentRepository.save(appointment);
    } catch (DataIntegrityViolationException ex) {
      throw new AppointmentAlreadyExistsException();
    }
  }

  private PaymentResponse initiatePayment(Appointment appointment, User doctor, User patient) {
    PaymentRequest paymentRequest = new PaymentRequest();
    paymentRequest.setAppointmentId(appointment.getId().toString());
    paymentRequest.setAmount(appointment.getAmount());
    paymentRequest.setCurrency("inr");
    paymentRequest.setDescription("Doctor Consultation");
    paymentRequest.setPatientName(patient.getName());
    paymentRequest.setDoctorName(doctor.getName());
    paymentRequest.setConsultationPurpose(appointment.getNotes());

    return paymentClient.createPayment(paymentRequest);
  }

  @Transactional
  @KafkaListener(topics = "appointment-status", groupId = "appointment")
  public void updateAppointment(String message) {
    log.info("Received appointment status message: {}", message);

    PaymentStatusRequest paymentStatusRequest;
    try {
      paymentStatusRequest = objectMapper.readValue(message, PaymentStatusRequest.class);
    } catch (JsonProcessingException e) {
      log.error("Failed to parse appointment status message: {}", message, e);
      return;
    }

    Optional<Appointment> optionalAppointment = appointmentRepository
        .findByPaymentId(paymentStatusRequest.getPaymentId());

    if (optionalAppointment.isEmpty()) {
      log.warn("No appointment found for paymentId={}", paymentStatusRequest.getPaymentId());
      return;
    }

    Appointment appointment = optionalAppointment.get();

    if (appointment.getStatus() == AppointmentStatus.CONFIRMED) {
      log.info("Appointment {} already confirmed, skipping", appointment.getId());
      return;
    }

    if (paymentStatusRequest.getStatus() == PaymentStatus.SUCCESS) {
      appointment.setStatus(AppointmentStatus.CONFIRMED);
    } else if (paymentStatusRequest.getStatus() == PaymentStatus.FAILED) {
      appointment.setStatus(AppointmentStatus.CANCELLED);
    } else {
      return;
    }

    appointmentRepository.save(appointment);
    log.info("Appointment {} status updated to {}", appointment.getId(), appointment.getStatus());

    User user = userRepository.findById(appointment.getPatientId())
        .orElseThrow(() -> new IllegalStateException("User not found for patientId: " + appointment.getPatientId()));

    AppointmentResponse from = AppointmentResponse.from(appointment);
    from.setEmail(user.getEmail());

    try {
      kafkaTemplate.send("appointment-status-email", objectMapper.writeValueAsString(from));
    } catch (JsonProcessingException e) {
      log.error("Failed to send appointment email for appointmentId={}", appointment.getId(), e);
    }
  }
}
