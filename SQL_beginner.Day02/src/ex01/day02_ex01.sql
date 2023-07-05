SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
FULL JOIN
(SELECT visit_date
FROM person_visits WHERE (person_id = 1 OR person_id = 2) AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS some_table
ON missing_date = some_table.visit_date WHERE some_table.visit_date IS NULL
ORDER BY missing_date;



