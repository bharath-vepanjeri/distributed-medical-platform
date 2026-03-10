package com.medical.paymentservice.mapper;

import com.medical.paymentservice.dtos.PaymentRequest;
import com.medical.paymentservice.models.Gateway;
import com.medical.paymentservice.models.Payment;
import com.medical.paymentservice.models.PaymentStatus;

public class PaymentMapper {

  public static Payment toEntity(PaymentRequest request) {
    Payment payment = new Payment();

    payment.setAppointmentId(request.getAppointmentId());
    payment.setAmount(request.getAmount());
    payment.setCurrency(request.getCurrency());
    payment.setPatientName(request.getPatientName());
    payment.setDoctorName(request.getDoctorName());
    payment.setConsultationPurpose(request.getConsultationPurpose());
    payment.setDescription(request.getDescription());
    payment.setPaymentStatus(PaymentStatus.INITIATED);
    payment.setGateway(Gateway.STRIPE);

    // Using appointmentId as idempotency key
    payment.setIdempotencyKey(request.getAppointmentId());

    return payment;
  }
}
