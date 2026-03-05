package com.medical.core.dto;

import jakarta.validation.constraints.NotBlank;

public record MedicineCreateRequest(
    @NotBlank(message = "Medicine name is required") String medicineName,
    @NotBlank(message = "Usage information is required") String usage,
    @NotBlank(message = "Dosage is required") String dosage,
    @NotBlank(message = "Pregnancy warning is required") String pregnancyWarning,
    @NotBlank(message = "Severity level is required") String severityLevel) {}
