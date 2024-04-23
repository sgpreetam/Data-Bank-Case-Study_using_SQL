-- For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?

WITH monthly_customer_transactions AS(SELECT 
	EXTRACT(MONTH FROM txn_date) AS month_num, customer_id, 
	SUM(CASE 
			WHEN txn_type = 'deposit' THEN 1 
			ELSE 0 
		END) AS deposit_count,
	SUM(CASE 
			WHEN txn_type = 'purchase' OR txn_type = 'withdrawal' THEN 1 
			ELSE 0 
		END) AS purchase_or_withdrawl_count
FROM customer_transactions
GROUP BY EXTRACT(MONTH FROM txn_date), customer_id
HAVING SUM(CASE 
		   		WHEN txn_type = 'deposit' THEN 1 
		   		ELSE 0 
		   END) > 1 AND
	SUM(CASE 
			WHEN txn_type = 'purchase' OR txn_type = 'withdrawal' THEN 1 
			ELSE 0 
		END) = 1
ORDER BY month_num)

SELECT month_num, COUNT(customer_id) AS customer_count
FROM monthly_customer_transactions	
GROUP BY month_num;

