CREATE TABLE CATEGORIA (
	CATEGORIA_id smallint PRIMARY KEY NOT NULL,
	CATEGORIA_nombre varchar(30) not null
);
/* CREAACION DE LOS DATOS */
INSERT INTO CATEGORIA VALUES('1','HARDWARE');
INSERT INTO CATEGORIA VALUES('212','SOFTWARE');

/Creacion de tabla PRODUCTO/

CREATE  TABLE  producto(
producto_id smallint PRIMARY KEY,
producto_categoriaid smallint,
producto_nombre VARCHAR(30),
producto_cantidad smallint,
producto_pvp numeric (5,2),
categoria_id smallint,
CONSTRAINT categoria_id_fk FOREIGN KEY (categoria_id) REFERENCES categoria (categoria_id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
/INGRESO DE PRDUCTOS/
insert into producto values(1, 1,'Mouse Microsoft USB ', 10, 15.85);
insert into producto values(2, 1,'Portátil ASUS Intel Core I7 ', 10, 550.55);
insert into producto values(3, 1,'Disco duro Toshiba 500 GB  ', 10, 77.20);
insert into producto values(4, 2,'Licencia Autocad Edition 2020 ', 5, 990.22);
insert into producto values(5, 2,'Licencia Adobe Reader ', 5, 750.50);
/Creacion de tabla FACTURA/

CREATE  TABLE  factura(
factura_id smallint PRIMARY KEY,
factura_empresaruc varchar(13),
factura_clienteid smallint,
factura_fecha timestamp,
factura_numero varchar(6),
factura_subtotal numeric(7,2)
);
/DATOS DE LA TABLA FACTURA/
insert into factura values(001, 2,'Licencia Adobe Reader ', 5, 750.50);
/Creacion de tabla factura_line/

CREATE  TABLE  factura_line(
line_id smallint PRIMARY KEY,
factura_id smallint NOT NULL,
producto_id smallint NOT NULL,
line_cantidad smallint,
line_preciounitario numeric(7,2),
CONSTRAINT factura_fk FOREIGN KEY (factura_id) REFERENCES factura (factura_id)
ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT producto_fk FOREIGN KEY (producto_id) REFERENCES producto (producto_id)
ON DELETE RESTRICT ON UPDATE CASCADE
);

/Creacion de tabla PRODUCTO/

CREATE  TABLE  empresa(
empresa_ruc VARCHAR(13),
empresa_razonsocial VARCHAR(30)
);
insert into empresa values(1,'FACCI S.A.');


/* CREACION DE TABLA CUSTOMER */


CREATE TABLE CLIENTE (
	CLIENTE _id smallint  PRIMARY KEY NOT NULL,
	CLIENTE _NAME varchar(30) not null,
	CLIENTE_deuda numeric(7,2)
);
/* creacion de datos del cliente*/
insert into CLIENTE values(1,'Juan Zambrano', 0);
insert into CLIENTE values(2,'José Arteaga', 0);
insert into CLIENTE values(3,'Cristina Cevallos ', 0);



/*    MOSTRAR TABLAS   */

	/*
	SELECT *FROM CATEGORIA
	SELECT *FROM producto
	SELECT *FROM CLIENTE
	SELECT *FROM factura
	*/

/*	BORRAR TABLA para ello se debera eliminar desde la ultima tabla creada */

	/*DROP TABLE CATEGORIA;
	DROP TABLE  producto;
	DROP TABLE CLIENTER;
	DROP TABLE factura;

	*/
