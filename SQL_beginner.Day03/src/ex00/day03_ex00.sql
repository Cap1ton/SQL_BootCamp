SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM (SELECT* FROM person WHERE name = 'Kate') AS person
JOIN person_visits ON person_id = person.id
JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN menu ON menu.pizzeria_id = pizzeria.id
where price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;