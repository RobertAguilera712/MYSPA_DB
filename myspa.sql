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


create table cliente(
id_cliente int not null,
correo varchar(50),
num_unico_cliente varchar(50),
primary key (id_cliente)
);

create table usuario(
id_usuario int not null,
nombre varchar(50),
contraseña varchar(50),
rol varchar(50),
primary key(id_usuario)
);

create table sala(
id_sala int not null,
nombre varchar(20) not null,
descripcion varchar(80) not null,
fotografia blob,
estatus bool,
ruta_fotografia varchar(30),
primary key (id_sala)
);

create table reservacion(
id_reservacion int not null,
fecha date not null,
estatus varchar(15),
primary key (id_reservacion)
);

create table horarios(
id_horario int not null,
hora_termino time,
hora_inicio time,
primary key(id_horario)
);

create table sucursales(
id_sucursal int not null,
latitud double,
longitud double,
estatus bool,
primary key (id_sucursal)
);

create table servicio(
id_servicio int not null,
fecha date not null,
costo int not null,
primary key (id_servicio)
);

create table tratamientos(
id_tratamientos int not null,
nombre varchar(20) not null,
estatus varchar(15),
descripcion varchar(80) not null,
primary key (id_tratamientos));

create table productos(
    id_producto int not null,
    nombre varchar(50),
    marca varchar(50),
    precio varchar(50),
    estatus bool,
    primary key (id_producto
));


create table tratamientos_servicio(
    id_tratamientos_servicios int not null,
    costo varchar(45)
);
