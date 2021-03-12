package com.commerce.prerentation.controller.web;

import com.commerce.common.utils.JwtUtils;
import com.commerce.data.dto.MyUserDetails;
import com.commerce.data.dto.UserDto;
import com.commerce.data.dto.request.AuthenticationRequest;
import com.commerce.data.entities.User;
import com.commerce.service.UserService;
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
public class UserController {

    private final UserService userService;

    private final AuthenticationManager authenticationManager;

    public UserController(UserService userService, AuthenticationManager authenticationManager) {
        this.userService = userService;
        this.authenticationManager = authenticationManager;
    }

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

    @PostMapping("/authenticate")
    public ResponseEntity<String> authentication(@RequestBody AuthenticationRequest authenticationRequest){
        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(authenticationRequest.getUsername(),
                authenticationRequest.getPassword()));
        UserDetails userDetails = userService.loadUserByUsername(authenticationRequest.getUsername());
        String jwt = JwtUtils.generateToken(userDetails);
        return ResponseEntity.ok(jwt);
    }

}
