SELECT name FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
WHERE (address = 'Samara' OR address = 'Moscow') AND (gender = 'male') AND (pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza')
ORDER BY name




