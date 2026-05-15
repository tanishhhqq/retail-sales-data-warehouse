-- Total Revenue
SELECT ROUND(SUM(sales),2) AS total_revenue
FROM fact_sales;

-- Total Profit
SELECT ROUND(SUM(profit),2) AS total_profit
FROM fact_sales;

-- Profit Margin
SELECT ROUND(
    (SUM(profit)/SUM(sales))*100,
    2
) AS profit_margin
FROM fact_sales;

-- Top Customers
SELECT
    customer_id,
    ROUND(SUM(sales),2) AS total_sales
FROM fact_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 10;