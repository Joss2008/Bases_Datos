--COMPAÑIA
--LOGIN
--NAME --WH/OUT/00002 ---WH/IN/00002
--ORDEN DE ENTREGA --ORDEN DE COMPRA  ---INVENTARIO PAR ----INVENTARIO IMPAR --REGALO
---DIA
--CANTIDAD
--CODE DE PRODUCTO
--NOMBRE DE PRODUCTO
--CATEGORIA DE PRODUCTO --HARDWARE --SOFTWARE

SELECT 
  res_company.name,
  res_users.login, 
  stock_picking.name, 
  stock_picking.origin, 
  stock_picking.scheduled_date,
  stock_move.product_qty,
  product_template.default_code,
  product_template.name, 
  product_category.name 
 
FROM 
  public.stock_picking
  inner join public.stock_picking_type on stock_picking_type.id = stock_picking.picking_type_id
  inner join public.res_company on res_company.id = stock_picking_type.company_id
  inner join public.stock_move on stock_picking.id = stock_move.picking_id 
  inner join public.product_product on product_product.id = stock_move.product_id
  inner join public.product_template on product_template.id = product_product.product_tmpl_id
  inner join public.product_category on product_category.id = product_template.categ_id
  inner join public.res_users on res_users.id = stock_picking.user_id
 WHERE 
  res_company.name='ZM SOLUTIONS S.A.'

-----------------------------------VENTA----------------
---------------------PRUEBA ANTERIOR-----------------
---------------------------------------
-------------------------------------
-------MENDOZA ALCIVAR ALEJANDRO-----
---------------CUARTO A--------------
------------FACTURA DE VENTA --------
-------------------------------------

select distinct
    res_company.name AS EMPRESA,    
    account_move.invoice_partner_display_name AS PROVEEDOR,
    account_move.name AS FACTURA,
    account_move_line.name AS DESCRIPCION,
    product_category.name AS CATEGORIA,
    account_move_line.quantity AS CANTIDAD,
    account_move_line.price_unit AS PRECIO_UNI,
    account_tax.description as IMPUESTO,
    account_move_line.credit AS IMPORTE,
    account_payment_term.name AS PLAZO_PAGO,
    res_company.email AS EMAIL
from
    account_move
    inner join res_partner ON account_move.partner_id = res_partner.id
    inner join res_company ON res_partner.company_id = res_company.id
    inner join account_tax on account_tax.company_id = res_company.id
    inner join account_move_line ON account_move.id = account_move_line.move_id
    inner join account_payment_term ON account_move.invoice_payment_term_id=account_payment_term.id 
    inner join public.product_product on  product_product.id = account_move_line.product_id
    inner join public.product_template on product_template.id = product_product.product_tmpl_id
    inner join product_category on product_category.id = product_template.categ_id
where
	account_move.name = 'INV/2021/0001'
	and  account_move_line.account_root_id=55049 
	and account_tax.description= 'IVA Cobrado 12%'


----------------------------------------
  SELECT 
  res_company.name, 
  res_partner.name, 
  purchase_order.name, 
  purchase_order_line.name, 
  product_template.name, 
  purchase_order_line.product_qty, 
  purchase_order_line.price_unit, 
  purchase_order_line.price_subtotal, 
  res_users.login
FROM public.purchase_order
INNER JOIN public.res_partner ON  purchase_order.partner_id = res_partner.id
INNER JOIN public.res_company ON  purchase_order.company_id = res_company.id
INNER JOIN public.purchase_order_line ON purchase_order_line.order_id = purchase_order.id 
INNER JOIN  public.product_product ON purchase_order_line.product_id = product_product.id
INNER JOIN public.product_template ON  product_template.id = product_product.product_tmpl_id
INNER JOIN public.res_users on res_users.company_id = res_company.id
WHERE 

  purchase_order.name = 'P00002' AND 
  res_users.login = 'wzamora@gmail.com'
