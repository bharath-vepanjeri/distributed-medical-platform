package com.medical.core.dto;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({"id", "name"})
public record MedicineCreateResponse(Long id, String name) {}
