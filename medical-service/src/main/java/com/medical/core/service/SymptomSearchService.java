package com.medical.core.service;

import com.medical.core.dto.MedicineSafetyResponse;
import com.medical.core.dto.SymptomSearchResponse;
import com.medical.core.entity.Disease;
import com.medical.core.entity.Symptom;
import com.medical.core.mapper.MedicineResponseMapper;
import com.medical.core.repository.SymptomRepository;
import java.util.List;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SymptomSearchService {

  private final SymptomRepository symptomRepository;
  private final MedicineResponseMapper medicineResponseMapper;

  public SymptomSearchService(
      SymptomRepository symptomRepository, MedicineResponseMapper medicineResponseMapper) {
    this.symptomRepository = symptomRepository;
    this.medicineResponseMapper = medicineResponseMapper;
  }

  @Transactional(readOnly = true)
  @Cacheable(value = "symptom-search", key = "#symptom")
  public List<SymptomSearchResponse> searchBySymptomCached(String symptom) {
    List<Symptom> symptoms = symptomRepository.findBySymptomContainingIgnoreCase(symptom);
    return symptoms.stream().map(this::mapToResponse).toList();
  }

  public Page<SymptomSearchResponse> searchBySymptom(String symptom, Pageable pageable) {
    List<SymptomSearchResponse> all = searchBySymptomCached(symptom);
    int start = (int) pageable.getOffset();
    int end = Math.min(start + pageable.getPageSize(), all.size());
    List<SymptomSearchResponse> pageContent = (start >= all.size()) ? List.of() : all.subList(start, end);
    return new PageImpl<>(pageContent, pageable, all.size());
  }

  private SymptomSearchResponse mapToResponse(Symptom symptom) {
    List<String> diseaseNames = symptom.getDiseases().stream().map(Disease::getDiseaseName).toList();
    List<MedicineSafetyResponse> safetyResponses = symptom.getDiseases().stream()
        .flatMap(d -> d.getMedicines().stream())
        .distinct()
        .map(medicineResponseMapper::toSafetyResponse)
        .toList();
    return new SymptomSearchResponse(symptom.getSymptom(), diseaseNames, safetyResponses);
  }
}
