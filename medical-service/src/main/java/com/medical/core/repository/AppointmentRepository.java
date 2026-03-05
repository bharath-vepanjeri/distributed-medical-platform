package com.medical.core.repository;

import com.medical.core.entity.Appointment;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
  Optional<Appointment> findByPaymentId(String paymentId);
}
