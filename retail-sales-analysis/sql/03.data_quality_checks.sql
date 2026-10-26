USE retail_sales_project;

-- Cleaning retail sales data

-- Inspect the dataset

SELECT *
FROM sales
limit 10;

-- Check missing values

SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS missing_customer_name,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS missing_product_name,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity
FROM sales;  

SELECT *
FROM sales;  

-- Check duplicate records

SELECT order_id, COUNT(*) AS record_count
FROM sales
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Find invalid quantities and prices

SELECT *
FROM sales
WHERE quantity <= 0
      OR unit_price <= 0
      OR unit_cost <= 0;
      
-- Check the date range

SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    COUNT(DISTINCT order_date) AS distinct_order_dates
FROM sales;