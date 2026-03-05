package com.medical.core.controller;

import com.medical.core.dto.MedicineCreateRequest;
import com.medical.core.dto.MedicineCreateResponse;
import com.medical.core.dto.MedicineSafetyResponse;
import com.medical.core.service.MedicineService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@Validated
@RequestMapping("/api/v1/medicines")
public class MedicineSearchController {
  private final MedicineService medicineService;

  public MedicineSearchController(MedicineService medicineService) {
    this.medicineService = medicineService;
  }

  @PostMapping
  @PreAuthorize("hasAnyRole('DOCTOR','PHARMACIST')")
  @ResponseStatus(HttpStatus.CREATED)
  // post medicine with safety warning
  public MedicineCreateResponse createMedicine(
      @RequestBody @Valid MedicineCreateRequest medicineCreateRequest) {
    return medicineService.createMedicine(medicineCreateRequest);
  }

  @GetMapping("/search")
  public Page<MedicineSafetyResponse> searchMedicines(
      @RequestParam("name") String name,
      @PageableDefault(size = 10, sort = "medicine") Pageable pageable) {
    return medicineService.getMedicineSafetyPage(name, pageable);
  }
}
