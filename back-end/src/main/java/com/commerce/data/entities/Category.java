package com.commerce.data.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "category")
public class Category extends BaseEntity {

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @ManyToOne
    @JoinColumn(name = "image_id")
    private Image image;

}
