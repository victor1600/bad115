---------------
--- PROCEDURES
---------------
CREATE OR REPLACE PROCEDURE raise_salary(p_id IN employees.employee_id%TYPE,
                                         p_percent IN NUMBER)
    is
BEGIN
    UPDATE EMPLOYEES
    SET SALARY = SALARY * (1 + p_percent / 100)
    where EMPLOYEE_ID = p_id;
    DBMS_OUTPUT.PUT_LINE('salary raised');
end;


----------------------
---- USAGE OF OUT VARIABLES: OUT PARAMETER
----------------------

CREATE OR REPLACE PROCEDURE query_emp(p_id IN employees.employee_id%TYPE,
                                      p_name out employees.last_name%type,
                                      p_salary out employees.salary%type) is
begin
    SELECT LAST_NAME, SALARY
    INTO p_name, p_salary
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_id;
end;


--- CALLING USING AN ANONYMOUS BLOCK

SET SERVEROUTPUT ON
DECLARE
    v_emp_name employees.last_name%TYPE;
    v_emp_sal  employees.salary%TYPE;
BEGIN
    query_emp(171, v_emp_name, v_emp_sal);
    DBMS_OUTPUT.PUT_LINE(v_emp_name || ' earns ' ||
                         to_char(v_emp_sal, '$999,999.00'));
end;

---- CALLING USING GLOBAL VARIABLES:
--- SE IDENTIFICAN CON DOS PUNTOS :
VARIABLE    b_name VARCHAR2(25)
VARIABLE b_sal NUMBER


EXECUTE query_emp(171, :b_name, :b_sal)
PRINT b_name b_sal

--------------------
--- phone structure: IN OUT PARAMETER
------------------

CREATE OR REPLACE PROCEDURE format_phone(p_phone_no IN OUT VARCHAR2)
    IS
BEGIN
    p_phone_no := ('(' || SUBSTR(p_phone_no, 1, 3) ||
                   ') ' || SUBSTR(p_phone_no, 4, 3) ||
                   '-' || SUBSTR(p_phone_no, 7));
end format_phone;


DECLARE
    p_phone_no VARCHAR2(25) := '8006330575';
BEGIN
    DBMS_OUTPUT.PUT_LINE(p_phone_no);
    FORMAT_PHONE(p_phone_no);
    DBMS_OUTPUT.PUT_LINE(p_phone_no);
end;

-----
---DEFAULT VALUES and arrow notation
----


CREATE OR REPLACE PROCEDURE add_dept(p_name departments.department_name%TYPE := 'Unknow',
                                     p_loc departments.location_id%TYPE DEFAULT 1700) IS
BEGIN
    INSERT INTO DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
    VALUES (DEPARTMENTS_SEQ.nextval, p_name, p_loc);
    DBMS_OUTPUT.PUT_LINE('EXECUTED STORED P.');
end;

EXECUTE add_dept;
EXECUTE add_dept('advertising', p_loc=>1200);
EXECUTE add_dept(p_loc=>1200);


-------
--- PROCEDURE AND CURSOR TO CALL OTHER PROCEDURE
------
CREATE OR REPLACE PROCEDURE raise_salary(p_id IN employees.employee_id%TYPE,
                                         p_percent IN NUMBER)
    is
BEGIN
    UPDATE EMPLOYEES
    SET SALARY = SALARY * (1 + p_percent / 100)
    where EMPLOYEE_ID = p_id;
    DBMS_OUTPUT.PUT_LINE('salary raised');
end;


CREATE OR REPLACE PROCEDURE process_employees
    IS
    CURSOR cur_emp_cursor IS
        SELECT EMPLOYEE_ID
        FROM EMPLOYEES;
BEGIN
    FOR emp_rec IN cur_emp_cursor
        LOOP
            RAISE_SALARY(emp_rec.EMPLOYEE_ID, 10);
        end loop;
    DBMS_OUTPUT.PUT_LINE('SP FINISHED');
    COMMIT;
end;

----------------------------------------------------
--- MANEJANDO EXCEPCIONES: en este ejemplo el flujo no para, solo advierte que no se puede
----------------------------------------------------
CREATE OR REPLACE PROCEDURE add_department(p_name VARCHAR2,
                                           P_mgr NUMBER,
                                           p_loc NUMBER) IS
BEGIN
    INSERT INTO DEPARTMENTS(DEPARTMENT_ID,
                            DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
    VALUES (DEPARTMENTS_SEQ.nextval, p_name, P_mgr, p_loc);
    DBMS_OUTPUT.PUT_LINE('Added dept: ' || p_name);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Err: adding dept: ' || p_name);
end;

CREATE PROCEDURE create_departments IS
BEGIN
    ADD_DEPARTMENT('Media', 100, 1800);
    ADD_DEPARTMENT('Editing', 99, 1800);
    ADD_DEPARTMENT('Advertising', 101, 1800);

end;

--------
-- ver procedimientos que hemos credo
-----
SELECT text
FROM USER_SOURCE;

----------------------
---- BIND: anonymous called SP
----------------------



CREATE OR REPLACE PROCEDURE p(x BOOLEAN) authid
    current_user as
begin
    if x then
        DBMS_OUTPUT.PUT_LINE('X is true');
    end if;
end;
/
DECLARE
    b BOOLEAN := TRUE;
BEGIN
    p(b);
end;
/
