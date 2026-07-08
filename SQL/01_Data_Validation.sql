-- ==========================================
-- Data Validation
-- Project: Retail Sales Analysis
-- ==========================================

-- 1. Validate Orders Table

SELECT COUNT(*) AS Total_Orders
FROM orders;

-- 2. Validate Returns Table

SELECT COUNT(*) AS Total_Returns
FROM returns;

-- 3. Validate People Table

SELECT COUNT(*) AS Total_People
FROM people;


-- 5. Validate Numeric Values
SELECT
    MIN(sales) AS Min_Sales,
    MAX(sales) AS Max_Sales,
    MIN(quantity) AS Min_Quantity,
    MAX(quantity) AS Max_Quantity,
    MIN(profit) AS Min_Profit,
    MAX(profit) AS Max_Profit
FROM orders;