CREATE DATABASE SODAMIX
GO
USE SODAMIX
GO

CREATE TABLE TIPO_USER
(
    ID_TIPO int primary key,
    NOMBRE VARCHAR (50) not null,
)
GO

CREATE TABLE USUARIO
(
    ID_Usuario int not null primary key identity(1,1),
    ID_TIPO int not null foreign key references TIPO_USER(ID_TIPO),
    Nombre varchar(255) not null,
    Apellido varchar(255)not null,
    DNI varchar(20)not null,
    Telefono varchar(20)not null,
    FechaNacimiento date not null,
    Email varchar(30)not null,
    Username VARCHAR(50) not null,
    Pass varchar (30)not null,
    Estado bit default (1)not null,
)
GO

CREATE TABLE TIPO_PRODUCTO
(
    ID_TipoProducto int primary key not null,
    Nombre varchar(100)not null,
    Descripcion varchar(400)not null,
)
GO

CREATE TABLE PRODUCTO
(
    ID_Producto int primary key identity(1,1)not null,
    Nombre varchar(100)not null,
    Descripcion varchar(400)not null,
    Tipo_Producto int foreign key references TIPO_PRODUCTO(ID_TipoProducto)not null,
    Stock int not null,
    Precio_Compra money not null,
    Precio_Venta money not null,
    Img_URL varchar(400) not null,
    Estado bit default(1) not null,
)
GO

CREATE TABLE PROVINCIA
(
    ID_Provincia int primary key identity (1,1) not null,
    Nombre varchar(100) not null,
)
GO

CREATE TABLE CIUDADES
(
    ID_Ciudad int primary key identity (1,1) not null,
    ID_Provincia int foreign key references PROVINCIA(ID_Provincia) not null,
    Nombre varchar(100) not null,
)
GO

CREATE TABLE DIRECCIONES
(
    ID_Direccion int primary key identity(1,1)not null,
    ID_Usuario int foreign key references USUARIO(ID_Usuario)not null,
    ID_Ciudad int foreign key references CIUDADES(ID_Ciudad)not null,
    Direccion varchar(100)not null,
    Piso varchar(100)null,
)
GO

CREATE TABLE METODO_PAGO
(
    ID_Metodo_Pago int primary key identity(1,1),
    Descripcion varchar (100),
)
GO

CREATE TABLE VENTA
(
    ID_Venta int primary key identity(1,1) not null,
    ID_Metodo_Pago int foreign key references METODO_PAGO(ID_Metodo_Pago),
    Precio_Total money not null,
    Fecha_Venta date not null,
    ID_Usuario int foreign key references USUARIO(ID_Usuario) not null,
    ID_Direccion int foreign key references DIRECCIONES(ID_Direccion) not null,
)
GO

CREATE TABLE DETALLE_VENTA
(
    ID_Detalle_Venta int primary key identity(1,1)not null,
    ID_Producto int foreign key references PRODUCTO(ID_Producto)not null,
    ID_Venta int foreign key references VENTA(ID_Venta)not null,
    Cantidad int not null,
    Precio money not null,
)
GO


insert into TIPO_USER values (0, 'admin')
insert into TIPO_USER values (1, 'user')


INSERT INTO USUARIO([ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(0,'admin','admin','11111111','11 1111-1111','01-01-1999','admin@admin.com','admin','123456','1')
INSERT INTO USUARIO([ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(0,'userTest','userTest','11111112','11 1111-1112','01-01-1999','user@test.com','userTest','123456','0')
INSERT INTO USUARIO([ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(0,'user','user','11111113','11 1111-1113','01-01-1999','user@test.com','user','123456','1')
     

insert into TIPO_PRODUCTO values (0, 'tipo 1', 'producto tipo 1')
insert into TIPO_PRODUCTO values (1, 'tipo 2', 'producto tipo 2')
insert into TIPO_PRODUCTO values (2, 'tipo 3', 'producto tipo 3')
insert into TIPO_PRODUCTO values (3, 'tipo 4', 'producto tipo 4')

INSERT INTO [PRODUCTO]([Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES('Produto 1','producto 1',1,100,100,100,'~/Imagenes/1.jpg',1)
INSERT INTO [PRODUCTO]([Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES('Produto 2','producto 2',1,100,100,100,'~/Imagenes/2.jpg',1)
INSERT INTO [PRODUCTO]([Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES('Produto 3','producto 3',1,100,100,100,'~/Imagenes/3.jpg',1)
INSERT INTO [PRODUCTO]([Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES('Produto 4','producto 4',1,100,100,100,'~/Imagenes/4.jpg',1)
INSERT INTO [PRODUCTO]([Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES('Produto 5','producto 5',1,100,100,100,'~/Imagenes/5.jpg',1)
INSERT INTO [PRODUCTO]([Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES('Produto 6','producto 6',1,100,100,100,'~/Imagenes/6.jpg',1)





