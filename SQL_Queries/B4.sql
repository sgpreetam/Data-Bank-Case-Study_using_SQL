-- What is the closing balance for each customer at the end of the month?

WITH customer_monthwise_total AS(
SELECT customer_id, EXTRACT(MONTH FROM txn_date) AS month_num,  
	SUM(CASE 
			WHEN txn_type != 'deposit' THEN -txn_amount 
			ELSE txn_amount 
		END) AS monthly_total
FROM customer_transactions
GROUP BY customer_id, EXTRACT(MONTH FROM txn_date)
)

SELECT customer_id, 
	(date_trunc('month', DATE '2020-01-01' + INTERVAL '1 month'*month_num) - INTERVAL '1 day')::date AS month_end,
	SUM(monthly_total) OVER(
		PARTITION BY customer_id
		ORDER BY month_num) AS closing_balance
FROM customer_monthwise_total;