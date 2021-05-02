package com.commerce.data.dto;

import com.commerce.data.entities.Category;
import lombok.Data;
@Data
public class CategoryDto {

    private String name;

    private String code;

    private ImageDto imageDto;

}
