package com.medical.core.dto;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({
  "medicine",
  "usage",
  "dosage",
  "pregnancyWarning",
  "severityLevel",
  "disclaimer"
})
public record MedicineSafetyResponse(
    String medicine,
    String usage,
    String dosage,
    String pregnancyWarning,
    String severityLevel,
    String disclaimer) {}
