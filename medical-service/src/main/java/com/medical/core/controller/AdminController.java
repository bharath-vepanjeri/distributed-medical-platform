package com.medical.core.controller;

import com.medical.core.dto.UserRegisterResponse;
import com.medical.core.entity.Role;
import com.medical.core.exception.InvalidUserRegistrationException;
import com.medical.core.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/admin")
@Tag(name = "Admin", description = "Promote users to DOCTOR or PHARMACIST role")
public class AdminController {

  private final UserService userService;

  public AdminController(UserService userService) {
    this.userService = userService;
  }

  @PutMapping("/users/{userId}/promote")
  @PreAuthorize("hasRole('ADMIN')")
  @ResponseStatus(HttpStatus.OK)
  @Operation(summary = "Promote user", description = "Promote a user to DOCTOR or PHARMACIST. Requires ADMIN role.")
  public UserRegisterResponse promoteUser(
      @PathVariable Long userId,
      @RequestParam Role role) {

    if (role == Role.ADMIN) {
      throw new InvalidUserRegistrationException();
    }

    return userService.updateRole(userId, role);
  }
}
