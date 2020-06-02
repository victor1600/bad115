----------------------------
--- ANONYMOUS BLOCKS IN PLGSQL
----------------------------

--------------------------------
----- GETTIG CURRENT USER, TIME AND DATE OF CREATION, SLEEP
---------------------------------

DO
$$
    DECLARE
        CREATED_AT_TIME TIME        := CURRENT_TIME;
        CREATED_AT_DATE date        := CURRENT_DATE;
        USER            varchar(50) := current_user;
    BEGIN
        RAISE NOTICE 'CURRENT USER: %', USER;
        PERFORM pg_sleep(10);
        RAISE NOTICE 'CURRENT TIME: %', CREATED_AT_TIME;
        RAISE NOTICE 'CURRENT DATE: %', CREATED_AT_DATE;

    end;
$$;

--- WE CAN USE TYPE JUST LIKE PLSQL

---- CONSTANTS

DO
$$
    DECLARE
        start_at CONSTANT time := now();
    BEGIN
        RAISE NOTICE 'Start executing block at %', start_at;
    END
$$;


--------------------------
--- EXCEPTIOS
-----------------------
DO
$$
    DECLARE
        email varchar(255) := 'info@postgresqltutorial.com';
    BEGIN
        -- check email for duplicate
        -- ...
        -- report duplicate email
        RAISE EXCEPTION 'Duplicate email: %', email
            USING HINT = 'Check the email again';
    END
$$;

----------------------------------
---- FUNCTIONS
-----------------------------------


CREATE FUNCTION INC(VAL INTEGER)
    RETURNS INTEGER AS
$$
BEGIN
    RETURN VAL + 1;
end;
$$
    LANGUAGE plpgsql;


SELECT INC(1);

--------------------
--- PARAMETERS: IN
--------------------
CREATE OR REPLACE FUNCTION GET_SUM(A numeric,
                                   B numeric)
    RETURNS NUMERIC AS
$$
BEGIN
    RETURN A + B;
end;
$$
    language plpgsql;

SELECT GET_SUM(1, 2);

----------------------
------ OUT PARAMETERS: WE DONT NEED TO USE RETURN STATEMENT!
-----------------------
CREATE OR REPLACE FUNCTION HI_LO(A numeric,
                                 B numeric,
                                 C numeric,
                                 OUT HI numeric,
                                 OUT LO numeric)
AS
$$
BEGIN
    HI := GREATEST(A, B, C);
    LO := LEAST(A, B, C);
end;
$$
    LANGUAGE plpgsql;
----
--- CALLING THE FUNCTION
-------

-- DEFAULT
SELECT hi_lo(10, 20, 30);

-- SEPARATED BY COLUMNS
SELECT *
FROM HI_LO(10, 20, 30);

----------
--- IN OUT PARAMETERS
-------------
CREATE OR REPLACE FUNCTION SQUARE(
    INOUT A NUMERIC
)
AS
$$
BEGIN
    A := A * A;
end;
$$
    LANGUAGE plpgsql;

SELECT SQUARE(4);
---------------------

CREATE OR REPLACE FUNCTION greet(
    OUT GREET varchar
)
AS
$$
BEGIN
    GREET := 'HI';
end;
$$
    LANGUAGE plpgsql;

SELECT GREET();

------------------------
-- FUNCTIONS WITH SQL
------------------------
CREATE OR REPLACE FUNCTION get_total_tipos(
    p_id_tipo uuid
)
    RETURNS NUMERIC AS
$$
DECLARE
    TOTAL numeric;
BEGIN
    SELECT INTO TOTAL COUNT(*)
    FROM db_tipo_medicamento
    WHERE id_tipo_medicamento = p_id_tipo;
    RETURN TOTAL;
end;
$$
    LANGUAGE plpgsql;

SELECT get_total_tipos('79c00706-9361-49e9-8c55-8e654674d924');

SELECT *
FROM db_tipo_medicamento;

-------------------------------------
----- FUNCTION THAT RETURN TABLES
--------------------------------------

---- obtener medicamento por nombre
CREATE OR REPLACE FUNCTION get_medicamento(p_pattern VARCHAR)
    RETURNS TABLE
            (
                name_medicamento varchar,
                medicamento_id   uuid
            )
