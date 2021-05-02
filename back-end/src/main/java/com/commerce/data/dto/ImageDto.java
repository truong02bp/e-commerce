package com.commerce.data.dto;

import com.commerce.data.entities.Image;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ImageDto {
    private Long id;

    private byte[] bytes;

    private String url;

    private String name;

    private String type;

    private String folder;

    public static Image toEntity(ImageDto imageDto){
        Image image = new Image();
        image.setId(imageDto.getId());
        image.setUrl(imageDto.getUrl());
        image.setName(imageDto.getName());
        image.setType(imageDto.getType());
        return image;
    }

    public static ImageDto toDto(Image image){
        ImageDto imageDto = new ImageDto();
        imageDto.setId(image.getId());
        imageDto.setType(image.getType());
        imageDto.setUrl(image.getUrl());
        imageDto.setName(image.getName());
        return imageDto;
    }

}
