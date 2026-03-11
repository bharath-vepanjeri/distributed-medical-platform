package com.medical.core.service;

import com.medical.core.dto.DiseaseSearchResponse;
import com.medical.core.dto.MedicineSafetyResponse;
import com.medical.core.entity.Disease;
import com.medical.core.mapper.MedicineResponseMapper;
import com.medical.core.repository.DiseaseRepository;
import java.util.List;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
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
  @Cacheable(value = "disease-search", key = "#disease")
  public List<DiseaseSearchResponse> searchByDiseaseCached(String disease) {
    List<Disease> diseases = diseaseRepository.findByDiseaseNameContainingIgnoreCase(disease);
    return diseases.stream().map(this::convertToDto).toList();
  }

  public Page<DiseaseSearchResponse> searchByDisease(String disease, Pageable pageable) {
    List<DiseaseSearchResponse> all = searchByDiseaseCached(disease);
    int start = (int) pageable.getOffset();
    int end = Math.min(start + pageable.getPageSize(), all.size());
    List<DiseaseSearchResponse> pageContent = (start >= all.size()) ? List.of() : all.subList(start, end);
    return new PageImpl<>(pageContent, pageable, all.size());
  }

  private DiseaseSearchResponse convertToDto(Disease disease) {
    List<MedicineSafetyResponse> medicines =
        disease.getMedicines().stream().map(medicineResponseMapper::toSafetyResponse).toList();
    List<String> symptoms = disease.getSymptoms().stream().map(s -> s.getSymptom()).toList();
    return new DiseaseSearchResponse(disease.getDiseaseName(), symptoms, medicines);
  }
}
