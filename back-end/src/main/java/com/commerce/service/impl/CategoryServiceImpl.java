package com.commerce.service.impl;

import com.commerce.common.constants.FolderConstants;
import com.commerce.common.exception.ApiException;
import com.commerce.data.dto.CategoryDto;
import com.commerce.data.entities.Category;
import com.commerce.data.repository.CategoryRepository;
import com.commerce.service.CategoryService;
import com.commerce.service.ImageService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
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
        Category category = categoryRepository.findById(categoryDto.getId()).orElseThrow(() -> ApiException.builder().httpStatus(HttpStatus.INTERNAL_SERVER_ERROR).message("Invalid category"));
        mapData(category,CategoryDto.toEntity(categoryDto));
        if (category.getImage() == null)
            category.setImage(imageService.save(categoryDto.getImageDto()));
        else
            category.setImage(imageService.update(categoryDto.getImageDto()));
        return categoryRepository.save(category);
    }


    @Override
    public void delete(Long id) {
        categoryRepository.deleteById(id);
    }

    private void mapData(Category old, Category newCategory){
        if (newCategory.getName() != null)
            old.setName(newCategory.getName());
        if (newCategory.getCode() != null)
            old.setCode(newCategory.getCode());
    }
}
