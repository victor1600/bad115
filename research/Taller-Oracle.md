# Taller Oracle BLOB


# LOB
Large Object. Almacenan datos grandes no estructurados como texto, imagenes graficas, peliculas,etc 

- **LOB INTERNOS**
    - BLOB: Binarios
    - CLOB: Objeto grande de caracteres
    - NCLOB: Almacena caracteres y binarios

- **LOB EXTERNOS**:
    - BFILE: Solo guarda la ruta donde se encuentra fisicamente un archivo en el OS.

[BFILE](images-taller/BFILE.png)

### Como se guardan los LOB(CLOB,BLOB,NLOB)?
Los lOB incorporan un localizador. Imaginemos que tenemos una tabla de empleados,
que contiene su nombre y su contrato PDF, la data no esta junta, sino que el archivo binario
PDF estara en otra parte dentro de la misma BD. El Localizador dice: "El archivo tipo LOB esta en este lado".

> Al insertar, se inserta un localizador que apunta a la zona donde esta el archivo binario


### Como trabaja el BFILE?
- No lo guarda en la BD, se guarda la ruta del archivo dentro de la base de datos, pero el sistema esta 
externo, afuera de la BD. La desventaja es que no hay seguridad

> La carpeta donde se guarden externamente los archivos debe ser declarada en oracle, de otra manera no podremos referenciar

## Leccion 01: Trabajando con tipo CLOB y BLOB

 > Campos CLOB guardan caracteres de gran longitud. (Hasta 4 GB)

- Paso 0: Crear zona de almacenamiento, en oracle, esto se llama **TABLESPACE**.

```sql
CREATE TABLESPACE TBS_CLOB
DATAFILE 'C:\TEMP\DF_CLOB.DBF' 
SIZE 10M;

```

-  **Crear tablas**. El campo se especifica como CLOB

```sql
CREATE TABLE PERSONAJES
(
CODIGO NUMBER,
NOMBRE VARCHAR2(100),
BIOGRAFIA CLOB) TABLESPACE TBS_CLOB;
```

- **Insertar datos CLOB** Es igual que un insert normal con los CLOB.

- **alter table**: Agregar una foto BLOB

- **Insertar datos BLOB**: Dara error si intentamos hacer un insert normal


### **Crear localizadores sin valores asociados**
Cada registro tiene que tener un localizador que dice donde esta el archivo LOB


```sql
-- 6. INSERTANDO REGISTROS CON CAMPOS NULOS EN CLOB Y BLOB
--    Crea localizadores sin valores asociados 
INSERT INTO PERSONAJES VALUES (4,'SAN MARTIN',EMPTY_CLOB(),EMPTY_BLOB());
```

## Leccion 02: Trabajando con BFILE

> Carpeta en OS debe ser declarada como directorio oracle dentro de TOAD

- Poner carpeta en disco C.

- Trabajaremos con libreria **DBMS_LOB**

- **Crear tabla** Definimos una tabla con un campo BFILE

```sql
CREATE TABLE MASCOTAS
(
CODIGO NUMBER,
NOMBRE VARCHAR(100),
FOTO BFILE);
```

- **Crear carpeta alias y asignarle un alias**

```sql
CREATE OR REPLACE DIRECTORY FICHEROS AS 'C:\IMAGENES';
```

- Ver lista de directorios.

```sql
SELECT * FROM DBA_DIRECTORIES;
```

### Insercion de datos con bloque anonimo
No se almacenan en la base de datos los bloques anonimos.

- Declaro una variable de tipo BFILE
- **A la variable FOTO le cargo el archivo gatito01 que esta en directorio ficheros**(Que es nuestra carpeta oracle)
- Inserto los valores.

```sql
DECLARE
  FOTO BFILE;
BEGIN
  FOTO:=BFILENAME('FICHEROS','Gatito01.jpg');
  insert into MASCOTAS VALUES (1,'UÑAS', FOTO);
END;
```

### Insertando con SQL normal(Sin bloque anonimo):

```sql
INSERT INTO MASCOTAS VALUES(4,'CLAUDIO', BFILENAME('FICHEROS','Gatito04.jpg'));
```

## Leccion 03

### Uso de funcion para obtener size de una imagen

> Esto nos ayuda para controlar el size permitido de los archivos a cargar

