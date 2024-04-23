-- What is the number of nodes per region?

SELECT r.region_name, COUNT(DISTINCT c.node_id) AS nodes_per_region_num
FROM customer_nodes AS c 
	LEFT JOIN regions AS r 
	ON c.region_id = r.region_id
GROUP BY r.region_name;