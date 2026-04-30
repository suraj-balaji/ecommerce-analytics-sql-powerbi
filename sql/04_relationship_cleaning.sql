USE ecommerce_analytics;

-- Relationship Map

-- customers -> orders

SELECT COUNT(*) AS joined_rows
FROM customers AS c
JOIN orders AS  o
ON c.customer_id = o.customer_id;

 -- orders -> order_items

SELECT COUNT(*) AS Joined_rows
FROM orders AS o
JOIN order_items AS oi
ON o.order_id = oi.order_id;

-- order_items -> products

SELECT COUNT(*) AS joined_rows
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- orders → payments

SELECT COUNT(*) AS joined_rows
FROM orders o
JOIN payments pay
ON o.order_id = pay.order_id;


-- Check Missing Matches

-- orders without customers

SELECT COUNT(*) AS missing_customer
FROM orders AS o
LEFT JOIN customers AS C 
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- items without product

SELECT COUNT(*) AS missing_product
FROM order_items oi
LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;