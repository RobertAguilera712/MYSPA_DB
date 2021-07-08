DROP DATABASE IF EXISTS myspa;
CREATE DATABASE myspa;
USE myspa;

CREATE TABLE Persona(
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
	PRIMARY KEY (id_persona)
);

CREATE TABLE Empleado(
	id_empleado INT NOT NULL,
	num_empleado VARCHAR(50) NOT NULL,
	fotografia BLOB NOT NULL,
	ruta_fotografia VARCHAR(50) NOT NULL,
	puesto VARCHAR(50) NOT NULL,
	estatus BOOL NOT NULL,
	fecha_contratacion DATE NOT NULL,
	PRIMARY KEY (id_empleado)
);


CREATE TABLE Cliente(
	id_cliente INT NOT NULL,
	correo VARCHAR(50) NOT NULL,
	num_unico_cliente VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_cliente)
);

CREATE TABLE Usuario(
    id_usuario INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_usuario)
);

CREATE TABLE Sala(
    id_sala INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(80) NOT NULL,
    fotografia BLOB NOT NULL,
    estatus BOOL NOT NULL,
    ruta_fotografia VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_sala)
);

CREATE TABLE Reservacion(
	id_reservacion INT NOT NULL,
	fecha DATE NOT NULL,
	estatus VARCHAR(15) NOT NULL,
	PRIMARY KEY (id_reservacion)
);

CREATE TABLE Horarios(
	id_horario INT NOT NULL,
	hora_termino TIME NOT NULL,
	hora_inicio TIME NOT NULL,
	PRIMARY KEY(id_horario)
);

CREATE TABLE Sucursales(
	id_sucursal INT NOT NULL,
	latitud DOUBLE NOT NULL,
	longitud DOUBLE NOT NULL,
	estatus BOOL NOT NULL,
	PRIMARY KEY (id_sucursal)
);

CREATE TABLE Servicio(
	id_servicio INT NOT NULL,
	fecha DATE NOT NULL,
	costo INT NOT NULL,
	PRIMARY KEY (id_servicio)
);

CREATE TABLE Tratamientos(
	id_tratamientos INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	estatus VARCHAR(15) NOT NULL,
	descripcion VARCHAR(80) NOT NULL,
PRIMARY KEY (id_tratamientos));

CREATE TABLE Productos(
    id_producto INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio VARCHAR(50) NOT NULL,
    estatus BOOL NOT NULL,
    PRIMARY KEY (id_producto)
);


CREATE TABLE Tratamientos_servicio(
    id_tratamientos_servicios INT NOT NULL,
    costo VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_tratamientos_servicios)
);
