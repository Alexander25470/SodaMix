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
    DNI varchar(20)not null unique,
    Telefono varchar(20)not null unique,
    FechaNacimiento date not null,
    Email varchar(100)not null unique,
    Username VARCHAR(100) not null unique,
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
INSERT INTO USUARIO([ID_Usuario],[ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(0,0,'admin','admin','11111111','1111111111','01-01-1999','admin@admin.com','admin','123456','1')
INSERT INTO USUARIO([ID_Usuario],[ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(1,1,'usertest','usertest','11111113','1111111113','01-01-1999','usertest@usertest.com','usertest','123456','0')
INSERT INTO USUARIO([ID_Usuario],[ID_TIPO],[Nombre],[Apellido],[DNI],[Telefono],[FechaNacimiento],[Email],[Username],[Pass],[Estado])VALUES(2,1,'user','user','11111112','1111111112','01-01-1999','user@user.com','user','123456','1')
SET IDENTITY_INSERT USUARIO OFF
GO


insert into TIPO_PRODUCTO values (0, 'Gaseosa', 'Una bebida carbonatada, denominada gaseosa, refresco, fresco o soda, dependiendo del país, es una bebida saborizada, hecha con agua carbonatada, edulcorantes naturales como fructosa o sacarosa, o sintéticos como el ciclamato, acidulantes, colorantes, antioxidantes, estabilizadores de acidez y conservadores.')
insert into TIPO_PRODUCTO values (1, 'Cerveza', 'La cerveza ​ es una bebida alcohólica, no destilada, de sabor amargo, que se fabrica con granos de cebada germinados u otros cereales cuyo almidón se fermenta en agua con levadura y se aromatiza a menudo con lúpulo, entre otras plantas.​​')
insert into TIPO_PRODUCTO values (2, 'Vino', 'El vino es una bebida obtenida de la uva, mediante la fermentación alcohólica de su mosto o zumo.​ La fermentación se produce por la acción metabólica de levaduras, que transforman los azúcares naturales del fruto en etanol y gas en forma de dióxido de carbono. ')
insert into TIPO_PRODUCTO values (3, 'Agua Mineral', 'El agua mineral es agua que contiene minerales u otras sustancias disueltas que le dan un valor terapéutico. Sales, compuestos sulfurados y gases están entre las sustancias que pueden estar disueltas en el agua. El agua mineral puede ser preparada o puede producirse naturalmente.')
GO


SET IDENTITY_INSERT [PRODUCTO] ON
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(0,'Coca Cola','Gaseosa de Coca Cola, 2.25L',0,341,95,195.50,'~/Imagenes/Coca.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(1,'Pepsi','Gaseosa de Pepsi, 2.25L',0,201,30,130,'~/Imagenes/Pepsi.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(2,'Fanta','Gaseosa de Fanta sabor naranja, 2.25L',0,153,96,196,'~/Imagenes/Fanta.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(3,'Brahma','Cerveza en Lata de Brahma. 473 ML',1,13,30,60.50,'~/Imagenes/Brahma.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(4,'Heineken','Cerveza en Lata de Heineken. 473 ML',1,36,64,128,'~/Imagenes/Heineken.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(5,'Stella Artois','Cerveza en Lata Stella. 473 ML',1,31,43,86,'~/Imagenes/Stella Artois.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(6,'Termidor','Vino en Caja. 1L',2,32,97,194,'~/Imagenes/Termidor.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(7,'Toro','Vino en Botella de vidrio. 700 ML',2,16,85,170.50,'~/Imagenes/Toro.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(8,'Dadá','Vino en Botella de vidrio. 750 ML',2,35,150,314,'~/Imagenes/Dada.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(9,'VillaVicencio','Agua en Botella de plástico. 2L',3,60,90,160,'~/Imagenes/Villavicencio.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(10,'Kin','Agua en Botella de plástico. 2.25L',3,25,30,75,'~/Imagenes/Kin.png',1)
INSERT INTO [PRODUCTO]([ID_Producto],[Nombre],[Descripcion],[Tipo_Producto],[Stock],[Precio_Compra],[Precio_Venta],[Img_URL],[Estado])VALUES(11,'Villa Del Sur','Agua en Botella de plástico. 2.5L',3,50,40,85,'~/Imagenes/Villadelsur.png',1)
SET IDENTITY_INSERT [PRODUCTO] OFF
GO


SET IDENTITY_INSERT [PROVINCIA] ON
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(0,'Buenos Aires')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(1,'CABA')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(2,'Catamarca')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(3,'Chaco')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(4,'Chubut')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(5,'Córdoba')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(6,'Corrientes')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(7,'Entre Ríos')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(8,'Formosa')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(9,'Jujuy')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(10,'La Pampa')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(11,'La Rioja')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(12,'Mendoza')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(13,'Misiones')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(14,'Neuquén')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(15,'Río Negro')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(16,'Salta')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(17,'San Juan')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(18,'San Luis')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(19,'Santa Cruz')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(20,'Santa Fe')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(21,'Santiago Del Estero')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(22,'Tierra del Fuego')
INSERT INTO [PROVINCIA]([ID_Provincia],[Nombre]) values(23,'Tucumán')
SET IDENTITY_INSERT [PROVINCIA] OFF
GO


SET IDENTITY_INSERT [CIUDADES] ON
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre]) values(0, 0,'La Plata')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(1, 1,'Belgrano')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(2, 2,'San Fernando del Valle de Catamarca')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(3, 3,'Resistencia')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(4, 4,'Rawson')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(5, 5,'Córdoba')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(6, 6,'Corrientes')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(7, 7,'Paraná')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(8, 8,'Formosa')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(9, 9,'San Salvador de Jujuy')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(10, 10,'Santa Rosa')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(11, 11,'La Rioja')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(12, 12,'Mendoza')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(13, 13,'Posadas')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(14, 14,'Neuquén')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(15, 15,'Viedma')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(16, 16,'Salta')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(17, 17,'San Juan')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(18, 18,'San Luis')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(19, 19,'Rio Gallegos')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(20, 20,'Santa Fe')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(21, 21,'Santiago Del Estero')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre])	values(22, 22,'Ushuaia')
INSERT INTO [CIUDADES]([ID_Ciudad],[ID_Provincia],[Nombre]) values(23, 23,'San Miguel de Tucumán')
SET IDENTITY_INSERT [CIUDADES] OFF							

INSERT INTO METODO_PAGO values(0, 'Efectivo')
INSERT INTO METODO_PAGO values(1, 'Tarjeta de credito')
INSERT INTO METODO_PAGO values(2, 'Tarjeta de debito')
GO


SET IDENTITY_INSERT [DIRECCIONES] ON
insert into [DIRECCIONES](ID_Direccion,ID_Usuario,ID_Ciudad,Direccion,Piso) values (0,2,0,'Sarmiento 953','1')
insert into [DIRECCIONES](ID_Direccion,ID_Usuario,ID_Ciudad,Direccion,Piso) values (1,2,1,'Escobar 953','0')
SET IDENTITY_INSERT [DIRECCIONES] OFF
GO


SET IDENTITY_INSERT [Venta] ON
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(0,0,400,'22/06/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(1,0,400,'23/06/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(2,0,400,'15/01/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(3,0,400,'23/02/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(4,0,400,'23/03/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(5,0,400,'23/04/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(6,0,400,'23/05/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(7,0,400,'23/06/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(8,0,400,'23/07/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(9,0,400,'23/08/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(10,0,400,'23/09/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(11,0,400,'23/10/2020',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(12,0,400,'23/12/2020',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(13,0,400,'23/05/2020',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(14,0,400,'23/03/2020',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(15,0,400,'04/07/2021',2,1)
insert into [Venta](ID_Venta,ID_Metodo_Pago,Precio_Total,Fecha_Venta,ID_Usuario,ID_Direccion) values(16,0,400,'01/02/2021',2,1)
SET IDENTITY_INSERT [Venta] OFF
GO


SET IDENTITY_INSERT [DETALLE_VENTA] ON
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(0,0,0,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(1,1,0,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(2,2,1,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(3,3,1,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(4,4,2,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(5,5,2,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(6,6,3,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(7,7,3,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(8,8,4,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(9,9,4,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(10,10,5,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(11,11,5,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(12,0,6,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(13,1,6,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(14,2,7,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(15,3,7,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(16,4,8,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(17,5,8,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(18,6,9,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(19,7,9,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(20,8,10,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(21,9,10,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(22,10,11,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(23,11,11,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(24,0,12,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(25,1,12,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(26,2,13,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(27,3,13,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(28,4,14,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(29,5,14,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(30,6,15,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(31,7,15,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(32,8,16,2,100,50)
insert into [DETALLE_VENTA](ID_Detalle_Venta,ID_Producto,ID_Venta,Cantidad,Precio,PrecioCompra) values(33,9,16,2,100,50)
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
	SELECT @PrecioCompra = Precio_Compra FROM PRODUCTO WHERE ID_Producto = @IDPRODUCTO 
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
	select @pasivo = sum(dv.PrecioCompra* dv.cantidad) from VENTA v inner join DETALLE_VENTA dv on dv.ID_Venta = v.ID_Venta where v.Fecha_Venta between @fechaInicio and @fechaFin
	select @activo = sum(dv.Precio* dv.cantidad) from VENTA v inner join DETALLE_VENTA dv on dv.ID_Venta = v.ID_Venta where v.Fecha_Venta between @fechaInicio and @fechaFin
	set @ganancia = @activo - @pasivo
	return @ganancia
end
GO

create procedure SP_GANANCIA_TOTAL
as
begin
	declare @pasivo money
	declare @activo money
	declare @ganancia money
	select @pasivo = sum(dv.PrecioCompra* dv.cantidad) from VENTA v inner join DETALLE_VENTA dv on dv.ID_Venta = v.ID_Venta
	select @activo = sum(dv.Precio* dv.cantidad) from VENTA v inner join DETALLE_VENTA dv on dv.ID_Venta = v.ID_Venta
	set @ganancia = @activo - @pasivo
	return @ganancia
end
GO

-- trae cantidad vendida, ganancia y perdida de  cada producto
create view VW_EstadisticasProductos
as
select
	p.ID_Producto, p.Nombre, p.Stock,sum(dv.Cantidad) as cantidadVendida, sum(dv.Precio * dv.cantidad) as ingreso, sum(dv.PrecioCompra * dv.cantidad) as gastos
from
	VENTA v inner join DETALLE_VENTA dv on v.ID_Venta = dv.ID_Venta
	inner join PRODUCTO p on dv.ID_Producto = p.ID_Producto
group by
	p.ID_Producto,p.Nombre, p.Stock
GO

-- trae cantidad vendida, ganancia y perdida de un producto especifico
create procedure SP_EstadisticasProducto
@idProducto int
as
begin
	select * from VW_EstadisticasProductos where ID_Producto=@idProducto
end
GO


-- trae las mismas estadiscticas que VW_EstadisicasProductos pero filtradas por fecha
create procedure SP_EstadisticasEntreFecha
@fechaInicio date,
@fechaFin date
as
begin
select
	p.ID_Producto, p.Nombre, p.Stock,sum(dv.Cantidad) as cantidadVendida, sum(dv.Precio * dv.cantidad) as ingreso, sum(dv.PrecioCompra * dv.cantidad) as gastos
from
	VENTA v inner join DETALLE_VENTA dv on v.ID_Venta = dv.ID_Venta
	inner join PRODUCTO p on dv.ID_Producto = p.ID_Producto
where
	v.Fecha_Venta between @fechaInicio and @fechaFin
group by
	p.ID_Producto,p.Nombre, p.Stock
end



