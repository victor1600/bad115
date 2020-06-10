------------ EJECUTAR UNA FUNCION PARA CADA FILA DE UNA TABLA USANDO SELECT ---------
CREATE OR REPLACE FUNCTION tax(p_value IN NUMBER)
    return number is
begin
    RETURN (p_value * 0.08);
end;

select EMPLOYEE_ID, LAST_NAME, SALARY, tax(SALARY)
from EMPLOYEES
where DEPARTMENT_ID = 100;
-----------------------------------------------------------


---------- NOTACION MIXTA, VALORES POR DEFAULT, DECLARECION SIN DECLARE ---

CREATE OR REPLACE FUNCTION f(p_parameter_1 IN NUMBER DEFAULT 1,
                             p_parameter_5 IN NUMBER DEFAULT 5) RETURN NUMBER
    IS
    --- VARIABLE DECLARADA SIN DECLARE ?
    v_var number;
BEGIN
        v_var:= p_parameter_1 + (p_parameter_5 *2);
        RETURN v_var;
end f;

SELECT F(p_parameter_5 => 10) FROM DUAL;

---- VER TABLAS DONDE ESTAN FUNCIONES
DESCRIBE USER_SOURCE

--- CONSULTAR LAS FUNCIONES EXISTENTES
SELECT TEXT
FROM USER_SOURCE
WHERE TYPE ='FUNCTION'
ORDER BY LINE;
