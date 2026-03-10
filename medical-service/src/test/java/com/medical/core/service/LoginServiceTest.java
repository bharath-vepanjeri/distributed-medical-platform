
package com.medical.core.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import com.medical.core.dto.UserLoginRequest;
import com.medical.core.dto.UserLoginResponse;
import com.medical.core.entity.Role;
import com.medical.core.entity.User;
import com.medical.core.exception.InvalidCredentialsException;
import com.medical.core.exception.UserNotFoundException;
import com.medical.core.repository.UserRepository;
import com.medical.core.security.JwtUtil;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@ExtendWith(MockitoExtension.class)
class LoginServiceTest {

  @Mock
  private UserRepository userRepository;
  @Mock
  private BCryptPasswordEncoder bCryptPasswordEncoder;
  @Mock
  private JwtUtil jwtUtil;
  @InjectMocks
  private LoginService loginService;

  private User testUser;
  private UserLoginRequest loginRequest;

  @BeforeEach
  void setUp() {
    testUser = new User("John Doe", "john@test.com", "hashed_pass", Role.DOCTOR);
    testUser.setId(1L);
      loginRequest = new UserLoginRequest();
      loginRequest.setEmail("john@test.com");
      loginRequest.setPassword("raw_password");
  }

  @Test
  void authenticate_Success() {
    when(userRepository.findByEmail(anyString())).thenReturn(Optional.of(testUser));
    when(bCryptPasswordEncoder.matches("raw_password", "hashed_pass")).thenReturn(true);
    when(jwtUtil.generateToken(anyLong(), anyString(), anyString())).thenReturn("mocked_jwt_token");

    UserLoginResponse response = loginService.authenticate(loginRequest);

    assertNotNull(response);
    assertEquals("mocked_jwt_token", response.token());
    assertEquals("john@test.com", response.email());
    verify(userRepository).findByEmail("john@test.com");
  }

  @Test
  void authenticate_UserNotFound_ThrowsException() {
    when(userRepository.findByEmail("unknown@test.com")).thenReturn(Optional.empty());
      UserLoginRequest invalidRequest = new UserLoginRequest();
      invalidRequest.setEmail("unknown@test.com");
      invalidRequest.setPassword("pass");
    assertThrows(UserNotFoundException.class, () -> loginService.authenticate(invalidRequest));
  }

  @Test
  void authenticate_WrongPassword_ThrowsException() {
    when(userRepository.findByEmail(anyString())).thenReturn(Optional.of(testUser));
    when(bCryptPasswordEncoder.matches(anyString(), anyString())).thenReturn(false);
    assertThrows(InvalidCredentialsException.class, () -> loginService.authenticate(loginRequest));
  }
}
