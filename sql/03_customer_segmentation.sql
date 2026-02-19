-- CUSTOMER SEGMENTATION 
-- High /Medium / Low value customers
SELECT 
	c.name, 
	COALESCE(SUM(o.amount), 0) AS total_spent, 
	CASE 
	WHEN COALESCE(SUM(o.amount), 0) > 100000 THEN 'High Value' 
	WHEN COALESCE(SUM(o.amount), 0) BETWEEN 20000 AND 100000 THEN 'Medium Value' 
	WHEN COALESCE(SUM(o.amount), 0) > 0 THEN 'Low Value' 
	ELSE 'No Value' 
   END AS customer_value 
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
GROUP BY c.name 
ORDER BY total_spent DESC;