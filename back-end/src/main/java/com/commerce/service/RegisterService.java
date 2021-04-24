package com.commerce.service;

public interface RegisterService {

    String sendOtp(String email, String name);

    boolean isEmailExisted(String email);

    boolean isUsernameExisted(String username);

}
