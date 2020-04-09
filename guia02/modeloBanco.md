### *En estas consultas se ha utilizado las tablas prestamo, prestatario y sucursal*

1. **Determine una expresión de algebra relacional que permita mostrar los Nombres de todos los clientes que tienen un préstamo en la sucursal de Navacerrada.**
```sql
SELECT nombre_cliente FROM prestamo NATURAL JOIN prestatario WHERE nombre_sucursal = 'Navacerrada'

Π{nombre_cliente}(σ{nombre_sucursal='Navacerrada'}(prestamo ⋈ prestatario ))
```
2. **Si además incorporamos la relación Sucursal, cuál sería la expresión que nos permitiría incorporar el atributo de la ciudad donde se ubica NavarraCerrada.**
```sql
SELECT nombre_cliente,ciudad_sucursal FROM prestamo NATURAL JOIN prestatario NATURAL JOIN sucursal WHERE nombre_sucursal = 'Navacerrada'

Π{nombre_cliente,ciudad_sucursal}(σ{nombre_sucursal='Navacerrada'}(prestamo ⋈ prestatario ⋈ sucursal ))
```