AS
$$
DECLARE
BEGIN
    RETURN QUERY
        SELECT nombre_medicamento, id_medicamento
        FROM db_medicamento
        WHERE nombre_medicamento ILIKE p_pattern;
end;
$$
    LANGUAGE plpgsql;

SELECT *
FROM get_medicamento('A%');

----------------------------------
---- ITERAR SOBRE SELECCION
---------------------------------
CREATE OR REPLACE FUNCTION GET_MEDICAMENTO_MAYUSC(p_pattern VARCHAR)
    RETURNS TABLE
            (
                name VARCHAR,
                ID   uuid
            )
AS
$$
DECLARE
    var_r record;
BEGIN


    FOR var_r in (SELECT nombre_medicamento, id_medicamento
                  FROM db_medicamento
                  WHERE nombre_medicamento ILIKE p_pattern)
        LOOP
            name := upper(var_r.nombre_medicamento);
            id := var_r.id_medicamento;
            return NEXT;
        end loop;
end;
$$
    language plpgsql;

SELECT *
FROM get_medicamento_mayusc('A%');

----------------------------------
-------- IF/ELSE
---------------------------------

DO
$$
    DECLARE
        a INTEGER := 10;
        b INTEGER := 20;
    BEGIN
        IF A > B THEN
            RAISE NOTICE 'A IS GREATER THAN B';
        ELSIF A < B THEN
            RAISE NOTICE 'A IS LESS THAN B';

        ELSE
            RAISE NOTICE 'A IS EQUAL TO B';
        end if;

    end;

$$;

------------------
--- CASE
-------------------
CREATE OR REPLACE FUNCTION GET_ESTADO_MEDICAMENTOS()
-- SE ESPECIFICA LA LONGIT DEL VARCHAR
    RETURNS varchar(25) AS

$$
DECLARE
    SUMATORIA NUMERIC;
    ESTADO    varchar(25);

BEGIN
    SELECT INTO SUMATORIA COUNT(nombre_medicamento)
    FROM db_medicamento;

    CASE
        WHEN SUMATORIA > 10 THEN
            ESTADO = 'MAS DE 10';
        WHEN SUMATORIA > 20 THEN
            ESTADO = 'MAS DE 20';
        ELSE
            ESTADO = 'POCOS';
        END CASE;
    RETURN ESTADO;

end;
$$
    LANGUAGE plpgsql;


SELECT get_estado_medicamentos();

--------------------
--- LOOP
-------------------

CREATE OR REPLACE FUNCTION fibonacci(n INTEGER)
    RETURNS INTEGER AS
$$
DECLARE
    counter INTEGER := 0 ;
    i       INTEGER := 0 ;
    j       INTEGER := 1 ;
BEGIN

    IF (n < 1) THEN
        RETURN 0 ;
    END IF;

    LOOP
        EXIT WHEN counter = n;
        counter := counter + 1;
        SELECT j, i + j INTO i, j;
    END LOOP;

    RETURN i;
END ;
$$ LANGUAGE plpgsql;

---------------------
--- WHILE
--------------
CREATE OR REPLACE FUNCTION fibonacci(n INTEGER)
    RETURNS INTEGER AS
$$
DECLARE
    counter INTEGER := 0 ;
    i       INTEGER := 0 ;
    j       INTEGER := 1 ;
BEGIN

    IF (n < 1) THEN
        RETURN 0 ;
    END IF;

    WHILE counter <= n
        LOOP
            counter := counter + 1;
            SELECT j, i + j INTO i, j;
        END LOOP;

    RETURN i;
END ;
$$
    LANGUAGE plpgsql;

------------
--- FOR LOOP
---------
DO
$$
    BEGIN
        FOR counter IN 1..5
            LOOP
                RAISE NOTICE 'COUNTER: %', counter;
            end loop;
    end;
$$;

--------------------------
--- FOR LOOP WITH QUERIES with default
--------------------------
CREATE OR REPLACE FUNCTION for_loop_through_query(
    n INTEGER default 10
)
    RETURNS VOID AS
$$
DECLARE
    rec RECORD;
BEGIN
    for rec in select nombre_medicamento
               from db_medicamento

        loop
            raise notice '%', rec.nombre_medicamento;
        end loop;
end;
$$
    language plpgsql;

SELECT for_loop_through_query(5);

