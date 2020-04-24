# Recuperando datos utilizando SELECT, SQL básico

## Uso de Distinct

- Eliminando tuplas repetidas:
```sql
select DISTINCT * from CLIENTE;
```

## Aliases

- Se puede hacer con o sin comillas dobles, pero el ```as``` las comillas dobles son requeridas si se usara un nombre compuesto como alias:

```sql
select NOMBRE_CLIENTE CLIENTE FROM CLIENTE;
```
o:
```sql
select NOMBRE_CLIENTE as "CLIENTE" FROM CLIENTE;
```

#### Cadena de caracteres literal

- Debe ir entre **comillas simples**
- Comillas dobles para el nombre del alias

```sql
SELECT nombre_cliente || ' vive en: ' || CALLECLIENTE as " Cliente Direccion "  FROM CLIENTE;
```

#### Operador alternativo ```q```

- Se ocupa cuando lleva apostrofe el texto que queremos usar
- Sintaxis: ```q'[]``` 

```sql
SELECT nombre_cliente || q'[live's in: ]' || CALLECLIENTE as " Cliente Direccion "  FROM CLIENTE;
```

## Describe

1)
```sql
DESCRIBE cliente
```

2)

```sql
DESC cliente
```

# Restringiendo y Ordenando de Datos, SQL, ClaseIII, Oracle 12c

### Restriccion a nivel de filas Where
![](imagenes/Screenshot%20from%202020-04-20%2022-59-50.png)

#### Where fechas
![](imagenes/Screenshot%20from%202020-04-20%2023-01-08.png)

#### Operadores comparacion
![](imagenes/Screenshot%20from%202020-04-20%2023-03-02.png)

#### Between
![](imagenes/Screenshot%20from%202020-04-20%2023-03-55.png)

#### In
![](imagenes/Screenshot%20from%202020-04-20%2023-04-33.png)

#### LIKE
![](imagenes/Screenshot%20from%202020-04-20%2023-05-00.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-05-31.png)

#### Where NULL
![](imagenes/Screenshot%20from%202020-04-20%2023-06-01.png)

#### where operadores logicos
![](imagenes/Screenshot%20from%202020-04-20%2023-06-28.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-07-20.png)

### Reglas prioridad
![](imagenes/Screenshot%20from%202020-04-20%2023-07-49.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-08-11.png)

### ORDER BY
![](imagenes/Screenshot%20from%202020-04-20%2023-08-35.png)

##### ORDER BY ALias
![](imagenes/Screenshot%20from%202020-04-20%2023-09-12.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-09-37.png)

### Variables sustitucion
![](imagenes/Screenshot%20from%202020-04-20%2023-10-15.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-10-46.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-10-57.png)

#### Doble &&
![](imagenes/Screenshot%20from%202020-04-20%2023-11-18.png)

#### DEFINE UNDEFINE
![](imagenes/Screenshot%20from%202020-04-20%2023-11-51.png)

#### VERIFY
![](imagenes/Screenshot%20from%202020-04-20%2023-12-12.png)

# Uso de las funciones de una sola fila para personalizar la salida, SQL, claseIV, Oracle 12c

#### Tipos 
- Una fila
- Multiples Filas

#### Una fila 
![](imagenes/Screenshot%20from%202020-04-20%2023-16-38.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-16-58.png)

##### Lower
![](imagenes/Screenshot%20from%202020-04-20%2023-17-55.png)

## InitCap
```sql
select initcap(first_name || ' ' || last_name)
from employees where department_id = 30;
```

#### caracter
![](imagenes/Screenshot%20from%202020-04-20%2023-17-33.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-18-27.png)

#### Anidamiento
![](imagenes/Screenshot%20from%202020-04-20%2023-19-14.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-22-02.png)

#### Funciones numericas
![](imagenes/Screenshot%20from%202020-04-20%2023-22-30.png)

#### ROUND
![](imagenes/Screenshot%20from%202020-04-20%2023-23-17.png)
#### TRunc
![](imagenes/Screenshot%20from%202020-04-20%2023-23-30.png)


#### MOD
![](imagenes/Screenshot%20from%202020-04-20%2023-24-05.png)

## FECHAS

![](imagenes/Screenshot%20from%202020-04-20%2023-24-22.png)

#### Fecha YY RR
![](imagenes/Screenshot%20from%202020-04-20%2023-24-50.png)

#### SYSDATE
![](imagenes/Screenshot%20from%202020-04-20%2023-25-45.png)

#### ARITMETICA FECHA
![](imagenes/Screenshot%20from%202020-04-20%2023-26-00.png)

#### FUNCIONES MANIPULACION FECHAS
![](imagenes/Screenshot%20from%202020-04-20%2023-26-19.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-26-54.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-27-18.png)

# Uso de las funciones de conversión y Expresiones condicionales, SQL, claseV, Oracle 12c

### tipos
- Implicito
- Explicitos

###  Implicito
![](imagenes/Screenshot%20from%202020-04-20%2023-29-17.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-29-44.png)

