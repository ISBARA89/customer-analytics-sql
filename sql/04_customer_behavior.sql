-- CUSTOMER BEHAVIOR: Repeat vs One-Time Customers
SELECT 
    c.name,
    COUNT(o.order_id) AS total_orders,
    CASE 
        WHEN COUNT(o.order_id) > 1 THEN 'Repeat Customer'
        WHEN COUNT(o.order_id) = 1 THEN 'One-Time Customer'
        ELSE 'No Orders'
    END AS customer_type
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_orders ;

-- CUSTOMER BEHAVIOR: Churn detection
SELECT 
    c.name,
    MAX(o.order_date) AS last_order_date
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING MAX(o.order_date) < '2024-04-01'
OR MAX(o.order_date) IS NULL;