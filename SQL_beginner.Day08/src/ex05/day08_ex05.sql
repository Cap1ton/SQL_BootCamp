BEGIN; -- в первом терминале
BEGIN; -- во втором терминале

SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- в первом терминале
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- во втором терминале

SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut'; -- в первом терминале
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut'; -- во втором терминале

COMMIT;	-- во втором терминале
SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut'; -- в первом терминале

COMMIT; -- в первом терминале
SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut'; -- в первом терминале

SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut'; -- во втором терминале