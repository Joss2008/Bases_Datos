SELECT 
  productos.nombre_p, 
  productos.tipo_p, 
  productos.costo_p, 
  productos.modelo_p, 
  productos.cantidad_p, 
  entrada.fecha_entrada, 
  entrada.cant_entrada, 
  stock.cant_total
FROM 
  public.productos, 
  public.entrada, 
  public.stock
WHERE 
  entrada.id_prod = productos.id_prod AND
  stock.id_entrada = entrada.id_entrada;


CREATE TABLE usuarios(
	id_user INT PRIMARY KEY ,
	tipo_u VARCHAR(250) NULL DEFAULT NULL,
	nombre_u VARCHAR(250) NULL DEFAULT NULL,
	usuario_u VARCHAR(250) NULL DEFAULT NULL,
	correo_u VARCHAR(250) NULL DEFAULT NULL,
	contra_u VARCHAR(250) NULL DEFAULT NULL

);
CREATE TABLE productos(
	id_prod int PRIMARY KEY ,
	nombre_p VARCHAR(250) NULL DEFAULT NULL,
	tipo_p VARCHAR(100) NULL DEFAULT NULL,
	fechav_p VARCHAR(50) NULL DEFAULT NULL,
	costo_p FLOAT NULL DEFAULT NULL,
	descripcion_p text NULL DEFAULT NULL,
	marca_p VARCHAR(50) NULL DEFAULT NULL,
	modelo_p VARCHAR(100) NULL DEFAULT NULL, 
	peso_p FLOAT NULL DEFAULT NULL,
	unimedida_p VARCHAR(200) NULL DEFAULT NULL,
	cantidad_p INT NULL DEFAULT NULL
);
CREATE TABLE proveedor(
	id_prov int PRIMARY KEY ,
	nombre_prove VARCHAR(250) NULL DEFAULT NULL,
	ruta_prove TEXT NULL DEFAULT NULL,
	tel_prove TEXT NULL DEFAULT NULL
);
CREATE TABLE entrada(
	id_entrada SERIAL PRIMARY KEY,
	cant_entrada INT NULL DEFAULT NULL,
	fecha_entrada VARCHAR(250) NULL DEFAULT NULL,
	id_prod int ,
	CONSTRAINT id_prod FOREIGN KEY (id_prod) REFERENCES productos (id_prod)
	ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE salida(
	id_salida SERIAL PRIMARY KEY,
	cant_salida INT NULL DEFAULT NULL,
	fecha_salida VARCHAR(250) NULL DEFAULT NULL,
	id_prod int ,
	CONSTRAINT id_prod FOREIGN KEY (id_prod) REFERENCES productos (id_prod)
	ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE STOCK(
	id_stock serial PRIMARY KEY,
	id_prod INT,
	id_entrada SERIAL,
	id_salida SERIAL,
	cant_total integer NULL DEFAULT NULL,
	CONSTRAINT id_prod_FK FOREIGN KEY (id_prod) REFERENCES productos (id_prod)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT id_entrada_FK FOREIGN KEY (id_entrada) REFERENCES entrada (id_entrada)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT id_salida_FK FOREIGN KEY (id_salida) REFERENCES salida (id_salida)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

/*incersiones*/
INSERT INTO STOCK (id_stock, id_prod, id_entrada, id_salida) values
(1, 1, 2, 1);
INSERT INTO STOCK (id_stock, id_prod, id_entrada, id_salida) values
(2, 1, 1, 2);
INSERT INTO STOCK (id_stock, id_prod, id_entrada, id_salida) values
(3, 2, 3, 3);
INSERT INTO STOCK (id_stock, id_prod, id_entrada, id_salida) values
(4, 2, 3, 4);


INSERT INTO SALIDA (id_salida, cant_salida, fecha_salida, id_prod) values
(1, 5, '10/04/2021',1);
INSERT INTO SALIDA (id_salida, cant_salida, fecha_salida, id_prod) values
(2, 8, '11/03/2021',1);
INSERT INTO SALIDA (id_salida, cant_salida, fecha_salida, id_prod) values
(3, 9, '02/01/2021',2);
INSERT INTO SALIDA (id_salida, cant_salida, fecha_salida, id_prod) values
(4, 12, '5/02/2021',2);


INSERT INTO ENTRADA (id_entrada, cant_entrada, fecha_entrada, id_prod) values
(1, 25, '06/03/2021',1);
INSERT INTO ENTRADA (id_entrada, cant_entrada, fecha_entrada, id_prod) values
(2, 10, '09/03/2021',1);
INSERT INTO ENTRADA (id_entrada, cant_entrada, fecha_entrada, id_prod) values
(3, 35, '01/01/2021',2);


INSERT INTO PROVEEDOR (id_prov, nombre_prove, ruta_prove, tel_prove) values
(1, 'BRYAN ARTEAGA ZAMBRANO', 'ALTAGRACIA',0991843520);
INSERT INTO PROVEEDOR (id_prov, nombre_prove, ruta_prove, tel_prove) values
(2, 'ROSA RIVERA ALVARADO', 'SANTA MARTHA',0915632875);


INSERT INTO productos (id_prod, nombre_p, tipo_p, fechav_p, costo_p, descripcion_p, marca_p, 
modelo_p, peso_p, unimedida_p, cantidad_p ) values(1, 'AGUA', 'BEBIDA','11/08/2021',0.40,
 'BEBIDA LIQUIDA SIN COLOR', 'STAR', 'BOTELLA', '2', 'L', 10);
INSERT INTO productos (id_prod, nombre_p, tipo_p, fechav_p, costo_p, descripcion_p, marca_p, 
modelo_p, peso_p, unimedida_p, cantidad_p ) values(2, 'MANTEQUILLA', 'PRODCUTO DE COCINA','9/12/2021',1.35,
 'MANTEQUILLA AMARILLA PARA COCINA', 'GIRASOL', 'TARRINA', '500', 'g', 20);

 INSERT INTO USUARIOS (id_user, tipo_u, nombre_u, usuario_u, correo_u, contra_u) values
(1, 'ADMINISTRADOR', 'JOSSELYN MACIAS PICO', 'JOssel123', 'josy@hotmail.com', 'JOssel1234');
INSERT INTO USUARIOS (id_user, tipo_u, nombre_u, usuario_u, correo_u, contra_u) values
(2, 'EMPLEADO', 'DAYANA VILLAMAR PILOSO', 'DAyana123', 'dayi@hotmail.com', 'DAyana1234');
