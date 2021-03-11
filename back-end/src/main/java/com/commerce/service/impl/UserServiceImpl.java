package com.commerce.service.impl;

import com.commerce.data.dto.UserDto;
import com.commerce.data.entities.User;
import com.commerce.data.repository.UserRepository;
import com.commerce.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User save(UserDto userDto) {
        User user = UserDto.toEntity(userDto);
//        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }
}
