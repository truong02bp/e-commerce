package com.commerce.data.entities;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@Table(name = "province")
public class Province extends BaseEntity {

    @Column(name = "name")
    private String name;

}
