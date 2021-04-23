package com.commerce.data.dto;

import com.commerce.data.entities.Role;
import com.commerce.data.entities.User;
import com.commerce.service.MinioService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

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
    private String firstName;
    private String lastName;
    private String address;
    private String phone;
    private ImageDto image;
    private String urlImage;
    private List<Role> roles;

    public static User toEntity(UserDto dto) {
        User entity = new User();
        entity.setId(dto.getId());
        entity.setAddress(dto.getAddress());
        entity.setEmail(dto.getEmail());
        entity.setFirstName(dto.getFirstName());
        entity.setLastName(dto.getLastName());
        entity.setPassword(dto.getPassword());
        entity.setUsername(dto.getUsername());
        entity.setPhone(dto.getPhone());
        entity.setRoles(dto.getRoles());
        return entity;
    }

    public static UserDto toDto(User user) {
        UserDto dto = new UserDto();
        dto.setId(user.getId());
        dto.setAddress(user.getAddress());
        dto.setEmail(user.getEmail());
        dto.setFirstName(user.getFirstName());
        dto.setLastName(user.getLastName());
        dto.setUsername(user.getUsername());
        dto.setPhone(user.getPhone());
        dto.setPhone(user.getPhone());
        dto.setRoles(user.getRoles());
        dto.setUrlImage(user.getImage().getUrl());
        return dto;
    }

}
