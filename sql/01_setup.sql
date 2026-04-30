
-- crate database
CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;  -- for analytics purpose

-- Rename the tables

RENAME TABLE ecommerce_analytics.cutomers TO ecommerce_analytics.customers;
RENAME TABLE ecommerce_analytics.olist_products_dataset TO ecommerce_analytics.products;