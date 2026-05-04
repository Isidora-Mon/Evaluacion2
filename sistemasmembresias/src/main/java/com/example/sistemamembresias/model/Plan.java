package com.example.sistemamembresias.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "planes")
@Data
public class Plan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;
    private Double precioMensual; //precio del plan
    private Integer PorcenajeDescuento; //porcentaje de descuento del plan
    private Integer LimiteViajes; //limite de viajes con descuento
}