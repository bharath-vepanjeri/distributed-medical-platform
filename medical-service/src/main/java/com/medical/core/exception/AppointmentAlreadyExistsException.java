package com.medical.core.exception;

public class AppointmentAlreadyExistsException extends RuntimeException {
  public AppointmentAlreadyExistsException() {
    super("This time slot is already booked for the selected doctor.");
  }
}
