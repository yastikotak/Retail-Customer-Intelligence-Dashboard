CREATE TABLE stg_online_retail (

    InvoiceNo VARCHAR(20),

    StockCode VARCHAR(20),

    Description TEXT,

    Quantity INTEGER,

    InvoiceDate TIMESTAMP,

    UnitPrice NUMERIC(10,2),

    CustomerID BIGINT,

    Country VARCHAR(100),

    Revenue NUMERIC(12,2),

    IsCancelled BOOLEAN,

    IsReturn BOOLEAN

);