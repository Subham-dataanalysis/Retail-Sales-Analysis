/*=============================================================
        INTERMEDIATE SQL - PROFIT MARGIN ANALYSIS
=============================================================*/

-- Business Question 39:
-- Which Category has the highest Profit Margin (%)?

SELECT
    category,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY category
ORDER BY Profit_Margin DESC
LIMIT 1;

-- Business Insight:
-- Technology has the highest profit margin (17.45%).
-- This indicates that Technology products generate the highest profit relative to their sales.
-- A higher profit margin reflects better profitability and efficient revenue generation.


-- ============================================================

-- Business Question 40:
-- Which Sub-Category has the highest Profit Margin (%)?

SELECT
    sub_category,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY sub_category
ORDER BY Profit_Margin DESC
LIMIT 1;

-- Business Insight:
-- The leading sub-category has the highest profit margin among all sub-categories.
-- This indicates strong profitability relative to revenue and highlights products
-- that contribute efficiently to business profits.


-- ============================================================

-- Business Question 41:
-- Which Region has the highest Profit Margin (%)?

SELECT
    region,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY region
ORDER BY Profit_Margin DESC
LIMIT 1;

-- Business Insight:
-- The top-performing region has the highest profit margin.
-- This suggests efficient sales performance and stronger profitability
-- compared to other regions.


-- ============================================================

-- Business Question 42:
-- Which State generated the highest Profit Margin (%)?

SELECT
    state_province,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY state_province
ORDER BY Profit_Margin DESC
LIMIT 1;

-- Business Insight:
-- The leading state recorded the highest profit margin.
-- This indicates efficient revenue generation and better profitability
-- compared to other states.


-- ============================================================

-- Business Question 43:
-- Which City generated the highest Profit Margin (%)?

SELECT
    city,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY city
ORDER BY Profit_Margin DESC
LIMIT 1;

-- Business Insight:
-- The leading city achieved the highest profit margin.
-- This highlights the city's strong profitability and effective conversion
-- of sales into profit.


-- ============================================================

-- Business Question 44:
-- Which Customer Segment has the highest Profit Margin (%)?

SELECT
    segment,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY segment
ORDER BY Profit_Margin DESC
LIMIT 1;

-- Business Insight:
-- The top-performing customer segment has the highest profit margin.
-- This indicates that sales from this segment generate greater profitability
-- relative to revenue.


-- ============================================================

-- Business Question 45:
-- Which Customer has the highest Profit Margin (%)?

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY customer_id, customer_name
ORDER BY Profit_Margin DESC
LIMIT 1;

-- Business Insight:
-- The customer with the highest profit margin generates the greatest
-- profitability relative to their total purchases.
-- Identifying such customers helps businesses focus on high-value
-- relationships and profitable customer segments.




-- Business Question 46:
-- Classify each order based on Profit.

SELECT
    order_id,
    customer_name,
    sales,
    profit,
    CASE
        WHEN profit < 0 THEN 'Loss'
        WHEN profit = 0 THEN 'No Profit'
        ELSE 'Profit'
    END AS Profit_Status
FROM orders;

-- Business Insight:
-- Each order is categorized as Profit, Loss, or No Profit based on its profit value.
-- This classification helps identify loss-making transactions and supports
-- profitability analysis, pricing decisions, and operational improvements.



-- Business Question 47:
-- Classify each order based on Discount Percentage.

SELECT
    order_id,
    customer_name,
    sales,
    profit,
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.20 THEN 'Low Discount'
        WHEN discount > 0.20 AND discount <= 0.50 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS Discount_Status
FROM orders;

-- Business Insight:
-- Orders are categorized into discount levels based on the discount percentage.
-- This classification helps identify heavily discounted transactions,
-- evaluate pricing strategies, and analyze the relationship between
-- discounts, sales, and profitability.


-- Business Question 48:
-- Classify each order based on Sales Value.

SELECT
    order_id,
    customer_name,
    sales,
    profit,
    CASE
        WHEN sales < 100 THEN 'Low Sales'
        WHEN sales >= 100 AND sales < 500 THEN 'Medium Sales'
        WHEN sales >= 500 THEN 'High Sales'
    END AS Sales_Category
FROM orders;

-- Business Insight:
-- Orders are classified into Low, Medium, and High Sales categories based on their sales value.
-- This segmentation helps businesses understand order value distribution,
-- identify high-value transactions, and design targeted sales and marketing strategies.



-- Business Question 49:
-- Classify orders based on business priority.

SELECT
    order_id,
    customer_name,
    sales,
    profit,
    discount,
    CASE
        WHEN profit < 0 THEN 'Needs Attention'
        WHEN discount > 0.30 THEN 'High Discount'
        ELSE 'Healthy Order'
    END AS Order_Status
FROM orders;

-- Business Insight:
-- Orders are classified based on profitability and discount levels.
-- Loss-making orders are prioritized for review, while orders with high discounts
-- are identified for pricing analysis. Healthy orders indicate profitable
-- transactions with acceptable discount levels.


-- Business Question 50:
-- Find customers whose total sales are greater than 10,000.

SELECT
    customer_id,
    ROUND(SUM(sales),2) AS Total_Sales
FROM orders
GROUP BY customer_id
HAVING SUM(sales) > 10000;

-- Business Insight:
-- This query identifies high-value customers based on their total purchases.
-- Such customers are important for customer retention, loyalty programs,
-- and targeted marketing campaigns.



-- Business Question 51:
-- Find customers who have placed more than 10 unique orders.

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS Unique_Order
FROM orders
GROUP BY customer_id
HAVING Unique_Order > 10;

-- Business Insight:
-- This query identifies loyal customers who have placed more than 10 unique orders.
-- These customers demonstrate strong purchasing behavior and can be targeted
-- through loyalty programs, personalized offers, and customer retention strategies.


-- Business Question 52:
-- Find customers whose total sales are greater than 10,000,
-- considering only profitable orders.

SELECT
    customer_id,
    ROUND(SUM(sales),2) AS Total_Sales
FROM orders
WHERE profit > 0
GROUP BY customer_id
HAVING Total_Sales > 10000;

-- Business Insight:
-- This query identifies high-value customers based only on profitable transactions.
-- By excluding loss-making orders, the analysis focuses on customers who contribute
-- positively to business revenue and profitability.


-- Business Question 53:
-- Create a View to store customer-wise total sales.

CREATE VIEW customer_sales AS
SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM orders
GROUP BY customer_id, customer_name;

SELECT *
FROM customer_sales;

-- Business Insight:
-- The customer_sales view stores the total sales generated by each customer.
-- Using a view simplifies reporting by allowing analysts to reuse the same
-- business logic without rewriting the aggregation query.


-- Business Question 54:
-- Find the customer(s) with the highest total sales without using LIMIT.

SELECT
    customer_id,
    customer_name,
    SUM(sales) AS Total_Sales
FROM orders
GROUP BY customer_id, customer_name
HAVING SUM(sales) =
(
    SELECT MAX(Total_sales)
    FROM
    (
        SELECT
            customer_id,
            customer_name,
            SUM(sales) AS Total_sales
        FROM orders
        GROUP BY customer_id, customer_name
    ) AS temp
);

-- Business Insight:
-- This query identifies the customer(s) with the highest total sales without relying on LIMIT.
-- Using a subquery makes the solution dynamic and ensures that all customers tied for the highest sales are returned.