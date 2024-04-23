-- What is the percentage of customers who increase their closing balance by more than 5%?

WITH customer_monthwise_total AS(
SELECT customer_id, EXTRACT(MONTH FROM txn_date) AS month_num,  
	SUM(CASE 
			WHEN txn_type != 'deposit' THEN -txn_amount 
			ELSE txn_amount 
		END) as monthly_total
FROM customer_transactions
GROUP BY customer_id, EXTRACT(MONTH FROM txn_date))

, customer_monthly_closing_balance AS(
SELECT customer_id, 
	(date_trunc('month', DATE '2020-01-01' + INTERVAL '1 month'*month_num) - INTERVAL '1 day')::date AS month_end,
	SUM(monthly_total) OVER(
		PARTITION BY customer_id
		ORDER BY month_num) AS closing_balance
	FROM customer_monthwise_total)

, closing_balance_increase AS (
SELECT *, LAG(closing_balance) OVER(
		PARTITION BY customer_id
		ORDER BY month_end) AS prev_month_balance,
	100*(closing_balance - LAG(closing_balance) OVER(
		PARTITION BY customer_id
		ORDER BY month_end))/LAG(closing_balance) OVER(
		PARTITION BY customer_id
		ORDER BY month_end) AS increase_percent
FROM customer_monthly_closing_balance
WHERE closing_balance != 0)

SELECT 100*CAST(COUNT(DISTINCT customer_id) AS FLOAT)/(SELECT COUNT(DISTINCT customer_id) FROM closing_balance_increase) AS requd_percent_value
FROM closing_balance_increase
WHERE closing_balance > prev_month_balance AND increase_percent > 5;