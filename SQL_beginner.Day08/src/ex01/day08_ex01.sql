BEGIN; -- в первом терминале
BEGIN; -- во втором терминале

SHOW TRANSACTION ISOLATION LEVEL; -- в первом терминале
SHOW TRANSACTION ISOLATION LEVEL; -- во втором терминале

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- в первом терминале
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- во втором терминале

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- в первом терминале
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- во втором терминале

COMMIT; -- в первом терминале
COMMIT; -- во втором терминале