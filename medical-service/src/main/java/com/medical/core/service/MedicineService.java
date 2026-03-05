package com.medical.core.service;

import com.medical.core.dto.MedicineCreateRequest;
import com.medical.core.dto.MedicineCreateResponse;
import com.medical.core.dto.MedicineSafetyResponse;
import com.medical.core.entity.Medicine;
import com.medical.core.entity.MedicineSafetyProfile;
import com.medical.core.exception.MedicineAlreadyExistsException;
import com.medical.core.mapper.MedicineResponseMapper;
import com.medical.core.repository.MedicineRepository;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MedicineService {

  private final MedicineRepository medicineRepository;
  private final MedicineResponseMapper medicineResponseMapper;

  public MedicineService(
      MedicineRepository medicineRepository, MedicineResponseMapper medicineResponseMapper) {
    this.medicineRepository = medicineRepository;
    this.medicineResponseMapper = medicineResponseMapper;
  }

  @Transactional
  @CacheEvict(
      value = {"disease-search", "symptom-search"},
      allEntries = true)
  public MedicineCreateResponse createMedicine(MedicineCreateRequest request) {

    if (medicineRepository.existsByMedicineIgnoreCase(request.medicineName())) {
      throw new MedicineAlreadyExistsException(request.medicineName());
    }

    Medicine medicine = new Medicine(request.medicineName());

    MedicineSafetyProfile profile =
        new MedicineSafetyProfile(
            request.usage(), request.dosage(), request.pregnancyWarning(), request.severityLevel());

    profile.setMedicine(medicine);
    medicine.setSafetyProfile(profile);

    Medicine saved = medicineRepository.save(medicine);

    return new MedicineCreateResponse(saved.getId(), saved.getMedicine());
  }

  @Transactional(readOnly = true)
  public Page<MedicineSafetyResponse> getMedicineSafetyPage(String name, Pageable pageable) {
    Page<Medicine> medicinePage =
        medicineRepository.findByMedicineContainingIgnoreCase(name, pageable);

    return medicinePage.map(medicineResponseMapper::toSafetyResponse);
  }
}
