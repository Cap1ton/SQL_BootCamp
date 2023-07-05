WITH new_visit AS (
    SELECT (SELECT MAX(id) + 1 FROM person_order)         AS id,
           (SELECT id FROM person WHERE name = 'Dmitriy') AS person_id,
           (SELECT id FROM pizzeria WHERE name != 'Papa Johns' AND
    id IN (SELECT pizzeria_id FROM menu WHERE price <= 800)
ORDER BY RANDOM() LIMIT 1) AS pizzeria_id, '2022-01-08':: date AS visit_date)

INSERT
INTO person_visits
SELECT *
FROM new_visit;

REFRESH
MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
