USE ecommerce_analytics;

-- Purpose: speed join and filter

CREATE INDEX idx_orders_customer
ON orders(customer_id);

CREATE INDEX idx_orders_purchase_dt
ON orders(purchase_dt);

CREATE INDEX idx_order_items_order
ON order_items(order_id);

CREATE INDEX idx_order_item_product
ON order_items(product_id);

CREATE INDEX idx_payments_order
ON payments(order_id);

-- ADD derivable column
ALTER TABLE orders
ADD COLUMN order_year  INT,
ADD COLUMN order_month INT,
ADD COLUMN order_quarter INT,
ADD COLUMN is_delivered INT;

-- filled the new column valus
UPDATE orders
SET order_year = YEAR(purchase_dt),
	order_month = MONTH(purchase_dt),
	order_quarter = QUARTER(purchase_dt),
	is_delivered = 
					CASE 
						WHEN delivered_customer_dt IS NOT NULL THEN 1
						ELSE 0
					END;



-- Add Delay Flag column
ALTER TABLE orders
ADD COLUMN is_late INT;

UPDATE orders
SET is_late = CASE 
				WHEN delivered_customer_dt > estimated_delivery_dt THEN 1
				ELSE 0
              END;

-- count late order
SELECT SUM(is_late) AS late_order
FROM orders;

-- count delivered order
SELECT SUM(is_delivered)
FROM orders;


-- review indexes

SHOW INDEX FROM orders;

SHOW INDEX FROM order_items;

SHOW INDEX FROM payments;