## TO_CHAR fechas
![](imagenes/Screenshot%20from%202020-04-20%2023-30-01.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-30-11.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-30-24.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-30-48.png)

## TO_CHAR numeros
![](imagenes/Screenshot%20from%202020-04-20%2023-31-18.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-31-56.png)

## TO_NUMBER TO_DATE RR
![](imagenes/Screenshot%20from%202020-04-20%2023-32-30.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-32-55.png)

### NVL
![](imagenes/Screenshot%20from%202020-04-20%2023-33-21.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-33-34.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-33-45.png)

### NVL2
![](imagenes/Screenshot%20from%202020-04-20%2023-34-02.png)

### NULLIF
![](imagenes/Screenshot%20from%202020-04-20%2023-34-31.png)

#### COALESCE
![](imagenes/Screenshot%20from%202020-04-20%2023-34-55.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-35-06.png)

### CASE
![](imagenes/Screenshot%20from%202020-04-20%2023-35-31.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-35-43.png)

### DECODE
![](imagenes/Screenshot%20from%202020-04-20%2023-36-08.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-36-17.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-36-32.png)

# Informes de Datos Agregados utilizando las Funciones de grupoClase VI, SQL , Oracle 12c

### Funciones grupo

![](imagenes/Screenshot%20from%202020-04-20%2023-38-35.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-39-05.png)

#### AVG SUM MIN MAX COUNT
![](imagenes/Screenshot%20from%202020-04-20%2023-39-38.png)
![](imagenes/imagenes/Screenshot%20from%202020-04-20%2023-40-00.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-40-16.png)

### COUNT DISTINCT
![](imagenes/Screenshot%20from%202020-04-20%2023-41-03.png)

### GRUPO NULL
![](imagenes/Screenshot%20from%202020-04-20%2023-41-21.png)

#### GROUP BY
![](imagenes/Screenshot%20from%202020-04-20%2023-42-21.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-42-34.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-42-58.png)

#### GROUPY BY ERRORES
![](imagenes/Screenshot%20from%202020-04-20%2023-43-14.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-43-41.png)

#### HAVING
![](imagenes/Screenshot%20from%202020-04-20%2023-44-12.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-44-23.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-44-34.png)

### JERARQUIZACION ANIDACION
![](imagenes/Screenshot%20from%202020-04-20%2023-44-57.png)
![](imagenes/Screenshot%20from%202020-04-20%2023-45-12.png)

# Mostrar datos de múltiples tablas usando Joins, ClaseVII, (SQL) en Oracle 12c

## Inner Join( Filas coincidentes)

#### Natural Join:
- Todas las columnas de las tablas que tienen el mismo nombre
- Columnas con mismo nombre pero diferente tipo de dato, da error
- No se pone alias

#### Using:
-  Sirve para especificar dejar afuera columnas que no tienen mismo tipo de dato,
 pero mismo nombre.
 
 - Coincida solo con una columna
 
![](imagenes/Screenshot%20from%202020-04-17%2017-21-30.png)

#### On

- Especificamos columnas que queremos unir
- Deja la columna

![](imagenes/Screenshot%20from%202020-04-17%2017-24-19.png)

- Multiples tablas:
![](imagenes/Screenshot%20from%202020-04-17%2017-26-15.png)


#### Self Join

- Cuando queremos comparar tabla contra ella misma 
- Es NECESARIO USAR JOINS
![](imagenes/Screenshot%20from%202020-04-17%2017-30-11.png)

#### Nonequijoins
- No tienen atributos comunes
![](imagenes/Screenshot%20from%202020-04-17%2017-32-27.png)

## OUTER JOINS


- Left

![](imagenes/Screenshot%20from%202020-04-17%2017-37-20.png)

- Rigth
![](imagenes/Screenshot%20from%202020-04-17%2017-37-42.png)
- Full Outer Join
![](imagenes/Screenshot%20from%202020-04-17%2017-39-36.png)

## Producto Cartesiano, (CROSS JOIN)

- Expresion de ```mxn``` 

![](imagenes/Screenshot%20from%202020-04-17%2017-41-57.png)

# El uso de subconsultas para resolver Consultas, Clase VIII, SQL , en Oracle 12c


- Siempre se desarrolla primero la consulta
- Luego la consulta

##### Una sola Fila
- usando Having
![](imagenes/Screenshot%20from%202020-04-17%2018-34-06.png)


##### Multiples filas

![](imagenes/Screenshot%20from%202020-04-17%2018-37-03.png)

- Any
![](imagenes/Screenshot%20from%202020-04-17%2018-38-00.png)

- All
![](imagenes/Screenshot%20from%202020-04-17%2018-38-58.png)

###### Exists
- Operacion booleana
 
![](imagenes/Screenshot%20from%202020-04-17%2018-39-25.png)

# El uso de los operadores de Conjunto, Clase IX, SQL, en Oracle 12c


- Union All: Todos los elementos de A y todos los elementos de B, aun aquellos que se repitan
- Intersect
- Minus

