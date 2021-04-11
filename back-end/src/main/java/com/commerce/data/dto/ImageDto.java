package com.commerce.data.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ImageDto {

    private byte[] bytes;

    private String type;

}
