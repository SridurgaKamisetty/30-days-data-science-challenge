USE day4_customers;
SELECT * FROM orders LIMIT 5;
SELECT 
    order_id,
    customer_name,
    amount,
    row_number() OVER(order by amount desc) as rank_amount
FROM orders;
SELECT 
    order_id,
    customer_name,
    amount,
   rank() OVER(order by amount desc) as rank_amount
FROM orders;
SELECT 
    order_id,
    customer_name,
    amount,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS rank_by_amount
FROM orders;

SELECT 
    order_id,
    customer_name,
    order_date,
    amount,
    SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

SELECT 
    month(order_date) as month_num,
    monthname(order_date) as month_name,
    sum(amount) as monthly_revenue,
    sum(sum(amount)) over(order by month(order_date)) as cumulative_revenue
FROM orders
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month_num;
