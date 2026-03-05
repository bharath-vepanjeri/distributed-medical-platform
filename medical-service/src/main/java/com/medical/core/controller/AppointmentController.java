package com.medical.core.controller;

import com.medical.core.dto.AppointmentRequest;
import com.medical.core.dto.PaymentResponse;
import com.medical.core.service.AppointmentService;
import jakarta.validation.Valid;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/appointments")
public class AppointmentController {

  private final AppointmentService appointmentService;

  public AppointmentController(AppointmentService appointmentService) {
    this.appointmentService = appointmentService;
  }

  @PostMapping("/book")
  @PreAuthorize("hasRole('PATIENT')")
  public PaymentResponse createAppointment(
      @AuthenticationPrincipal String userId, @RequestBody @Valid AppointmentRequest request) {
    return appointmentService.createAppointment(userId, request);
  }

//  @PostMapping("/status")
//  public void updateAppointment(@RequestBody @Valid PaymentStatusRequest paymentStatusRequest) {
//    appointmentService.updateAppointment(paymentStatusRequest);
//  }
}
