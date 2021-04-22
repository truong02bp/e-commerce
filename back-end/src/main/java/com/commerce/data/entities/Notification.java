package com.commerce.data.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.Instant;

@Data
@Entity
@NoArgsConstructor
@Table(name = "notification")
public class Notification extends BaseEntity {

    @Column(name = "content", columnDefinition = "text")
    private String content;

    @ManyToOne
    private User user;


}
