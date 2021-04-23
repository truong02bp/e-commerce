package com.commerce.data.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "evaluation")
@Data
public class Evaluation extends BaseEntity {

    @Column(name = "comment", columnDefinition = "text")
    private String comment;

    @Column(name = "star_number")
    private Integer star_number;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "item_id")
    private Item item;

}
