use retail_analytics


SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS Average_Order_Value,
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM sales1;


SELECT
    p.Category,
    ROUND(SUM(s.Sales), 2) AS Total_Sales,
    ROUND(SUM(s.Profit), 2) AS Total_Profit,
    ROUND(SUM(s.Profit) / SUM(s.Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales1 s
JOIN products p
    ON s.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Sales DESC;



SELECT
    Order_Month,
    Month_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales1
GROUP BY Order_Month, Month_Name
ORDER BY Order_Month;


SELECT
    c.Region,
    ROUND(SUM(s.Sales), 2) AS Total_Sales,
    ROUND(SUM(s.Profit), 2) AS Total_Profit,
    ROUND(SUM(s.Profit) / SUM(s.Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales1 s
JOIN customerss c
    ON s.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Total_Sales DESC;


SELECT
    c.Customer_Segment,
    ROUND(SUM(s.Sales), 2) AS Total_Sales,
    ROUND(SUM(s.Profit), 2) AS Total_Profit,
    ROUND(SUM(s.Profit) / SUM(s.Sales) * 100, 2) AS Profit_Margin_Percent,
    COUNT(DISTINCT s.Customer_ID) AS Total_Customers
FROM sales1 s
JOIN customerss c
    ON s.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Total_Sales DESC;


SELECT
    p.Product_ID,
    p.Product_Name,
    p.Category,
    ROUND(SUM(s.Sales), 2) AS Total_Sales,
    ROUND(SUM(s.Profit), 2) AS Total_Profit,
    ROUND(SUM(s.Profit) / SUM(s.Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales1 s
JOIN products p
    ON s.Product_ID = p.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name,
    p.Category
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    p.Product_ID,
    p.Product_Name,
    p.Category,
    ROUND(SUM(s.Sales), 2) AS Total_Sales,
    ROUND(SUM(s.Profit), 2) AS Total_Profit,
    ROUND(SUM(s.Profit) / SUM(s.Sales) * 100, 2) AS Profit_Margin_Percent
FROM sales1 s
JOIN products p
    ON s.Product_ID = p.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name,
    p.Category
ORDER BY Total_Profit ASC
LIMIT 10;