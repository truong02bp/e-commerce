package com.commerce.data.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "product")
public class Product extends BaseEntity {

    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Column(name = "price")
    private Long price;

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @ManyToOne
    @JoinColumn(name = "sale_id")
    private Sale sale;
}
