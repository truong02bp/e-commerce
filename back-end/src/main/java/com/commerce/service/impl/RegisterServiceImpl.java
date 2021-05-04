package com.commerce.service.impl;

import com.commerce.data.entities.User;
import com.commerce.data.repository.UserRepository;
import com.commerce.service.RegisterService;
import lombok.AllArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Random;

@Service
@AllArgsConstructor
@Transactional
public class RegisterServiceImpl implements RegisterService {

    private final JavaMailSender javaMailSender;

    private final UserRepository userRepository;


    @Override
    public String sendOtp(String email, String name) {
        SimpleMailMessage message = new SimpleMailMessage();
        Random random = new Random();
        String otp = String.valueOf(random.nextInt(8999) + 1000);
        message.setFrom("contact_e-commerce@gmail.com");
        message.setTo(email);
        message.setSubject("Hi " + name + ", you have notification");
        String content = "Hi " + name + "\n" + "Your otp code is : " + otp;
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
}
