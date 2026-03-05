package com.medical.core.dto;

import java.util.List;

public record DiseaseSearchResponse(
    String diseaseName, List<String> symptoms, List<MedicineSafetyResponse> medicines) {}
