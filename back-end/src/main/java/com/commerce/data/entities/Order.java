package com.commerce.data.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "order")
@Data
public class Order extends BaseEntity {

    @Column(name = "is_payed")
    private boolean isPayed;

    @ManyToOne
    @JoinColumn(name = "cart_id")
    private Cart cart;

    @ManyToOne
    @JoinColumn(name = "information_delivery_id")
    private InformationDelivery informationDelivery;


}
