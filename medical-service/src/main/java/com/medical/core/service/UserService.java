package com.medical.core.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.medical.core.dto.UserRegisterRequest;
import com.medical.core.dto.UserRegisterResponse;
import com.medical.core.dto.WelcomeEmail;
import com.medical.core.entity.Role;
import com.medical.core.entity.User;
import com.medical.core.exception.UserAlreadyExistsException;
import com.medical.core.exception.UserNotFoundException;
import com.medical.core.mapper.UserResponseMapper;
import com.medical.core.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class UserService {

  private final UserRepository userRepository;
  private final UserResponseMapper userResponseMapper;
  private final BCryptPasswordEncoder bCryptPasswordEncoder;
  private final KafkaTemplate<String, String> kafkaTemplate;
  private final ObjectMapper objectMapper;

  public UserService(
      UserRepository userRepository,
      UserResponseMapper userResponseMapper,
      BCryptPasswordEncoder bCryptPasswordEncoder,
      KafkaTemplate kafkaTemplate,
      ObjectMapper objectMapper) {
    this.userRepository = userRepository;
    this.userResponseMapper = userResponseMapper;
    this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    this.kafkaTemplate = kafkaTemplate;
    this.objectMapper = objectMapper;
  }

  @Transactional
  public UserRegisterResponse register(UserRegisterRequest request) {

    String hashedPassword = bCryptPasswordEncoder.encode(request.getPassword());

    // New users are always registered as PATIENT. DOCTOR/PHARMACIST roles are
    User newUser = new User(request.getName(), request.getEmail(), hashedPassword, Role.PATIENT);

    User savedUser;
    try {
      savedUser = userRepository.save(newUser);
    } catch (DataIntegrityViolationException ex) {
      throw new UserAlreadyExistsException(request.getEmail());
    }

    try {
      WelcomeEmail welcomeEmail = new WelcomeEmail();
      welcomeEmail.setEmail(newUser.getEmail());
      kafkaTemplate.send("welcomeEmail", objectMapper.writeValueAsString(welcomeEmail));
    } catch (JsonProcessingException ex) {
      log.warn("Failed to serialize welcome email for: {}", newUser.getEmail(), ex);
    }

    return userResponseMapper.mapToUserRegisterResponse(savedUser);
  }

  @Transactional
  public UserRegisterResponse updateRole(Long userId, Role role) {
    User user = userRepository.findById(userId).orElseThrow(() -> new UserNotFoundException(userId.toString()));
    user.setRole(role);
    return userResponseMapper.mapToUserRegisterResponse(userRepository.save(user));
  }

}
