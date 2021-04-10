package com.commerce.prerentation.controller;

import com.commerce.common.utils.JwtUtils;
import com.commerce.data.dto.MyUserDetails;
import com.commerce.data.dto.UserDto;
import com.commerce.data.dto.request.AuthenticationRequest;
import com.commerce.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/user")
    public ResponseEntity<UserDto> getUser(){
        MyUserDetails myUserDetails = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return ResponseEntity.ok(myUserDetails.getUser());
    }

    @PostMapping("/user")
    public ResponseEntity<UserDto> create(@RequestBody UserDto userDto) throws URISyntaxException {
        UserDto res = userService.save(userDto);
        return ResponseEntity.created(new URI("/api/user?id="+res.getId())).body(res);
    }

    @PutMapping("/user")
    public ResponseEntity<UserDto> update(@RequestBody UserDto userDto) {
        UserDto res = userService.save(userDto);
        return ResponseEntity.ok(res);
    }

    @PostMapping("/user/otp")
    public ResponseEntity<String> sendOtp(@RequestParam("email") String email,
                                          @RequestParam("firstName") String firstName,
                                          @RequestParam("lastName") String lastName) {
        String otp = userService.sendOtp(email,firstName,lastName);
        return ResponseEntity.ok(otp);
    }

    @PostMapping("/user/check-email")
    public ResponseEntity<Boolean> checkEmailExisted(@RequestParam("email") String email){
        Boolean res = userService.isEmailExisted(email);
        return ResponseEntity.ok(res);
    }

    @PostMapping("/user/check-username")
    public ResponseEntity<Boolean> checkUsernameExisted(@RequestParam("username") String username){
        Boolean res = userService.isUsernameExisted(username);
        return ResponseEntity.ok(res);
    }
}
