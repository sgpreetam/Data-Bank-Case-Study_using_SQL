-- What is the median, 80th and 95th percentile for this same reallocation days metric for each region?

WITH node_days_per_customer AS 
(SELECT r.region_name, cn.customer_id, cn.node_id, SUM(cn.end_date - cn.start_date) AS days_in_node
FROM customer_nodes AS cn
 	LEFT JOIN regions AS r
 	ON cn.region_id = r.region_id
WHERE end_date != '9999-12-31'
GROUP BY r.region_name, cn.customer_id, cn.node_id) , 

ordered AS
(SELECT region_name, days_in_node, 
	ROW_NUMBER() OVER(PARTITION BY region_name
					  ORDER BY days_in_node) AS row_num
FROM node_days_per_customer)

SELECT region_name, 
	PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY days_in_node) AS median,
	PERCENTILE_DISC(0.8) WITHIN GROUP(ORDER BY days_in_node) AS percentile_80th,
	PERCENTILE_DISC(0.95) WITHIN GROUP(ORDER BY days_in_node) AS percentile_95th
FROM ordered
GROUP BY region_name;