
-- ; 1. Query to Extract All Customers from "Victoria" State
SELECT 
    *
FROM 
    Customers  -- Replace with your actual table name
WHERE 
    state = 'Victoria';


-- ; 2. Query to Get Names of Customers Who Ordered in "EUR" Currency and Total Quantity Ordered in 2020

SELECT 
    customer_key, 
    name,
    SUM(quantity) AS total_quantity_ordered
FROM 
    Customers
WHERE 
    currency = 'EUR' 
    AND YEAR(order_date) = 2020
GROUP BY 
    customer_key, name
ORDER BY 
    total_quantity_ordered DESC;
;


-- ; 3. Query to Insert a New Customer into the Customer Table

INSERT INTO Customers (
    customer_key, gender, name, city, state_code, state, zip_code, country, continent, 
    birthday, age, age_range, order_number, line_item, order_date, orders_last_365_days, 
    order_year, order_month, order_day, quantity, store_key, store_country, store_state, 
    square_meters, open_date, product_key, product_name, brand, color, unit_cost_usd, 
    unit_price_usd, revenue, total_cost, profit, subcategory_key, subcategory, category_key, 
    category, exchange_rate_date, currency, exchange, customer_status, order_count, order_count_range
) VALUES (
    12345, 'M', 'John Doe', 'Melbourne', 'VIC', 'Victoria', '3000', 'Australia', 'Oceania', 
    '1990-05-15', 34, '30-40', 98765, 1, '2025-01-27', 15, 
    2025, 1, 27, 5, 101, 'Australia', 'Victoria', 
    200, '2010-06-01', 56789, 'Wireless Headphones', 'BrandX', 'Black', 50.00, 
    75.00, 375.00, 250.00, 125.00, 12, 'Electronics', 5, 
    'Technology', '2025-01-27', 'EUR', 1.0, 'Active', 25, '20-30'
);
