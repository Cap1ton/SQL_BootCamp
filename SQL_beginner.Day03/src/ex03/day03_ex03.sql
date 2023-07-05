WITH name_female(name) AS
(SELECT pi.name FROM person_visits pv
JOIN pizzeria pi
ON pv.pizzeria_id = pi.id
JOIN person pe
ON pv.person_id = pe.id WHERE pe.gender = 'female'),

name_male(name) AS
(SELECT pi.name
FROM person_visits pv
JOIN pizzeria pi
ON pv.pizzeria_id = pi.id
JOIN person pe
ON pv.person_id = pe.id
WHERE pe.gender = 'male'),

not_male AS
(SELECT * FROM name_female
EXCEPT ALL
SELECT * FROM name_male),

not_female AS
(SELECT * FROM name_male
EXCEPT ALL
SELECT * FROM name_female)
SELECT name pizzeria_name FROM not_male
UNION ALL
SELECT name pizzeria_name FROM not_female
ORDER BY pizzeria_name