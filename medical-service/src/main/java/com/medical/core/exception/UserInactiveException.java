package com.medical.core.exception;

public class UserInactiveException extends RuntimeException {
  public UserInactiveException(String email) {
    super("User : " + email + " is inactive");
  }
}