### Union

> Elimina duplicados!
![](imagenes/Screenshot%20from%202020-04-20%2021-25-27.png)

### Union All
![](imagenes/Screenshot%20from%202020-04-20%2021-26-36.png)

### Intersect
![](imagenes/Screenshot%20from%202020-04-20%2021-28-14.png)

### Minus
![](imagenes/Screenshot%20from%202020-04-20%2021-29-34.png)

#### Coincidencias de sentencias SELECT
> Cuando una tabla no tiene la columna de otra y queremos que coincidan

![](imagenes/Screenshot%20from%202020-04-20%2021-31-19.png)
![](imagenes/Screenshot%20from%202020-04-20%2021-32-28.png)

### Order By
![](imagenes/Screenshot%20from%202020-04-20%2021-34-18.png)

# Gestionando tablas utilizando sentencias DML, Clase X, Sql en Oracle 12c

## Insert
![](imagenes/Screenshot%20from%202020-04-20%2022-11-09.png)
![](imagenes/Screenshot%20from%202020-04-20%2022-11-45.png)

### Valores especiales

- Sysdate
![](imagenes/Screenshot%20from%202020-04-20%2022-12-49.png)

- Fechas
![](imagenes/Screenshot%20from%202020-04-20%2022-13-23.png)

- Copiando filas de otra tabla
![](imagenes/Screenshot%20from%202020-04-20%2022-14-18.png)

## Update
![](imagenes/Screenshot%20from%202020-04-20%2022-16-54.png)

### Update subconsulta
![](imagenes/Screenshot%20from%202020-04-20%2022-17-43.png)
![](imagenes/Screenshot%20from%202020-04-20%2022-18-27.png)

## Delete

![](imagenes/Screenshot%20from%202020-04-20%2022-19-50.png)

### Delete subconsulta
![](imagenes/Screenshot%20from%202020-04-20%2022-20-34.png)

## Truncate
![](imagenes/Screenshot%20from%202020-04-20%2022-22-05.png)

## Transacciones de base de datos
DML, DDL, DCL

### Commit rollback
![](imagenes/Screenshot%20from%202020-04-20%2022-23-24.png)

![](imagenes/Screenshot%20from%202020-04-20%2022-24-06.png)
![](imagenes/Screenshot%20from%202020-04-20%2022-24-49.png)
![](imagenes/Screenshot%20from%202020-04-20%2022-31-30.png)
![](imagenes/Screenshot%20from%202020-04-20%2022-32-14.png)
![](imagenes/Screenshot%20from%202020-04-20%2022-32-42.png)
![](imagenes/Screenshot%20from%202020-04-20%2022-33-05.png)
#### SavePoint
![](imagenes/Screenshot%20from%202020-04-20%2022-28-14.png) 

#### Transaccion implicita
![](imagenes/Screenshot%20from%202020-04-20%2022-29-29.png)

#### Nivel de sentencia Rollback
![](imagenes/Screenshot%20from%202020-04-20%2022-34-51.png)

## Leer Consistencia
![](imagenes/Screenshot%20from%202020-04-20%2022-35-29.png)

## For update
![](imagenes/Screenshot%20from%202020-04-20%2022-38-15.png)
![](imagenes/Screenshot%20from%202020-04-20%2022-39-50.png)

#### Resumen
![](imagenes/Screenshot%20from%202020-04-20%2022-40-36.png)

# Video 10 "Introducción al lenguaje de definición de datos(LDD)"

## Objetos de base de datos
![](imagenes/objBD.png)

## Tipos de Dato
![](imagenes/tipoDato.png)

## Tipos de Datos fecha y hora
![](imagenes/fechayhora.png)

## Opcion Default
- Los valores literales, expresiones o funciones de SQL son valores legales
- El nombre de otra columna o un pseudocolumna son valores ilegales
- El tipo de datos predeterminado debe coincidir con el tipo de datos de columna
```sql
CREATE TABLE hire_dates
            (id             NUMBER(8),
             hire_date      DATE DEFAULT SYSDATE);
```

## Sentencia CREATE TABLE

### Se especifica
- El nombre de la tabla
- El nombre de la columna, el tipo de datos de la columna y el tamaño de la columna

### Creando tablas
*Creando la Tabla*
```sql
CREATE TABLE dept
            (deptno         NUMBER(2),
             dname          VARCHAR2(14),
             loc            VARCHAR2(13),
             create_date    DATE DEFAULT SYSDATE);
```
*Confirmando creacion de tabla*
```sql
DESCRIBE dept
```

## Incluyendo restricciones
- Aseguran la coherencia y la integridad de la BD
- Los siguientes tipos de restricciones son validas
  - NOT NULL
  - UNIQUE
  - PRIMARY KEY
  - FOREIGN KEY
  - CHECK

