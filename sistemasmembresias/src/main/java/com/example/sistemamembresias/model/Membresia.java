package com.example.sistemamembresias.model;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;

@Entity
@Table(name = "membresia")
@Data
public class Membresia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario; // usuario de la membresia

    @ManyToOne
    @JoinColumn(name = "plan_id")
    private Plan plan; // plan del usuario

    private LocalDate fechaInicio;
    private LocalDate fechaTermino;
    private Boolean activo; //si esta o no la membresia activa
    
    private Integer viajesEsteMes; //viajes en el mes actual para activar plan frecuente de no cobro
}