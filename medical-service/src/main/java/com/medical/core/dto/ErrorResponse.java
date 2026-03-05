package com.medical.core.dto;

import java.time.LocalDateTime;

public record ErrorResponse(String errorMessage, String errorCode, LocalDateTime time) {}
