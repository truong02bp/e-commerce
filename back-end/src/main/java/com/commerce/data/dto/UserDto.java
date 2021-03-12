package com.commerce.data.dto;

import com.commerce.data.entities.Role;
import com.commerce.data.entities.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

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
    private List<Role> roles;

    public static User toEntity(UserDto dto) {
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
        if (dto.getRoles() != null)
            entity.setRoles(dto.getRoles());
        return entity;
    }

    public static UserDto toDto(User user){
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
        return dto;
    }

}
