package com.medical.core.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.medical.core.dto.AppointmentRequest;
import com.medical.core.dto.PaymentResponse;
import com.medical.core.dto.PaymentStatusRequest;
import com.medical.core.entity.Appointment;
import com.medical.core.entity.AppointmentStatus;
import com.medical.core.entity.PaymentStatus;
import com.medical.core.entity.Role;
import com.medical.core.entity.User;
import com.medical.core.exception.AppointmentAlreadyExistsException;
import com.medical.core.exception.InvalidDoctorException;
import com.medical.core.exception.UserNotFoundException;
import com.medical.core.repository.AppointmentRepository;
import com.medical.core.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.kafka.core.KafkaTemplate;

import java.time.LocalDateTime;
import java.util.Optional;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class AppointmentServiceTest {

  @Mock
  private AppointmentRepository appointmentRepository;
  @Mock
  private UserRepository userRepository;
  @Mock
  private PaymentClient paymentClient;
  @Mock
  private KafkaTemplate<String, String> kafkaTemplate;

  @InjectMocks
  private AppointmentService appointmentService;

  private final ObjectMapper objectMapper = new ObjectMapper();

  private User doctor;
  private User patient;
  private AppointmentRequest request;

  @BeforeEach
  void setUp() throws Exception {
    var field = AppointmentService.class.getDeclaredField("objectMapper");
    field.setAccessible(true);
    field.set(appointmentService, objectMapper);

    doctor = new User("Dr. Sharma", "sharma@hospital.com", "pass", Role.DOCTOR);
    setId(doctor, 10L);

    patient = new User("Ravi Kumar", "ravi@example.com", "pass", Role.PATIENT);
    setId(patient, 20L);

    request = new AppointmentRequest();
    request.setDoctorId(10L);
    request.setAppointmentTime(LocalDateTime.now().plusDays(1));
    request.setNotes("Routine check-up");
  }

  @Test
  @DisplayName("createAppointment: returns PaymentResponse when doctor, patient and payment are valid")
  void createAppointment_happyPath_returnsPaymentResponse() {
    Appointment saved = buildAppointment(1L, AppointmentStatus.PENDING_PAYMENT);
    PaymentResponse paymentResponse = PaymentResponse.builder()
        .paymentId("pay_abc123")
        .appointmentId("1")
        .checkoutUrl("https://stripe.com/checkout/abc")
        .status(PaymentStatus.INITIATED)
        .build();

    when(userRepository.findById(10L)).thenReturn(Optional.of(doctor));
    when(userRepository.findById(20L)).thenReturn(Optional.of(patient));
    when(appointmentRepository.save(any())).thenReturn(saved);
    when(paymentClient.createPayment(any())).thenReturn(paymentResponse);

    PaymentResponse result = appointmentService.createAppointment("20", request);

    assertThat(result.getPaymentId()).isEqualTo("pay_abc123");
    assertThat(result.getCheckoutUrl()).isEqualTo("https://stripe.com/checkout/abc");
    // First save persists the record; second save stores the paymentId
    verify(appointmentRepository, times(2)).save(any(Appointment.class));
  }

  @Test
  @DisplayName("createAppointment: throws UserNotFoundException when doctorId is not found")
  void createAppointment_doctorNotFound_throwsUserNotFoundException() {
    when(userRepository.findById(10L)).thenReturn(Optional.empty());

    assertThatThrownBy(() -> appointmentService.createAppointment("20", request))
        .isInstanceOf(UserNotFoundException.class)
        .hasMessageContaining("10");

    verifyNoInteractions(paymentClient);
    verifyNoInteractions(appointmentRepository);
  }

  @Test
  @DisplayName("createAppointment: throws InvalidDoctorException when the resolved user is not a DOCTOR")
  void createAppointment_userIsNotDoctor_throwsInvalidDoctorException() {
    User nonDoctor = new User("Imposter", "imposter@example.com", "pass", Role.PATIENT);
    setId(nonDoctor, 10L);

    when(userRepository.findById(10L)).thenReturn(Optional.of(nonDoctor));

    assertThatThrownBy(() -> appointmentService.createAppointment("20", request))
        .isInstanceOf(InvalidDoctorException.class)
        .hasMessageContaining("10");

    verifyNoInteractions(paymentClient);
    verifyNoInteractions(appointmentRepository);
  }

  @Test
  @DisplayName("createAppointment: throws AppointmentAlreadyExistsException on duplicate time slot")
  void createAppointment_duplicateSlot_throwsAppointmentAlreadyExistsException() {
    when(userRepository.findById(10L)).thenReturn(Optional.of(doctor));
    when(userRepository.findById(20L)).thenReturn(Optional.of(patient));
    when(appointmentRepository.save(any()))
        .thenThrow(new DataIntegrityViolationException("duplicate entry"));

    assertThatThrownBy(() -> appointmentService.createAppointment("20", request))
        .isInstanceOf(AppointmentAlreadyExistsException.class)
        .hasMessageContaining("already booked");

    verifyNoInteractions(paymentClient);
  }

  @Test
  @DisplayName("createAppointment: saves appointment as CANCELLED when payment service throws")
  void createAppointment_paymentFails_savesAppointmentAsCancelled() {
    Appointment saved = buildAppointment(1L, AppointmentStatus.PENDING_PAYMENT);

    when(userRepository.findById(10L)).thenReturn(Optional.of(doctor));
    when(userRepository.findById(20L)).thenReturn(Optional.of(patient));
    when(appointmentRepository.save(any())).thenReturn(saved);
    when(paymentClient.createPayment(any())).thenThrow(new RuntimeException("payment service down"));

    assertThatThrownBy(() -> appointmentService.createAppointment("20", request))
        .isInstanceOf(RuntimeException.class);

    ArgumentCaptor<Appointment> captor = ArgumentCaptor.forClass(Appointment.class);
    verify(appointmentRepository, times(2)).save(captor.capture());
    assertThat(captor.getAllValues().get(1).getStatus()).isEqualTo(AppointmentStatus.CANCELLED);
  }

  @Test
  @DisplayName("updateAppointment: confirms appointment and publishes email Kafka event on SUCCESS")
  void updateAppointment_paymentSuccess_confirmsAppointmentAndSendsEmail() throws Exception {
    Appointment appointment = buildAppointment(1L, AppointmentStatus.PENDING_PAYMENT);
    appointment.setPatientId(20L);

    String message = buildPaymentStatusJson("pay_abc123", PaymentStatus.SUCCESS);

    when(appointmentRepository.findByPaymentId("pay_abc123")).thenReturn(Optional.of(appointment));
    when(appointmentRepository.save(any())).thenReturn(appointment);
    when(userRepository.findById(20L)).thenReturn(Optional.of(patient));

    appointmentService.updateAppointment(message);

    // Appointment must be saved with CONFIRMED status
    ArgumentCaptor<Appointment> captor = ArgumentCaptor.forClass(Appointment.class);
    verify(appointmentRepository).save(captor.capture());
    assertThat(captor.getValue().getStatus()).isEqualTo(AppointmentStatus.CONFIRMED);

    verify(kafkaTemplate).send(eq("appointment-status-email"), anyString());
  }

  private Appointment buildAppointment(Long id, AppointmentStatus status) {
    Appointment a = new Appointment();
    a.setId(id);
    a.setDoctorId(10L);
    a.setPatientId(20L);
    a.setStatus(status);
    a.setAmount(50000L);
    a.setPaymentId("pay_abc123");
    return a;
  }

  private String buildPaymentStatusJson(String paymentId, PaymentStatus status) {
    return String.format(
        "{\"paymentId\":\"%s\",\"appointmentId\":\"1\",\"status\":\"%s\"}",
        paymentId, status.name());
  }

  private void setId(User user, Long id) {
    try {
      var f = User.class.getDeclaredField("id");
      f.setAccessible(true);
      f.set(user, id);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
