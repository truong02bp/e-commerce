package com.commerce.data.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "cart")
public class Cart extends BaseEntity {

    @Column(name = "quantities")
    private Long quantities;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "item_id")
    private Product product;

}
