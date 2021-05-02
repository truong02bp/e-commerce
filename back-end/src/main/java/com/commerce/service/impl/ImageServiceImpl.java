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
import java.time.LocalDateTime;

@Service
@AllArgsConstructor
public class ImageServiceImpl implements ImageService {

    private final ImageRepository imageRepository;

    private final MinioService minioService;

    @Override
    public Image save(ImageDto imageDto) {
        if (imageDto.getName() == null){
            imageDto.setName(LocalDateTime.now().toString());
        }
        if (imageDto.getFolder() == null)
            imageDto.setFolder(FolderConstants.DEFAULT_FOLDER);
        minioService.upload(imageDto.getFolder(), imageDto.getName(), new ByteArrayInputStream(imageDto.getBytes()));
        imageDto.setUrl(imageDto.getFolder() + imageDto.getName());
        return imageRepository.save(ImageDto.toEntity(imageDto));
    }

    @Override
    public Image update(ImageDto imageDto) {
        if (imageDto.getName() == null){
            imageDto.setName(LocalDateTime.now().toString());
        }
        if (imageDto.getFolder() == null)
            imageDto.setFolder(FolderConstants.DEFAULT_FOLDER);
        Image old = imageRepository.findById(imageDto.getId()).orElseThrow(() -> ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message("Invalid image"));
        minioService.delete(old.getUrl());
        minioService.upload(imageDto.getFolder(), imageDto.getName(), new ByteArrayInputStream(imageDto.getBytes()));
        imageDto.setUrl(imageDto.getFolder() + imageDto.getName());
        mapValue(old, ImageDto.toEntity(imageDto));
        return imageRepository.save(old);
    }

    private void mapValue(Image oldImage, Image newImage) {
        if (newImage.getName() != null)
            oldImage.setName(newImage.getName());
        if (newImage.getType() != null)
            oldImage.setType(newImage.getType());
        if (newImage.getUrl() != null)
            oldImage.setUrl(newImage.getUrl());
    }

}
