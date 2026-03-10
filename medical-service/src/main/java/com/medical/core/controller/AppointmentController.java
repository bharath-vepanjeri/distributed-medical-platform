package com.medical.core.controller;

import com.medical.core.dto.AppointmentRequest;
import com.medical.core.dto.PaymentResponse;
import com.medical.core.service.AppointmentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/appointments")
@Tag(name = "Appointments", description = "Book doctor appointments and initiate Stripe payment")
public class AppointmentController {

  private final AppointmentService appointmentService;

  public AppointmentController(AppointmentService appointmentService) {
    this.appointmentService = appointmentService;
  }

  @PostMapping("/book")
  @PreAuthorize("hasRole('PATIENT')")
  @Operation(summary = "Book appointment", description = "Book a doctor appointment. Returns a Stripe checkout URL for payment. Requires PATIENT role.")
  public PaymentResponse createAppointment(
      @AuthenticationPrincipal String userId, @RequestBody @Valid AppointmentRequest request) {
    return appointmentService.createAppointment(userId, request);
  }
}
