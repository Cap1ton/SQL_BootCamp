SELECT person.name FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
WHERE menu.pizza_name = 'pepperoni pizza' AND person.gender = 'female'
INTERSECT
SELECT person.name FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
WHERE menu.pizza_name = 'cheese pizza' AND person.gender = 'female';