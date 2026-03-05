package com.medical.core.repository;

import com.medical.core.entity.Medicine;
import jakarta.validation.constraints.NotBlank;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MedicineRepository extends JpaRepository<Medicine, Long> {

  @EntityGraph(attributePaths = {"safetyProfile"})
  Page<Medicine> findByMedicineContainingIgnoreCase(String term, Pageable pageable);

  boolean existsByMedicineIgnoreCase(@NotBlank(message = "Medicine name is required") String s);
}
