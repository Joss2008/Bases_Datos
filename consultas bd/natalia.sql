select 
	account_move.name as factura_nombre,
	account_move.invoice_date as fecha_factura,
	account_move.invoice_date_due as fecha_vencimieno_factura,
	account_move.ref as referencia,
--------------------------------------------------------------------------------------------------------------------
	account_move.invoice_partner_display_name as cliente,
	(select res_partner.street from res_partner where account_move.partner_id = res_partner.id) as direccion_cliente,
	(select res_partner.city from res_partner where account_move.partner_id = res_partner.id) as Ciudad_cliente,
---------------------------------------------------------------------------------------------------------------------
	account_move_line.name as descripcion,
	account_move_line.quantity as cantidad,
	account_move_line.price_unit as precio_unitario,
	account_move_line.price_subtotal as importe,
	account_move.amount_untaxed as Subtotal,  
	account_move.amount_tax as Iva,
	account_move.amount_total as Total,
---------------------------------------------------------------
	res_partner.name as Compañia,
	res_partner.street as direccion_compañia,
	res_partner.city as ciudad_compañia,
	res_partner.website as web,
	res_partner.phone as telefono,
---------------------------------------------------------------
	account_payment_term.name as plazo_dias,
---------------------------------------------------------------
	res_country.name as pais,
	res_users.login as usuario
	from 
	account_move_line 
	inner join account_move on account_move_line.move_id=account_move.id
	inner join res_company on res_company.id= account_move.company_id
	inner join  res_partner on res_partner.id= res_company.partner_id
	inner join res_country on res_country.id= res_partner.country_id
	inner join res_users on res_users.id=account_move.invoice_user_id
	inner join account_payment_term on  account_payment_term.id = account_move.invoice_payment_term_id
where
    account_move.name='INV/2020/0004' and account_move_line.product_id IS NOT NULL

-----------------------

SELECT res_company.name as Compañia,
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
res_company.email as correo
FROM account_move
INNER JOIN res_company ON res_company.id = account_move.company_id
INNER JOIN res_partner ON res_partner.id = account_move.partner_id
INNER JOIN res_country ON res_partner.country_id =res_country.id
INNER JOIN account_move_line ON account_move_line.move_id = account_move.id
INNER JOIN account_payment_term ON  account_payment_term.id = account_move.invoice_payment_term_id
where account_move.name = 'FACTURA/2020/0001' AND account_move_line.product_id IS NOT NULL

--------------------

SELECT 
  product_template.name AS Nombre_Producto,
  product_category.name as Categoria,
  product_template.default_code AS Default_Code,
  product_template.list_price as Precio,
  res_company.name as Compañia
  FROM 
  public.product_template
  INNER JOIN public.product_product ON product_template.id = product_product.product_tmpl_id
  INNER JOIN public.product_category ON product_category.id = product_template.categ_id
  INNER JOIN public.res_company ON res_company.id = product_template.company_id
  where res_company.name = 'ZM SOLUTIONS S.A.'

-------------------------------

SELECT
 	res_company.name AS compania, 
	product_category.name AS categoria, 
	sum(product_template.list_price) AS precio
FROM
	product_product
	INNER JOIN
	product_template ON product_product.product_tmpl_id = product_template.id
	INNER JOIN res_company ON product_template.company_id = res_company.id
	INNER JOIN res_users ON product_template.write_uid = res_users.id
	INNER JOIN product_category	ON product_template.categ_id = product_category.id
	WHERE res_company.id=1
	GROUP BY compania, categoria
	HAVING count(*) > 1
---------------------------

---------------------------------------------------------
SELECT  CUSTOMER.CUS_CODE AS CODIGO, CUS_FNAME||' '||CUS_LNAME AS NOMBREAPELLIDO, 
INV_NUMBER, INV_DATE, INV_TOTAL 
FROM CUSTOMER, INVOICE WHERE CUSTOMER.CUS_CODE = INVOICE.CUS_CODE
ORDER BY NOMBREAPELLIDO;

SELECT  CUSTOMER.CUS_CODE AS CODIGO, CUS_FNAME||' '||CUS_LNAME AS NOMBREAPELLIDO, 
INV_NUMBER, INV_DATE, INV_TOTAL 
FROM CUSTOMER INNER JOIN INVOICE ON CUSTOMER.CUS_CODE = INVOICE.CUS_CODE
ORDER BY NOMBREAPELLIDO;
-------------------------------FILTRO-------------------
SELECT  CUSTOMER.CUS_CODE AS CODIGO, CUS_FNAME||' '||CUS_LNAME AS NOMBREAPELLIDO, 
INV_NUMBER, INV_DATE, INV_TOTAL 
FROM CUSTOMER, INVOICE WHERE CUSTOMER.CUS_CODE = INVOICE.CUS_CODE AND CUSTOMER.CUS_CODE = '10011' 
ORDER BY NOMBREAPELLIDO;

