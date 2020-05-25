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




