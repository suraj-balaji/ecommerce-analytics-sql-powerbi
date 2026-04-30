-- File: 06_cleaning.sql


USE ecommerce_analytics;

-- Purpose: Add proper datetime columns to orders table

ALTER TABLE orders
ADD COLUMN purchase_dt DATETIME,
ADD COLUMN delivered_carrier_dt DATETIME,
ADD COLUMN delivered_customer_dt DATETIME,
ADD COLUMN estimated_delivery_dt DATETIME;

-- purpose: check if there any '' in date functtion
SELECT
COUNT(*) AS blank_delivered_customer
FROM orders
WHERE order_delivered_customer_date = '';

-- Purpose: Convert text dates into DATETIME with blank value

UPDATE orders
SET
    purchase_dt = STR_TO_DATE(NULLIF(order_purchase_timestamp,''), '%Y-%m-%d %H:%i:%s'),
    delivered_carrier_dt = STR_TO_DATE(NULLIF(order_delivered_carrier_date,''), '%Y-%m-%d %H:%i:%s'),
    delivered_customer_dt = STR_TO_DATE(NULLIF(order_delivered_customer_date,''), '%Y-%m-%d %H:%i:%s'),
    estimated_delivery_dt = STR_TO_DATE(NULLIF(order_estimated_delivery_date,''), '%Y-%m-%d %H:%i:%s');

-- checking new column
SELECT
    order_purchase_timestamp,
    purchase_dt,
    order_delivered_customer_date,
    delivered_customer_dt
FROM orders
LIMIT 5;

-- Purpose: Add clean shipping limit datetime

ALTER TABLE order_items
ADD COLUMN shipping_limit_dt DATETIME;

-- check if any '' value
SELECT COUNT(*) AS blank_delivered_customer
FROM order_items
WHERE shipping_limit_date = '';

-- Purpose: Convert text dates into DATETIME
UPDATE order_items
SET shipping_limit_dt =
STR_TO_DATE(shipping_limit_date, '%Y-%m-%d %H:%i:%s');

-- Create Useful Derived Columns. identify days of delivery of orders

ALTER TABLE orders
ADD COLUMN delivery_days INT;

UPDATE orders
SET delivery_days = DATEDIFF(delivered_customer_dt, purchase_dt);

-- Purpose: find min and max delivery day
SELECT MIN(delivery_days), 
	   MAX(delivery_days) 
FROM orders;

SELECT COUNT(purchase_dt) AS null_count
FROM orders
WHERE purchase_dt IS NULL;


