package com.medical.core.controller;

import com.medical.core.dto.SymptomSearchResponse;
import com.medical.core.service.SymptomSearchService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Validated
@RequestMapping("/api/v1/symptoms")
public class SymptomSearchController {

  private final SymptomSearchService symptomSearchService;

  public SymptomSearchController(SymptomSearchService symptomSearchService) {
    this.symptomSearchService = symptomSearchService;
  }

  @GetMapping("/search")
  public Page<SymptomSearchResponse> searchSymptom(
      @RequestParam("name") String name,
      @PageableDefault(size = 10, sort = "symptom") Pageable pageable) {
    return symptomSearchService.searchBySymptom(name, pageable);
  }
}
