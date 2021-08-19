DROP DATABASE IF EXISTS myspa;
CREATE DATABASE myspa;
USE myspa;

CREATE TABLE persona(
    id_persona INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL DEFAULT "",
    apellido_paterno VARCHAR(50) NOT NULL DEFAULT "",
    apellido_materno VARCHAR(50) NOT NULL DEFAULT "",
    genero VARCHAR(2) NOT NULL DEFAULT "0",
    rfc VARCHAR(14) NOT NULL DEFAULT "",
    domicilio VARCHAR(200) NOT NULL DEFAULT "",
    telefono VARCHAR(25) NOT NULL DEFAULT ""
);

CREATE TABLE usuario(
    id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    contrasenia VARCHAR(50) NOT NULL DEFAULT "",
    rol VARCHAR(25) NOT NULL DEFAULT ""
);

CREATE TABLE empleado(
    id_empleado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    num_empleado VARCHAR(50),
    fotografia LONGTEXT,
    ruta_fotografia TEXT,
    puesto VARCHAR(25) NOT NULL,
    estatus INT NOT NULL DEFAULT "",
    id_persona INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_empleado_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_empleado_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cliente(
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    correo VARCHAR(50) NOT NULL DEFAULT "",
    num_unico_cliente VARCHAR(50) NOT NULL,
	estatus INT NOT NULL DEFAULT 1,
    id_persona INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_cliente_persona FOREIGN KEY (id_persona) REFERENCES persona (id_persona) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_cliente_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE producto(
    id_producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL DEFAULT "",
    marca VARCHAR(50) NOT NULL DEFAULT "",
    precio_uso FLOAT NOT NULL DEFAULT 0.0,
    estatus INT NOT NULL
);

CREATE TABLE tratamiento(
    id_tratamiento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(80) NOT NULL
);

CREATE TABLE sucursal(
    id_sucursal INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL DEFAULT "",
	domicilio VARCHAR(200),
    latitud DOUBLE NOT NULL DEFAULT 0.0,
    longitud DOUBLE NOT NULL DEFAULT 0.0,
    estatus INT NOT NULL DEFAULT 1
);

CREATE TABLE sala(
    id_sala INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL DEFAULT "",
    descripcion TEXT,
    fotografia LONGTEXT,
    estatus INT NOT NULL DEFAULT 1,
    ruta_fotografia TEXT,
    id_sucursal INT NOT NULL,
    CONSTRAINT fk_sala_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE horario(
    id_horario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    hora_termino VARCHAR(6),
    hora_inicio VARCHAR(6)
);

CREATE TABLE sala_horario(
    id_horario INT NOT NULL,
    id_sala INT NOT NULL,
    CONSTRAINT fk_sala_horario_horario FOREIGN KEY (id_horario) REFERENCES horario (id_horario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_sala_horario_sala FOREIGN KEY (id_sala) REFERENCES sala (id_sala) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reservacion(
    id_reservacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME,
    estatus INT,
    id_cliente INT NOT NULL,
    id_sala INT NOT NULL,
    CONSTRAINT fk_reservacion_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_reservacion_sala FOREIGN KEY (id_sala) REFERENCES sala (id_sala) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE servicio(
    id_servicio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    costo FLOAT NOT NULL DEFAULT 0.0,
    id_empleado INT NOT NULL,
    id_reservacion INT NOT NULL,
    CONSTRAINT fk_servicio_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_servicio_reservacion FOREIGN KEY (id_reservacion) REFERENCES reservacion(id_reservacion) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tratamiento_servicio(
    id_tratamiento_servicio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    costo VARCHAR(45) NOT NULL,
    id_servicio INT NOT NULL,
    id_tratamiento INT NOT NULL,
    CONSTRAINT fk_tratamiento_servicio_servicio FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_tratamiento_servicio_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES tratamiento (id_tratamiento) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tratamiento_servicio_producto(
    id_tratamiento_servicio INT NOT NULL,
    id_producto INT NOT NULL,
    precio_uso FLOAT NOT NULL DEFAULT 0.0,
    CONSTRAINT fk_tratamiento_servicio_producto_tratamiento_servicio FOREIGN KEY (id_tratamiento_servicio) REFERENCES tratamiento_servicio(id_tratamiento_servicio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_tratamiento_servicio_producto_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE
);
