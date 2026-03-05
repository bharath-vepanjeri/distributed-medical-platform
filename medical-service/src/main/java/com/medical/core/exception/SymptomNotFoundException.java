package com.medical.core.exception;

public class SymptomNotFoundException extends RuntimeException {
  public SymptomNotFoundException(String symptom) {
    super("Symptom " + symptom + " not found");
  }
}
