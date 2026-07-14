/*===========================================
Retail Customer Churn Intelligence
Dimension Tables
===========================================*/

-- ==========================
-- Customer Dimension
-- ==========================

CREATE TABLE dim_customer (

    customer_key SERIAL PRIMARY KEY,

    customerid BIGINT UNIQUE,

    first_order_date DATE,

    last_order_date DATE,

    total_orders INTEGER

);

-- ==========================
-- Product Dimension
-- ==========================

CREATE TABLE dim_product (

    product_key SERIAL PRIMARY KEY,

    stockcode VARCHAR(20) UNIQUE,

    description TEXT

);

-- ==========================
-- Country Dimension
-- ==========================

CREATE TABLE dim_country (

    country_key SERIAL PRIMARY KEY,

    country VARCHAR(100) UNIQUE

);

-- ==========================
-- Date Dimension
-- ==========================

CREATE TABLE dim_date (

    date_key INTEGER PRIMARY KEY,

    full_date DATE UNIQUE,

    year INTEGER,

    quarter INTEGER,

    month INTEGER,

    month_name VARCHAR(20),

    day INTEGER,

    weekday VARCHAR(20)

);