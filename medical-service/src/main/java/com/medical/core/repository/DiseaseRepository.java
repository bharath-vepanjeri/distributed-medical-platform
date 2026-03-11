package com.medical.core.repository;

import com.medical.core.entity.Disease;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiseaseRepository extends JpaRepository<Disease, Long> {

  Page<Disease> findByDiseaseNameContainingIgnoreCase(String diseaseName, Pageable pageable);

  List<Disease> findByDiseaseNameContainingIgnoreCase(String diseaseName);
}
