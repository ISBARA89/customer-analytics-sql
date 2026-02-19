-- REVENUE ANALYSIS: Monthly Revenue
SELECT
	DATE_TRUNC('month', order_date) AS month,
	SUM(amount) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- REVENUE ANALYSIS: Running Total Revenue
SELECT
	order_date,
	amount,
	SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;