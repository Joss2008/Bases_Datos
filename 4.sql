--MENDOZA ALCIVAR ALJANDRO 

CREATE TABLE CLIENTE (
CLIENTE_ID SMALLINT PRIMARY KEY,
CLIENTE_NOMBRE VARCHAR (45)
);

INSERT INTO CLIENTE (CLIENTE_ID , CLIENTE_NOMBRE ) VALUES
(1, 'JOSE ARTEAGA' );
INSERT INTO CLIENTE (CLIENTE_ID , CLIENTE_NOMBRE ) VALUES
(2, 'WILLIAM ZAMORA' );

CREATE TABLE FACTURA(
FACTURA_ID SMALLINT PRIMARY KEY NULL,
FACTURA_NUMERO VARCHAR(15),
FACTURA_FECHA TIMESTAMP,
CLIENTE_ID SMALLINT,
CONSTRAINT CLIENTE_ID foreign key (CLIENTE_ID)
REFERENCES CLIENTE(CLIENTE_ID) ON UPDATE CASCADE
);

INSERT INTO FACTURA (FACTURA_ID , FACTURA_NUMERO,  CLIENTE_ID ) VALUES
(1, '001-001-00015', 2 );
INSERT INTO FACTURA (FACTURA_ID , FACTURA_NUMERO, CLIENTE_ID ) VALUES
(2, '001-001-00022', 1 );



CREATE TABLE PRODUCTO(
PRODUCTO_ID SMALLINT PRIMARY KEY,
PRODUCTO_NOMBRE VARCHAR(30),
PRODUCTO_STOCK SMALLINT,
PRODUCTO_PVP SMALLINT
);

INSERT INTO PRODUCTO (PRODUCTO_ID , PRODUCTO_NOMBRE, PRODUCTO_STOCK, PRODUCTO_PVP  ) VALUES
(1, 'FLASH MEMORY 2G', 20, 15);
INSERT INTO PRODUCTO (PRODUCTO_ID , PRODUCTO_NOMBRE, PRODUCTO_STOCK, PRODUCTO_PVP  ) VALUES
(2, 'HDD SD 1 GB SAMSUNG', 10, 125);
INSERT INTO PRODUCTO (PRODUCTO_ID , PRODUCTO_NOMBRE, PRODUCTO_STOCK, PRODUCTO_PVP  ) VALUES
(3, 'IMPRESORA EPSON', 5, 150);


CREATE TABLE FACTURA_LINE(
LINE_ID SMALLINT PRIMARY KEY,
LINE_CANTIDAD SMALLINT,
LINE_PV SMALLINT,
LINE_SUBTOTAL SMALLINT,
FACTURA_ID SMALLINT NULL,
PRODUCTO_ID SMALLINT,
CONSTRAINT FACTURA_ID foreign key (FACTURA_ID)
REFERENCES FACTURA(FACTURA_ID) ON UPDATE CASCADE,
CONSTRAINT PRODUCTO_ID foreign key (PRODUCTO_ID)
REFERENCES PRODUCTO(PRODUCTO_ID) ON UPDATE CASCADE
);

INSERT INTO FACTURA_LINE (LINE_ID , LINE_CANTIDAD, LINE_PV, LINE_SUBTOTAL,  FACTURA_ID, PRODUCTO_ID ) VALUES
(1, 10,  15,150, 1, 1);
INSERT INTO FACTURA_LINE (LINE_ID , LINE_CANTIDAD, LINE_PV, LINE_SUBTOTAL,  FACTURA_ID, PRODUCTO_ID ) VALUES
(1, 1,  150,150, 1, 3);


INSERT INTO FACTURA_LINE (LINE_ID , LINE_CANTIDAD, LINE_PV, LINE_SUBTOTAL,  FACTURA_ID, PRODUCTO_ID ) VALUES
(5, 10,  15,75, 2, 1);
INSERT INTO FACTURA_LINE (LINE_ID , LINE_CANTIDAD, LINE_PV, LINE_SUBTOTAL,  FACTURA_ID, PRODUCTO_ID ) VALUES
(5, 10,  125,625, 2, 2);
INSERT INTO FACTURA_LINE (LINE_ID , LINE_CANTIDAD, LINE_PV, LINE_SUBTOTAL,  FACTURA_ID, PRODUCTO_ID ) VALUES
(3, 10,  150,450, 2, 3);

SELECT 
  cliente.cliente_nombre, 
  factura.factura_numero, 
  factura.factura_fecha, 
  producto.producto_nombre, 
  factura_line.line_cantidad, 
  producto.producto_stock
FROM 
	 public.factura
	INNER JOIN public.cliente ON  cliente.cliente_id = factura.cliente_id
	INNER JOIN public.factura_line ON factura_line.factura_id = factura.factura_id
	INNER JOIN public.producto ON  factura_line.producto_id = producto.producto_id
  
WHERE 
   cliente.cliente_id= 1
  
