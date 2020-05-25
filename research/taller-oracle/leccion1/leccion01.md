# Leccion 01

[Link google Drive](https://drive.google.com/open?id=1oEgYTrt1ndf5xMb57mRlj5_ppl4YY4JX)

Balanceador de carga
- Multiples servidores
- Una unica BD en un solo servidor

### Tablespace y DataFile

Oracle crea una zona que se llama SYSTEM y una SYSAUX, entre otros.

Se recomienda crear una zona de almacenamiento logica(**Tablespaces**) para cada area de la empresa: RRHH, Comercial, inventario, etc.
Todo eso se guarda en archivos fisicos(**Datafile**) que se asocian a un tablespaces.

Por ejemplo:
- Table space inventarios -> C:\bases\Inventarios01.DBF (10 MB)


Ejemplo: Creando tablespace y asociando a datafile

```sql
CREATE TABLESPACE TBS_VENTAS
DATAFILE 'C:\BDORACLE\DF_VENTAS_01.DBF'
SIZE 3M;
```

Ejemplo 2: Dos datafile para un tablespace

```sql
CREATE TABLESPACE TBS_SEGURIDAD 
DATAFILE 
'C:\BDORACLE\DF_SEG_01.DBF' SIZE 10M ,
'C:\BDORACLE\DF_SEG_02.DBF' SIZE 10M ;
```

> Si se llena el datafile, puedo crear uno nuevo, o cambiarle el size.

> Convencion, numerar los datafiles

- Ver lista de tablespaces

```sql
-- 2. CONSULTA ADMINISTRATIVA DE TBS
-------------------------------------
SELECT * FROM DBA_TABLESPACES;
```


> No es correcto guardar nuestra BD en SYSTEM.

- Ver list de datafiles

```sql
-------------------------------------------
-- 3. CONSULTA ADMINISTRATIVA DE DATAFILES
-------------------------------------------
SELECT FILE#, NAME FROM V$DATAFILE;    
```