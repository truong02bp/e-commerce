package com.commerce.prerentation.controller;

import com.commerce.data.entities.Category;
import com.commerce.service.CategoryService;
import com.commerce.service.ImageService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping("/category")
    public ResponseEntity<Object> getAll(Pageable pageable){
        List<Category> res = categoryService.findAll(pageable);
        return ResponseEntity.ok(res);
    }

    @PostMapping("/category")
    public ResponseEntity<Object> create(Category category){
        Category res = categoryService.create(category);
        return ResponseEntity.ok(res);
    }
    
}
