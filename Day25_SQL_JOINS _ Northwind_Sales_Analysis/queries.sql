select * from northwind_order_details;
select * from northwind_orders;
select o.order_id,o.product_id,o.unit_price,c.customer_id,c.ship_name,c.ship_country
 from northwind_order_details o inner join northwind_orders c on  o.order_id=c.order_id;
select o.order_id,c.customer_id,c.ship_country
 from northwind_order_details o right join northwind_orders c on  o.order_id=c.order_id;
 select c.ship_country,count(c.order_id) as total_orders, round(sum((o.quantity * o.unit_price)), 2) as total_revenue from 
northwind_order_details o inner join northwind_orders c on  o.order_id=c.order_id group by c.ship_country order by 
total_revenue desc;
