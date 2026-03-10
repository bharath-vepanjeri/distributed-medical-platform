package com.medical.core.service;

import com.medical.core.dto.UserLoginRequest;
import com.medical.core.dto.UserLoginResponse;
import com.medical.core.entity.User;
import com.medical.core.exception.InvalidCredentialsException;
import com.medical.core.exception.UserInactiveException;
import com.medical.core.exception.UserNotFoundException;
import com.medical.core.repository.UserRepository;
import com.medical.core.security.JwtUtil;
import java.time.LocalDateTime;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class LoginService {

  private final UserRepository userRepository;
  private final BCryptPasswordEncoder bCryptPasswordEncoder;
  private final JwtUtil jwtUtil;

  public LoginService(
      UserRepository userRepository,
      BCryptPasswordEncoder bCryptPasswordEncoder,
      JwtUtil jwtUtil) {
    this.userRepository = userRepository;
    this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    this.jwtUtil = jwtUtil;
  }

  public UserLoginResponse authenticate(UserLoginRequest request) {
    log.info("Login attempt for email={}", request.getEmail());

    User user = userRepository
        .findByEmail(request.getEmail())
        .orElseThrow(() -> {
          log.warn("Login failed - user not found: {}", request.getEmail());
          return new UserNotFoundException(request.getEmail());
        });

    if (!user.isActive()) {
      log.warn("Login failed - account inactive: {}", request.getEmail());
      throw new UserInactiveException(request.getEmail());
    }

    if (!bCryptPasswordEncoder.matches(request.getPassword(), user.getPassword())) {
      log.warn("Login failed - wrong password for: {}", request.getEmail());
      throw new InvalidCredentialsException();
    }

    String token = jwtUtil.generateToken(user.getId(), user.getEmail(), user.getRole().name());
    log.info("Login successful for userId={}, role={}", user.getId(), user.getRole());

    return new UserLoginResponse(
        user.getId(), user.getEmail(), user.getRole(), token, LocalDateTime.now());
  }
}
