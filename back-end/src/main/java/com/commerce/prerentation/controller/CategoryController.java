package com.commerce.prerentation.controller;

import com.commerce.data.entities.Category;
import com.commerce.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class CategoryController {

    private final CategoryService categoryService;

    @PostMapping("/category")
    public ResponseEntity<Object> create(Category category){
        Category res = categoryService.create(category);
        return ResponseEntity.ok(res);
    }
}
