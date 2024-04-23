-- How many customers are allocated to each region?

SELECT region_name, COUNT(DISTINCT customer_id) AS unique_customers
FROM customer_nodes AS c 
	LEFT JOIN regions AS r 
	ON c.region_id = r.region_id
GROUP BY r.region_name;