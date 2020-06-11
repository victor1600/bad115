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
    CREATE OR REPLACE PACKAGE global_consts IS
    c_mile_2_kilo CONSTANT NUMBER := 1.6093;
    c_kilo_2_mile CONSTANT NUMBER := 0.62;
    c_yard_2_meter CONSTANT NUMBER := 0.9144;
    c_meter_2_yard CONSTANT NUMBER := 1.0936;
END global_consts;

BEGIN
    DBMS_OUTPUT.PUT_LINE('20 MILES = ' ||
                         20 * global_consts.c_kilo_2_mile || ' km');
end;
