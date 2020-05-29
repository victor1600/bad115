-----------------------------------------------------------
--- STORED PROCEDURES Y FUNCIONES
-----------------------------------------------------------

--------------
---- STORED P.
--------------
create or replace PROCEDURE add_dept IS
    v_dept_id   dept.department_id%TYPE;
    v_dept_name dept.department_name%TYPE ;
BEGIN
    v_dept_id := 280;
    v_dept_name := 'ST-Curriculum';
    INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME)
    VALUES (v_dept_id, v_dept_name);
    DBMS_OUTPUT.PUT_LINE('INSERTED ' || SQL%rowcount || ' ROW ');
end;

BEGIN
    add_dept;
end;

---------------------
--- FUNCTION
---------------------
CREATE OR REPLACE FUNCTION check_sal(p_empno employees.employee_id%TYPE)
    RETURN Boolean
    IS
    v_dept_id employees.department_id%TYPE;
    v_sal     employees.salary%TYPE;
    v_avg_sal employees.salary%TYPE;
BEGIN

    SELECT SALARY, DEPARTMENT_ID
    INTO v_sal, v_dept_id
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_empno;
    SELECT AVG(SALARY)
    INTO v_avg_sal
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = v_avg_sal;
    IF v_sal > v_avg_sal THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    end if;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
end;

--- EXECUTING THE FUNCTION USING AN ANONYMUS BLOCK

BEGIN
    IF (CHECK_SAL(205) IS NULL) THEN
        DBMS_OUTPUT.PUT_LINE('THE FUNCTION RETURNED NULL DUE TO EXCEPTION');
    ELSIF (CHECK_SAL(205)) THEN
        DBMS_OUTPUT.PUT_LINE('SALARY > AVERAGE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('SALARY < AVERAGE');
    end if;
end;