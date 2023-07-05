BEGIN; -- в первом терминале
BEGIN; -- во втором терминале

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- в первом терминале
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- во втором терминале

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- в первом терминале
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- во втором терминале

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- в первом терминале
COMMIT; -- во втором терминале

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- во втором терминале