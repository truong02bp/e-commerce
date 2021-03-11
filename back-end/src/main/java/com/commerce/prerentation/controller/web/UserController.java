package com.commerce.prerentation.controller.web;

import com.commerce.data.dto.UserDto;
import com.commerce.data.entities.User;
import com.commerce.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.net.URISyntaxException;

@RestController
@RequestMapping("/api")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/user")
    public ResponseEntity<User> create(@RequestBody UserDto userDto) throws URISyntaxException {
        User res = userService.save(userDto);
        return ResponseEntity.created(new URI("/api/user?id="+res.getId())).body(res);
    }

}
