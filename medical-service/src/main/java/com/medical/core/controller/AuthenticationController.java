package com.medical.core.controller;

import com.medical.core.dto.UserLoginRequest;
import com.medical.core.dto.UserLoginResponse;
import com.medical.core.dto.UserRegisterRequest;
import com.medical.core.dto.UserRegisterResponse;
import com.medical.core.service.LoginService;
import com.medical.core.service.UserService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@Validated
@RequestMapping("/api/v1/auth")
public class AuthenticationController {

  private final LoginService loginService;
  private final UserService userService;

  public AuthenticationController(LoginService loginService, UserService userService) {
    this.loginService = loginService;
    this.userService = userService;
  }

  @PostMapping("/login")
  public UserLoginResponse userLogin(@RequestBody @Valid UserLoginRequest login) {
    return loginService.authenticate(login);
  }

  @PostMapping("/register")
  @ResponseStatus(HttpStatus.CREATED)
  public UserRegisterResponse registerUser(
      @RequestBody @Valid UserRegisterRequest userRegisterRequest) {
    return userService.register(userRegisterRequest);
  }
}
