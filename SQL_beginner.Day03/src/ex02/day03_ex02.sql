SELECT  menu.pizza_name AS pizza_name,
  menu.price AS price,
  pizzeria.name AS pizzeria_name
FROM menu

JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
LEFT JOIN person_order ON person_order.menu_id = menu.id

WHERE menu.id NOT IN (SELECT menu_id FROM person_order)
ORDER BY pizza_name, price;