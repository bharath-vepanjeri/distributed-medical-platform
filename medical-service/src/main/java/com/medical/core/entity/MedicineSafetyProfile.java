package com.medical.core.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "medicine_safety_profile")
public class MedicineSafetyProfile {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "usage_instructions", nullable = false)
  private String usage;

  @Column(name = "dosage")
  private String dosage;

  @Column(name = "pregnancy_warning")
  private String pregnancyWarning;

  @Column(name = "severity")
  private String severity;

  @OneToOne(fetch = FetchType.LAZY, optional = false)
  @JoinColumn(name = "medicine_id", nullable = false, unique = true)
  private Medicine medicine;

  protected MedicineSafetyProfile() {}

  public MedicineSafetyProfile(
      String usage, String dosage, String pregnancyWarning, String severity) {
    this.usage = usage;
    this.dosage = dosage;
    this.pregnancyWarning = pregnancyWarning;
    this.severity = severity;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (!(o instanceof MedicineSafetyProfile that)) return false;
    return id != null && id.equals(that.id);
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }
}
