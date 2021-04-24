package com.commerce.data.dto;

import com.commerce.data.entities.Role;
import com.commerce.data.entities.User;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDto {
    private Long id;
    private String email;
    private String username;
    private String password;
    private String newPassword;
    private String name;
    private String address;
    private String phone;
    private String urlImage;
    private Date dateOfBirth;
    private List<Role> roles;

    public static User toEntity(UserDto dto) {
        User entity = new User();
        entity.setId(dto.getId());
        entity.setAddress(dto.getAddress());
        entity.setEmail(dto.getEmail());
        entity.setName(dto.getName());
        entity.setPassword(dto.getPassword());
        entity.setUsername(dto.getUsername());
        entity.setPhone(dto.getPhone());
        entity.setRoles(dto.getRoles());
        entity.setDateOfBirth(dto.getDateOfBirth());
        return entity;
    }

    public static UserDto toDto(User user) {
        UserDto dto = new UserDto();
        dto.setId(user.getId());
        dto.setAddress(user.getAddress());
        dto.setEmail(user.getEmail());
        dto.setName(user.getName());
        dto.setUsername(user.getUsername());
        dto.setPhone(user.getPhone());
        dto.setPhone(user.getPhone());
        dto.setRoles(user.getRoles());
        dto.setDateOfBirth(user.getDateOfBirth());
        if (user.getImage() != null)
            dto.setUrlImage(user.getImage().getUrl());
        return dto;
    }


}
