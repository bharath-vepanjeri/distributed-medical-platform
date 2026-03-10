package com.medical.core.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserRegisterRequest {
  @NotBlank(message = "Name is required")
  String name;

  @NotBlank(message = "Email is required")
  @Email(message = "Invalid email format")
  String email;

  @NotBlank(message = "Password is required")
  @Size(min = 8, message = "Password should be at least 8 characters")
  String password;

}
