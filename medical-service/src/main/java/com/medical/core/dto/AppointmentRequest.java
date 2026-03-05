package com.medical.core.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.Instant;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppointmentRequest {
    @NotBlank
    private String doctorId;
    @NotNull
    private Instant appointmentTime;
    private String notes;

    @Override
    public String toString() {
        return "AppointmentRequest{" +
                "doctorId='" + doctorId + '\'' +
                ", appointmentTime=" + appointmentTime +
                ", notes='" + notes + '\'' +
                '}';
    }
}
