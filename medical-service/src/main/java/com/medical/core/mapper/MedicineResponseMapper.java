package com.medical.core.mapper;

import com.medical.core.dto.MedicineSafetyResponse;
import com.medical.core.entity.Medicine;
import com.medical.core.entity.MedicineSafetyProfile;
import com.medical.core.exception.MedicineSafetyNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class MedicineResponseMapper {

  private static final String DEFAULT_ADVICE = "Be Careful";

  public MedicineSafetyResponse toSafetyResponse(Medicine medicine) {

    MedicineSafetyProfile profile = medicine.getSafetyProfile();

    if (profile == null) {
      throw new MedicineSafetyNotFoundException(medicine.getMedicine());
    }

    return new MedicineSafetyResponse(
        medicine.getMedicine(),
        profile.getUsage(),
        profile.getDosage(),
        profile.getPregnancyWarning(),
        profile.getSeverity(),
        DEFAULT_ADVICE);
  }
}
