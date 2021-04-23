package com.commerce.data.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
@Table(name = "image")
public class Image extends BaseEntity {

    @Column(name = "url")
    private String url;

    @Column(name = "name")
    private String name;

    @Column(name = "type")
    private String type;

    @ManyToOne
    @JoinColumn(name = "item_id")
    private Item item;

    @ManyToOne
    @JoinColumn(name = "evaluation_id")
    private Evaluation evaluation;

}
