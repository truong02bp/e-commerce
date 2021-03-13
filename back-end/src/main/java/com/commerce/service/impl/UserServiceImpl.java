package com.commerce.service.impl;

import com.commerce.data.dto.MyUserDetails;
import com.commerce.data.dto.UserDto;
import com.commerce.data.entities.User;
import com.commerce.data.repository.UserRepository;
import com.commerce.service.UserService;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    private final JavaMailSender javaMailSender;

    public UserServiceImpl(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder, JavaMailSender javaMailSender) {
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.javaMailSender = javaMailSender;
    }

    @Override
    public UserDto save(UserDto userDto) {
        User user = UserDto.toEntity(userDto);
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
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
        return user == null;
    }

    @Override
    public boolean isUsernameExisted(String username) {
        User user = userRepository.findByUsername(username);
        return user == null;
    }


    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        List<GrantedAuthority> authorities = new ArrayList<>();
        if (user.getRoles() != null){
            user.getRoles().forEach(role -> {
                authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getCode()));
            });
        }
        return new MyUserDetails(user.getUsername(),user.getPassword(),true,true,true,true, authorities, UserDto.toDto(user));
    }
}
