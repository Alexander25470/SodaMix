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
    Email varchar(100)not null,
    Username VARCHAR(100) not null,
    Pass varchar (100)not null,
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
    ID_Provincia int primary key identity(1,1) not null,
    Nombre varchar(100) not null,
)
GO

CREATE TABLE CIUDADES
(
    ID_Ciudad int primary key identity(1,1) not null,
    ID_Provincia int foreign key references PROVINCIA(ID_Provincia) not null,
    Nombre varchar(100) not null,
)
GO

CREATE TABLE DIRECCIONES
(
    ID_Direccion int primary key identity(1,1) not null,
    ID_Usuario int foreign key references USUARIO(ID_Usuario)not null,
    ID_Ciudad int foreign key references CIUDADES(ID_Ciudad)not null,
    Direccion varchar(100)not null,
    Piso varchar(100)null,
)
GO

CREATE TABLE METODO_PAGO
(
    ID_Metodo_Pago int primary key,
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
	PrecioCompra money not null,
)
GO


insert into TIPO_USER values (0, 'admin')
insert into TIPO_USER values (1, 'user')

SET IDENTITY_INSERT [USUARIO] ON
INSERT INTO USUARIO([ID_Usuario],[ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(0,0,'admin','admin','11111111','11 1111-1111','01-01-1999','admin@admin.com','admin','123456','1')
INSERT INTO USUARIO([ID_Usuario],[ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(1,1,'userTest','userTest','11111112','11 1111-1112','01-01-1999','user@test.com','userTest','123456','0')
INSERT INTO USUARIO([ID_Usuario],[ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(2,1,'user','user','11111113','11 1111-1113','01-01-1999','user@test.com','user','123456','1')
SET IDENTITY_INSERT USUARIO OFF
GO


insert into TIPO_PRODUCTO values (0, 'tipo 1', 'producto tipo 1')
insert into TIPO_PRODUCTO values (1, 'tipo 2', 'producto tipo 2')
insert into TIPO_PRODUCTO values (2, 'tipo 3', 'producto tipo 3')
insert into TIPO_PRODUCTO values (3, 'tipo 4', 'producto tipo 4')
GO


SET IDENTITY_INSERT [PRODUCTO] ON
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(0,'Produto 1','producto 1',1,100,100,100,'~/Imagenes/1.jpg',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(1,'Produto 2','producto 2',1,100,100,100,'~/Imagenes/2.jpg',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(2,'Produto 3','producto 3',1,100,100,100,'~/Imagenes/3.jpg',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(3,'Produto 4','producto 4',1,100,100,100,'~/Imagenes/4.jpg',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(4,'Produto 5','producto 5',1,100,100,100,'~/Imagenes/5.jpg',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(5,'Produto 6','producto 6',1,100,100,100,'~/Imagenes/6.jpg',1)
SET IDENTITY_INSERT [PRODUCTO] OFF
GO


SET IDENTITY_INSERT [PROVINCIA] ON
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(0,'Buenos Aires')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(1,'CABA')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(2,'Otra provincia')
SET IDENTITY_INSERT [PROVINCIA] OFF
GO


SET IDENTITY_INSERT [CIUDADES] ON
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre]) values(0,0,'Pacheco')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre]) values(1,0,'Otra ciudad')
SET IDENTITY_INSERT [CIUDADES] OFF

INSERT INTO METODO_PAGO values(0, 'Efectivo')
INSERT INTO METODO_PAGO values(1, 'Tarjeta de credito')
INSERT INTO METODO_PAGO values(2, 'Tarjeta de debito')
GO


SET IDENTITY_INSERT [DIRECCIONES] ON
insert into [DIRECCIONES](ID_Direccion,ID_Usuario,ID_Ciudad,Direccion,Piso) values (0,2,0,'calle 120','1')
insert into [DIRECCIONES](ID_Direccion,ID_Usuario,ID_Ciudad,Direccion,Piso) values (1,2,1,'calle 3qaw4r','0')
SET IDENTITY_INSERT [DIRECCIONES] OFF
GO


SET IDENTITY_INSERT [Venta] ON
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(0,0,1000,'22/06/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(1,0,1000,'23/06/2021',2,1)
SET IDENTITY_INSERT [Venta] OFF
GO


SET IDENTITY_INSERT [DETALLE_VENTA] ON
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(0,0,0,2,100,999)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(1,1,0,2,100,999)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(2,0,1,2,100,999)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(3,1,1,2,100,999)
SET IDENTITY_INSERT [DETALLE_VENTA] OFF
GO


create procedure SP_RegistrarUsuario
@nombre as varchar(255),
@apellido as varchar(255),
@dni as varchar(20),
@telefono as varchar(20),
@fechaNacimiento as date,
@email as varchar(30),
@username as varchar(30),
@pass as varchar(30)
as
begin
	INSERT INTO
		USUARIO([ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])
	VALUES
		(1,@nombre,@apellido,@dni,@telefono,@fechaNacimiento,@email,@username,@pass,1)
end
GO


CREATE PROCEDURE SP_AGREGAR_DETALLEVENTA(	
	@IDPRODUCTO INT,
	@IDVENTA INT,
	@CANTIDAD INT
)
AS
BEGIN
	DECLARE @PrecioVenta MONEY
	DECLARE @PrecioCompra MONEY
	SELECT @PrecioVenta = Precio_Venta FROM PRODUCTO WHERE ID_Producto = @IDPRODUCTO 
	SELECT @PrecioCompra = Precio_Compra FROM PRODUCTO WHERE ID_Producto = @PrecioCompra 
	INSERT INTO DETALLE_VENTA(PRECIO, ID_Producto, Cantidad, ID_Venta,PrecioCompra)
	VALUES (@PrecioVenta, @IDPRODUCTO, @CANTIDAD, @IDVENTA,@PrecioCompra)
	UPDATE PRODUCTO set Stock = (Stock - @CANTIDAD) where ID_Producto = @IDPRODUCTO
END
GO


create PROCEDURE SP_AGREGAR_VENTA(
	@IDMETODOPAGO INT,
	@PRECIOTOTAL MONEY,
	@IDUSUARIO INT
)
AS
BEGIN
	declare @IDVENTA int
	insert into [VENTA](ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) 
	values(@IDMETODOPAGO,@PRECIOTOTAL,GETDATE(),@IDUSUARIO,1)	
	set @IDVENTA = @@IDENTITY
	RETURN @IDVENTA
END
GO


create procedure SP_GANANCIA_ENTRE_FECHAS
@fechaInicio date,
@fechaFin date
as
begin
	declare @pasivo money
	declare @activo money
	declare @ganancia money
	select @pasivo = sum(dv.PrecioCompra) from VENTA v inner join DETALLE_VENTA dv on dv.ID_Venta = v.ID_Venta where v.Fecha_Venta between @fechaInicio and @fechaFin
	select @activo = sum(dv.Precio) from VENTA v inner join DETALLE_VENTA dv on dv.ID_Venta = v.ID_Venta where v.Fecha_Venta between @fechaInicio and @fechaFin
	set @ganancia = @activo - @pasivo
	return @ganancia
end
GO
