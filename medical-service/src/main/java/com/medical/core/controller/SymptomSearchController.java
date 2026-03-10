package com.medical.core.controller;

import com.medical.core.dto.SymptomSearchResponse;
import com.medical.core.service.SymptomSearchService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@Validated
@RequestMapping("/api/v1/symptoms")
@Tag(name = "Symptom Search", description = "Search symptoms by name — returns related diseases and medicines")
public class SymptomSearchController {

  private final SymptomSearchService symptomSearchService;

  public SymptomSearchController(SymptomSearchService symptomSearchService) {
    this.symptomSearchService = symptomSearchService;
  }

  @GetMapping("/search")
  @Operation(summary = "Search symptoms", description = "Search symptoms by name with pagination. Example: ?name=fever")
  public Page<SymptomSearchResponse> searchSymptom(
      @RequestParam("name") String name,
      @PageableDefault(size = 10, sort = "symptom") Pageable pageable) {
    return symptomSearchService.searchBySymptom(name, pageable);
  }
}