- Declaro parametros de entrada de la funcion, uno es el nombre del directorio, que se llama "ficheros"(directorio oracle) y el nombre (codigo) de la imagen
- Declaro despues de ```return`` el tipo de dato que voy a retornar
- Declaro variables despues de is
- Begin:
    - Creo un string en fichero
    - Cargo en variable foto con la funcion ```bfilename``` la foto dentro del directorio
    - Si existe, retornar el peso en bytes de ese archivo binario.


```sql
-- 1. PAQUETE DBMS_LOB

CREATE TABLE CLIENTES
(
CODIGO NUMBER,
NOMBRE VARCHAR2(100),
FOTO BFILE,
LONGITUD NUMBER);

INSERT INTO CLIENTES VALUES ( 1,'ROSA',NULL,NULL);
INSERT INTO CLIENTES VALUES ( 2,'PEDRO',NULL,NULL); 
INSERT INTO CLIENTES VALUES ( 3,'ANTONIO',NULL,NULL); 
INSERT INTO CLIENTES VALUES ( 4,'RAUL',NULL,NULL); 

SELECT * FROM CLIENTES;

-- 2. OBTENER TAMAÑO DE ARCHIVO
--     Envio de directorio y id de archivo
CREATE OR REPLACE FUNCTION TAM (DIRECTORIO VARCHAR2, CODIGO NUMBER)
RETURN NUMBER
IS
    FICHERO VARCHAR2(100);
    FOTO BFILE;
BEGIN
    FICHERO:='Cliente0'||CODIGO||'.jpg';
    
    FOTO:=BFILENAME(DIRECTORIO,FICHERO);
    
    IF DBMS_LOB.FILEEXISTS(FOTO)=1 THEN
        RETURN DBMS_LOB.GETLENGTH(FOTO);
    ELSE
        RETURN 0;
    END IF;
END;

-- PROBANDO LA FUNCION ( Retorna tamaño del archivo en bytes )
EXECUTE DBMS_OUTPUT.PUT_LINE(TAM('FICHEROS',2)); 

-- 3. STORE PROCEDURE :: CARGA IMAGEN EN CAMPO FOTO
CREATE OR REPLACE PROCEDURE SPU_CARGA_CLIENTES
IS
	CURSOR CLI IS SELECT * FROM CLIENTES FOR UPDATE;
	FICHERO VARCHAR2(100);
BEGIN
	FOR C1 IN CLI LOOP
		FICHERO:= 'CLIENTE0'||C1.CODIGO||'.JPG';

		UPDATE CLIENTES 
		SET FOTO=BFILENAME( 'FICHEROS',FICHERO),
            LONGITUD=TAM('FICHEROS',C1.CODIGO)
		WHERE CURRENT OF CLI;
		
	END LOOP;
END;
/
-- Ejecutando Store Procedure
EXECUTE SPU_CARGA_CLIENTES;

SELECT * FROM CLIENTES;
```

- Probar funcion

```sql
-- PROBANDO LA FUNCION ( Retorna tamaño del archivo en bytes )
EXECUTE DBMS_OUTPUT.PUT_LINE(TAM('FICHEROS',2)); 
```

### Procedimiento almacenado para cargar fotos
 > cursores llevan una query a memoria para hacer un trabajo, leemos fila a file y hacemos un trabajo

- En oracle declaro variables entre el IS y el BEGIN
- Creamos cursor y le ponemos ```FOR UPDATE``` porque el cursor va a
servir para actualizar
- BEGIN:
    - Iteramos por cada fila en el cursor
        - Leemos el codigo del registro para armar el fichero, o nombre de la imagen a cargar.
        - Cargamos en el campo foto.
        - en campo longitud mandamos a llamar la funcion.
        - ```WHERE CURRENT OF CLI```: Sentence que indica que se actualia el cliente (CLI) actual

- Lo ejecutamos con ```execute```

```sql
-- 3. STORE PROCEDURE :: CARGA IMAGEN EN CAMPO FOTO
CREATE OR REPLACE PROCEDURE SPU_CARGA_CLIENTES
IS
	CURSOR CLI IS SELECT * FROM CLIENTES FOR UPDATE;
	FICHERO VARCHAR2(100);
BEGIN
	FOR C1 IN CLI LOOP
		FICHERO:= 'CLIENTE0'||C1.CODIGO||'.JPG';

		UPDATE CLIENTES 
		SET FOTO=BFILENAME( 'FICHEROS',FICHERO),
            LONGITUD=TAM('FICHEROS',C1.CODIGO)
		WHERE CURRENT OF CLI;
		
	END LOOP;
