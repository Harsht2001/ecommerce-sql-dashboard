-- 1. Total revenue generated
SELECT SUM(amount) AS total_revenue FROM orders;

-- 2. Top 5 customers by total spending
SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

-- 3. Most popular product by quantity sold
SELECT p.name, SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- 4. Monthly revenue trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(amount) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- 5. Average order value
SELECT AVG(amount) AS average_order_value FROM orders;

-- 6. Number of orders per customer
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_orders DESC;

-- 7. Products never ordered
SELECT name FROM products
WHERE product_id NOT IN (
  SELECT DISTINCT product_id FROM order_items
);