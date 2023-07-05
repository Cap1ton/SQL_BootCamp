CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
  RETURNS SETOF integer AS
$$
WITH RECURSIVE fibonacci_numbers(a, b) as 
     (VALUES(0, 1)
	  UNION ALL 
	  SELECT GREATEST(a, b), a + b as a
	  FROM fibonacci_numbers
	  WHERE b < pstop)
SELECT a
FROM fibonacci_numbers;
$$
LANGUAGE 'sql';

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();