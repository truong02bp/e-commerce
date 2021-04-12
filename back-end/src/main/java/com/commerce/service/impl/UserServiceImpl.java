package com.commerce.service.impl;
import com.commerce.common.constants.FolderConstants;
import com.commerce.common.exception.ApiException;
import com.commerce.common.constants.MessageConstants;
import com.commerce.data.dto.MyUserDetails;
import com.commerce.data.dto.UserDto;
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
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {



    private final UserRepository userRepository;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    private final JavaMailSender javaMailSender;

    private final MinioService minioService;

    @Override
    public UserDto save(UserDto userDto) {
        User user = UserDto.toEntity(userDto);
        if (user.getId() == null){
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        }
        else {
            User old = userRepository.findById(user.getId()).get();
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
            // change password
            String oldPassword = userDto.getOldPassword();
            String newPassword = user.getPassword();
            if (oldPassword != null && newPassword != null){
                if (!bCryptPasswordEncoder.matches(oldPassword,old.getPassword()))
                    throw ApiException.from(HttpStatus.INTERNAL_SERVER_ERROR).message(MessageConstants.OLD_PASSWORD_WRONG);
                user.setPassword(bCryptPasswordEncoder.encode(newPassword));
            }
            // change avatar
            byte[] data = userDto.getImage().getBytes();
            if (data != null ){
                String fileName = "avatar_user_"+user.getId() + "." + userDto.getImage().getType();
                minioService.upload(FolderConstants.AVATAR_FOLDER,fileName,new ByteArrayInputStream(data));
                user.setUrlImage(FolderConstants.AVATAR_FOLDER + fileName);
            }
        }
        return UserDto.toDto(userRepository.save(user));
    }

    @Override
    public String sendOtp(String email, String firstName, String lastName) {
        SimpleMailMessage message = new SimpleMailMessage();
        Random random = new Random();
        String otp = String.valueOf(random.nextInt(8999) + 1000);
        message.setFrom("contact_e-commerce@gmail.com");
        message.setTo(email);
        String fullName = firstName + " " + lastName;
        message.setSubject(fullName + " has notification");
        String content = "Hi " + fullName + "\n" + "Your otp code is : " + otp;
        message.setText(content);
        javaMailSender.send(message);
        return otp;
    }

    @Override
    public boolean isEmailExisted(String email) {
        User user = userRepository.findByEmail(email);
        return !(user == null);
    }

    @Override
    public boolean isUsernameExisted(String username) {
        User user = userRepository.findByUsername(username);
        return !(user == null);
    }


    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null)
            throw new UsernameNotFoundException("Invalid user");
        List<GrantedAuthority> authorities = new ArrayList<>();
        if (user.getRoles() != null){
            user.getRoles().forEach(role -> {
                authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getCode()));
            });
        }
        return new MyUserDetails(user.getUsername(),user.getPassword(),true,true,true,true, authorities, UserDto.toDto(user));
    }
}
