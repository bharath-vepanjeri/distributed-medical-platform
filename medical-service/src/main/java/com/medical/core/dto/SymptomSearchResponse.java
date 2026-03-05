package com.medical.core.dto;

import java.util.List;

public record SymptomSearchResponse(
    String symptom, List<String> diseases, List<MedicineSafetyResponse> medicines) {}
