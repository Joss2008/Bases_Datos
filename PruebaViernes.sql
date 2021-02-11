select product_product.default_code, res_users.login,  res_company.name, product_category.name, product_template.name, 
product_template.list_price
from product_template
inner join res_company 
on  res_company.id = product_template.company_id
inner join  product_product
on product_template.id = product_product.product_tmpl_id
inner join  res_users
on res_users.id = product_template.id
inner join product_category
on product_category.id = product_template.categ_id
where res_company.name = 'ZM SOLUTIONS S.A.'
