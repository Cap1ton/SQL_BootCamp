DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy', 
															  pprice numeric DEFAULT 500,
															  pdate date DEFAULT '2022-01-08')
RETURNS TABLE (pizzeria_name varchar) AS
$$
BEGIN
	RETURN QUERY SELECT DISTINCT p1.name
	FROM pizzeria p1
	JOIN menu m
	  ON m.pizzeria_id = p1.id
	 AND m.price < pprice
	JOIN person_order po
	  ON po.menu_id = m.id
	 AND po.order_date = pdate
	 AND po.order_date IN (SELECT pv.visit_date
						  FROM person_visits pv)
	JOIN person p
	  ON p.id = po.person_id
	 AND p.name = pperson;
END;
$$
LANGUAGE 'plpgsql';

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');