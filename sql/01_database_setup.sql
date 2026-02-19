-- DATABASE SETUP
-- Create customers table
CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	join_date DATE,
	city VARCHAR(50)
);

-- Create orders table
CREATE TABLE orders (
	order_id SERIAL PRIMARY KEY,
	customer_id INT,
	order_date DATE,
	amount DECIMAL(10,2)
);

-- Insert sample data for customers
INSERT INTO customers (name, join_date, city) VALUES
('Tunde', '2024-01-10', 'Lagos'),
('Ada', '2024-02-15', 'Abuja'),
('Kemi', '2024-03-05', 'Ibadan'),
('John', '2024-01-20', 'Lagos'),
('Bola', '2024-04-01', 'Lagos');

-- Insert sample data for orders
INSERT INTO orders (customer_id, order_date, amount) VALUES
(1, '2024-02-01', 50000),
(1, '2024-03-01', 70000),
(2, '2024-03-10', 20000),
(3, '2024-03-15', 15000),
(1, '2024-04-01', 90000),
(4, '2024-02-20', 30000);