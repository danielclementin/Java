drop database if exists negocio;
create database negocio;
use negocio;

drop table if exists clientes;
drop table if exists articulos;
drop table if exists pedidos;

create table articulos(
    codArticulo int auto_increment primary key,
    nombreItem varchar(20) not null,
    descripcion varchar(20) not null,
    precioUnitario decimal(8,2)
);
create table clientes(
    codCliente int auto_increment primary key,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    dni varchar(8) not null,
    telefono varchar(20) not null,
    direccion varchar(45) not null,
    codigoPostal varchar(12)not null,
    email varchar(45)
);

create table pedidos(
    codPedido int auto_increment primary key,
    codCliente int,
    cantidad int not null,
    codArticulo int not null,
    monto decimal(8,2),
    tipoEntrega enum('Retira','Envio'),
    fechaPedido date
);

alter table pedidos 
    add constraint FK_pedidos_codCliente
    foreign key(codCliente)
    references clientes(codCliente);


alter table pedidos 
    add constraint FK_pedidos_codArticulo
    foreign key(codArticulo)
    references articulos(codArticulo);