-- CLV: Total spending per customer
SELECT c.name, SUM(o.amount) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spending DESC;

-- CLV: Highest spending customer
SELECT c.name, SUM(o.amount) AS total_spending
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spending DESC
LIMIT 1;

-- CLV: Number of orders per customer
SELECT c.name, 
COUNT(o.order_id) AS number_of_orders
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY number_of_orders DESC;

-- CLV: Customer Summary (Orders + Total Spending)
SELECT
	c.name,
	COUNT(o.order_id) AS total_orders,
	COALESCE(SUM(o.amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;