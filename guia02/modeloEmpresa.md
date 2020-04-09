### *En estas consultas se ha utilizado las tablas prestamo, prestatario y sucursal*

1. **Obtener, en el departamento 5, los empleados con salarios mayores a $30000.**
```sql
SELECT fname,lname FROM (SELECT * FROM employee, department WHERE dno = dnumber)alias1  WHERE dnumber = 5 AND salary > 30000

Π{ fname,lname}(σ{dnumber=5 ∧ salary>30000 }(σ{ dno= dnumber}( employee × department)))
```