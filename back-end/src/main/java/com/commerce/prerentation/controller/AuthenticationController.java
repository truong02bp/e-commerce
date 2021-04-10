package com.commerce.prerentation.controller;

import com.commerce.common.utils.JwtUtils;
import com.commerce.data.dto.request.AuthenticationRequest;
import com.commerce.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class AuthenticationController {

    private final AuthenticationManager authenticationManager;

    private final UserService userService;

    @PostMapping("/authenticate")
    public ResponseEntity<String> authentication(@RequestBody AuthenticationRequest authenticationRequest) {
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(authenticationRequest.getUsername(),
                    authenticationRequest.getPassword()));
        }
        catch (BadCredentialsException e) {
            throw new BadCredentialsException("Invalid username", e);
        }

        UserDetails userDetails = userService.loadUserByUsername(authenticationRequest.getUsername());
        String jwt = JwtUtils.generateToken(userDetails);
        return ResponseEntity.ok(jwt);
    }


}
