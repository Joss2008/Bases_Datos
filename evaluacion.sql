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
  stock_picking.id = 1 or stock_picking.id = 4