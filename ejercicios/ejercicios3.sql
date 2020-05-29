-----------
---CURSORES
-----------

-- DECLARAR CURSOR
--- APERTURARLO
--- HACER UN FECTH (asignar a variabls correspondientes ese cursor)


--- USING ROWTYPE
DECLARE
    CURSOR c_emp_cursor IS
        SELECT EMPLOYEE_ID, LAST_NAME
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = 30;
    v_emp_record c_emp_cursor%ROWTYPE;
BEGIN
    OPEN c_emp_cursor;
    LOOP
        FETCH c_emp_cursor INTO v_emp_record;
        EXIT WHEN c_emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_emp_record.EMPLOYEE_ID || ' ' || v_emp_record.LAST_NAME);
    end loop;
    -- ALWAYS CLOSE THE CURSOR
    CLOSE c_emp_cursor;
end;

--------------------------------------------------------------------------------
--- CURSOR WITH FOR (LIKE IN PYTHON) BEST WAY: DOES OPEN,FETCH AND CLOSE IMPLICITLY
--------------------------------------------------------------------------------

DECLARE
    CURSOR c_emp_cursor IS
        SELECT EMPLOYEE_ID, LAST_NAME
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = 30;
BEGIN
    FOR emp_record IN c_emp_cursor
        LOOP
            DBMS_OUTPUT.PUT_LINE(emp_record.EMPLOYEE_ID || ' ' || emp_record.LAST_NAME);
        end loop;
end;

-------
---UTILIZAR %ISOPEN antes de desarrollar una recuperacion para probar si esta abierto
--------

--- USANOD ROWCOUNT Y NOT FOUND
DECLARE
    CURSOR c_emp_cursor IS SELECT EMPLOYEE_ID,
                                  LAST_NAME
                           FROM EMPLOYEES;
    v_emp_record c_emp_cursor%ROWTYPE;
BEGIN
    OPEN c_emp_cursor;
    LOOP
        FETCH c_emp_cursor INTO v_emp_record;
        EXIT WHEN c_emp_cursor%ROWCOUNT > 10 OR c_emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_emp_record.EMPLOYEE_ID || ' ' || v_emp_record.LAST_NAME);
    end loop;
    CLOSE c_emp_cursor;
END;

--------------------
--- CUSOR IMPLICITO
---------------
BEGIN
    FOR emp_record IN (
        SELECT EMPLOYEE_ID, LAST_NAME
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = 30
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE(emp_record.EMPLOYEE_ID || ' ' || emp_record.LAST_NAME);
        end loop;
end;
/

----------------------------
--- CURSORES ON PARAMETROS
---------------------------
DECLARE
    CURSOR c_emp_cursor (deptno NUMBER) IS
        SELECT EMPLOYEE_ID, LAST_NAME
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = deptno;
begin
    open c_emp_cursor(10);
    close c_emp_cursor;
    open c_emp_cursor(20);
    close c_emp_cursor;
end;


--------------------------
---BLOQUEO DE FILAS
-------------------------

--- DENEGAR ACCESSO A OTRAS SESIONES DURANTE EL TIEMPO DE UNA TRANSACCION
--- BLOQUEAR FILAS ANTES DE ACTUALIZAR UTILIZANDO FOR UPDATE
---- WHERE CURRENT OF PARA REFERENCIAR LA FILA ACTUAL ANTES DE UN CURSOR EXPLICITO
