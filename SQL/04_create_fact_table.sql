DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales
(
    sales_key BIGSERIAL PRIMARY KEY,

    customer_key INTEGER,
    product_key INTEGER,
    country_key INTEGER,
    date_key INTEGER,

    invoiceno VARCHAR(20),

    quantity INTEGER,

    unitprice NUMERIC(10,2),

    revenue NUMERIC(12,2),

    iscancelled BOOLEAN,

    isreturn BOOLEAN,

    CONSTRAINT fk_customer
        FOREIGN KEY(customer_key)
        REFERENCES dim_customer(customer_key),

    CONSTRAINT fk_product
        FOREIGN KEY(product_key)
        REFERENCES dim_product(product_key),

    CONSTRAINT fk_country
        FOREIGN KEY(country_key)
        REFERENCES dim_country(country_key),

    CONSTRAINT fk_date
        FOREIGN KEY(date_key)
        REFERENCES dim_date(date_key)
);