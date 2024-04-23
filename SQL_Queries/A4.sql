-- How many days on average are customers reallocated to a different node?

WITH node_days_per_customer AS 
(SELECT customer_id, node_id, SUM(end_date - start_date) AS days_in_node
FROM customer_nodes
WHERE end_date != '9999-12-31'
GROUP BY customer_id, node_id)

SELECT ROUND(AVG(days_in_node), 0) AS reallocation_average_days
FROM node_days_per_customer;