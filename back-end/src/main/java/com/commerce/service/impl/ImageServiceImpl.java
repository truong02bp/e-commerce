package com.commerce.service.impl;

import com.commerce.common.constants.FolderConstants;
import com.commerce.common.exception.ApiException;
import com.commerce.data.dto.ImageDto;
import com.commerce.data.entities.Image;
import com.commerce.data.repository.ImageRepository;
import com.commerce.service.ImageService;
import com.commerce.service.MinioService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;

@Service
@AllArgsConstructor
public class ImageServiceImpl implements ImageService {

    private final ImageRepository imageRepository;

    private final MinioService minioService;

    @Override
    public Image save(ImageDto imageDto) {
        minioService.upload(FolderConstants.AVATAR_FOLDER, imageDto.getName(), new ByteArrayInputStream(imageDto.getBytes()));
        imageDto.setUrl(FolderConstants.AVATAR_FOLDER + imageDto.getName());
        return imageRepository.save(ImageDto.toEntity(imageDto));
    }

    @Override
    public Image update(ImageDto imageDto) {
        Image old = imageRepository.findById(imageDto.getId()).orElseThrow(() -> ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message("Invalid image"));
        minioService.upload(FolderConstants.AVATAR_FOLDER, imageDto.getName(), new ByteArrayInputStream(imageDto.getBytes()));
        imageDto.setUrl(FolderConstants.AVATAR_FOLDER + imageDto.getName());
        mapValue(old,ImageDto.toEntity(imageDto));
        return imageRepository.save(old);
    }

    private void mapValue(Image oldImage, Image newImage){
        if (newImage.getName() != null)
            oldImage.setName(newImage.getName());
        if (newImage.getType() != null)
            oldImage.setType(newImage.getType());
        if (newImage.getUrl() != null)
            oldImage.setUrl(newImage.getUrl());
    }

}
