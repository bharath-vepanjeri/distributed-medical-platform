package com.medical.core.entity;

import jakarta.persistence.*;
import java.util.Set;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(
    name = "disease",
    indexes = {@Index(name = "idx_disease_name", columnList = "disease_name")})
public class Disease {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "disease_name", nullable = false, unique = true)
  private String diseaseName;

  @ManyToMany(mappedBy = "diseases", fetch = FetchType.LAZY)
  private Set<Symptom> symptoms;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(
      name = "disease_medicine",
      joinColumns = @JoinColumn(name = "disease_id"),
      inverseJoinColumns = @JoinColumn(name = "medicine_id"))
  private Set<Medicine> medicines;

  protected Disease() {}

  public Disease(String diseaseName) {
    this.diseaseName = diseaseName;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (!(o instanceof Disease that)) return false;
    return id != null && id.equals(that.id);
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }
}
