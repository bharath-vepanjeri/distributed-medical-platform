package com.medical.core.exception;

public class MedicineSafetyNotFoundException extends RuntimeException {
  public MedicineSafetyNotFoundException(String medicine) {
    super("Medicine safety profile not found for " + medicine + " medicine");
  }
}
