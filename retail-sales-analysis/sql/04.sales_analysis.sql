USE retail_sales_project;

-- Stage 1 Understand the dataset

SELECT *
FROM sales;

SELECT COUNT(*) AS total_records
FROM sales;

SELECT order_id, order_date,product_name,quantity
FROM sales;

SELECT order_id,product_name,quantity,unit_price,unit_cost,
quantity*unit_price AS revenue,
quantity*(unit_price-unit_cost) AS profits
FROM sales;

SELECT *
FROM sales;

-- Display all the sales from Hyderabad.

SELECT *
FROM sales
where city = 'Hyderabad';

-- Find the total number of sales records.

SELECT COUNT(*) AS total_records
FROM sales;

-- Display products with a unit price greater than ₹1,000.

SELECT product_name, unit_price
FROM sales
WHERE unit_price >1000;

-- Find total revenue across all records.

SELECT *
FROM sales;

SELECT *, quantity * unit_price AS revenue
FROM sales; -- revenue of each product 

SELECT SUM(quantity * unit_price) AS total_revenue
FROM sales; -- revenue of total products

-- Find total revenue for each product category.

SELECT product_name, category, sum( quantity * unit_price) AS total_revenue
FROM sales
group by product_name, category;

-- Stage 2 — Retail Sales Analysis 

-- Calculate total revenue, cost, and profit
SELECT
     SUM(quantity * unit_price) AS total_revenue,
     SUM(quantity * unit_cost) AS total_cost,
	 SUM(quantity * (unit_price - unit_cost)) AS total_profit,
     ROUND(
          SUM(quantity * (unit_price - unit_cost))
          / NULLIF(SUM(quantity * unit_price),0) * 100,2
          ) AS profit_margin_percentage
FROM sales;

-- Find the best-selling products

SELECT product_name,
	SUM(quantity) AS units_sold,
	SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY product_name
ORDER BY Units_sold DESC;

-- Analyze revenue by category

SELECT 
	category,
    SUM(quantity * unit_price) AS total_revenue,
    SUM(quantity *(unit_price - unit_cost)) AS total_profits
FROM sales
GROUP BY category
ORDER BY total_revenue DESC ;

SELECT *
FROM sales;

-- Analyze monthly sales trends

SELECT 
	DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(quantity * unit_price) AS month_revenue,
    SUM(quantity *(unit_price - unit_cost)) AS month_profits
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- Top three cities by total sales revenue

SELECT *
FROM sales;


SELECT city,
	SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 3;
    
-- Most profitable product

SELECT product_name,
	SUM( quantity *(unit_price - unit_cost)) AS highest_total_profit
FROM sales
GROUP BY product_name
ORDER BY highest_total_profit DESC
LIMIT 1;

-- Total profit by category

SELECT
    category,
    SUM(quantity * (unit_price - unit_cost)) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

-- Monthly revenue trends

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;


