--------------- EJEMPLO SOBRECARGA -----------------------

-------------------------------
----  SOBRECARGA DE PAQUETES
-------------------------------

--- HEADER
    CREATE OR REPLACE PACKAGE dep_pkg IS
    --- SP con 3 parametros
    PROCEDURE add_department(p_deptno departments.department_id%TYPE,
                             p_name departments.department_name%TYPE := 'unknown',
                             p_loc departments.location_id%TYPE := 1700);
    --- SP con 2 parametros
    PROCEDURE add_department(p_name departments.department_name%TYPE := 'unknown',
                             p_loc departments.location_id%TYPE := 1700);
end dep_pkg;

---BODY
    CREATE OR REPLACE PACKAGE BODY dept_pkg IS
    --- primera declaracion
    PROCEDURE add_department(p_deptno departments.department_id%TYPE,
                             p_name departments.department_name%TYPE := 'unknown',
                             p_loc departments.location_id%TYPE := 1700) IS
    BEGIN
        INSERT INTO departments(department_id, department_name, location_id)
        VALUES (p_deptno, p_name, p_loc);
    END add_department;
    --- segunda declaracion
    PROCEDURE add_department(p_name departments.department_name%TYPE := ' unknown',
                             p_loc departments.location_id%TYPE := 1700) IS
    BEGIN
        INSERT INTO DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
        VALUES (DEPARTMENTS_SEQ.nextval, p_name, p_loc);

    end add_department;
end dept_pkg;
--------------------------------------------------------------

-------------------------------
----  PACKAGES
-------------------------------

--- HEADER
    CREATE OR REPLACE PACKAGE taxes_pkg IS
    FUNCTION tax(p_value IN NUMBER) RETURN NUMBER;
END taxes_pkg;

-- PACKAGE BODY
    CREATE OR REPLACE PACKAGE BODY taxes_pkg IS
    FUNCTION tax(p_value IN NUMBER) RETURN NUMBER IS
        v_rate NUMBER := 0.08;
    BEGIN
        RETURN (p_value * v_rate);
    end tax;
end taxes_pkg;

-- llamada a paquete
SELECT taxes_pkg.tax(SALARY), SALARY, LAST_NAME
FROM EMPLOYEES;

-------------------------------------------------------------------------

--------------------------
----- PAQUETES CON CURSOR
--------------------------
    CREATE OR REPLACE PACKAGE curs_pkg IS
    PROCEDURE open;
    FUNCTION next(p_n NUMBER := 1) RETURN BOOLEAN;
    PROCEDURE close;
END curs_pkg;

CREATE OR REPLACE PACKAGE BODY curs_pkg IS
    -- PACKAGE BODY
    CURSOR cur_c IS
        SELECT EMPLOYEE_ID
        FROM EMPLOYEES;
    PROCEDURE open is
    BEGIN
        IF NOT cur_c%ISOPEN THEN
            OPEN cur_c;
        end if;
    end open;
    FUNCTION next(p_n NUMBER := 1) RETURN BOOLEAN IS
        v_emp_id employees.employee_id%TYPE;
    BEGIN
        FOR count IN 1..p_n
            LOOP
                FETCH cur_c INTO v_emp_id;
                EXIT WHEN cur_c%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('ID: ' || (v_emp_id));
            end loop;
        RETURN cur_c%FOUND;
    end next;
    PROCEDURE close IS
    BEGIN
        IF cur_c%ISOPEN THEN
            CLOSE cur_c;
        end if;
    end close;
END curs_pkg;

-------------------------
--- EJECUTANDO PAQUETE
-------------------------
DECLARE
    v_more BOOLEAN := curs_pkg.next(3);
BEGIN
    curs_pkg.open;
    IF NOT v_more THEN
        curs_pkg.CLOSE;
    end if;
end;


----------------------------------------------------------------------

----------------------------------------------------------------------

----------------------------------------
----  MATRICES ASOCIATIVAS EN PAQUETES
----------------------------------------

CREATE OR REPLACE PACKAGE emp_pkg IS
    TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY BINARY_INTEGER;
    PROCEDURE get_employees(p_emps OUT emp_table_type);
END emp_pkg;

CREATE OR REPLACE PACKAGE BODY emp_pkg IS
    PROCEDURE get_employees(p_emps OUT emp_table_type) IS
        v_i BINARY_INTEGER := 0;
    BEGIN
        FOR emp_record IN (SELECT * FROM EMPLOYEES)
            LOOP
                p_emps(v_i) := emp_record;
                v_i := v_i + 1;
            end loop;
    end get_employees;
end emp_pkg;


-------------------------------------------------------------------------------
