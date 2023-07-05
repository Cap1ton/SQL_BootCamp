CREATE INDEX IF NOT EXISTS idx_person_name on person (UPPER(name));
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT name FROM person WHERE UPPER(name) IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_person_name on person (UPPER(name));
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT UPPER(name) FROM person WHERE name IS NOT NULL;