#### Restriccion a nivel de la columna
```sql
CREATE TABLE employees(
    employee_id     NUMBER(6),
    CONSTRAINT emp_emp_id_pk PRIMARY KEY,
    first_name      VARCHAR2(20),
...);
```
#### Restriccion a nivel de tabla
```sql
CREATE TABLE employees(
    employee_id     NUMBER(6),
    first_name      VARCHAR2(20),
    ...
    job_id          VARCHAR2(10) NOT NULL,
    CONSTRAINT emp_emp_id_pk 
    PRIMARY KEY (EMPLOYEE_ID)
);
```
#### Restriccion NOT NULL
- La primary key, impone automaticamente la restriccion not null
#### Restriccion UNIQUE
- A los atributos que deban ser unicos dentro de las reglas del negocio se pone dicha restriccion
```sql
CREATE TABLE employees(
    employee_id     NUMBER(6),
    last_name       VARCHAR2(25) NOT NULL,
    email           VARCHAR2(25),
    salary          NUMBER(8,2),
    job_id          VARCHAR2(10) NOT NULL,
    hire_date       DATE NOT NULL,
    ...
    CONSTRAINT emp_email_uk     UNIQUE(email)
);
```
#### Restriccion PRIMARY KEY
- Si se quiere ingresar un nuevo registro en la tabla, la primary key obliga a que exista un codigo, por ejemplo un department_id
- Si el id ya existe entonces no se permite porque el valor de la primary key debe ser unica
```sql
CREATE TABLE employees(
    employee_id     NUMBER(6)    PRIMARY KEY,
    last_name       VARCHAR2(25) NOT NULL,
    email           VARCHAR2(25),
    salary          NUMBER(8,2),
    hire_date       DATE NOT NULL,
    ...
    CONSTRAINT emp_dept_fk      FOREIGN KEY (department_id)
     REFERENCES departments(department_id),
    CONSTRAINT emp_email_uk     UNIQUE(email)
);
```

#### Restriccion FOREIGN KEY
- Hace referencia a una primary key de otra tabla
- Ese valor debe existir a la tabla que hace referencia
```sql
CREATE TABLE employees(
    employee_id     NUMBER(6),
    last_name       VARCHAR2(25) NOT NULL,
    email           VARCHAR2(25),
    salary          NUMBER(8,2),
    hire_date       DATE NOT NULL,
    ...
    CONSTRAINT emp_dept_fk      FOREIGN KEY (department_id)
     REFERENCES departments(department_id),
    CONSTRAINT emp_email_uk     UNIQUE(email)
);
```

*FOREIGN KEY: Define la columna de la tabla secundaria en el nivel restricciones de tabla*

*REFERENCES: Identifica la tabla y la columna en la tabla padre*

*ON DELETE CASCADE: Elimina las filas dependientes en la tabla secundaria cuando se elimina una fila de la tabla padre*

*ON DELETE SET NULL: Convierte los valores de clave foranea dependientes a NULL*

#### Restricción CHECK
- En el se define una condicion que cada fila debe satisfacer
- Expresiones no permitidas:
    - Las referencias a la pseudocolumnas CURRVAL, NEXTVAL, LEVEL, ROWNUM
    - Las llamadas a las funciones SYSDATE, UID, USER, USERENV
    - Las consultas que hacen referencia a otros valores en otras filas
```sql
CREATE TABLE employees(
    ...,salary          NUMBER(8,2)
    CONSTRAINT emp_salary_min
            CHECK (salary > 0),...
);
```

*Al actualizar la tupla de salario, cada vez que se ingrese un valor mayor o igual a cero no va a permitir ese valor en la tupla*

## Violaciones de las restricciones
- Si agregamos un codigo padre que no existe a la foreing key, entonces da error
- No se puede eliminar una fila que contiene una primary key que se utiliza como ua foreign key de otra tabla

## Creacion de tabla utilizando una subconsulta
```sql
CREATE TABLE dept80
    AS
        SELECT  employee_id, last_name,
                salary*12 ANNSAL,
                hire_date
        FROM    employees
        WHERE   department_id=80;
```
```sql
DESCRIBE dept80
```

## Sentencia ALTER TABLE
*Se utiliza para:*

- Añadir una nueva columna
- Modificar una definicion de columna existente
- Definir un valor predeterminado para la nueva columna
- Dropear una columna
- Cambiar nombre de una columna
- Cambiar la tabla al estado de solo lectura

*Agregar una columna*
```sql
ALTER TABLE dept80
ADD         (job_id VARCHAR2(9));
```
*Modificar una columna*
```sql
ALTER TABLE dept80
MODIFY         (last_name VARCHAR2(30));
```
*Eliminar una columna*
```sql
ALTER TABLE dept80
DROP         (job_id);
```

## Opcion SET UNUSED
- Se usa para marcar una o mas columnas como no utilizadas
- DROP UNUSED COLUMNS para eliminar las consultas que fueron marcadas como no utilizadas
- Con ONLINE se indica que las operaciones DML en la tabla se permitira al marcar la columna o las columnas UNUSED

## Tablas de solo lectura
- Se realiza con ALTER TABLE
- Impide crear que sentendias DDL o DML cambien durante el mantenimiento de la tabla

