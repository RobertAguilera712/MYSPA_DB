DROP DATABASE IF EXISTS myspa;
CREATE DATABASE myspa;
USE myspa;


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

create table sala_horario(
id_sala_horario int not null,
id_sala int not null,
id_horario int not null
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
estatus bool 
);



