--DAY1 SALES DATA EXPLORATION--
CREATE TABLE sales (
  order_id INTEGER,
  product TEXT,
  region TEXT,
  amount INTEGER,
  month TEXT
);

INSERT INTO sales VALUES
(1001, 'Laptop', 'North', 45000, 'Jan'),
(1002, 'Phone',  'South', 18000, 'Jan'),
(1003, 'Tablet', 'East',  22000, 'Jan'),
(1004, 'Laptop', 'West',  46000, 'Jan'),
(1005, 'Phone',  'North', 19500, 'Feb'),
(1006, 'Tablet', 'South', 21000, 'Feb'),
(1007, 'Laptop', 'East',  47000, 'Feb'),
(1008, 'Phone',  'West',  20000, 'Feb'),
(1009, 'Laptop', 'North', 44500, 'Mar'),
(1010, 'Tablet', 'South', 23000, 'Mar'),
(1011, 'Phone',  'East',  18500, 'Mar'),
(1012, 'Laptop', 'West',  45500, 'Mar'),
(1013, 'Tablet', 'North', 22500, 'Apr'),
(1014, 'Laptop', 'South', 46500, 'Apr'),
(1015, 'Phone',  'East',  19000, 'Apr'),
(1016, 'Tablet', 'West',  21500, 'Apr'),
(1017, 'Laptop', 'North', 48000, 'May'),
(1018, 'Phone',  'South', 17500, 'May'),
(1019, 'Tablet', 'East',  23500, 'May'),
(1020, 'Laptop', 'West',  47000, 'May');

SELECT * FROM sales;

-- Q1: How many orders do we have?
SELECT COUNT(*) AS total_orders FROM sales;

-- Q2: What regions exist in our data?
SELECT DISTINCT region FROM sales;

-- Q3: What is the min, max and average order?
SELECT
  MIN(amount) AS min_order,
  MAX(amount) AS max_order,
  ROUND(AVG(amount),0) AS avg_order
FROM sales;

-- Only North region orders
SELECT order_id, product, amount
FROM sales
WHERE region = 'North';

-- High-value orders above ₹40,000
SELECT order_id, product, region, amount
FROM sales
WHERE amount > 40000
ORDER BY amount DESC;

-- Total revenue per region
SELECT
  region,
  COUNT(*) AS orders,
  SUM(amount) AS total_revenue,
  ROUND(AVG(amount),0) AS avg_order_value
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Revenue per region per product
SELECT region, product, SUM(amount) AS revenue
FROM sales
GROUP BY region, product
ORDER BY region, revenue DESC;

-- Which region drives the most revenue?--
SELECT
  region,
  SUM(amount) AS total_revenue,
  ROUND((SUM(amount) * 100.0 /
    (SELECT SUM(amount) FROM sales)), 1)
    AS revenue_share
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- TOP REGION = WEST
-- TOP PRODUCT = LAPTOP
-- TOTAL ORDERS = 20
