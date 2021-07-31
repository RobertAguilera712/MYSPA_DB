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
    descripcion VARCHAR(80) NOT NULL,
);

CREATE TABLE sucursal(
    id_sucursal INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL DEFAULT "",
	domicilio VARCHAR(200)
    latitud DOUBLE NOT NULL DEFAULT 0.0,
    longitud DOUBLE NOT NULL DEFAULT 0.0,
    estatus INT NOT NULL DEFAULT 1
);
--Sin terminar
CREATE TABLE sala(
    id_sala INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL DEFAULT "",
    descripcion VARCHAR(80) NOT NULL,
    fotografia BLOB NOT NULL,
    estatus BOOL NOT NULL,
    ruta_fotografia VARCHAR(30) NOT NULL,
    id_sucursal INT NOT NULL,
    CONSTRAINT sala_id_sucursal_fk1 FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal)
);

CREATE TABLE horario(
    id_horario INT NOT NULL,
    hora_termino TIME NOT NULL,
    hora_inicio TIME NOT NULL,
    CONSTRAINT horario_id_horario_pk PRIMARY KEY (id_horario)
);

CREATE TABLE servicio(
    id_servicio INT NOT NULL,
    costo INT NOT NULL,
    id_empleado INT NOT NULL,
    CONSTRAINT servicio_id_servicio_pk PRIMARY KEY (id_servicio),
    CONSTRAINT servicio_id_empleado_fk1 FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE reservacion(
    id_reservacion INT NOT NULL,
    fecha DATE NOT NULL,
    estatus VARCHAR(15) NOT NULL,
    id_cliente INT NOT NULL,
    id_servicio INT NOT NULL,
    id_sala INT NOT NULL,
    CONSTRAINT reservacion_id_reservacion_pk PRIMARY KEY (id_reservacion),
    CONSTRAINT reservacion_id_servicio_uq UNIQUE (id_servicio),
    CONSTRAINT reservacion_id_sala_uq UNIQUE (id_sala),
    CONSTRAINT reservacion_id_cliente_fk1 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT reservacion_id_servicio_fk2 FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio),
    CONSTRAINT reservacion_id_sala_fk3 FOREIGN KEY (id_sala) REFERENCES sala (id_sala)
);

CREATE TABLE tratamiento_servicio(
    id_tratamiento_servicio INT NOT NULL,
    costo VARCHAR(45) NOT NULL,
    id_servicio INT NOT NULL,
    id_tratamiento INT NOT NULL,
    id_producto INT NOT NULL,
    CONSTRAINT tratamiento_servicio_id_tratamiento_servicio PRIMARY KEY (id_tratamiento_servicio),
    CONSTRAINT tratamiento_servicio_id_servicio_fk1 FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio),
    CONSTRAINT tratamiento_servicio_id_tratamiento_fk2 FOREIGN KEY (id_tratamiento) REFERENCES tratamiento (id_tratamiento),
    CONSTRAINT tratamiento_servicio_id_producto_fk2 FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

CREATE TABLE sala_horario(
    id_sala_horario INT NOT NULL,
    id_horario INT NOT NULL,
    id_sala INT NOT NULL,
    CONSTRAINT sala_horario_id_sala_horario_pk PRIMARY KEY (id_sala_horario),
    CONSTRAINT sala_horario_id_horario_fk1 FOREIGN KEY (id_horario) REFERENCES horario (id_horario),
    CONSTRAINT sala_horario_id_sala_fk2 FOREIGN KEY (id_sala) REFERENCES sala (id_sala)
);
