package com.medical.core.exception;

public class MedicineAlreadyExistsException extends RuntimeException {
  public MedicineAlreadyExistsException(String medicine) {
    super("Medicine " + medicine + " already exists");
  }
}
