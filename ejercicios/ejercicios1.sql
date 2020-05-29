-----------
-- SELECT INTO
----------

DECLARE
    v_fname VARCHAR2(25);
BEGIN
    SELECT FIRST_NAME
    INTO v_fname
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 200;
    DBMS_OUTPUT.PUT_LINE('First Name is: ' || v_fname);
end;

----
--- selecting several fields and putting into variables
----

DECLARE
    v_emp_hiredate employees.HIRE_DATE%TYPE;
    v_emp_salary   employees.salary%TYPE;
BEGIN
    SELECT HIRE_DATE, SALARY
    INTO v_emp_hiredate, v_emp_salary
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE('Hire data is:' || v_emp_hiredate);
    DBMS_OUTPUT.PUT_LINE('Salary is: ' || v_emp_salary);
end;
----
--- LAS VARIABLES NO SOLO SE USAN PARA GUARDAR CAMPOS EN EL SELECT
----
DECLARE
    v_sum_sal NUMBER(10, 2);
    v_deptno  NUMBER NOT NULL := 60;
BEGIN
    SELECT SUM(SALARY)
    INTO v_sum_sal
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = v_deptno;
    DBMS_OUTPUT.PUT_LINE('The sum of salary is ' || v_sum_sal);

end;

----
--- Insercion
---
CREATE SEQUENCE employees_s START WITH 1;

