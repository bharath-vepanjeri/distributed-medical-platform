package com.medical.core.dto;

import com.medical.core.entity.Role;
import java.time.LocalDateTime;

public record UserLoginResponse(
    Long id, String email, Role role, String token, LocalDateTime loginTime) {}
