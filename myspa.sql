DROP DATABASE IF EXISTS myspa;
CREATE DATABASE myspa;
USE myspa;

CREATE TABLE persona(
	id_persona INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido_paterno VARCHAR(50) NOT NULL,
	apellido_materno VARCHAR(50) NOT NULL,
	genero VARCHAR(10) NOT NULL,
	rfc VARCHAR(13) NOT NULL,
	calle VARCHAR(50) NOT NULL,
	colonia VARCHAR(50) NOT NULL,
	ciudad VARCHAR(50) NOT NULL,
	codigo_postal VARCHAR(5) NOT NULL,
	estatus BOOL NOT NULL,
	CONSTRAINT persona_id_persona_pk PRIMARY KEY (id_persona)
);

CREATE TABLE usuario(
    id_usuario INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50) NOT NULL,
    rol VARCHAR(50) NOT NULL,
	CONSTRAINT usuario_id_usuario_pk PRIMARY KEY (id_usuario)
);

CREATE TABLE sucursal(
	id_sucursal INT NOT NULL,
	latitud DOUBLE NOT NULL,
	longitud DOUBLE NOT NULL,
	estatus BOOL NOT NULL,
	CONSTRAINT sucursal_id_sucursal_pk PRIMARY KEY (id_sucursal)
);

CREATE TABLE horario(
	id_horario INT NOT NULL,
	hora_termino TIME NOT NULL,
	hora_inicio TIME NOT NULL,
	CONSTRAINT horario_id_horario_pk PRIMARY KEY (id_horario)
);

CREATE TABLE tratamiento(
	id_tratamiento INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	estatus VARCHAR(15) NOT NULL,
	descripcion VARCHAR(80) NOT NULL,
	CONSTRAINT tratamiento_id_tratamiento_pk PRIMARY KEY (id_tratamiento)
);

CREATE TABLE producto(
    id_producto INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio VARCHAR(50) NOT NULL,
    estatus BOOL NOT NULL,
	CONSTRAINT producto_id_producto_pk PRIMARY KEY (id_producto)
);

CREATE TABLE empleado(
	id_empleado INT NOT NULL,
	num_empleado VARCHAR(50) NOT NULL,
	fotografia BLOB NOT NULL,
	ruta_fotografia VARCHAR(50) NOT NULL,
	puesto VARCHAR(50) NOT NULL,
	estatus BOOL NOT NULL,
	fecha_contratacion DATE NOT NULL,
	id_persona INT NOT NULL,
	id_usuario INT NOT NULL,
	CONSTRAINT empleado_id_empelado_pk PRIMARY KEY (id_empleado),
	CONSTRAINT empleado_id_persona_uq UNIQUE (id_persona),
	CONSTRAINT empleado_id_usuario_uq UNIQUE (id_usuario),
	CONSTRAINT empleado_id_persona_fk1 FOREIGN KEY (id_persona) REFERENCES persona (id_persona),
	CONSTRAINT empleado_id_usuario_fk2 FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);


CREATE TABLE cliente(
	id_cliente INT NOT NULL,
	correo VARCHAR(50) NOT NULL,
	num_unico_cliente VARCHAR(50) NOT NULL,
	id_persona INT NOT NULL,
	id_usuario INT NOT NULL,
	CONSTRAINT cliente_id_cliente_pk PRIMARY KEY (id_cliente),
	CONSTRAINT cliente_id_persona_uq UNIQUE (id_persona),
	CONSTRAINT cliente_id_usuario_uq UNIQUE (id_usuario),
	CONSTRAINT cliente_id_persona_fk1 FOREIGN KEY (id_persona) REFERENCES persona (id_persona),
	CONSTRAINT cliente_id_usuario_fk2 FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE servicio(
	id_servicio INT NOT NULL,
	fecha DATE NOT NULL,
	costo INT NOT NULL,
	id_empleado INT NOT NULL,
	CONSTRAINT servicio_id_servicio_pk PRIMARY KEY (id_servicio),
	CONSTRAINT servicio_id_empleado_fk1 FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE sala(
    id_sala INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    fotografia BLOB NOT NULL,
    estatus BOOL NOT NULL,
    ruta_fotografia VARCHAR(30) NOT NULL,
	id_sucursal INT NOT NULL,
	CONSTRAINT sala_id_sala_pk PRIMARY KEY (id_sala),
	CONSTRAINT sala_id_sucursal_fk1 FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal)
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