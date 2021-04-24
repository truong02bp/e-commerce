package com.commerce.data.dto;

import com.commerce.data.entities.Image;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ImageDto {

    private byte[] bytes;

    private String type;

}
