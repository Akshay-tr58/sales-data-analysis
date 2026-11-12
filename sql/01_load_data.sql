-- 1) Create the table (one row = one order line)
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    row_id        INTEGER PRIMARY KEY,
    order_id      TEXT,
    order_date    DATE,
    ship_date     DATE,
    ship_mode     TEXT,
    customer_id   TEXT,
    customer_name TEXT,
    segment       TEXT,
    country       TEXT,
    city          TEXT,
    state         TEXT,
    postal_code   TEXT,
    region        TEXT,
    product_id    TEXT,
    category      TEXT,
    sub_category  TEXT,
    product_name  TEXT,
    sales         NUMERIC,
    quantity      INTEGER,
    discount      NUMERIC,
    profit        NUMERIC
);

-- 2) Dates in the CSV look like 11/8/2016 (month/day/year)
SET datestyle = 'ISO, MDY';

-- 3) Load the CSV (keep this command on ONE line)
\copy orders FROM 'C:/dev/sprint/data/Sample - Superstore.csv' WITH (FORMAT csv, HEADER true, ENCODING 'WIN1252')

-- 4) Check: should be 9994 rows
SELECT COUNT(*) AS total_rows FROM orders;