package com.commerce.data.repository;

import com.commerce.data.entities.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image,Long > {
}
