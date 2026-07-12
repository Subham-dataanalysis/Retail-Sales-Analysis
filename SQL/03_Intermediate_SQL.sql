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
