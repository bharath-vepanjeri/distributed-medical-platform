package com.medical.core.entity;

import jakarta.persistence.*;
import java.util.Set;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(
    name = "medicine",
    indexes = {@Index(name = "idx_medicine", columnList = "medicine")})
public class Medicine {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "medicine", nullable = false, unique = true)
  private String medicine;

  @OneToOne(
      mappedBy = "medicine",
      cascade = CascadeType.ALL,
      orphanRemoval = true,
      fetch = FetchType.LAZY)
  private MedicineSafetyProfile safetyProfile;

  @ManyToMany(mappedBy = "medicines", fetch = FetchType.LAZY)
  private Set<Disease> diseases;

  protected Medicine() {}

  public Medicine(String medicine) {
    this.medicine = medicine;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (!(o instanceof Medicine that)) return false;
    return id != null && id.equals(that.id);
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }
}
