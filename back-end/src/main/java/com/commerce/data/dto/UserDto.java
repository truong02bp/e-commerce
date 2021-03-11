package com.commerce.data.dto;

import com.commerce.data.entities.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDto {

    private Long id;
    private String email;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String address;
    private String phone;

    public static User toEntity(UserDto dto){
        User entity = new User();
        if (dto.getId() != null)
            entity.setId(dto.getId());
        if (dto.getAddress() != null)
            entity.setAddress(dto.getAddress());
        if (dto.getEmail() != null)
            entity.setEmail(dto.getEmail());
        if (dto.getFirstName() != null)
            entity.setFirstName(dto.getFirstName());
        if (dto.getLastName() != null)
            entity.setLastName(dto.getLastName());
        if (dto.getPassword() != null)
            entity.setPassword(dto.getPassword());
        if (dto.getUsername() != null)
            entity.setUsername(dto.getUsername());
        if (dto.getPhone() != null)
            entity.setPhone(dto.getPhone());
        return entity;
    }

}
