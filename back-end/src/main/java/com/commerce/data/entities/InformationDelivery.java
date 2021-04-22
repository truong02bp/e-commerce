package com.commerce.data.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Data
@NoArgsConstructor
@Table(name = "information_delivery")
public class InformationDelivery extends BaseEntity {

    @Column(name = "address_detail", columnDefinition = "text")
    private String addressDetail;

    @Column(name = "phone")
    private String phone;

    @Column(name = "note", columnDefinition = "text")
    private String note;

    @Column(name = "is_default")
    private boolean isDefault;



}
