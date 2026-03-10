package com.medical.core.controller;

import com.medical.core.dto.UserRegisterResponse;
import com.medical.core.entity.Role;
import com.medical.core.exception.InvalidUserRegistrationException;
import com.medical.core.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/admin")
public class AdminController {

  private final UserService userService;

  public AdminController(UserService userService) {
    this.userService = userService;
  }

  @PutMapping("/users/{userId}/promote")
  @PreAuthorize("hasRole('ADMIN')")
  @ResponseStatus(HttpStatus.OK)
  public UserRegisterResponse promoteUser(
      @PathVariable Long userId,
      @RequestParam Role role) {

    if (role == Role.ADMIN) {
      throw new InvalidUserRegistrationException();
    }

    return userService.updateRole(userId, role);
  }
}
