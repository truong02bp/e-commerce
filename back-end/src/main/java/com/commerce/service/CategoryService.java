package com.commerce.service;

import com.commerce.data.entities.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CategoryService {

    List<Category> findAll();

    List<Category> findAll(Pageable pageable);

    Category create(Category category);

    Category update(Category category);

    void delete(Long id);
}