*Solo lectura*
```sql
ALTER TABLE employees READ ONLY;
```
*Lectura y escritura*
```sql
ALTER TABLE employees READ WRITE;
```

## Eliminar una Tabla
- Mueve una tabla a la papelera de reciclaje
- Si se especifica PURGE entonces elimina la tabla y todos sus datos por completo
- Invalida los objetos dependientes y elimina los privilegios de los objetos en la tabla
```sql
DROP TABLE dept80;
```

# Video1.  Introducción a Vistas del Diccionario de Datos, Curso Avanzado SQL

## Diccionario de datos
- El diccionario de datos es la metadata, es la definicion de los objetos que se tienen en una BD
- La metadata se encuentra en un directorio llamado "sys" que es el administrador de la BD, y el tienen toda una estructura para la gestion de la BD
- Las tablas de la BD obtienen informacion de los negocios (OBJETOS DEL NEGOCIO)
- El servidor oracle tambien contiene la vista de los diccionarios de datos (OBJETOS PARA GESTIONAR LA BD)

![](imagenes/dicciodedatos.png)

#### Estructura del diccionario de datos
![](imagenes/estructuradiccio.png)

#### Convencion de la nomenclatura

*Prefijos USER, ALL, DBA, V$*

![](imagenes/pref.png)

## Como usar el diccionario vistas
- Con DICTIONARY. Contiene los nombres y descripciones de las tablas de diccionario y puntos de vista
```sql
DESCRIBE DICTIONARY
```
```sql
SELECT * 
FROM    dictionary 
WHERE   table_name = 'USER_OBJECTS';
```

### Vistas USER_OBJECTS y ALL_OBJECTS
#### USER_OBJECTS:
- Para ver todos los objetos que se es dueño
- Se puede obtener un listado de todos los nombre de objetos y tipos en su esquema 
    - Fecha de creacion
    - Fecha de ultima modificacion
    - Estatus (valido o invalido)
```sql
SELECT  object_name, object_type, created, status
FROM    user_objects
ORDER BY   object_type;
```
#### ALL_OBJECTS:
- Para ver todos los objetos a los cuales tiene acceso 

#### Tabla de informacion
- Depende en el usuario que me encuentre asi me mostrara las tablas de ese esquema
```sql
DESCRIBE user_tables
```
```sql
SELECT table_name
FROM    user_tables;
```
#### Informacion de Columna
```sql
DESCRIBE user_tab_columns
```
```sql
SELECT column_name, data_type, data_length,
        data_precision, data_scale, nullable
FROM    user_tab_columns
WHERE   table_name = 'EMPLOYEES';
```
#### Informacion de Restricciones
- USER_CONSTRAINTS, describe las definiciones de restricciones sobre las tablas
- USER_CONS_COLUMNS, describe las columnas que son propiedad de usted y que se especifican en restricciones
```sql
DESCRIBE user_constraints
```
```sql
SELECT constraint_name, constraint_type,
        search_condition, r_constraint_name,
        delete_rule, status
FROM    user_constraints
WHERE   table_name = 'EMPLOYEES';
```
#### Consultando con USER_CONS_COLUMNS
- Devuelve las columnas que forman parte de un  constraint
```sql
DESCRIBE user_cons_columns
```
```sql
SELECT constraint_name, column_name
FROM    user_cons_columns
WHERE   table_name = 'EMPLOYEES';
```
#### Adicion de comentarios a una tabla
- Se puede agregar comentarios a una tabla o una columna usando COMMENTS
```sql
COMMENT ON TABLE employees
IS 'Employee Information';
```
```sql
COMMENT ON COLUMN employees.first_name
IS 'First name of the employee';
```
- Los diccionarios pueden ser vistos a traves de las vistas de diccionarios de datos
    - ALL_COL_COMMENTS
    - USER_COL_COMMENTS
    - ALL_TAB_COMMENTS
    - USER_TAB_COMMENTS

# Video 2. Creación de secuencias, sinónimos, e índices

## Hacer referencias a las Tablas de otro usuario
- Se debe de usar el nombre del propietario como prefijo para las tablas
```sql
SELECT * FROM userB.employees;
```
```sql
SELECT * FROM userA.employees;
```
![](imagenes/referencia.png)

## Secuencias
- Pueden generar de forma automatica numeros unicos
- Es objeto compartible
- Se puede utilizar para crear un valor de clave principal
- Reemplaza el codigo de aplicacion, por lo que esta en la capa de datos y tiene mejor rendimiendo
- Acelera el rendimiento de acceso a valores de secuencia cuando se almacena en cache en la memoria

#### Sentencia CREATE SECUENCE: Sintaxis
*Secuencia para generar numeros consecutivos de forma automatica* 
```sql
CREATE SECUENCE [ schema. ] sequence
[ { INCREMENT BYE | START WITH } integer
| { MAXVALIUE integer | NOMAXVALUE }
| { MINVALUE integer | NOMINVALUE } 
| { CYCLE | NOCYCLE }
| { CACHE integer | NOCACHE }
| { ORDER | NOORDER }  
]
```

