CREATE TABLE IF NOT EXISTS person_audit
       (created timestamp with time zone  NOT NULL DEFAULT NOW(),
        type_event char NOT NULL DEFAULT 'I',
        row_id bigint NOT NULL,
        name varchar,
        age integer,
        gender varchar,
        address varchar);

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'));

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS trigger AS
$$
BEGIN
 INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
VALUES ('I', new.id, new.name, new.age, new.gender, new.address);
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';
CREATE OR REPLACE trigger trg_person_insert_audit
  AFTER INSERT
  ON person
  FOR EACH ROW
  EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');