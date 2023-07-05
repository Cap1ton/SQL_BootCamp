BEGIN; -- в первом терминале
BEGIN; -- во втором терминале

UPDATE pizzeria SET rating = 2 WHERE id = 1; -- в первом терминале
UPDATE pizzeria SET rating = 3 WHERE id = 2; -- во втором терминале

UPDATE pizzeria SET rating = 4 WHERE id = 2; -- в первом терминале
UPDATE pizzeria SET rating = 5 WHERE id = 1; -- во втором терминале

COMMIT; -- в первом терминале
COMMIT; -- во втором терминале