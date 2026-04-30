USE ecommerce_analytics;

-- Purpose: row count of evry table

SELECT COUNT(*) AS customer_rows
FROM customers;

SELECT COUNT(*) AS products_rows
FROM products;

SELECT COUNT(*) AS orders_rows
FROM orders;

SELECT COUNT(*) AS order_items_row
FROM order_items;

SELECT COUNT(*) AS payments_rows
FROM payments;

-- Understand Key Columns

-- Purpose: inspect customers table
SELECT * 
FROM customers 
LIMIT 5;

-- Purpose: inspect orders table
SELECT * 
FROM orders 
LIMIT 5;

-- Purpose: inspect order_items table
SELECT * 
FROM order_items 
LIMIT 5;

-- Purpose: inspect products table
SELECT * 
FROM products 
LIMIT 5;

-- Purpose: inspect payments table
SELECT * 
FROM payments 
LIMIT 5;

-- Check Duplicate Primary Keys

-- Purpose: customer_id should be unique
SELECT customer_id,
	   COUNT(*) AS cnt
FROM customers
GROUP BY customer_id 
HAVING COUNT(*) > 1;

-- Purpose: order unique
SELECT order_id,
	   COUNT(*) AS cnt
FROM orders
GROUP BY order_id 
HAVING COUNT(*) > 1;

-- Purpose: duplicate item rows
SELECT order_id, 
	   product_id, 
	   COUNT(*) cnt
FROM order_items
GROUP BY order_id, product_id
HAVING COUNT(*) > 1
LIMIT 20;

-- Pupose: check duplicate in products
SELECT product_id,
	   COUNT(*) AS cnt
FROM products
GROUP BY product_id 
HAVING COUNT(product_id) > 1;

-- Pupose: check duplicate in payments
SELECT order_id,
	   COUNT(*) AS cnt
FROM payments
GROUP BY order_id 
HAVING COUNT(order_id) > 1
LIMIT 20;


-- Check Null Keys

-- Purpose: check any null value in customer
SELECT COUNT(*) AS null_customer_id
FROM customers
WHERE customer_id IS NULL;

-- Purpose: check any null valye in orders
SELECT COUNT(*) AS null_order_id
FROM orders
WHERE order_id IS NULL;

-- Purpose: order_items should have valid order_id
SELECT COUNT(*) AS null_order_id
FROM order_items
WHERE order_id IS NULL;

-- Purpose: payments key check
SELECT COUNT(*) AS null_order_id
FROM payments
WHERE order_id IS NULL;

-- Purpose: products key check
SELECT COUNT(*) AS null_product_id
FROM products
WHERE product_id IS NULL;