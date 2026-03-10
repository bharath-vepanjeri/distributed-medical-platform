package com.medical.core.exception;

public class InvalidDoctorException extends RuntimeException {
  public InvalidDoctorException(String doctorId) {
    super("User with id " + doctorId + " is not a valid doctor");
  }
}
