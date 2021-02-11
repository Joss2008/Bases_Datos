/*Macias Pico Josselyn Stefany*/   

   SELECT 
   res_company.name, 
   res_partner.name, 
   purchase_order.name, 
   sum(purchase_order_line.price_total) as precio
   FROM purchase_order
   inner join public.purchase_order_line on purchase_order.id = purchase_order_line.order_id
   inner join public.res_company on  res_company.id = purchase_order.company_id
   inner join public.res_partner on res_partner.id = purchase_order.partner_id
   where 
   res_partner.id =10
   group by 
   res_company.name,
   res_partner.name,
   purchase_order.name