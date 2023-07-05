SELECT order_date, concat(person.name, ' (age:', person.age, ')') AS person_information
FROM person
NATURAL JOIN
(SELECT id AS order_id, order_date, person_id AS id FROM person_order) person_order
order by order_date, person_information;
