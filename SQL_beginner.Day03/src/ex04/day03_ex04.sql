WITH name_female(name) AS
(SELECT pi.name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pi ON m.pizzeria_id = pi.id
JOIN person pe ON po.person_id = pe.id
WHERE pe.gender = 'female'),

name_male(name) AS
(SELECT pi.name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pi ON m.pizzeria_id = pi.id
JOIN person pe ON po.person_id = pe.id
WHERE pe.gender = 'male'),

not_male AS
(SELECT * FROM name_female
EXCEPT
SELECT * FROM name_male),

not_female AS
(SELECT * FROM name_male
EXCEPT
SELECT * FROM name_female)
SELECT name pizzeria_name FROM not_male
UNION
SELECT name pizzeria_name FROM not_female
ORDER BY pizzeria_name