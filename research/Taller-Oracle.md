## Taller Oracle

- BFILE: Solo guarda la ruta donde se encuentra fisicamente un archivo
- BLOB: Guarda un archivo video en la base de datos
- CLOB: Character long object, 4 GB.
- NLON

### Como se guardan los LOB(CLOB,BLOB,NLOB)?
- Se Incorpora un localizador dentro del Datafile de Oracle, que indica donde esta el archivo tipo LOB.

### Como trabaja el BFILE?
- No lo guarda en la BD, se guarda la ruta del archivo dentro de la base de datos, pero el sistema esta 
externo, afuera de la BD. La desventaja es que no hay seguridad


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













### Decargando la maquina virtual

Password: Server01