CREATE TABLE fact_sales AS
SELECT
    row_id,
    order_id,
    order_date,
    ship_date,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
FROM stg_sales;