package com.medical.core.dto;

import com.medical.core.entity.Role;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record UserRegisterRequest(
    @NotBlank String name,
    @NotBlank @Email String email,
@NotBlank String password) {}