BEGIN
    INSERT INTO EMPLOYEES
        (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
    VALUES (employees_s.nextval, 'Ruth', 'Cores', 'RCORES',
            CURRENT_DATE, 'AD_ASST', 400);
end;

-------------------
--- ACTUALIZACION
------------------
DECLARE
    sal_increase employees.salary%TYPE := 800;
BEGIN
    UPDATE EMPLOYEES
    SET SALARY = SALARY + sal_increase
    WHERE JOB_ID = 'ST_CLERK';
end;


------------
--- BORRAR
------------
DECLARE
    deptno employees.department_id%TYPE := 10;
BEGIN
    DELETE
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = deptno;
end;

------------
--- FUSION
------------
CREATE TABLE copy_emp
AS
SELECT *
FROM EMPLOYEES;

SELECT *
FROM COPY_EMP;

BEGIN
    MERGE INTO copy_emp c
    USING EMPLOYEES E
    ON (E.EMPLOYEE_ID = C.EMPLOYEE_ID)
    WHEN MATCHED THEN
        UPDATE
        SET c.first_name = e.FIRST_NAME,
            c.last_name  = e.LAST_NAME,
            c.email      = e.EMAIL;

end;

-------------------------------------------------------------------------------
-- SQL%FOUND: ATRIBUTO BOOLEANO QUE ENVIA TRUE SI SE AFECTO AL MENOS UNA FILA
--- SQL%NOTFOUND: " " EVALUA TRUE SI NO SE AFECTO NI UNA FILA
---SQL%ROWCOUNT: NUMERO DE FILAS AFECTADAS
-----------------------------------------------------------------------------

CREATE TABLE employees_copy AS
SELECT *
FROM EMPLOYEES;

DECLARE
    v_rows_deleted VARCHAR2(30);
    v_empno        employees.employee_id%TYPE := 176;
BEGIN
    DELETE
    FROM employees_copy
    WHERE EMPLOYEE_ID = v_empno;
    v_rows_deleted := (SQL%ROWCOUNT || ' row deleted.');
    DBMS_OUTPUT.PUT_LINE(v_rows_deleted);
end;

-----------------
---IF ELSEIF ELSE
-----------------
DECLARE
    v_myage number := 31;
BEGIN
    IF v_myage < 11 THEN
        DBMS_OUTPUT.PUT_LINE('IM A CHILD');
    ELSIF v_myage < 20 THEN
        DBMS_OUTPUT.PUT_LINE('IM YOUNG');
    ELSIF v_myage < 30 THEN
        DBMS_OUTPUT.PUT_LINE(' iM AN IN TWENTIES');
    ELSIF v_myage < 40 THEN
        DBMS_OUTPUT.PUT_LINE('IM IN MY THIRTIES');
    ELSE
        DBMS_OUTPUT.PUT('IM ALWAYS YOUNG');

    end if;
end;
/

----------------------------------------
---CASE: Recibiendo input del teclado
---------------------------------------
SET VERIFY OFF
DECLARE
    v_grade     CHAR(1) := UPPER('&grade');
    v_appraisal VARCHAR2(20);
BEGIN
    v_appraisal := CASE v_grade
                       WHEN 'A' THEN 'Excellent'
                       WHEN 'B' THEN 'VERY GOOD'
                       WHEN 'C' THEN 'GOOD'
                       ELSE 'NO SUCH GRADE'
        END;
    DBMS_OUTPUT.PUT_LINE('Grade' || v_Grade || ' Appraisal' || v_appraisal);
end;

DECLARE
    v_grade     CHAR(1) := UPPER('&grade');
    v_appraisal VARCHAR2(20);
BEGIN
    v_appraisal := CASE
                       WHEN v_grade = 'A' THEN 'Excellent'
                       WHEN v_grade IN ('B', 'C') THEN 'GOOD'
                       ELSE 'NO SUCH GRADE'
        END;
    DBMS_OUTPUT.PUT_LINE('Grade ' || v_Grade || ' Appraisal ' || v_appraisal);
end;

---------
---LOOPS
---------

---------------
---  LOOP BASICO : INSERTANDO REGISTROS
-------------

DECLARE
    v_country_id locations.country_id%TYPE := 'CA';
    v_loc_id     locations.location_id%TYPE;
    v_counter    NUMBER(2)                 := 1;
    v_new_city   locations.city%TYPE       := 'Montreal';
BEGIN
    SELECT MAX(LOCATION_ID)
    INTO v_loc_id
    FROM LOCATIONS
    WHERE COUNTRY_ID = v_country_id;
    LOOP
        INSERT INTO LOCATIONS(LOCATION_ID, CITY, COUNTRY_ID)
        values ((v_loc_id + v_counter), v_new_city, v_country_id);
        v_counter := v_counter + 1;
        DBMS_OUTPUT.PUT_LINE('LOCATION WITH ID:' || (v_loc_id + v_counter) || ' was appended!');
        EXIT WHEN v_counter > 3;
    end loop;
end;

---------------------------------------
---  LOOP WHEN : INSERTANDO REGISTROS
---------------------------------------

DECLARE
    v_country_id LOCATIONS_COPY.country_id%TYPE := 'CA';
    v_loc_id     LOCATIONS_COPY.location_id%TYPE;
    v_counter    NUMBER(2)                      := 1;
    v_new_city   locations.city%TYPE            := 'Montreal';
BEGIN
    SELECT MAX(LOCATION_ID)
    INTO v_loc_id
    FROM LOCATIONS_COPY
    WHERE COUNTRY_ID = v_country_id;
    WHILE v_counter <= 3
        LOOP
            INSERT INTO LOCATIONS_COPY(LOCATION_ID, CITY, COUNTRY_ID)
            values ((v_loc_id + v_counter), v_new_city, v_country_id);
            v_counter := v_counter + 1;
            DBMS_OUTPUT.PUT_LINE('LOCATION WITH ID:' || (v_loc_id + v_counter) || ' was appended!');
        end loop;
end;


---------------------------------------
---  FOR
---------------------------------------
DECLARE
    v_country_id LOCATIONS_COPY.country_id%TYPE := 'CA';
    v_loc_id     LOCATIONS_COPY.location_id%TYPE;
    v_new_city   locations.city%TYPE            := 'Montreal';
    v_suma       int;
BEGIN
    SELECT MAX(LOCATION_ID)
    INTO v_loc_id
    FROM LOCATIONS_COPY
    WHERE COUNTRY_ID = v_country_id;

    FOR i IN 1..3
        LOOP
            SELECT (v_loc_id + i) INTO v_suma FROM DUAL;
            INSERT INTO LOCATIONS_COPY(LOCATION_ID, CITY, COUNTRY_ID)
            values (v_suma, v_new_city, v_country_id);
            DBMS_OUTPUT.PUT_LINE('LOCATION WITH ID:' || v_suma || ' was appended!');
        end loop;
end;

-----------------
--- NESTED LOOPS EXAMPLE!
---------------
DECLARE
    s PLS_INTEGER := 0;
    i PLS_INTEGER := 0;
    j PLS_INTEGER;
BEGIN
    <<outer_loop>>
    LOOP
        i := i + 1;
        j := 0;
        <<inner_loop>>
        LOOP
            j := j + 1;
            s := s + i * j; -- sum a bunch of products
            EXIT inner_loop WHEN (j > 5);
            EXIT outer_loop WHEN ((i * j) > 15);
        END LOOP inner_loop;
    END LOOP outer_loop;
    DBMS_OUTPUT.PUT_LINE('The sum of products equals: ' || TO_CHAR(s));
END;
/

/*
 BUCLE BASICO:
 Utilizar bucle basico cuando las sentencias dentro del bucle se deben realizar
 por lo menos una vez.

 BUCLE WHILE:
 Utilice el bucle WHILE si la condicion se deve evaluar al comienzo de cada
 iteracion.

 BUCLE FOR:
 Utilizar un bucle FOR si se conoce el
 numero de iteraciones
 */