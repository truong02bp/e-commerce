package com.commerce.service;

import com.commerce.data.dto.UserDto;
import com.commerce.data.entities.User;

public interface UserService {

    User save(UserDto userDto);

}
