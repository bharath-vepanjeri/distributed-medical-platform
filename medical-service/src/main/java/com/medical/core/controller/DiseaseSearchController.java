package com.medical.core.controller;

import com.medical.core.dto.DiseaseSearchResponse;
import com.medical.core.service.DiseaseSearchService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.constraints.NotBlank;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@Validated
@RequestMapping("/api/v1/diseases")
@Tag(name = "Disease Search", description = "Search diseases by name — returns related symptoms and medicines")
public class DiseaseSearchController {

  private final DiseaseSearchService diseaseSearchService;

  public DiseaseSearchController(DiseaseSearchService diseaseSearchService) {
    this.diseaseSearchService = diseaseSearchService;
  }

  @GetMapping("/search")
  @Operation(summary = "Search diseases", description = "Search diseases by name with pagination. Example: ?query=diabetes")
  public Page<DiseaseSearchResponse> searchByDisease(
      @RequestParam("query") @NotBlank String query,
      @PageableDefault(size = 10, page = 0, sort = "diseaseName", direction = Sort.Direction.ASC) Pageable pageable) {
    return diseaseSearchService.searchByDisease(query, pageable);
  }
}
