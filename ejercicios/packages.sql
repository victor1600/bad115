----------------
--- package
----------------

--- HEADER--------------------------------------
    CREATE OR REPLACE PACKAGE comm_pkg IS
    v_std_comm NUMBER := 0.10; -- variable publica global

    -- cabecera
    PROCEDURE reset_comm(p_new_comm NUMBER);

END comm_pkg;
---------------- END HEADER ----------------------

--- BODY----------------------------------------------------------
    CREATE OR REPLACE PACKAGE BODY comm_pkg IS

    -- FUNCTION---------------------------------------
    FUNCTION validate(p_comm NUMBER) RETURN BOOLEAN IS
        v_max_comm EMPLOYEES.COMMISSION_PCT%TYPE;
    BEGIN
        SELECT MAX(COMMISSION_PCT)
        INTO v_max_comm
        FROM EMPLOYEES;
        RETURN (p_comm BETWEEN 0.0 AND v_max_comm);
    end validate;
    -- END FUNCTION---------------------------------

    -- PROCEDURE------------------------------------
    PROCEDURE reset_comm(p_new_comm NUMBER) IS
    BEGIN
        --- INVOKING FUNCTION FROM WITHIN -------
        IF validate(p_new_comm) THEN
            v_std_comm := p_new_comm; -- reset public var
            DBMS_OUTPUT.PUT_LINE('RESETED');
        ELSE
            RAISE_APPLICATION_ERROR(
                    -20210, 'BAD COMISSION');
        end if;
    end reset_comm;
    -- FIN PROCEDURE -----------------------------------
end comm_pkg;
-- END BODY ----------------------------------------

--- EXECUTING A PACKAGE ------------
BEGIN
    comm_pkg.RESET_COMM(0.15);
end;
-------------------------


-------------------------------------------
----- CREACION Y USO DE PAQUETES SIN CUERPO
------------------------------------------

CREATE TABLESPACE tbs_pruebas
DATAFILE '/home/oracle/tbs/DF_PRUEBAS_01.DBF' SIZE 100M;
