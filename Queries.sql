CREATE DATABASE superstore_task2;
USE superstore_task2;

SELECT 
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Region,
    o.Category,
    o.Sales,
    o.Profit
FROM Orders o
INNER JOIN Customers c
ON o.Customer_ID = c.Customer_ID;

SELECT c.Region, 
       SUM(o.Sales) AS Total_Sales
FROM Orders o
JOIN Customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region;

SELECT Category, 
       SUM(Profit)/SUM(Sales) AS Profit_Margin
FROM Orders
GROUP BY Category;

SELECT 
    MONTH(Order_Date_Fixed) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM Orders
GROUP BY Month
ORDER BY Month;

SELECT c.Customer_Name, 
       SUM(o.Sales) AS Total_Revenue
FROM Orders o
JOIN Customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 5;
