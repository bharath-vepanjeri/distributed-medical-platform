package com.medical.core.dto;

import com.medical.core.entity.Role;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserRegisterResponse {
  private Long id;
  private String name;
  private String email;
  private Role role;
  private LocalDateTime createdAt;
}
