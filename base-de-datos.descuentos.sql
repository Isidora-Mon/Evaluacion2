CREATE DATABASE IF NOT EXISTS sistema_descuentos;
USE sistema_descuentos;

CREATE TABLE regiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE comunas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    region_id INT,
    CONSTRAINT fk_comuna_region FOREIGN KEY (region_id) REFERENCES regiones(id)
);

CREATE TABLE franquicias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL
);

CREATE TABLE tipos_descuento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE condiciones_grupo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_grupo VARCHAR(100) NOT NULL
);

CREATE TABLE condiciones_especificas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    metrica VARCHAR(100),
    valor_requerido DECIMAL(15,2),
    grupo_condiciones_id INT,
    CONSTRAINT fk_condicion_grupo FOREIGN KEY (grupo_condiciones_id) REFERENCES condiciones_grupo(id)
);

CREATE TABLE niveles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nivel VARCHAR(50) NOT NULL,
    condiciones_id INT,
    CONSTRAINT fk_nivel_condiciones FOREIGN KEY (condiciones_id) REFERENCES condiciones_grupo(id)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    nivel_id INT,
    comuna_id INT,
    CONSTRAINT fk_usuario_nivel FOREIGN KEY (nivel_id) REFERENCES niveles(id),
    CONSTRAINT fk_usuario_comuna FOREIGN KEY (comuna_id) REFERENCES comunas(id)
);

CREATE TABLE descuentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor_descuento DECIMAL(10,2) NOT NULL,
    descripcion VARCHAR(255),
    franquicia_id INT,
    tipo_descuento_id INT,
    comuna_id INT,
    CONSTRAINT fk_descuento_franquicia FOREIGN KEY (franquicia_id) REFERENCES franquicias(id),
    CONSTRAINT fk_descuento_tipo FOREIGN KEY (tipo_descuento_id) REFERENCES tipos_descuento(id),
    CONSTRAINT fk_descuento_comuna FOREIGN KEY (comuna_id) REFERENCES comunas(id)
);

CREATE TABLE usuarios_descuentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    descuento_id INT,
    fecha_aplicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historial_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT fk_historial_descuento FOREIGN KEY (descuento_id) REFERENCES descuentos(id)
);

INSERT INTO regiones (nombre) VALUES ('Metropolitana'), ('Valparaíso'), ('Biobío');
INSERT INTO comunas (nombre, region_id) VALUES ('Santiago', 1), ('Viña del Mar', 2), ('Concepción', 3);
INSERT INTO franquicias (nombre_empresa) VALUES ('Burger King'), ('CineHoyts'), ('Starbucks');
INSERT INTO tipos_descuento (tipo) VALUES ('Porcentaje'), ('Monto Fijo'), ('2x1');
INSERT INTO condiciones_grupo (nombre_grupo) VALUES ('Requisitos Plata'), ('Requisitos Oro');
INSERT INTO niveles (nombre_nivel, condiciones_id) VALUES ('Bronce', NULL), ('Plata', 1), ('Oro', 2);