----------------------------------------------------------
----------- DYNAMIC: PASING IN QUERY DYNAMICALLY TO THE FUNCTION.
----------------------------------------------------------
CREATE OR REPLACE FUNCTION for_loop_through_dyn_query(query text,
                                                      n integer)
    RETURNS VOID AS
$$
DECLARE
    --- THIS IS USED FOR ITERATING IN FOR LOOPS
    rec RECORD;

BEGIN

    FOR REC IN EXECUTE query
        LOOP
            RAISE NOTICE '%', rec.nombre_medicamento;
        end loop;
end;
$$
    language plpgsql;

SELECT for_loop_through_dyn_query('SELECT nombre_medicamento FROM db_medicamento', 5);

----------------
------- CURSOR: PARAMETERS, RETURN, IF STATEMENT
----------------
CREATE OR REPLACE FUNCTION GET_NAMES_MEDS(p_name varchar)
    RETURNS TEXT AS
$$
DECLARE
    titles TEXT DEFAULT '';
    rec    RECORD;
    -- mando argumento a cursor
    cur_meds CURSOR (p_name varchar)
        FOR SELECT nombre_medicamento
            from db_medicamento;
BEGIN
    -- open the cursor
    OPEN cur_meds(p_name);
    LOOP
        FETCH cur_meds into rec;
        EXIT WHEN NOT FOUND;


        -- BUILD THE OUTPUT
        IF REC.nombre_medicamento LIKE 'A%' THEN
            titles := titles || ' , ' || REC.nombre_medicamento;
        end if;
    end loop;
    CLOSE cur_meds;
    RETURN titles;

end ;
$$
    language plpgsql;

SELECT GET_NAMES_MEDS('ds');

---------------HELPER TABLES----------------
CREATE TABLE accounts
(
    id      INT GENERATED BY DEFAULT AS IDENTITY,
    name    VARCHAR(100) NOT NULL,
    balance DEC(15, 2)   NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO accounts(name, balance)
VALUES ('Bob', 10000);

INSERT INTO accounts(name, balance)
VALUES ('Alice', 10000);

SELECT *
FROM accounts;
----------------HELPER TABLES---------------
CREATE OR REPLACE PROCEDURE transfer(INT, INT, DEC)
    LANGUAGE plpgsql
AS
$$
BEGIN
    -- SUBSTRACT THE AMOUNT FROM THE SENDER'S ACCOUNT
    UPDATE accounts
    SET BALANCE = balance - $3
    WHERE ID = $1;

    -- ADDINGTHE AMOUNT TO THE RECEIVER'S ACCOUNT
    UPDATE accounts
    SET balance = balance + $3
    WHERE ID = $2;

    COMMIT;
end;

$$;

CALL transfer(1, 2, 1000);

---------------------------------------
------- TRIGGERS
--------------------------------------
CREATE TABLE employees
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name  VARCHAR(40) NOT NULL
);

CREATE TABLE employee_audits
(
    id          SERIAL PRIMARY KEY,
    employee_id INT          NOT NULL,
    last_name   VARCHAR(40)  NOT NULL,
    changed_on  TIMESTAMP(6) NOT NULL
);


--------------
--- CREATE TRIGGER
--------------

CREATE OR REPLACE FUNCTION log_last_name_changes()
    RETURNS TRIGGER AS
$BODY$
BEGIN
    IF NEW.LAST_NAME <> OLD.LAST_NAME THEN
        INSERT INTO employee_audits(EMPLOYEE_ID, LAST_NAME, CHANGED_ON)
        VALUES (old.ID, OLD.LAST_NAME, NOW());

    end if;
    RETURN NEW;
end;
$BODY$
LANGUAGE plpgsql;

------------------------------
--- BIND TRIGGER TO A TABLE
-----------------------------
CREATE TRIGGER LAST_NAME_CHANGES
    BEFORE UPDATE ON employees
    FOR EACH ROW
    EXECUTE PROCEDURE log_last_name_changes();


INSERT INTO employees (first_name, last_name)
VALUES ('John', 'Doe');

INSERT INTO employees (first_name, last_name)
VALUES ('Lily', 'Bush');

SELECT * FROM employees;

UPDATE employees
SET last_name = 'Brown'
WHERE ID = 2;

SELECT *
FROM employee_audits;
