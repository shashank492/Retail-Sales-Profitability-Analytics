CREATE DATABASE retail_analytics;
USE retail_analytics;


SELECT DATABASE();

USE retail_analytics;

CREATE TABLE customerss (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(20),
    Age INT,
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(50),
    Customer_Segment VARCHAR(50),
    Region_Clean varchar(50)
);

CREATE TABLE products (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(100),
    Sub_Category VARCHAR(100),
    Cost_Price DECIMAL(12,2),
    Selling_Price DECIMAL(12,2)
);

CREATE TABLE stores (
    Store_ID VARCHAR(10) PRIMARY KEY,
    Store_Name VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(50)
);

CREATE TABLE sales1 (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Product_ID VARCHAR(10),
    Store_ID VARCHAR(10),
    Quantity INT,
    Discount DECIMAL(5,2),
    Sales DECIMAL(14,2),
    Cost DECIMAL(14,2),
    Profit DECIMAL(14,2),
    Profit_Margin DECIMAL(8,4),
    Order_Month TINYINT,
    Month_Name VARCHAR(20),
Quarter VARCHAR(10)

);
SELECT COUNT(*) FROM customerss;


drop table saless



SELECT COUNT(*) FROM customerss;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM stores;
SELECT COUNT(*) FROM sales1;


USE retail_analytics;

SELECT *
FROM sales1
LIMIT 10;

SELECT * FROM customerss LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM stores LIMIT 5;



-- Customers
SELECT Customer_ID, COUNT(*) AS duplicate_count
FROM customerss
GROUP BY Customer_ID
HAVING COUNT(*) > 1;
-- Products
SELECT Product_ID, COUNT(*) AS duplicate_count
FROM products
GROUP BY Product_ID
HAVING COUNT(*) > 1;
-- Stores
SELECT Store_ID, COUNT(*) AS duplicate_count
FROM stores
GROUP BY Store_ID
HAVING COUNT(*) > 1; 
-- Sales
SELECT Order_ID, COUNT(*) AS duplicate_count
FROM sales1
GROUP BY Order_ID
HAVING COUNT(*) > 1;





SELECT
    SUM(Customer_ID IS NULL) AS null_customer_id,
    SUM(Customer_Name IS NULL) AS null_customer_name,
    SUM(Gender IS NULL) AS null_gender,
    SUM(Age IS NULL) AS null_age,
    SUM(City IS NULL) AS null_city,
    SUM(State IS NULL) AS null_state,
    SUM(Region IS NULL) AS null_region,
    SUM(Customer_Segment IS NULL) AS null_segment
FROM customerss;


SELECT
    SUM(Product_ID IS NULL) AS null_product_id,
    SUM(Product_Name IS NULL) AS null_product_name,
    SUM(Category IS NULL) AS null_category,
    SUM(Sub_Category IS NULL) AS null_subcategory,
    SUM(Cost_Price IS NULL) AS null_cost_price,
    SUM(Selling_Price IS NULL) AS null_selling_price
FROM products;

SELECT
    SUM(Store_ID IS NULL) AS null_store_id,
    SUM(Store_Name IS NULL) AS null_store_name,
    SUM(City IS NULL) AS null_city,
    SUM(State IS NULL) AS null_state,
    SUM(Region IS NULL) AS null_region
FROM stores;



SELECT
    SUM(Order_ID IS NULL) AS null_order_id,
    SUM(Order_Date IS NULL) AS null_order_date,
    SUM(Customer_ID IS NULL) AS null_customer_id,
    SUM(Product_ID IS NULL) AS null_product_id,
    SUM(Store_ID IS NULL) AS null_store_id,
    SUM(Quantity IS NULL) AS null_quantity,
    SUM(Discount IS NULL) AS null_discount,
    SUM(Sales IS NULL) AS null_sales,
    SUM(Cost IS NULL) AS null_cost,
    SUM(Profit IS NULL) AS null_profit
FROM sales1;

SELECT COUNT(*) AS invalid_customers
FROM sales1 s
LEFT JOIN customerss c
    ON s.Customer_ID = c.Customer_ID
WHERE c.Customer_ID IS NULL;

SELECT COUNT(*) AS invalid_products
FROM sales1 s
LEFT JOIN products p
    ON s.Product_ID = p.Product_ID
WHERE p.Product_ID IS NULL;

SELECT COUNT(*) AS invalid_stores
FROM sales1 s
LEFT JOIN stores st
    ON s.Store_ID = st.Store_ID
WHERE st.Store_ID IS NULL;


SELECT COUNT(*) AS invalid_quantity
FROM sales1
WHERE Quantity <= 0;

SELECT COUNT(*) AS invalid_sales_cost
FROM sales1
WHERE Sales <= 0
   OR Cost <= 0;
   
   SELECT COUNT(*) AS invalid_discount
FROM sales1
WHERE Discount < 0
   OR Discount > 0.20;