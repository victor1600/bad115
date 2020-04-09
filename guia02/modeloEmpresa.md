### *En estas consultas se ha utilizado las tablas prestamo, prestatario y sucursal*

1. **Obtener, en el departamento 5, los empleados con salarios mayores a $30000.**
```sql
SELECT fname,lname FROM (SELECT * FROM employee, department WHERE dno = dnumber)alias1  WHERE dnumber = 5 AND salary > 30000

Π{ fname,lname}(σ{dnumber=5 ∧ salary>30000 }(σ{ dno= dnumber}( employee × department)))
```

3. **Obtener el nombre y apellido de cada empleado y el nombre de su jefe.**
```sql
SELECT fname,lname,posname FROM employee, position WHERE posnumber = posnum

Π{fname,lname,posname }(σ{posnumber=posnum}(employee × position))
```

4. **Obtener el nombre de los empleados que ganen más que su jefe.**

5. **Obtener el nombre de los departamentos que tienen exactamente 2 mujeres en su personal.**

***aqui falta que muestre exactamente el que tiene solo 2 mujeres***
```sql
SELECT dname as nombre_departamento, count(sex) as sexo_femenino 
FROM (SELECT * FROM employee, department WHERE dno = dnumber)alias1  
WHERE sex = 'F'
group by dname;
```

6. **Obtener para cada empleado su nombre y apellido, el nombre del departamento donde trabaja y el nombre de su jefe.**

***Aqui falta que se muestre el nombre del jefe***
```sql
SELECT fname,lname,dname FROM department, employee WHERE dno = dnumber;
```