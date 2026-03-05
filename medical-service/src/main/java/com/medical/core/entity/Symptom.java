package com.medical.core.entity;

import jakarta.persistence.*;
import java.util.Set;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(
    name = "symptom",
    indexes = {@Index(name = "idx_symptom", columnList = "symptom")})
public class Symptom {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "symptom", nullable = false, unique = true)
  private String symptom;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(
      name = "symptom_diseases",
      joinColumns = @JoinColumn(name = "symptom_id"),
      inverseJoinColumns = @JoinColumn(name = "disease_id"))
  private Set<Disease> diseases;

  protected Symptom() {}

  public Symptom(String symptom) {
    this.symptom = symptom;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (!(o instanceof Symptom that)) return false;
    return id != null && id.equals(that.id);
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }
}
