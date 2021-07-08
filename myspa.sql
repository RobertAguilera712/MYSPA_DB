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
	estatus BOOL,
	PRIMARY KEY (id_perosna)
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

