package com.medical.core.exception;

public class InvalidUserRegistrationException extends RuntimeException {
  public InvalidUserRegistrationException() {
    super("Invalid Registration Request");
  }
}
