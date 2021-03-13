
CREATE TABLE Categoria (
	categoria_id smallint PRIMARY KEY NOT NULL,
	categoria_nombre varchar(30) not null
);


/*Creacion de tabla PRODUCTO*/

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

/*Creacion de tabla FACTURA*/

CREATE  TABLE  factura(
factura_id smallint,
factura_empresaruc varchar(13),
factura_clienteid smallint,
factura_fecha timestamp,
factura_numero varchar(6),
factura_subtotal numeric(7,2),
primary key (factura_id)
);

/*Creacion de tabla factura_line*/

CREATE  TABLE  factura_line(
line_id smallint,
factura_id smallint ,
producto_id smallint NOT NULL,
line_cantidad smallint,
line_preciounitario numeric(7,2),
primary key (line_id),
CONSTRAINT factura_fk FOREIGN KEY (factura_id) REFERENCES factura (factura_id)
ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT producto_fk FOREIGN KEY (producto_id) REFERENCES producto (producto_id)
ON DELETE RESTRICT ON UPDATE CASCADE
);

/*Creacion de tabla PRODUCTO*/

CREATE  TABLE  empresa(
empresa_ruc VARCHAR(13),
empresa_razonsocial VARCHAR(30)
);

/* CREACION DE TABLA CUSTOMER */


CREATE TABLE Cliente (
	cliente_id smallint PRIMARY KEY NOT NULL,
	cliente_NAME varchar(30) not null,
	cliente_deuda numeric(7,2)
);

insert into empresa values(1,'FACCI S.A.');

insert into categoria values(1,'Hardware');
insert into categoria values(2 ,'Software');

insert into cliente values(1,'Juan Zambrano', 0);
insert into cliente values(2,'José Arteaga', 0);
insert into cliente values(3,'Cristina Cevallos ', 0);

insert into producto values(1, 1,'Mouse Microsoft USB ', 10, 15.85);
insert into producto values(2, 1,'Portátil ASUS Intel Core I7 ', 10, 550.55);
insert into producto values(3, 1,'Disco duro Toshiba 500 GB  ', 10, 77.20);
insert into producto values(4, 2,'Licencia Autocad Edition 2020 ', 5, 990.22);
insert into producto values(5, 2,'Licencia Adobe Reader ', 5, 750.50);

insert into factura (factura_id,factura_numero)values(1, '0001');
insert into factura_line values( 1,1,2,15.85);
insert into factura_line values( 1,2,1,550.55);
insert into factura_line values( 1,4,2,990.22);

insert into factura (factura_id,factura_numero)values(2, '0002');
insert into factura_line values( 2,4,1,77.20);
insert into factura_line values( 2,5,1,750.50);

insert into factura values(2, '0003');
insert into factura_line values( 3,2,1,550.55);






