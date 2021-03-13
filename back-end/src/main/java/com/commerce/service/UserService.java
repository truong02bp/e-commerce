package com.commerce.service;

import com.commerce.data.dto.UserDto;
import com.commerce.data.entities.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    UserDto save(UserDto userDto);

    String sendOtp(String email, String firstName, String lastName);

    boolean isEmailExisted(String email);

    boolean isUsernameExisted(String username);

}
