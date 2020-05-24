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

### Ejercicio: Trabajando con BFILE

- Declarando directorios en oracle
Directorio Oracle 
LOB_PATH = '/oracle/lob'


- **Paso 0**: Definir donde en la BD voy a almacenar mis tablas. La zona de almacenamiento. Creamos  ```TABLESPACE```.
    - Cerciorarse que existe la carpeta en donde creare mi .DBF

- **Paso 1**: creamos tabla dentro del tablespace deseado.

- **Paso 5**: no podemos insertar  un texto en un campo BLOB, es incorrecto, da un erro.

- **Paso 6**:
Todo registro que tiene un campo tipo LOB, tiene que tener un **localizador**
y una zona de almacenamiento donde estara verdaderamente el dato tipo LOB

> Toda tabla con campo tipo LOB, cada registro insertado debe tener un localizador: Se localiza el archivo binario(Video, sonido) asociado al registro





