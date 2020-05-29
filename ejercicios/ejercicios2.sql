---------------
--- Tipo RECORD
--- ROWTYPE: util cuando usamos SELECT *, INSERT Y UPDATE.
---------------
DECLARE
    -- Creando un nuevo tipo de datos
    TYPE t_rec IS RECORD (
        v_sal number(8),
        v_minsal number(8),
        -- v_hire_date sera del mismo tipo que employees.hire_date
        v_hire_date employees.hire_date%type,
        -- v_rec es una variable igual a un registro de employees
        -- tiene los mismos campos
        v_rec1 employees%rowtype
        );
    --- instanciando una variable
    v_myrec t_rec;
BEGIN
    v_myrec.v_sal := v_myrec.v_minsal + 500;
    v_myrec.v_hire_date := sysdate;
    SELECT *
    INTO v_myrec.v_rec1
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(v_myrec.v_rec1.LAST_NAME || ' ' ||
                         to_char(v_myrec.v_hire_date) || ' ' || to_char(v_myrec.v_sal));
END;

----------
---- ROWTYPE WITH INSERT
------

DECLARE
    v_employee_number number := 124;
    v_emp_rec         retired_emps%ROWTYPE;
BEGIN
    SELECT *
    INTO v_emp_rec
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = v_employee_number;
    INSERT INTO RETIRED_EMPS VALUES v_emp_rec;
END;

----------------------------------------------------------------------------------
--- COLECCIONES/ MATRIZ ASOCIATIVA
---------------------------------------------------------------------------------

-------------------------------------
--- TABLE OF NUMBERS
-------------------------------------
SET SERVEROUTPUT ON SIZE 1000000
DECLARE
    TYPE table_type IS TABLE OF NUMBER(10)
        INDEX BY BINARY_INTEGER;

    v_tab table_type;
    v_idx NUMBER;
BEGIN
    -- Initialise the collection.
    << load_loop >>
    FOR i IN 1 .. 5
        LOOP
            v_tab(i) := i;
        END LOOP load_loop;

    -- Delete the third item of the collection.
    v_tab.DELETE(3);

    -- Traverse sparse collection
    v_idx := v_tab.FIRST;
    << display_loop >>
    WHILE v_idx IS NOT NULL
        LOOP
            DBMS_OUTPUT.PUT_LINE('The number ' || v_tab(v_idx));
            v_idx := v_tab.NEXT(v_idx);
        END LOOP display_loop;
END;
/
----------
---- TABLE OF + ROWTYPE: accediendo a 1 registro
----------

DECLARE
    TYPE dept_table_type
        is
        TABLE OF departments%ROWTYPE INDEX BY VARCHAR2 (20);
    dept_table dept_table_type;
BEGIN
    SELECT *
           -- APPENDING JUST ONE DEPARTMENT TO DEPT_TABLE COLLECTION
    INTO dept_table(1)
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = 10;
    DBMS_OUTPUT.PUT_LINE(dept_table(1).DEPARTMENT_ID || ' ' ||
                         dept_table(1).DEPARTMENT_NAME || ' ' ||
                         dept_table(1).MANAGER_ID);
end;

----------
---- TABLE OF + ROWTYPE: iterando sobre elementos
----------
DECLARE
    --- CREATING A COLLECTION
    TYPE emp_table_type IS TABLE OF
        --- EACH ROW WILL BE OF EMPLOYEES TYPE
        employees%ROWTYPE INDEX BY PLS_INTEGER;
    -- INSTATING  EMP_TABLE_TYPE
    my_emp_table emp_table_type;
    max_count    NUMBER(3) := 104;
BEGIN
    FOR i IN 100..max_count
        LOOP
            SELECT *
                   -- SELECT EMPLOYEE WITH ID i FROM EMPLOYEES TABLE AND
                   -- APPENDING EACH EMPLOYEE TO MY_EMP_TABLE IN POSITION i.
            INTO my_emp_table(i)
            FROM EMPLOYEES
            WHERE EMPLOYEE_ID = i;
        end loop;
    --- LOOPTING FROM FIRST TO LAST ELEMENT IN THE COLLECTION
    FOR i IN my_emp_table.FIRST..my_emp_table.LAST
        LOOP
            -- PRINTING LAST NAME OF EACH EMPLOYEEE
            DBMS_OUTPUT.PUT_LINE(my_emp_table(i).LAST_NAME);
        end loop;
end;

----------
-- EJEMPLO DE VARRAYS
--------
DECLARE
    -- Los elementos del array seran de varchar20
    TYPE month_va is varray (13) of
        VARCHAR2(20);
    -- instancio la variale
    v_month_va month_va;
    v_count_nr number;
BEGIN
    -- asignamos valores al VARRAY.
    v_month_va := month_va('A', 'B', 'C', 'D', 'E', 'F', 'G');
    DBMS_OUTPUT.PUT_LINE('Lenght: ' || v_month_va.COUNT);
    -- Agregamos otro espacio, es como un append en otros lenguajes
    v_month_va.extend;
    v_month_va(v_month_va.LAST) := 'Null';
    -- Length ha incrementando gracias al extend.
    DBMS_OUTPUT.PUT_LINE('Lenght: ' || v_month_va.COUNT);
    FOR i IN v_month_va.FIRST..v_month_va.LAST
        LOOP
            DBMS_OUTPUT.PUT_LINE('v_month_va(' || to_char(i) || '):' || v_month_va(i));
        end loop;

end;

-----------
--- CREAR TIPOS Y CREAR TABLAS CON UN VARRAY
---------

--- CREATING NEW TYPE
CREATE OR REPLACE TYPE mem_type IS VARRAY (10) OF VARCHAR2(15)
/
-- CREATING TABLE USING THE NEW TYPE
CREATE TABLE club
(
    Name    VARCHAR2(10),
    Address VARCHAR2(20),
    City    VARCHAR2(20),
    Phone   VARCHAR2(8),
    Members mem_type
);

---- INSERTANDO
INSERT INTO club
VALUES ('Al', '1111 FIRST St.', 'MOBILE', '22222222', mem_type('BRENDA', 'Richard'));
INSERT INTO club
VALUES ('FL', '2222 SECONDS St.', 'MOBILE', '3333333', mem_type('Gen', 'John', 'Steph', 'JJ'));


SELECT *
FROM club;

-- QUERYING BASED ON THE CUSTOM VARRAY TYPE.
SELECT NAME "Clubname"
FROM CLUB
-- CONSULTANDO TABLA ANIDADA.
WHERE 'Gen' IN (SELECT * FROM table (club.Members));