#### Creando una secuencia
- Crear una secuencia llamada DEPT_DEPTID_SEQ que se utilizara para la clave principal de la tabla de DEPARTMENTS
- No usar la opcion CYCLE
```sql
CREATE SECUENCE dept_deptid_seq
                INCREMENT BY 10
                START WITH 280
                MAXVALUE 9999
                NOCACHE
                NOCYCLE;
```
## Pseudocolumnas NEXTVAL y CURRVAL
- NEXTVAL: Devuleve el siguiente valor de la secuencia disponible. Se devulve un valor unico cada vez que se hace referencia, incluso para los diferentes usuarios
- CURRVAL: Obtiene el valor de secuencia actual
- NEXTVAL debe ser emitido por esa secuencia antes que CURRVAL contenga ese valor

#### Usando una secuencia
*Inserte un nuevo departamento denominado "Suport" en la localidad 2500 con el id de departamento con el valor de secuencia* 
```sql
INSERT INTO     departments(
                department_id, department_name, location_id)
VALUES          (dept_deptid_seq.NEXTVAL,
                'Support', 2500);
```
*Ver el valor actual de la secuencia DEPT_DEPTID_SEQ*
```sql
CREATE      dept_deptid_seq.CURRVAL
FROM        dual;
```
#### Columna por defecto SQL usando una secuencia
- La expresion DEFAULT puede incluir la secuencia con seudocolumnas CURRVAL y NEXTVA, mientras exista la sentencia y usted tenga los privilegios encesarios para acceder a ella.
```sql
CREATE SEQUENCE s1 START WITH 1;
CREATE TABLE emp (a1 NUMBER DEFAULT s1 NEXTVAL NOT NULL, a2 VARCHAR2(10));
```

#### Los valores de secuencia Caching

- Alamacenamiento en cache de valores de secuencia en la memoria da un acceso mas rapido a esos valores

- Pueden ocurrir lagunas o vacios en valores de secuencia cuando
    - Una reversion se produce
    - Los fallos del sistema
    - Una secuencia se utiliza en otra tabla

### Modificando el valor de secuencia
*Cambie el valor de incremento, valor maximo, valor minimo, la opcion de ciclo o la opcion de cache*
```sql
ALTER SECUENCE dept_deptid_seq
                INCREMENT BY 20
                MAXVALUE 999999
                NOCACHE
                NOCYCLE;
```
#### Reglas para la modificacion de la secuencia
- Debe ser propietario o tener privilegio ALTER para la secuencia
- Solo los numeros de secuencia futuros se ven afectados
- En algunos se realiza la validacion
- Para eliminar una secuencia se usa DROP
```sql
DROP SECUENCE dept_deptid_seq;
```
#### Informacion de la secuencia
```sql
DESCRIBE user_sequences;
```

## Sinonimos
- Objetos de base de datos
- Puede ser creado para dar un nombre alternativo para una tabla o a otro objeto de base de datos
- No requiere almacenamiento que no sea su definicion en el diccionario de datos
- Es util para ocultar la identidad y la ubicacion de un objeto de esquema subyacente

*A travez del sinonimo se puede ocultar la identidad de la tabla, es buena practica para efectos de seguridad*

#### Creacion de un sinonimo de un objeto
- Crea una referencia mas facil a una tabla que es propiedad de otro usuario
- Acorta largos nombres de objeto 
```sql
CREATE [PUBLIC] SYNONYM synonym
FOR object;
```
*Crear un nombre abreviado para la vista DEPT_SUM_VU*
```sql
CREATE SYNONYM d_sum
FOR dept_sum_vu;
```
*Eliminar un sinonimo*
```sql
DROP SYNONYM d_sum;
```
#### Informacion de sinonimos
```sql
DESCRIBE user_synonym
```
```sql
SELECT * FROM user_synonym
```

## Indices
- Puede ser utilizado para acelerar la recuperacion de filas mediante el uso de un puntero
- Puede reducir la entrada/salida de disco mediante el uso de un metodo de acceso de ruta rapida para localizar datos de forma rapida
- Es dependiente los indices de las tablas
- Se usa y se mantiene de forma automatica por el servidor de Oracle

#### Como se crean los indices

- **Automaticamente:** Cuando se define una restriccion de CLAVE PRIMARIA o UNIQUE en una definicion de la tabla
- **Manualmente:** Se puede crear un indice unico o no unico en las columnas para acelerar el acceso a las filas

*Mejorar la velocidad de acceso de consulta de columna LAST_NAME en la tabla:*
```sql
CREATE INDEX emp_last_name_idx
ON employees(last_name);
```

*Crear indice con CREATE TABLE*
```sql
CREATE TABLE NEW_EMP
(employee_id NUMBER(6) PRIMARY KEY USING INDEX
                        (CREATE INDEX emp_id_idx ON
                        NEW_EMP(employee_id)),
first_name VARCHAR2(20),
last_name VARCHAR2(25);
)
```
```sql
SELECT INDEX_NAME, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE = 'NEW_EMP';
```

