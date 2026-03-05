package com.medical.core.exception;

public class UserNotFoundException extends RuntimeException {
  public UserNotFoundException(String email) {
    super("User " + email + " doesn't exists");
  }
}
