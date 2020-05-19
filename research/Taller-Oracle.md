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


- Definir donde en la BD voy a almacenar mis tablas. La zona de almacenamiento. Creamos  ```TABLESPACE```.
    - Cerciorarse que existe la carpeta en donde creare mi .DBF


### Decargando la maquina virtual

Password: Server01