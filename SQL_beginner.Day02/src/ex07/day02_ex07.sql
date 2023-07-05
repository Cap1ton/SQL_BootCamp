SELECT pizzeria.name AS pizzeria_name  FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN Person ON person.id = person_visits.person_id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price <= 800
