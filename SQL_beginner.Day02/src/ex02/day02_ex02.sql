SELECT CASE
	WHEN person.name IS NULL THEN '-'
	ELSE person.name
END AS person_name, some_table.visit_date AS visit_date,
	   CASE
	WHEN pizzeria.name IS NULL THEN '-'
	ELSE pizzeria.name
END AS pizzeria_name FROM person
FULL JOIN (SELECT * FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS some_table
ON person.id = some_table.person_id
FULL JOIN pizzeria
ON pizzeria.id = some_table.pizzeria_id
ORDER BY 1, 2, 3;