package com.commerce.service.impl;

import com.commerce.common.constants.FolderConstants;
import com.commerce.common.exception.ApiException;
import com.commerce.common.constants.MessageConstants;
import com.commerce.data.dto.UserDto;
import com.commerce.data.dto.MyUserDetails;
import com.commerce.data.entities.User;
import com.commerce.data.repository.UserRepository;
import com.commerce.service.MinioService;
import com.commerce.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
import java.util.Random;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {


    private final UserRepository userRepository;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    private final MinioService minioService;

    @Override
    @Transactional
    public UserDto save(UserDto userDto) {
        User user = UserDto.toEntity(userDto);
        if (user.getId() == null) {
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        } else {
            User old = userRepository.findById(user.getId()).orElseThrow(() -> ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message("Invalid user"));
            if (user.getAddress() == null)
                user.setAddress(old.getAddress());
            if (user.getEmail() == null)
                user.setEmail(old.getEmail());
            if (user.getPhone() == null)
                user.setPhone(old.getPhone());
            if (user.getFirstName() == null)
                user.setFirstName(old.getFirstName());
            if (user.getLastName() == null)
                user.setLastName(old.getLastName());
            if (user.getPassword() == null)
                user.setPassword(old.getPassword());
            if (user.getUsername() == null)
                user.setUsername(old.getUsername());
        }
        return UserDto.toDto(userRepository.save(user));
    }

    @Override
    @Transactional
    public UserDto changeAvatar(Long id, byte[] data, String type) {
        User user = userRepository.findById(id).orElseThrow(() -> ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message("Invalid user"));
        String fileName = "user_" + user.getId() + "_" + LocalDateTime.now() + "." + type;
        minioService.upload(FolderConstants.AVATAR_FOLDER, fileName, new ByteArrayInputStream(data));
        user.getImage().setUrl(FolderConstants.AVATAR_FOLDER + fileName);
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
}
