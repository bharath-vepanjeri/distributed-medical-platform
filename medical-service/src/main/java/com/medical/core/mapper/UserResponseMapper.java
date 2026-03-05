package com.medical.core.mapper;

import com.medical.core.dto.UserRegisterResponse;
import com.medical.core.entity.User;
import org.springframework.stereotype.Component;

@Component
public class UserResponseMapper {

  public UserRegisterResponse mapToUserRegisterResponse(User user) {
    return new UserRegisterResponse(
        user.getId(), user.getName(), user.getEmail(), user.getRole(), user.getCreatedAt());
  }
}