#### Los indices de funcion-base
- Se basa en expresiones
- La expresion de indice se construye a partir de columnas de tabla, constantes, funciones de SQL y funciones definidas por el usuario
```sql
CREATE INDEX upper_dept_name_idx
ON dept2(UPPER(department_name));
```
```sql
SELECT *
FROM dept2
WHERE UPPER(department_name) = 'SALES';
```
#### Ejemplo de creacion de multiples indices en el mismo conjunto de columnas
```sql
CREATE INDEX emp_id_name_ix1
ON employees(employee_id, first_name);
```
```sql
ALTER INDEX emp_id_name_ix1 INVISIBLE;
```
```sql
CREATE BITMAP INDEX emp_id_name_ix2
ON employees(employee_id, first_name);
```
#### Directrices de la creacion del indice
![](imagenes/directrices.png)
#### Informacion de indices
```sql
DESCRIBE user_indexes
```
```sql
SELECT index_name, table_name, uniqueness
FROM user_indexes
WHERE table_name = 'EMPLOYEES';
```

#### Consultando USER_IN_COLUMNS
- Devuelve las columnas asociadas a un indice
```sql
DESCRIBE user_ind_columns
```
```sql
SELECT index_name, column_name, table_name
FROM user_ind_columns
WHERE index_name = 'LNAME_I DX';
```
#### Eliminacion de un indice
- Se realiza mediante DROP INDEX
- Para excluir a un indice, debe ser el propietario del indice o tener el privilegio DROP ANY INDEX
```sql
DROP INDEX emp_last_name_idx
```

# Video 3. Creacion de Vistas

- La vista es un subconjunto de informacion que ponemos tener en tablas base.**
- Las tablas base las construimos en los esquemas de las bases de datos**

## Ventajas de las vistas
- Restringir acceso a los datos
- Hace consultas complejas faciles
- Proporciona independencia de datos
- Presenta diferentes vistas de los mismos datos

## Vistas simples y complejas
![](imagenes/vistas.png)

#### Creacion de vista
*Crear la vista EMPVU80, que contiene detalle de los empleados del departamento 80*
```sql
CREATE VIEW empvu80
 AS SELECT employee_id, last_name, salary
 FROM   employees
 WHERE  department_id = 80;
```
*Describir la consulta de la vista*
```sql
DESCRIBE empvu80;
```
#### Modificacion de vista
- CREATE OR REPLACE VIEW son las clausulas para modificar una vista
```sql
CREATE OR REPLACE VIEW empvu80
 (id_number, name, sal, department_id)
AS SELECT employee_id, first_name || '' || last_name, salary, department_id
FROM   employees
WHERE  department_id = 80;
```

## Creacion de Vista Completa

*Crear una vista compleja que contiene las funciones de grupo para mostrar los valores de dos tablas*
```sql
CREATE OR REPLACE VIEW dep_sum_vu
 (name, minsal, maxsal, avgsal)
AS SELECT d.deparment_name, MIN(e.salary),
          MAX(e.salary), AVG(e.salary)
FROM      employees e JOIN departments d
ON        (e.department_id = d.department_id)
GROUP BY  d.department_name;
```
#### Informacion de las vistas
```sql
DESCRIBE user_views
```
```sql
SELECT view_name FROM user_views;
```
```sql
SELECT text FROM user_views
WHERE view_name = 'EMP_DETAILS_VIEW';
```

## Reglas para la realizacion de operaciones DML en una vista

- No se puede eliminar ni modificar una vista si la fila contiene
  - funciones de grupo
  - clausula GROUP BY
  - la palabra DISTINCT
  - la palabra reservada ROWNUM

- No se pueden agregar datos a una vista si la vista contiene:
  - funciones de grupo
  - clausula GROUP BY
  - la palabra DISTINCT
  - la palabra reservada ROWNUM
  - columnas definidas por las expresiones
  - columnas NOT NULL sin valor por defecto en las tablas de base que no estan seleccionados por la vista

## Uso de la clausula WITH CHECK OPTION
- Asegura que las operaciones DML se realizaron en la estancia de la vista en el dominio de la vista.

![](imagenes/withcheck.png)

## Denegar operaciones DML
- Se puede asegurar que no hayan operaciones de DML mediante la opcion WITH READ ONLY

![](imagenes/denegardml.png)

## Eliminar una vista
```sql
DROP VIEW empvu80
```

# Video 4. Gestionando Objetos de Esquemas

## Adicionando una restriccion
![](imagenes/adicionando.png)

## Borrando un constraint
- utilizando DROP CONSTRAINT

![](imagenes/dropcons.png)

#### Dropiando un constraint ONLINE osea en vivo
![](imagenes/online.png)

## Clausula ON DELETE
![](imagenes/cascade.png)

#### Restricciones en cascada 
![](imagenes/restrcc.png)

*Ejemplos de restricciones en cascada*

