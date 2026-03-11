package com.medical.core.repository;

import com.medical.core.entity.Symptom;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SymptomRepository extends JpaRepository<Symptom, Long> {

  @EntityGraph(
      attributePaths = {"diseases", "diseases.medicines", "diseases.medicines.safetyProfile"})
  Page<Symptom> findBySymptomContainingIgnoreCase(String symptom, Pageable pageable);

  @EntityGraph(
      attributePaths = {"diseases", "diseases.medicines", "diseases.medicines.safetyProfile"})
  List<Symptom> findBySymptomContainingIgnoreCase(String symptom);
}
