
-- Total Revenue
SELECT SUM(amount) AS total_revenue FROM orders;

-- Total Orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Average Order Value
SELECT ROUND(SUM(amount)/COUNT(*), 2) AS avg_order_value FROM orders;

-- Number of Customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Top 5 Customers by Revenue
SELECT c.customer_id, c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 5;

-- Revenue by Month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(amount) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Most Popular Products (by quantity sold)
SELECT p.name AS product_name, SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Customers with Repeat Orders
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING order_count > 1;

-- Daily Revenue Trend (last 7 days)
SELECT order_date, SUM(amount) AS daily_revenue
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY order_date
ORDER BY order_date;