END;
/
-- Ejecutando Store Procedure
EXECUTE SPU_CARGA_CLIENTES;
```

## Leccion 04: Campos BLOB

- Alterar tabla para agregar campo BLOB
- Ponerle como valor por defecto un ```empty_blob()```


 - PROCEDIMIENTO
    - cursor para actualizar
    - variabels tipo bfile y blob
    - Begin:
        - Leo registro por registro
            - Armo el nombre del archivo y lo pongo en la variable de archivo.
            - En comentarios pongo el archivo pdf
            - Abrir el archivo
            - Crear una variable temporal binaria
            - Cargo el contenido de bfile comentarios en temporal, especificando el size del archivo.
            - Actualizamos el cursor
            - **Cerrar el fichero**.


```sql
CREATE OR REPLACE PROCEDURE CARGA_COMENTARIOS
IS
    CURSOR CLI IS SELECT * FROM CLIENTES FOR UPDATE;
    FICHERO VARCHAR2(100);
    COMENTARIOS BFILE;
    TEMPORAL BLOB;
BEGIN
    FOR C1 IN CLI LOOP 
        --NOMBRE DEL FICHERO
        FICHERO:='DOCUMENTO'||C1.CODIGO||'.PDF';
        
        --ASOCIAR EL FICHERO AL BFILE
        COMENTARIOS:=BFILENAME('FICHEROS',FICHERO);
        
        --ABRIR EL FICHERO. ES OBLIGATORIO SI QUEREMOS USAR LOADFROMMFILE
        DBMS_LOB.OPEN(COMENTARIOS,DBMS_LOB.LOB_READONLY);
        
        --ES NECESARIO CREAR UN LOB TEMPORAL, PARA INICIALIZAR EL LOCALIZARO
        DBMS_LOB.CREATETEMPORARY(TEMPORAL,TRUE);
        
        -- CARGAMOS EL FICHERO A LA VARIABLE TEMPORAL 
        DBMS_LOB.LOADFROMFILE(TEMPORAL,COMENTARIOS,DBMS_LOB.GETLENGTH(COMENTARIOS));
        
        --MODIFICAMOS LA COLUMNA DE LA TABLA
        UPDATE CLIENTES SET CONTRATO=TEMPORAL WHERE CURRENT OF CLI;
        
        --CERRAMOS EL FICHERO
        DBMS_LOB.CLOSE(COMENTARIOS);
    END LOOP;
END;
/

EXECUTE CARGA_COMENTARIOS;
```


## Leccion 07:

- Creo tablespaces para los registros de las tablas
- Otra zona para los LOB.


### Asignacion de tablespaces para las tablas y otro para los LOB (Manera correcta)
- Creo tabla
- Dato tipo LOB se guardara en tablespace tbs_lob
- El retistro se almace en tbs_tabla

```sql
-- CREANDO TABLESPACES
CREATE TABLESPACE TBS_TABLA 
DATAFILE 'C:\TEMP\DF_TABLA.DBF' SIZE 10M;

CREATE TABLESPACE TBS_LOB 
DATAFILE 'C:\TEMP\DF_LOB.DBF' SIZE 10M;

-- CREANDO TABLA CON CAMPO LOB
CREATE TABLE PERSONAL (id NUMBER, DATOS VARCHAR(100),
CONTRATO BLOB)
LOB (CONTRATO) STORE AS (TABLESPACE TBS_LOB)
TABLESPACE TBS_TABLA;

```

```sql
-- PROCEDIMIENTO DE CARGA
CREATE OR REPLACE PROCEDURE CARGA_CONTRATOS
IS
    CURSOR CUR_PERSONAL IS SELECT * FROM PERSONAL FOR UPDATE;
    FICHERO VARCHAR2(100);
    COMENTARIOS BFILE;
    TEMPORAL BLOB;
