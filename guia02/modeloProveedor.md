### *En estas consultas se ha utilizado las tablas proveedor, envio y pieza*

1. **Listar los nombres y ciudades donde viven los proveedores que han enviado piezas color azul**
```sql
SELECT snombre,ciudadproveedor FROM proveedor NATURAL JOIN pieza NATURAL JOIN envio WHERE color = 'azul'
```
2. **Cuanto es el peso promedio de las piezas**
```sql
SELECT AVG(peso) FROM pieza;
```
3. **Listar los nombres de proveedores, nombres y cantidades de piezas enviadas de proveedores que viven en Londres.**
```sql
SELECT snombre,pnombre,cant FROM proveedor NATURAL JOIN envio NATURAL JOIN pieza WHERE ciudadproveedor = 'Londres'
```

4. **Listar los promedios de piezas enviadas por proveedor, mostrando nombre de proveedor y la ciudad donde vive.**

```sql
select snombre, ciudadproveedor, avg(cant) as promedio 
from envio natural join proveedor natural join pieza
group by snombre, ciudadproveedor;
```