---------------------------------------------------------
-------- EXCEPCIONES
---------------------------------------------------------

-----------------
-- TOO MANY ROWS
----------------

DECLARE
    v_lname VARCHAR2(15);
BEGIN
    SELECT LAST_NAME
    INTO v_lname
    FROM EMPLOYEES
    WHERE FIRST_NAME = 'John';
    DBMS_OUTPUT.PUT_LINE('John''s last name is: ' || v_lname);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('YOUR SELECT STATEMENT RETRIEVED' ||
                             'MULTIPLE ROWS. CONSIDER USING A CURSOR.');
end;

--------------
---- EXCEPCIONES YA DEFINIDAS
--------------

---- NO_DATA_FOUND
---- TOO_MANY_ROWS
----- INVALID_CURSOR
------ ZERO_DIVIDE
------ DUP_VAL_ON_INDEX


-------------------------------------------------------------
--- ATRAPANDO ORACLE SERVER ERROR 01400 (CANNOT INSERT NULL)
-------------------------------------------------------------


DECLARE
    ---- DEFINING CUSTOM EXCEPTION
    e_insert_excep EXCEPTION;
    -- WILL GET RAISED WHEN TRYING TO INSERT NULL
    --- CODIGOS NEGATIVOS
    PRAGMA EXCEPTION_INIT ( e_insert_excep, -01400);
BEGIN
    INSERT INTO DEPARTMENTS
        (DEPARTMENT_ID, DEPARTMENT_NAME)
    values (280, NULL);
EXCEPTION
    WHEN e_insert_excep THEN
        DBMS_OUTPUT.PUT_LINE('INSERT OPERATION FAILED');
        ---- SQLERRM: DEVUELVE MENSAJE ASOCIADO CON EL NUMERO DE ERROR
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
end;

----------------
----- GOOD PRACTICE
--------------
/*
 OTHERS:
 Buena practica: When others, hacer rollback, e insertar el codigo de error y el mensaje
 en una tabla de logs o de errores, para que al siguiente dia, verificar el error y poner
 un nuevo when creando una nueva excepcion antes de others
 */
--------------------
---- EXCEPCIONES DEFINIDAS POR USUARIO
--------------------

--- RAISE: DETIENE EJECUCION Y TRANSFIERE CONTROL A UN CONTROLADOR DE EXCEPCIONES

DECLARE
    v_deptno NUMBER       := 500;
    v_name   VARCHAR2(20) := 'Testing';
    e_invalid_department EXCEPTION;
BEGIN
    UPDATE DEPARTMENTS
    SET DEPARTMENT_NAME = 'POLY'
    where DEPARTMENT_ID = v_deptno;
    --- SI EL CODIGO DE DEPARTAMENT NO EXISTE.
    IF SQL%NOTFOUND THEN
        RAISE e_invalid_department;
    end if;
    COMMIT;
EXCEPTION
    WHEN e_invalid_department THEN
        DBMS_OUTPUT.PUT_LINE('NO SUCH DEPARTMENT ID.');

end;

-------------------------
------ RAISE APPLICATION ERROR
-------------------------

-- AREA EJECUTABLE


BEGIN
    DELETE
    FROM EMPLOYEES
    WHERE MANAGER_ID = 9999999;
    IF SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR(-20202, 'THIS IS NOT A VALIDA MANAGER');
    end if;
end;

-- AREA DE EXCEPCION
BEGIN
    DELETE
    FROM EMPLOYEES
    WHERE MANAGER_ID = 9999999;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20201, 'THIS IS NOT A VALIDA MANAGER');
end;