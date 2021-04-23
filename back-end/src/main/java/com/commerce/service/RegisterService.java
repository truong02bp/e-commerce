package com.commerce.service;

public interface RegisterService {

    String sendOtp(String email, String firstName, String lastName);

    boolean isEmailExisted(String email);

    boolean isUsernameExisted(String username);

}
