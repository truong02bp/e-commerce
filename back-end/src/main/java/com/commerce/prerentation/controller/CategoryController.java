package com.commerce.prerentation.controller;

import com.commerce.data.dto.CategoryDto;
import com.commerce.data.entities.Category;
import com.commerce.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<Object> create(@RequestBody CategoryDto categoryDto){
        Category res = categoryService.create(categoryDto);
        return ResponseEntity.ok(res);
    }
    
}
