package com.commerce.data.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "commune")
public class Commune extends BaseEntity {

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "district_id")
    private District district;

}
