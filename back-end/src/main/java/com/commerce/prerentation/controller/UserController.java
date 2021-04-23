package com.commerce.prerentation.controller;

import com.commerce.data.dto.ImageDto;
import com.commerce.data.dto.MyUserDetails;
import com.commerce.data.dto.UserDto;
import com.commerce.service.MinioService;
import com.commerce.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @PutMapping("/user/update-avatar/{id}")
    public ResponseEntity<UserDto> updateAvatar(@PathVariable Long id,
                                          @RequestBody ImageDto imageDto){
        UserDto res = userService.changeAvatar(id,imageDto.getBytes(),imageDto.getType());
        return ResponseEntity.ok(res);
    }

    @PutMapping("/user/update-password")
    public ResponseEntity<UserDto> updatePassword(@RequestBody UserDto userDto){
        UserDto res = userService.changePassword(userDto);
        return ResponseEntity.ok(res);
    }

}
