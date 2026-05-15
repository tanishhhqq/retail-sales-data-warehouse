-- Customer Ranking
SELECT
    customer_id,
    SUM(sales) AS total_sales,

    RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS sales_rank

FROM fact_sales
GROUP BY customer_id;

-- Running Revenue
SELECT
    order_date,

    SUM(sales) AS daily_sales,

    SUM(SUM(sales)) OVER(
        ORDER BY order_date
    ) AS cumulative_sales

FROM fact_sales
GROUP BY order_date;