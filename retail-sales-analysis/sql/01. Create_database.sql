
-- Retail Sales Analysis | Database setup

CREATE DATABASE retail_sales_project;

-- Select the database
USE retail_sales_project;

-- Create the sales table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL
);