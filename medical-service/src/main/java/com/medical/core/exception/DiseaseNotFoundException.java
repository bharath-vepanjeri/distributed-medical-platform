package com.medical.core.exception;

public class DiseaseNotFoundException extends RuntimeException {
  public DiseaseNotFoundException(String disease) {
    super("Disease " + disease + " not found");
  }
}
