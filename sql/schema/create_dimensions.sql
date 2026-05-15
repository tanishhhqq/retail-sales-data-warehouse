CREATE TABLE dim_customer AS
SELECT
    customer_id,
    MAX(customer_name) AS customer_name,
    MAX(segment) AS segment,
    MAX(city) AS city,
    MAX(state) AS state,
    MAX(region) AS region
FROM stg_sales
GROUP BY customer_id;

CREATE TABLE dim_product AS
SELECT
    product_id,
    MAX(category) AS category,
    MAX(sub_category) AS sub_category,
    MAX(product_name) AS product_name
FROM stg_sales
GROUP BY product_id;

CREATE TABLE dim_date AS
SELECT DISTINCT
    order_date,
    year,
    month,
    quarter
FROM stg_sales;