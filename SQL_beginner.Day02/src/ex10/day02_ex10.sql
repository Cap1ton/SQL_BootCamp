SELECT
pn1.name AS person_name1,
pn2.name AS person_name2,
pn1.address AS common_address
FROM person AS pn1
CROSS JOIN person AS pn2
WHERE pn1.name != pn2.name AND pn1.address = pn2.address AND pn1.id > pn2.id
ORDER BY 1, 2, 3


