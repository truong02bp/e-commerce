package com.commerce.service.impl;

import com.commerce.common.constants.FolderConstants;
import com.commerce.data.dto.CategoryDto;
import com.commerce.data.entities.Category;
import com.commerce.data.repository.CategoryRepository;
import com.commerce.data.repository.ImageRepository;
import com.commerce.service.CategoryService;
import com.commerce.service.ImageService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    final CategoryRepository categoryRepository;

    final ImageService imageService;

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public List<Category> findAll(Pageable pageable) {
        return categoryRepository.findAll(pageable).getContent();
    }

    @Override
    public Category create(CategoryDto categoryDto) {
        Category category = CategoryDto.toEntity(categoryDto);
        categoryDto.getImageDto().setFolder(FolderConstants.CATEGORY_FOLDER);
        category.setImage(imageService.save(categoryDto.getImageDto()));
        return categoryRepository.save(category);
    }

    @Override
    public Category update(CategoryDto categoryDto) {
        return null;
    }


    @Override
    public void delete(Long id) {
        categoryRepository.deleteById(id);
    }
}
