WITH new_orders AS (
SELECT generate_series((SELECT max(id) + 1 FROM person_order), (SELECT max(id) FROM person_order) + (SELECT COUNT (id) FROM person)) as id,
    generate_series((SELECT min(id) FROM person), (SELECT max(id) FROM person)) as person_id,
       id AS menu_id,
    '2022-02-25'::date AS order_date

 FROM menu
 WHERE menu.pizza_name = 'greek pizza'
 ORDER BY 1,2
)

INSERT INTO person_order
SELECT * FROM new_orders

