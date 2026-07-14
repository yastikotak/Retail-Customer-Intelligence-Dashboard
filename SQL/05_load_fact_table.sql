TRUNCATE TABLE fact_sales RESTART IDENTITY;

INSERT INTO fact_sales
(
    customer_key,
    product_key,
    country_key,
    date_key,
    invoiceno,
    quantity,
    unitprice,
    revenue,
    iscancelled,
    isreturn
)

SELECT

    dc.customer_key,

    dp.product_key,

    dco.country_key,

    dd.date_key,

    s.invoiceno,

    s.quantity,

    s.unitprice,

    s.revenue,

    s.iscancelled,

    s.isreturn

FROM stg_online_retail s

LEFT JOIN dim_customer dc
ON s.customerid = dc.customerid

LEFT JOIN dim_product dp
ON s.stockcode = dp.stockcode

LEFT JOIN dim_country dco
ON s.country = dco.country

LEFT JOIN dim_date dd
ON s.invoicedate::DATE = dd.full_date;