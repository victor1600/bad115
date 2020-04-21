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