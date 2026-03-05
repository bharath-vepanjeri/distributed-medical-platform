package com.medical.core.exception;

public class MedicineNotFoundException extends RuntimeException {
  public MedicineNotFoundException(String medicine) {
    super("Medicine not found : " + medicine);
  }
}
