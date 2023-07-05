WITH andrey_visits AS
(SELECT pizzeria.name AS pizzeria_name FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person.id = person_visits.person_id
WHERE person.name = 'Andrey'),

andrey_orders AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON menu.id = person_order.menu_id
JOIN person ON person.id = person_order.person_id
WHERE person.name = 'Andrey')

SELECT pizzeria_name FROM andrey_visits
EXCEPT
SELECT pizzeria_name FROM andrey_orders
ORDER BY pizzeria_name;