USE retail_sales_project;

-- Month-over-month revenue comparison using LAG()

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        SUM(quantity * unit_price) AS monthly_revenue
    FROM sales
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    sales_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (
        ORDER BY sales_month
    ) AS previous_month_revenue,
    monthly_revenue - LAG(monthly_revenue) OVER (
        ORDER BY sales_month
    ) AS revenue_difference,
    ROUND(
        (
            monthly_revenue - LAG(monthly_revenue) OVER (
                ORDER BY sales_month
            )
        ) / NULLIF(
            LAG(monthly_revenue) OVER (
                ORDER BY sales_month
            ), 0
        ) * 100,
        2
    ) AS growth_percentage
FROM monthly_sales
ORDER BY sales_month;

-- The top 3 products by profit

SELECT
	product_name,
    SUM(quantity * (unit_price - unit_cost)) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT  3 ;

-- row_number() function

WITH product_profit AS (
	SELECT
		product_name,
    SUM(quantity * (unit_price - unit_cost)) AS total_profit
FROM sales
GROUP BY product_name
)
SELECT
	product_name,
    total_profit,
    ROW_NUMBER() OVER (ORDER BY total_profit DESC) AS row_num
FROM product_profit;

-- rank() function

WITH product_profit AS (
	SELECT
		product_name,
    SUM(quantity * (unit_price - unit_cost)) AS total_profit
FROM sales
GROUP BY product_name
)
SELECT
	product_name,
    total_profit,
    RANK() OVER (ORDER BY total_profit DESC) AS row_num
FROM product_profit;

-- Combining all three window functions row_number(),rank(),dense()


WITH product_profit AS (
    SELECT
        product_name,
        SUM(quantity * (unit_price - unit_cost)) AS total_profit
    FROM sales
    GROUP BY product_name
)
SELECT
    product_name,
    total_profit,
    ROW_NUMBER() OVER (
        ORDER BY total_profit DESC, product_name
    ) AS row_num,
    RANK() OVER (
        ORDER BY total_profit DESC
    ) AS product_rank,
    DENSE_RANK() OVER (
        ORDER BY total_profit DESC
    ) AS dense_rank_num
FROM product_profit;

-- Rank products within each category

WITH product_profit as (
	 SELECT 
		category,
		product_name,
		SUM(quantity *(unit_price - unit_cost)) AS total_profit
	FROM sales
    GROUP BY category, product_name
)
SELECT
	category,
    product_name,
    total_profit,
    RANK() OVER (PARTITION BY category ORDER BY total_profit DESC) AS rank_num
FROM product_profit
ORDER BY category,rank_num;

-- Repeat Customers

SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity * unit_price) AS total_spent
FROM sales
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_spent DESC;

-- Customer spending segments

WITH customer_spending AS (
	SELECT
		customer_name,
        SUM(quantity * unit_price) AS total_spent
	FROM sales
    GROUP BY customer_name
)
SELECT 
	customer_name,
    total_spent,
    CASE
		WHEN total_spent >=10000 THEN 'High Value'
        WHEN total_spent >=5000 THEN 'Medium Value'
        ELSE 'Low value'
	END AS customer_segment
FROM customer_spending
ORDER BY total_spent DESC;
