package com.commerce.prerentation.controller;

import com.commerce.service.RegisterService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api")
public class RegisterController {

    private RegisterService registerService;

    @PostMapping("/register/otp")
    public ResponseEntity<String> sendOtp(@RequestParam("email") String email,
                                          @RequestParam("firstName") String firstName,
                                          @RequestParam("lastName") String lastName) {
        String otp = registerService.sendOtp(email,firstName,lastName);
        return ResponseEntity.ok(otp);
    }

    @PostMapping("/register/check-email")
    public ResponseEntity<Boolean> checkEmailExisted(@RequestParam("email") String email){
        Boolean res = registerService.isEmailExisted(email);
        return ResponseEntity.ok(res);
    }

    @PostMapping("/register/check-username")
    public ResponseEntity<Boolean> checkUsernameExisted(@RequestParam("username") String username){
        Boolean res = registerService.isUsernameExisted(username);
        return ResponseEntity.ok(res);
    }

}
