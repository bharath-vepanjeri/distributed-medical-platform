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

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

  private final UserRepository userRepository;
  private final BCryptPasswordEncoder bCryptPasswordEncoder;
  private final JwtUtil jwtUtil;

  public LoginService(
      UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder, JwtUtil jwtUtil) {
    this.userRepository = userRepository;
    this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    this.jwtUtil = jwtUtil;
  }

  public UserLoginResponse authenticate(UserLoginRequest request) {
    // 1. Find user by email
    User user = userRepository
        .findByEmail(request.getEmail())
        .orElseThrow(() -> new UserNotFoundException(request.getEmail()));

    // 2. Check if account is active
    if (!user.isActive()) {
      throw new UserInactiveException(request.getEmail());
    }

    // 3. Verify password
    if (!bCryptPasswordEncoder.matches(request.getPassword(), user.getPassword())) {
      throw new InvalidCredentialsException();
    }

    // 4. Generate JWT
    String token = jwtUtil.generateToken(user.getId(), user.getEmail(), user.getRole().name());

    return new UserLoginResponse(
        user.getId(), user.getEmail(), user.getRole(), token, LocalDateTime.now());
  }
}
