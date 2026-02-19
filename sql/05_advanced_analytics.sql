-- CUSTOMER ANALYSIS: Customer Spending Ranking (Window Function)
SELECT
	c.name,
	SUM(o.amount) AS total_spent,
	RANK() OVER (ORDER BY SUM(o.amount) DESC) AS spending_rank
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;

-- CUSTOMER ANALYSIS: Customer Row Numbering 
SELECT
	c.name,
	SUM(o.amount) AS total_spent,
	ROW_NUMBER() OVER (ORDER BY SUM(o.amount) DESC) AS position
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;