package com.commerce.service;

import com.commerce.data.dto.ImageDto;
import com.commerce.data.entities.Image;

public interface ImageService {

    Image save(ImageDto imageDto);

    Image update(ImageDto imageDto);
}
