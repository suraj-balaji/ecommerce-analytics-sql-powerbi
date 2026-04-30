

-- Recommendation engines
-- | Metric         | Meaning                                           |
-- | -------------- | ------------------------------------------------- |
-- | **Support**    | How often A & B occur together                    |
-- | **Confidence** | If A bought → probability B also bought           |
-- | **Lift**       | Strength of relationship (independent vs related) |

-- We need:
--			1. Total orders
-- 			2. Product frequency
-- 			3. Product pair frequency
--			4. Combine all


-- Create for disctinct order id and product id.
WITH order_products AS (
    		SELECT DISTINCT
        			order_id,
        			product_id
    		FROM order_items
						),

-- step 1: Total orders
	 total_orders AS (
			SELECT COUNT(DISTINCT order_id) AS total_orders
			FROM order_products
						),
-- step 2: Product frequency
	 product_frequency AS (
	 		SELECT 
	 			product_id,
	 			COUNT(DISTINCT order_id) AS product_count
	 		FROM order_products
	 		GROUP BY product_id 
	 						),
-- step 3: Product pair frequency
	  product_pairs AS (
    		SELECT 
        		a.product_id AS product_1,
        		b.product_id AS product_2,
        		COUNT(DISTINCT a.order_id) AS pair_count
    		FROM order_products a
    		JOIN order_products b
        		ON a.order_id = b.order_id
        			AND a.product_id < b.product_id
    		GROUP BY 
        			a.product_id,
       				b.product_id
							)
-- step 4: Final Metrics
SELECT 
    p1.product_category_name AS category_1,
    p2.product_category_name AS category_2,
    pp.pair_count,

    ROUND(pp.pair_count * 1.0 / t.total_orders, 6) AS support,

    ROUND(pp.pair_count * 1.0 / pf1.product_count, 6) AS confidence,

    ROUND(
        (pp.pair_count * 1.0 / pf1.product_count) /
        (pf2.product_count * 1.0 / t.total_orders),
    6) AS lift

FROM product_pairs pp
JOIN product_frequency pf1 
	ON pp.product_1 = pf1.product_id
JOIN product_frequency pf2 
	ON pp.product_2 = pf2.product_id
	
JOIN products p1 
	ON pp.product_1 = p1.product_id
JOIN products p2 
	ON pp.product_2 = p2.product_id
	
CROSS JOIN total_orders t

WHERE pp.pair_count >= 1
				AND p1.product_category_name <> p2.product_category_name
				
ORDER BY lift
LIMIT 20;








