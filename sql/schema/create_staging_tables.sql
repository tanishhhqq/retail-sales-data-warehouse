CREATE TABLE stg_sales (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(100),

    customer_id VARCHAR(50),
    customer_name VARCHAR(255),
    segment VARCHAR(100),

    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(100),

    product_id VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_name TEXT,

    sales NUMERIC(10,2),
    quantity INT,
    discount NUMERIC(10,2),
    profit NUMERIC(10,2),

    year INT,
    month INT,
    quarter INT
);