CREATE TABLE orders (
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1, '2024-01-05', 250.00),
(2, '2024-01-10', 180.00),
(3, '2024-01-15', 320.00),
(4, '2024-01-20', 150.00),
(5, '2024-01-25', 420.00),
(1, '2024-02-03', 180.00),
(2, '2024-02-08', 220.00),
(3, '2024-02-14', 190.00),
(6, '2024-02-18', 280.00),
(7, '2024-02-22', 310.00),
(1, '2024-03-05', 260.00),
(3, '2024-03-10', 190.00),
(6, '2024-03-15', 240.00),
(8, '2024-03-20', 180.00),
(9, '2024-03-25', 220.00),
(2, '2024-04-02', 300.00),
(5, '2024-04-08', 190.00),
(6, '2024-04-12', 280.00),
(8, '2024-04-18', 150.00),
(10, '2024-04-22', 350.00),
(1, '2024-05-05', 220.00),
(3, '2024-05-10', 180.00),
(7, '2024-05-15', 290.00),
(9, '2024-05-20', 160.00),
(10, '2024-05-25', 310.00);
SELECT * FROM orders LIMIT 10;
-- Query 2: Find cohort month for each customer
SELECT 
    customer_id,
    MIN(order_date) AS first_purchase,
    MONTH(MIN(order_date)) AS cohort_month
FROM orders
GROUP BY customer_id
ORDER BY cohort_month;

-- Query 3: Cohort size (how many customers joined each month)
SELECT 
    MONTH(MIN(order_date)) AS cohort_month,
    COUNT(DISTINCT customer_id) AS cohort_size
FROM orders
GROUP BY cohort_month
ORDER BY cohort_month;

-- Query 4: Retention analysis
SELECT 
    c.cohort_month,
    MONTH(o.order_date) AS order_month,
    COUNT(DISTINCT o.customer_id) AS active_customers
FROM orders o
JOIN (
    SELECT 
        customer_id,
        MONTH(MIN(order_date)) AS cohort_month
    FROM orders
    GROUP BY customer_id
) c ON o.customer_id = c.customer_id
GROUP BY c.cohort_month, order_month
ORDER BY c.cohort_month, order_month;

-- Query 5: Final insight - Month 1 customers returning in Month 3
SELECT 
    COUNT(DISTINCT o.customer_id) AS returning_customers
FROM orders o
JOIN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING MONTH(MIN(order_date)) = 1
) cohort1 ON o.customer_id = cohort1.customer_id
WHERE MONTH(o.order_date) = 3;
