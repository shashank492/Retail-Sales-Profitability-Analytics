SELECT
    Discount,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales1
GROUP BY Discount
ORDER BY Discount;

SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customerss

UNION ALL

SELECT 'products', COUNT(*)
FROM products

UNION ALL

SELECT 'stores', COUNT(*)
FROM stores

UNION ALL

SELECT 'sales', COUNT(*)
FROM sales1;


SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales1;




SELECT
    COUNT(*) AS Invalid_Rows
FROM sales1 s
LEFT JOIN customerss c
    ON s.Customer_ID = c.Customer_ID
LEFT JOIN products p
    ON s.Product_ID = p.Product_ID
LEFT JOIN stores st
    ON s.Store_ID = st.Store_ID
WHERE c.Customer_ID IS NULL
   OR p.Product_ID IS NULL
   OR st.Store_ID IS NULL;