![](imagenes/cascadeejem.png)

## Renombrando columnas de tablas y restricciones
![](imagenes/rename.png)

#### Deshabilitando restricciones
![](imagenes/disable.png)

#### Habilitando restricciones
- ENABLE CONSTRAINT

## Deferring constraints
![](imagenes/deferring.png)

#### Diferencia entre INITIALY DEFERRED y INITIALY INMEDIATE
![](imagenes/diff.png)

## DROP TABLE... PURGE
- Ademas de que dropea, libera el espacio disponible que tengamos de nuestros segmentos a nivel de nuestro table spaces que estemos trabajando
- Limpia la tabla
```sql
DROP TABLE emp_new_sal PURGE;
```

## Tablas temporales
- Existen en la BD durante la duracion de la transaccion o sesion que tengamos
- Son definidas de manera estatica a nivel de la metadata o el diccionario de la base de datos

*El carrito en una aplicacion en linea esta temporalmente en una cola*

*Cada articulo representa una fila que temporalmente esta en la tabla*

*Los datos que yo este eligiendo en el carrito estan de manera privada en mi sesion*

*Entonces las tablas temporables son tablas privadas a nivel de sesion*

*Al hacer el pago la aplicacion mueve esas filas que elegi en el carrito, y las coloca en una tabla permanente, y al finalizar la sesion esos datos en la tabla temporal son borrados*

![](imagenes/temp.png)

#### Creando una tabla temporal con CREATE GLOBAL TEMPORARY TABLE
![](imagenes/tablatemp.png)

## Tablas Externas
#### Creando un directorio de tablas externas
![](imagenes/dirtable.png)

#### Creando una tabla externa
![](imagenes/tablaext.png)

#### Creando una tabla externa utilizando ORACLE_LOADER 
![](imagenes/loader.png)

## Consultando tablas externas
- Sintacticamente la estructura esta en nuestra base 

![](imagenes/consultext.png)

## Creando Tabla externa usando ORACLE_DATAPUMP: 
![](imagenes/oracle.png)

# Video 5. "Recuperacion de datos mediante subconsultas"

## Recuperacion de datos mediante una subconsulta como una fuente
![](imagenes/recuperacion.png)

#### Ejemplo de recuperancion de datos usando Vista
![](imagenes/usandovista.png)

## Subconsultas con multiples columnas
![](imagenes/multiple.png)

## Comparacion de Subconsultas pares
![](imagenes/consupar.png)

## Comparacion con Subconsulta No Par
![](imagenes/nopar.png)

## Expresiones Subconsulta Escalar
![](imagenes/escalar.png)

#### Ejemplos de subconsulta escalar
 ![](imagenes/subescalar.png)

## Subconsultas Correlacionadas
 ![](imagenes/correlacion.png)

#### Sintaxis de la consulta correlacionada
 ![](imagenes/sincorre.png)

*Buscar todos los empleados que ganan mas que el salari medio en su departamento*

 ![](imagenes/ejcorr.png)

*Mostrar detalle de aquellos empleados que han cambiado puestos de trabajo por lo menos dos veces*

 ![](imagenes/puesto.png)

 ## Usando operados EXIST
 ![](imagenes/exist.png)

 #### Ejemplo de operador EXIST

 ![](imagenes/emploex.png)

#### Encontrar todos los departamentos que no tienen empleados
 ![](imagenes/noexist.png)

## Clausula WITH
 ![](imagenes/with.png)

*Mostrar los nombres del departamento y salarios totales para aquellos departamentos cuyo salario total es mayor que el salario promedio de todos los departamentos*

 ![](imagenes/ejemwith.png)

 ## Clausula WITH Recursiva
 ![](imagenes/withrecurs.png)

#### Ejemplo de WITH Recursiva
 ![](imagenes/ejemrec.png)

# Introducción a SQL Analytic y Operacion ROLLUP, Clase I, para Data Warehousing

## SQL ANALITICO DEFINICION
![](imagenes/Screenshot%20from%202020-04-22%2000-39-28.png)

## Group by Having (Recordatorio)
- Tantas columnas no tengamos con funciones de agregacion, deben incluirse
en el group by

![](imagenes/Screenshot%20from%202020-04-22%2000-43-21.png)

### ROLLUP CUBE
![](imagenes/Screenshot%20from%202020-04-22%2001-00-38.png)

### ROLLUP
![](imagenes/Screenshot%20from%202020-04-22%2001-05-10.png)
![](imagenes/Screenshot%20from%202020-04-22%2001-12-28.png)
![](imagenes/Screenshot%20from%202020-04-22%2001-12-55.png)
![](imagenes/Screenshot%20from%202020-04-22%2001-22-04.png)
![](imagenes/Screenshot%20from%202020-04-22%2001-22-36.png)
![](imagenes/Screenshot%20from%202020-04-22%2001-24-50.png)
![](imagenes/Screenshot%20from%202020-04-22%2001-43-36.png)
![](imagenes/Screenshot%20from%202020-04-22%2001-57-22.png)
