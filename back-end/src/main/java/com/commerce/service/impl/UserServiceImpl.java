package com.commerce.service.impl;

import com.commerce.common.constants.FolderConstants;
import com.commerce.common.constants.MessageConstants;
import com.commerce.common.exception.ApiException;
import com.commerce.data.dto.ImageDto;
import com.commerce.data.dto.MyUserDetails;
import com.commerce.data.dto.UserDto;
import com.commerce.data.entities.Image;
import com.commerce.data.entities.User;
import com.commerce.data.repository.ImageRepository;
import com.commerce.data.repository.UserRepository;
import com.commerce.service.ImageService;
import com.commerce.service.MinioService;
import com.commerce.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayInputStream;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {


    private final UserRepository userRepository;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    private final ImageService imageService;

    @Override
    @Transactional
    public UserDto save(UserDto userDto) {
        User user;
        if (userDto.getId() == null) {
            user = UserDto.toEntity(userDto);
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        } else {
            user = userRepository.findById(userDto.getId()).orElseThrow(() -> ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message("Invalid user"));
            mapData(userDto, user);
        }
        return UserDto.toDto(userRepository.save(user));
    }

    @Override
    @Transactional
    public UserDto changeAvatar(Long id, ImageDto imageDto) {
        User user = userRepository.findById(id).orElseThrow(() -> ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message("Invalid user"));
        String fileName = "user_" + user.getId() + "_" + LocalDateTime.now() + "." + imageDto.getType();
        imageDto.setName(fileName);
        if (user.getImage() != null){
            user.setImage(imageService.save(imageDto));
        }
        else
            user.setImage(imageService.update(imageDto));
        return UserDto.toDto(userRepository.save(user));
    }

    @Override
    @Transactional
    public UserDto changePassword(UserDto userDto) {
        User user = userRepository.findById(userDto.getId()).orElseThrow(() -> ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message("Invalid user"));
        String oldPassword = userDto.getPassword();
        String newPassword = userDto.getNewPassword();
        if (oldPassword != null && newPassword != null) {
            if (!bCryptPasswordEncoder.matches(oldPassword, user.getPassword()))
                throw ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message(MessageConstants.OLD_PASSWORD_WRONG);
            user.setPassword(bCryptPasswordEncoder.encode(newPassword));
        }
        return UserDto.toDto(userRepository.save(user));
    }




    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null)
            throw new UsernameNotFoundException("Invalid user");
        List<GrantedAuthority> authorities = new ArrayList<>();
        if (user.getRoles() != null) {
            user.getRoles().forEach(role -> authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getCode())));
        }
        return new MyUserDetails(user.getUsername(), user.getPassword(), true, true, true, true, authorities, UserDto.toDto(user));
    }

    private void mapData(UserDto userDto , User user){
        if (userDto.getAddress() != null)
            user.setAddress(userDto.getAddress());
        if (userDto.getEmail() != null)
            user.setEmail(userDto.getEmail());
        if (userDto.getPhone() != null)
            user.setPhone(userDto.getPhone());
        if (userDto.getName() != null)
            user.setName(userDto.getName());
        if (userDto.getPassword() != null)
            user.setPassword(userDto.getPassword());
        if (userDto.getUsername() != null)
            user.setUsername(userDto.getUsername());
        if (userDto.getDateOfBirth() != null)
            user.setDateOfBirth(userDto.getDateOfBirth());
    }
}
