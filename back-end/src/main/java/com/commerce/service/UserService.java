package com.commerce.service;

import com.commerce.data.dto.ImageDto;
import com.commerce.data.dto.UserDto;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    UserDto save(UserDto userDto);

    UserDto changeAvatar(Long id, ImageDto imageDto);

    UserDto changePassword(UserDto userDto);

}
