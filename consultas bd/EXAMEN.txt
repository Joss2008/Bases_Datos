--MENDOZA ALCIVAR ALEJANDRO 
--IMPAR

--PRIMER EJERCICIO DE EL EXAMEN 
-----------------------------------------

create table estudiante(
	numero smallint primary key,
	nombre varchar(20),
	apellido varchar(20)
);
create table clase(
	codigo varchar(5) primary key,
	descripcion varchar(30)
);
create table inscripcion(
	id bigserial primary key,
	numero smallint,
	codigo varchar(5),
	fecha timestamp,
	CONSTRAINT numero FOREIGN KEY (numero) REFERENCES estudiante (numero),
	CONSTRAINT codigo FOREIGN KEY (codigo) REFERENCES clase(codigo)
);


Insert into estudiante (numero, nombre, apellido)values ('1','ALARCON VALENCIA','JEAN CARLOS');
Insert into estudiante (numero, nombre, apellido)values ('2','LIMON YAGUAL','OMAR LEONARDO');
Insert into estudiante (numero, nombre, apellido)values ('3','VILLAMAR PILOSO','DAYAN LISSETH');

Insert into clase (codigo, descripcion)values ('DBA-1','BASE DE DATOS' );
Insert into clase (codigo, descripcion)values ('DEV-1','DESARROLLO WEB' );
Insert into clase (codigo, descripcion)values ('DEV-2', 'DESARROLLO MOVIL');


Insert into inscripcion (id ,numero, codigo )values ('1', '1','DBA-1');
Insert into inscripcion (id ,numero, codigo )values ('2', '1','DEV-1');
Insert into inscripcion (id ,numero, codigo )values ('3', '1','DEV-2');
Insert into inscripcion (id ,numero, codigo )values ('4', '2','DEV-1');
Insert into inscripcion (id ,numero, codigo )values ('5', '2','DEV-1');
Insert into inscripcion (id ,numero, codigo )values ('6', '3','DEV-2');

SELECT 
  inscripcion.id, 
  CONCAT(estudiante.nombre||' '|| estudiante.apellido), 
  inscripcion.codigo, 
  clase.descripcion
FROM estudiante
INNER JOIN public.inscripcion on estudiante.numero = inscripcion.numero
INNER JOIN public.clase ON inscripcion.codigo = clase.codigo


--SEGUNDA PREGUNTA DE FACTURACION EN ODOO
---------------------------------------------------------


SELECT 

res_company.name as Compañia,
(select res_partner.street from res_partner where res_partner.name = res_company.name) as Direccion_Compañia,
res_partner.name as Proveedor,
res_partner.street as Direccion_proveedor, 
account_move.name as Numero_Factura,
account_move_line.name as Descripcion,
account_move_line.quantity as Cantidad,
account_move_line.price_unit as Precio_unitario,
(select account_tax.description from account_move_line
INNER JOIN account_move_line_account_tax_rel ON account_move_line_account_tax_rel.account_move_line_id = account_move_line.tax_line_id
INNER JOIN account_tax ON account_tax.id = account_move_line_account_tax_rel.account_tax_id 
where account_move_line.move_name = account_move.name) as IVA_DES,
account_move_line.price_subtotal as Importe,
account_payment_term.name as Plazo,
res_company.phone as Celular,
(select res_partner.name ) as cliente,
res_company.email as correo

FROM account_move
INNER JOIN res_company ON res_company.id = account_move.company_id
INNER JOIN res_partner ON res_partner.id = account_move.partner_id
INNER JOIN res_country ON res_partner.country_id =res_country.id
INNER JOIN account_move_line ON account_move_line.move_id = account_move.id
INNER JOIN account_payment_term ON  account_payment_term.id = account_move.invoice_payment_term_id
where 
account_move.name = 'FACTURA/2020/0001' AND account_move_line.product_id IS NOT NULL





