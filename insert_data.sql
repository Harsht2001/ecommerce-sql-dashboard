
-- insert_data.sql: Sample Data for E-Commerce Tables

-- Customers
INSERT INTO customers (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com');

-- Products
INSERT INTO products (name, price) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Keyboard', 45.00),
('Monitor', 300.00),
('Headphones', 80.00);

-- Orders
INSERT INTO orders (customer_id, order_date, amount) VALUES
(1, '2025-06-01', 1270.00),
(2, '2025-06-03', 325.00),
(1, '2025-06-05', 80.00),
(3, '2025-06-07', 1545.00),
(4, '2025-06-10', 45.00);

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), -- Laptop
(1, 2, 1), -- Mouse
(2, 2, 5), -- 5 Mice
(3, 5, 1), -- Headphones
(4, 1, 1), -- Laptop
(4, 4, 1), -- Monitor
(5, 3, 1); -- Keyboard
