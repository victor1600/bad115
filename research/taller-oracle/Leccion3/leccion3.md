# Enmascaramiento


### Redo Log - Fast Recovery Area 
> Por defecto tienen un size de 50Mb

Redo Log: Gurdan las sentencias que hicieron los datos que generaron cambios, es un almacenamiento
temporal. La informacion que esta aqui se pasa a una carpeta llamadda Fast Recovery Area, cumple la 
funcion con un almacen con todos los archivos provenientes Rredo Logs.

> Toda sentencia commiteada se guarda en Redo Log. Las otras no.

- Hay que multiplexarlos (Cada grupo tiene que tener 3 discos como minimo)
- Estos se guardan por defecto en el mismo lugar (APP) con la instalacion de software, hay que cambiarlos.


## Consultar los logfile

```sql
SELECT * FROM V$LOGFILE;
SELECT * FROM V$LOG;

```


## Configuracion de servidor en modo archivado
Es lo que hace posible que se pase, que fluya de los RedoLogs hacia el Fast Recovery Area. Esto debe de configurarse

- Las operaciones vienen y se guardan temporalmente en los redoLogs, todo el contenido lo guarda en un archivo ark y los
mueve hacia la zona FRAN
- Esto garantiza recuperabilidad.

#### Como saber si esta en modo archivado

```sql
SELECT LOG_MODE FROM V$DATABASE; -- PUEDE RESPONDER CON: ARCHIVELOG o NOARCHIVELOG
```

#### Cambiar a modo archivado
Abrimos Powershell:

- Entrar como dba en el power shell
- Se para la base de datos
- Arrancarla en modo mount: Arrarncar sin abrir la base de datos.
- El comando clave alter database archivelog es quien configura el modo archivado, temrina con ;
- Abrimos base de datos


```sql
SQLPLUS / AS SYSDBA
SHUTDOWN IMMEDIATE
STARTUP MOUNT
ALTER DATABASE ARCHIVELOG;

SELECT LOG_MODE FROM V$DATABASE;
```
Reconectarse en TOAD: session -> reconnect

## Configuracion de zona FRA

- Consultas parametros generales de BD:
```sql
SELECT * FROM V$PARAMETER;
```
- Ahi se mira en VALUE donde esta instalado
```sql
SELECT * FROM V$PARAMETER WHERE NAME = 'db_recovery_file_dest';
```

### Cambiar de ubicacion la zona FRA

- Debemos crear carpeta Fra en C:\, idealmente esta carpeta se hara en otro disco.
- Scope indica grabar nuevo campo tanto en memotia como en disco

```sql
-- Ubicación nueva ( C:\FRA )
ALTER SYSTEM SET DB_RECOVERY_FILE_DEST = 'C:\FRA'  SCOPE = BOTH;
```




### Espacio de almacenamiento de la zona FRA

> La meta es configurar que solo se guarden los ultimos 3 backups, y que los mas viejos se vayan borrando automaticamente.

#### Cuanto es el espacio?

```sql
SELECT * FROM V$PARAMETER WHERE NAME = 'db_recovery_file_dest_size';
```

#### Cambiar size

```sql
----------------------------------------------------
-- 5. Asigne como espacio a la zona FRA en 10Gb
----------------------------------------------------
ALTER SYSTEM SET DB_RECOVERY_FILE_DEST_SIZE = 10G  SCOPE = BOTH;
```

#### Monitorear que tan lleno esta:

- Cuando la sumatoria de la primera columna se acerque al 100%, entonces debemos preocuparnos
```sql
SELECT * FROM V$FLASH_RECOVERY_AREA_USAGE
```


### Verificar si se guardan los archivos en la zona FRA:
Probando cambiar entre redlogs aunque no esten llenos

```sql
ALTER SYSTEM CHECKPOINT;
```

Cada vez que ejecutemos este comando, se generaran los archivados:
```sql
ALTER SYSTEM SWITCH LOGFILE;
```

##### Verificacion usando un bloque anonimo

- Creamos tabla de NOTAS
- Ingresamos nota
- Deberemos de ver dentro de FRA/ARchiveLog/.. que se estan generando archivos ARC
```sql
--------------------------------------------
-- 2. TEST DE ESCRITURA EN DISCO I/O
--------------------------------------------
CREATE TABLE NOTAS ( id integer , n1 integer , n2 integer );

BEGIN
      FOR i IN 1..200000 LOOP
        INSERT INTO NOTAS VALUES ( I,I,I );
        COMMIT;
      END LOOP;
      DBMS_OUTPUT.PUT_LINE ('FINALIZADO');    
END;
```

> Si quisieramos configurar que no se llene esa zona, debemos trabajar con politicas de retencion?

# Generando Backups

> Servidor debe estar en modo archivado

### Entrando a RMAN
- Abrir powershell
- RMAN TARGET /

### Backup FULL
```RMAN> BACKUP DATABASE;```

### Generando backup especificos

#### Backup de tablespace
```
RMAN> BACKUP TABLESPACE USERS;
```

#### Backup de datafile
```
RMAN> BACKUP DATAFILE 'C:\DATA\DF_COMNTA.DBF'
```
- Por numero
    - consultar datafiles usando la sentencia aprendida en la leccion 01.

```
RMAN> BACKUP DATAFILE 6;
```
















































### Otros Conceptos
- "Rollback se da cuando la sentencia no esta confirmada, cuando aun no ha llegado a los red logs"
- Commit hace que las operacions se confirmen.