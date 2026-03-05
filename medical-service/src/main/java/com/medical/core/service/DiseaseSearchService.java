package com.medical.core.service;

import com.medical.core.dto.DiseaseSearchResponse;
import com.medical.core.dto.MedicineSafetyResponse;
import com.medical.core.entity.Disease;
import com.medical.core.mapper.MedicineResponseMapper;
import com.medical.core.repository.DiseaseRepository;
import java.util.List;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DiseaseSearchService {

  private final DiseaseRepository diseaseRepository;
  private final MedicineResponseMapper medicineResponseMapper;

  public DiseaseSearchService(
      DiseaseRepository diseaseRepository, MedicineResponseMapper medicineResponseMapper) {
    this.diseaseRepository = diseaseRepository;
    this.medicineResponseMapper = medicineResponseMapper;
  }

  @Transactional(readOnly = true)
  @Cacheable(
      value = "disease-search",
      key =
          "#disease + '-' + #pageable.pageNumber + '-' + #pageable.pageSize + '-' + #pageable.sort")
  public Page<DiseaseSearchResponse> searchByDisease(String disease, Pageable pageable) {

    Page<Disease> diseasePage =
        diseaseRepository.findByDiseaseNameContainingIgnoreCase(disease, pageable);

    return diseasePage.map(this::convertToDto);
  }

  private DiseaseSearchResponse convertToDto(Disease disease) {

    List<MedicineSafetyResponse> medicines =
        disease.getMedicines().stream().map(medicineResponseMapper::toSafetyResponse).toList();

    List<String> symptoms = disease.getSymptoms().stream().map(s -> s.getSymptom()).toList();

    return new DiseaseSearchResponse(disease.getDiseaseName(), symptoms, medicines);
  }
}
