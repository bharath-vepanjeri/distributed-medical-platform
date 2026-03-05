package com.medical.paymentservice.repository;

import com.medical.paymentservice.models.Payment;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
  Optional<Payment> findByAppointmentId(String appointmentId);

  Optional<Payment> findByGatewayReference(String gatewayReference);
}
