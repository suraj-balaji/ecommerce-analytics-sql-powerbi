

-- Find products that are frequently bought together

-- core idea : SELF JOIN
-- FROM order_items a
-- JOIN order_items b
--     ON a.order_id = b.order_id

-- Purpose: Find product pairs bought together

SELECT 
	a1.product_id AS product_1,
	a2.product_id AS product_2,
	
	COUNT(*) AS pair_count
FROM order_items a1
JOIN order_items a2
	ON a1.order_id = a2.order_id 
		AND a1.product_id < a2.product_id                 -- for not same product id
	
GROUP BY a1.product_id,
		 a2.product_id
		 
ORDER BY COUNT(*) DESC
LIMIT 20;

-- Purpose: finding product name bought together
	 
SELECT 
	p1.product_category_name AS category_1,
	p2.product_category_name AS category_2,
	
	COUNT(*) AS pair_count
FROM order_items a1
JOIN order_items a2 
	ON a1.order_id = a2.order_id
		AND a1.product_id < a2.product_id
		
JOIN products p1 
	ON a1.product_id = p1.product_id
JOIN products p2 
	ON a2.product_id = p2.product_id

WHERE p1.product_category_name <> p2.product_category_name          -- imp from not pair with same product
	
GROUP BY category_1,
		 category_2
		 
ORDER BY COUNT(*) DESC
LIMIT 20;


