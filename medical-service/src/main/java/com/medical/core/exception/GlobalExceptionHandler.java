package com.medical.core.exception;

import com.medical.core.dto.ErrorResponse;
import java.time.LocalDateTime;
import java.util.stream.Collectors;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

  @ExceptionHandler(MedicineNotFoundException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public ErrorResponse handleMedicineNotFound(MedicineNotFoundException exception) {
    return new ErrorResponse(exception.getMessage(), "MEDICINE_NOT_FOUND", LocalDateTime.now());
  }

  @ExceptionHandler(MethodArgumentNotValidException.class)
  @ResponseStatus(HttpStatus.BAD_REQUEST)
  public ErrorResponse handleValidationError(MethodArgumentNotValidException exception) {
    // Extract the specific field error message (e.g., "Email is required")
    String detailedMessage = exception.getBindingResult().getFieldErrors().stream()
        .map(error -> error.getField() + ": " + error.getDefaultMessage())
        .collect(Collectors.joining(", "));

    return new ErrorResponse(detailedMessage, "INVALID_REQUEST", LocalDateTime.now());
  }

  @ExceptionHandler(MedicineAlreadyExistsException.class)
  @ResponseStatus(HttpStatus.CONFLICT)
  public ErrorResponse handleMedicineAlreadyExists(MedicineAlreadyExistsException exception) {
    return new ErrorResponse(exception.getMessage(), "MEDICINE_EXISTS", LocalDateTime.now());
  }

  @ExceptionHandler(MedicineSafetyNotFoundException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public ErrorResponse medicineSafetyNotFoundError(MedicineSafetyNotFoundException exception) {
    return new ErrorResponse(
        exception.getMessage(), "SAFETY_PROFILE_NOT_FOUND", LocalDateTime.now());
  }

  @ExceptionHandler(SymptomNotFoundException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public ErrorResponse symptomNotFound(SymptomNotFoundException exception) {
    return new ErrorResponse(exception.getMessage(), "SYMPTOM_NOT_FOUND", LocalDateTime.now());
  }

  @ExceptionHandler(DiseaseNotFoundException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public ErrorResponse diseaseNotFound(DiseaseNotFoundException exception) {
    return new ErrorResponse(exception.getMessage(), "DISEASE_NOT_FOUND", LocalDateTime.now());
  }

  @ExceptionHandler(InvalidUserRegistrationException.class)
  @ResponseStatus(HttpStatus.BAD_REQUEST)
  public ErrorResponse invalidUserRequest(InvalidUserRegistrationException exception) {
    return new ErrorResponse(exception.getMessage(), "Invalid_Request", LocalDateTime.now());
  }

  @ExceptionHandler(UserAlreadyExistsException.class)
  @ResponseStatus(HttpStatus.CONFLICT)
  public ErrorResponse userExists(UserAlreadyExistsException exception) {
    return new ErrorResponse(exception.getMessage(), "USER_ALREADY_EXISTS", LocalDateTime.now());
  }

  @ExceptionHandler(UserNotFoundException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public ErrorResponse userNotFound(UserNotFoundException exception) {
    return new ErrorResponse(exception.getMessage(), "USER_NOT_FOUND", LocalDateTime.now());
  }

  @ExceptionHandler(InvalidCredentialsException.class)
  @ResponseStatus(HttpStatus.UNAUTHORIZED)
  public ErrorResponse invalidCredential(InvalidCredentialsException exception) {
    return new ErrorResponse(exception.getMessage(), "INVALID_CREDENTIALS", LocalDateTime.now());
  }

  @ExceptionHandler(UserInactiveException.class)
  @ResponseStatus(HttpStatus.FORBIDDEN)
  public ErrorResponse userInactive(UserInactiveException exception) {
    return new ErrorResponse(exception.getMessage(), "USER_INACTIVE", LocalDateTime.now());
  }

  @ExceptionHandler(Exception.class)
  @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
  public ErrorResponse handleAllExceptions(Exception exception) {
    // Log the actual exception here for developers
    return new ErrorResponse(exception.getMessage(), "INTERNAL_SERVER_ERROR", LocalDateTime.now());
  }

  @ExceptionHandler(org.springframework.data.mapping.PropertyReferenceException.class)
  @ResponseStatus(org.springframework.http.HttpStatus.BAD_REQUEST)
  public ErrorResponse handleInvalidSortField(
      org.springframework.data.mapping.PropertyReferenceException ex) {
    return new ErrorResponse(
        "Invalid sort field: " + ex.getPropertyName(), "INVALID_SORT", LocalDateTime.now());
  }

  @ExceptionHandler(io.jsonwebtoken.ExpiredJwtException.class)
  @ResponseStatus(HttpStatus.UNAUTHORIZED)
  public ErrorResponse handleExpiredToken(io.jsonwebtoken.ExpiredJwtException ex) {
    return new ErrorResponse(
        "Your session has expired. Please log in again.", "TOKEN_EXPIRED", LocalDateTime.now());
  }

  @ExceptionHandler(io.jsonwebtoken.security.SignatureException.class)
  @ResponseStatus(HttpStatus.UNAUTHORIZED)
  public ErrorResponse handleInvalidSignature(io.jsonwebtoken.SignatureException ex) {
    return new ErrorResponse(
        "Invalid token signature.", "INVALID_TOKEN_SIGNATURE", LocalDateTime.now());
  }

  @ExceptionHandler(io.jsonwebtoken.MalformedJwtException.class)
  @ResponseStatus(HttpStatus.UNAUTHORIZED)
  public ErrorResponse handleMalformedToken(io.jsonwebtoken.MalformedJwtException ex) {
    return new ErrorResponse(
        "The token provided is invalid or corrupted.", "MALFORMED_TOKEN", LocalDateTime.now());
  }

  @ExceptionHandler(AppointmentAlreadyExistsException.class)
  @ResponseStatus(HttpStatus.CONFLICT)
  public ErrorResponse handleAppointmentConflict(AppointmentAlreadyExistsException ex) {
    return new ErrorResponse(ex.getMessage(), "APPOINTMENT_CONFLICT", LocalDateTime.now());
  }

  @ExceptionHandler(PaymentServiceUnavailableException.class)
  @ResponseStatus(HttpStatus.SERVICE_UNAVAILABLE)
  public ErrorResponse handlePaymentDown(PaymentServiceUnavailableException ex) {
    return new ErrorResponse(ex.getMessage(), "PAYMENT_SERVICE_DOWN", LocalDateTime.now());
  }

  @ExceptionHandler(org.springframework.security.access.AccessDeniedException.class)
  @ResponseStatus(HttpStatus.FORBIDDEN)
  public ErrorResponse handleAccessDenied(
      org.springframework.security.access.AccessDeniedException ex) {
    return new ErrorResponse(
        "You do not have permission to access this resource.",
        "ACCESS_DENIED",
        LocalDateTime.now());
  }

  @ExceptionHandler(org.springframework.orm.ObjectOptimisticLockingFailureException.class)
  @ResponseStatus(HttpStatus.CONFLICT)
  public ErrorResponse handleOptimisticLocking(
      org.springframework.orm.ObjectOptimisticLockingFailureException ex) {
    return new ErrorResponse(
        "The record was modified by another transaction. Please try again.",
        "CONCURRENT_MODIFICATION",
        LocalDateTime.now());
  }

  @ExceptionHandler(InvalidDoctorException.class)
  @ResponseStatus(HttpStatus.BAD_REQUEST)
  public ErrorResponse handleInvalidDoctor(InvalidDoctorException ex) {
    return new ErrorResponse(ex.getMessage(), "INVALID_DOCTOR", LocalDateTime.now());
  }
}
