# Video 1
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
