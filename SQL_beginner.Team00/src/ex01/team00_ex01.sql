WITH RECURSIVE tours AS (
SELECT node_1 AS tour, node_1, node_2, cost, cost AS sum FROM routes WHERE node_1 = 'a'

UNION ALL

SELECT parent.tour || ',' || child.node_1 AS trace, child.node_1, child.node_2, child.cost, parent.sum + child.cost AS sum
FROM routes AS child
JOIN tours AS parent ON child.node_1 = parent.node_2
WHERE tour NOT LIKE '%' || child.node_1 || '%')

SELECT sum AS total_cost, '{' || tour || ',' || node_2 || '}' AS tour
FROM tours
WHERE node_2 = 'a'
	AND LENGTH(TOUR) = 7
	AND ((sum = (SELECT MIN(sum) FROM (SELECT sum FROM tours WHERE node_2 = 'a' AND LENGTH(TOUR) = 7) AS minimal_sum))
		OR
		(sum = (SELECT MAX(sum) FROM (SELECT sum FROM tours WHERE node_2 = 'a' AND LENGTH(TOUR) = 7) AS maximal_sum)))
ORDER BY total_cost, tour;
