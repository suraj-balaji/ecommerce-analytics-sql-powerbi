-- File: 05_schema_review.sql
-- Objective: Validate datatypes before analytics
-- Analyst: Suraj Balaji
-- Date: 27th April 2026

-- Check Table Structures

USE ecommerce_analytics;

-- Purpose: Review customers schema
DESCRIBE customers;

-- Purpose: Review orders schema
DESCRIBE orders;

-- Purpose: Review order_items schema
DESCRIBE order_items;

-- Purpose: Review products schema
DESCRIBE products;

-- Purpose: Review payments schema
DESCRIBE payments;

-- Purpose: check sampling data
SELECT order_purchase_timestamp,
	   order_delivered_carrier_date,
	   order_estimated_delivery_date
FROM orders
LIMIT 20;

SELECT payment_value
FROM payments
LIMIT 20;

SELECT price,
       freight_value,
       shipping_limit_date
 FROM order_items
 LIMIT 10;


-- Purpose: Undelivered or canceled orders

SELECT COUNT(*) AS null_delivered_date
FROM orders
WHERE order_delivered_customer_date IS NULL;