package com.commerce.data.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

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

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "province_id")
    private Province province;

    @ManyToOne
    @JoinColumn(name = "district_id")
    private District district;

    @ManyToOne
    @JoinColumn(name = "commune_id")
    private Commune commune;

}
