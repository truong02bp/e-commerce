package com.commerce.data.dto;

import com.commerce.data.entities.Category;
import lombok.Data;
@Data
public class CategoryDto {

    private Long id;

    private String name;

    private String code;

    private ImageDto imageDto;

    public static Category toEntity(CategoryDto dto){
        Category category = new Category();
        category.setCode(dto.getCode());
        category.setName(dto.getName());
        category.setId(dto.getId());
        return category;
    }

    public static CategoryDto toDto(Category category){
        CategoryDto categoryDto = new CategoryDto();
        categoryDto.setCode(category.getCode());
        categoryDto.setName(category.getName());
        categoryDto.setId(category.getId());
        categoryDto.setImageDto(ImageDto.toDto(category.getImage()));
        return categoryDto;
    }

}
