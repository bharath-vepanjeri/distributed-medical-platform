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
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AppointmentService {

  private final AppointmentRepository appointmentRepository;
  private final PaymentClient paymentClient;
  private final KafkaTemplate<String, String> kafkaTemplate;
  private final ObjectMapper objectMapper;
  private final UserRepository userRepository;

  public AppointmentService(
      AppointmentRepository appointmentRepository,
      PaymentClient paymentClient,
      KafkaTemplate kafkaTemplate,
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

    // Validate doctor
    User doctor = userRepository.findById(request.getDoctorId())
        .orElseThrow(() -> new UserNotFoundException(request.getDoctorId().toString()));

    if (doctor.getRole() != Role.DOCTOR) {
      throw new InvalidDoctorException(request.getDoctorId().toString());
    }

    // Validate patient
    User patient = userRepository.findById(Long.valueOf(patientId))
        .orElseThrow(() -> new UserNotFoundException(patientId));

    Appointment appointment = createAppointmentRecord(patientId, request, doctor);

    try {
      PaymentResponse paymentResponse = initiatePayment(appointment, doctor, patient);
      appointment.setPaymentId(paymentResponse.getPaymentId());
      appointmentRepository.save(appointment);
      return paymentResponse;
    } catch (Exception ex) {
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
    appointment.setAmount(50000L);
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
  public void updateAppointment(String message) throws JsonProcessingException {

    PaymentStatusRequest paymentStatusRequest = objectMapper.readValue(message, PaymentStatusRequest.class);

    Optional<Appointment> optionalAppointment = appointmentRepository
        .findByPaymentId(paymentStatusRequest.getPaymentId());

    if (optionalAppointment.isEmpty()) {
      return;
    }

    Appointment appointment = optionalAppointment.get();

    if (appointment.getStatus() == AppointmentStatus.CONFIRMED) {
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

    User user = userRepository.findById(appointment.getPatientId())
        .orElseThrow(() -> new IllegalStateException("User not found for patientId: " + appointment.getPatientId()));

    AppointmentResponse from = AppointmentResponse.from(appointment);
    from.setEmail(user.getEmail());

    kafkaTemplate.send("appointment-status-email", objectMapper.writeValueAsString(from));
  }
}
