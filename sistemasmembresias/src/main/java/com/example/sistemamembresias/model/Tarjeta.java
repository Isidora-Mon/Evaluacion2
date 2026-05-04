package com.example.sistemamembresias.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "tarjetas")
@Data
public class Tarjeta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String numeroTarjeta;
    
    private Double saldo;

    @OneToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;
}