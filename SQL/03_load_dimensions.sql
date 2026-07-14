-- ==========================
-- Customer Dimension
-- ==========================

TRUNCATE TABLE dim_customer RESTART IDENTITY;

INSERT INTO dim_customer
(
    customerid,
    first_order_date,
    last_order_date,
    total_orders
)

SELECT
    customerid,
    MIN(invoicedate)::DATE,
    MAX(invoicedate)::DATE,
    COUNT(DISTINCT invoiceno)
FROM stg_online_retail
WHERE customerid IS NOT NULL
GROUP BY customerid;


-- ==========================
-- Product Dimension
-- ==========================

TRUNCATE TABLE dim_product RESTART IDENTITY;

INSERT INTO dim_product
(
    stockcode,
    description
)

SELECT
    stockcode,
    MIN(description) AS description
FROM stg_online_retail
WHERE stockcode IS NOT NULL
GROUP BY stockcode;


-- ==========================
-- Country Dimension
-- ==========================

TRUNCATE TABLE dim_country RESTART IDENTITY;

INSERT INTO dim_country
(
    country
)

SELECT DISTINCT
    country
FROM stg_online_retail
ORDER BY country;


-- ==========================
-- Date Dimension
-- ==========================

TRUNCATE TABLE dim_date;

INSERT INTO dim_date
(
    date_key,
    full_date,
    year,
    quarter,
    month,
    month_name,
    day,
    weekday
)

SELECT
    TO_CHAR(d::date,'YYYYMMDD')::INTEGER,
    d::date,
    EXTRACT(YEAR FROM d),
    EXTRACT(QUARTER FROM d),
    EXTRACT(MONTH FROM d),
    TRIM(TO_CHAR(d,'Month')),
    EXTRACT(DAY FROM d),
    TRIM(TO_CHAR(d,'Day'))

FROM generate_series(
    (SELECT MIN(invoicedate)::date FROM stg_online_retail),
    (SELECT MAX(invoicedate)::date FROM stg_online_retail),
    INTERVAL '1 day'
) d;