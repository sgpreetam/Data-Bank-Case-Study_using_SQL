-- What is the average total historical deposit counts and amounts for all customers?

WITH customer_deposits AS (
SELECT customer_id, COUNT(*) AS deposit_counts, SUM(txn_amount) AS deposit_amounts
FROM customer_transactions
WHERE txn_type = 'deposit'
GROUP BY customer_id
)

SELECT ROUND(AVG(deposit_counts), 0) AS average_deposit_count, 
	   ROUND(AVG(deposit_amounts), 0) AS average_deposit_amount
FROM customer_deposits;