BEGIN
    FOR C1 IN CUR_PERSONAL LOOP 
        --NOMBRE DEL FICHERO
        FICHERO:='DOCUMENTO'||C1.ID||'.PDF';
        
        --ASOCIAR EL FICHERO AL BFILE
        COMENTARIOS:=BFILENAME('FICHEROS',FICHERO);
        
        --ABRIR EL FICHERO. ES OBLIGATORIO SI QUEREMOS USAR LOADFROMMFILE
        DBMS_LOB.OPEN(COMENTARIOS,DBMS_LOB.LOB_READONLY);
        
        --ES NECESARIO CREAR UN LOB TEMPORAL, PARA INICIALIZAR EL LOCALIZARO
        DBMS_LOB.CREATETEMPORARY(TEMPORAL,TRUE);
        
        -- CARGAMOS EL FICHERO A LA VARIABLE TEMPORAL 
        DBMS_LOB.LOADFROMFILE(TEMPORAL,COMENTARIOS,DBMS_LOB.GETLENGTH(COMENTARIOS));
        
        --MODIFICAMOS LA COLUMNA DE LA TABLA
        UPDATE PERSONAL SET CONTRATO=TEMPORAL WHERE CURRENT OF CUR_PERSONAL;
        
        --CERRAMOS EL FICHERO
        DBMS_LOB.CLOSE(COMENTARIOS);
    END LOOP;
END;
```


# Generales

- Lo primero antes de crear mis tablas, debo:

> Crearr zona de almacenamiento

- Checar zonas de almacenamiento existentes

```sql
SELECT * from DBA_TABLESPACES;
```

- Especificando en que tablespace deseo crear mi tabla:

```sql
CREATE TABLE PERSONAJES
(
CODIGO NUMBER,
NOMBRE VARCHAR2(100),
BIOGRAFIA CLOB) TABLESPACE TBS_CLOB;
```

- Puedo insertar null en campos BFILE

- Fragmentacion de tablas vs ponerla en una sola zona

Si dejamos que sea dinamico el espacio asignado a las tablas, se fragementan demasiado y esto dificulta al hacer las consultas, ya que un select buscaria en cada pedazo de tablas hasta encontrar lo que desea,
 en lugar de buscar en un solo bloque. Lo ideal es que los datos esten contiguos


[fragmentadas](images-taller/fragmentadas.jpg)

## Ejemplo propio

- Creamos carpeta con contenidos:
[folder](images-taller/folder.jpg)

Creando BLOB para guardar pdfs de recetas

```sql
-- Crear tablespaces para clinica

CREATE TABLESPACE TBS_CLINICA
DATAFILE 'C:\TEMP\DF_CLINICA.DBF' SIZE 20M;

CREATE TABLESPACE TBS_CLINICA_LOB
DATAFILE 'C:\TEMP\DF_CLINICA_LOB.DBF' SIZE 30M;

-- Crear tabla para recetas utilizando los tablespaces correctamente

CREATE TABLE RECETAS(
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    DOCTOR VARCHAR(100),
    IMAGEN BLOB)
    LOB (IMAGEN) STORE AS (TABLESPACE TBS_CLINICA_LOB)
TABLESPACE TBS_CLINICA;

DESC RECETAS;

INSERT INTO RECETAS(DOCTOR, IMAGEN) VALUES('DR. DAVID GONZALEZ', EMPTY_BLOB());

SELECT * from RECETAS;

-- CREAR CARPETA ORACLE DE RECETAS

CREATE OR REPLACE DIRECTORY RECETASFOLDER AS 'C:\RECETAS';

-- STORED PROCEDURE PARA CARGAR
CREATE OR REPLACE PROCEDURE CARGA_RECETAS
IS
    CURSOR CUR_RECETAS IS SELECT * FROM RECETAS FOR UPDATE;
    FICHERO VARCHAR2(100);
    COMENTARIOS BFILE;
    TEMPORAL BLOB;
BEGIN
    FOR C1 IN CUR_RECETAS LOOP
        FICHERO:='DOCUMENTO'||C1.ID||'.PDF';
        COMENTARIOS:=BFILENAME('RECETASFOLDER',FICHERO);
        DBMS_LOB.OPEN(COMENTARIOS, DBMS_LOB.LOB_READONLY);
        DBMS_LOB.CREATETEMPORARY(TEMPORAL,TRUE);
        DBMS_LOB.LOADFROMFILE(TEMPORAL,COMENTARIOS,DBMS_LOB.GETLENGTH(COMENTARIOS));
        UPDATE RECETAS SET IMAGEN=TEMPORAL WHERE CURRENT OF CUR_RECETAS;
        DBMS_LOB.CLOSE(COMENTARIOS);
    END LOOP;
END;
/

EXECUTE CARGA_RECETAS;

SELECT * FROM RECETAS;
```