SELECT  CUSTOMER.CUS_CODE AS CODIGO, CUS_FNAME||' '||CUS_LNAME AS NOMBREAPELLIDO, 
INV_NUMBER, INV_DATE, INV_TOTAL 
FROM CUSTOMER INNER JOIN INVOICE ON CUSTOMER.CUS_CODE = INVOICE.CUS_CODE
WHERE CUSTOMER.CUS_CODE = '10011'
ORDER BY NOMBREAPELLIDO
------------------------------------

SELECT
  product_product.default_code,
	res_company.name AS compania, 
	product_category.name AS categoria, 
	product_template.name AS nombreproducto, 
	res_users.login AS usuario, 
	product_template.list_price AS precio
	
FROM
	product_product
	INNER JOIN
	product_template ON product_product.product_tmpl_id = product_template.id
	INNER JOIN res_company ON product_template.company_id = res_company.id
	INNER JOIN res_users ON product_template.write_uid = res_users.id
	INNER JOIN product_category	ON product_template.categ_id = product_category.id
	WHERE res_company.id=1
-------------------------------------------


SELECT
 	res_company.name AS compania, 
	product_category.name AS categoria, 
	sum(product_template.list_price) AS precio
FROM
	product_product
	INNER JOIN
	product_template ON product_product.product_tmpl_id = product_template.id
	INNER JOIN res_company ON product_template.company_id = res_company.id
	INNER JOIN res_users ON product_template.write_uid = res_users.id
	INNER JOIN product_category	ON product_template.categ_id = product_category.id
	WHERE res_company.id=1
	GROUP BY compania, categoria

---------------------------------

SELECT CUS_CODE AS CODIGO, CUS_LNAME AS APELLIDO, CUS_BALANCE AS BALANCE FROM CUSTOMER WHERE CUS_BALANCE BETWEEN 200 AND 250;

SELECT CUS_CODE AS CODIGO, CUS_LNAME AS APELLIDO, CUS_BALANCE*2 AS BALANCE FROM CUSTOMER WHERE CUS_BALANCE >=200;

SELECT * FROM CUSTOMER;
SELECT CUS_CODE, CUS_LNAME FROM CUSTOMER;

SELECT CUS_CODE, CUS_LNAME FROM CUSTOMER WHERE CUS_CODE='10011';

SELECT CUSTOMER.CUS_CODE, CUSTOMER.CUS_LNAME FROM CUSTOMER WHERE CUS_CODE='10011';

SELECT C1.CUS_CODE, C1.CUS_LNAME FROM CUSTOMER AS C1 WHERE CUS_CODE='10011';

SELECT CUS_CODE AS CODIGO, CUS_LNAME AS APELLIDO FROM CUSTOMER WHERE CUS_CODE='10011';

SELECT  CUS_CODE AS CODIGO, CUS_FNAME||' '||CUS_LNAME AS NOMBREAPELLIDO FROM CUSTOMER;

SELECT CUS_CODE AS CODIGO, CUS_LNAME AS APELLIDO FROM CUSTOMER WHERE CUS_LNAME LIKE 'B%';

SELECT CUS_CODE AS CODIGO, CUS_LNAME AS APELLIDO FROM CUSTOMER WHERE CUS_LNAME LIKE 'O%';

SELECT CUS_CODE AS CODIGO, CUS_LNAME AS APELLIDO FROM CUSTOMER WHERE CUS_LNAME LIKE '%u%';

SELECT CUS_CODE AS CODIGO, CUS_LNAME AS APELLIDO, CUS_BALANCE AS BALANCE FROM CUSTOMER WHERE CUS_BALANCE >=200;

SELECT CUS_CODE AS CODIGO, CUS_LNAME AS APELLIDO, CUS_BALANCE AS BALANCE FROM CUSTOMER WHERE CUS_BALANCE >= 200 AND CUS_BALANCE <= 250;

----------------------

select 
account_move.name as factura_nombre,
account_move.invoice_date as date_factura,
account_move.invoice_date_due as datevence_factura,
account_move.ref as referencia,
account_move.amount_untaxed as Subtotal,  
account_move.amount_tax as Iva,
account_move.amount_total as Total,
account_move.invoice_partner_display_name as cliente,
(select res_partner.street from res_partner where account_move.partner_id = res_partner.id) as dsds,

account_move_line.name as descripcion,
account_move_line.quantity as cantidad,
account_move_line.price_unit as precio_unitario_impuestos,
account_move_line.price_subtotal as importe,


--------------------------------------------------------
res_partner.name as name,
res_partner.street as dir_company,
res_partner.city as city_company,
res_partner.website as web,
res_partner.phone as phone,
---------------------------------------------------------------
account_payment_term.name as plazo,
---------------------------------------------
res_country.name as proveedor_pais,
res_users.login


from 
account_move_line 
inner join account_move on account_move_line.move_id=account_move.id
inner join res_company on res_company.id= account_move.company_id
inner join  res_partner on res_partner.id= res_company.partner_id
inner join res_country on res_country.id= res_partner.country_id
inner join res_users on res_users.id=account_move.invoice_user_id
inner join account_payment_term on  account_payment_term.id = account_move.invoice_payment_term_id
where
    account_move.name='INV/2020/0004' and account_move_line.product_id IS NOT NULL
------------------------------

