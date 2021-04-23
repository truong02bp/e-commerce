package com.commerce.data.entities;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.time.Instant;

@Data
@Entity
@Table(name = "sale")
public class Sale extends BaseEntity {

    @Column(name = "percent")
    private Integer percent;

    @Column(name = "price_down")
    private Long priceDown;

    @Column(name = "date_start")
    private Instant dateStart;

    @Column(name = "date_end")
    private Instant dateEnd;


}
