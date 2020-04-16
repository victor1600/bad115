### *En estas consultas se ha utilizado las tablas prestamo, prestatario y sucursal*

1. **Obtener, en el departamento 5, los empleados con salarios mayores a $30000.**
```sql
SELECT fname,lname FROM (SELECT * FROM employee, department WHERE dno = dnumber)alias1  WHERE dnumber = 5 AND salary > 30000

Π{ fname,lname}(σ{dnumber=5 ∧ salary>30000 }(σ{ dno= dnumber}( employee × department)))
```

2. **Obtener los nombre de los departamentos que no tienen empleados**

*Esta consulta aun esta mala*
```sql
select D.dname departamento
from department D,
                (select * from department D
                natural full outer join employee E )N
where D.dnumber = N.dno
group by D.dname
having count(N.ssn) = null;
```

3. **Obtener el nombre y apellido de cada empleado y el nombre de su jefe.**

*Para esta consulta se uso un self join*
```sql
select emp.fname "nombre empleado", emp.lname "apellido empleado", jef.fname "nombre jefe"
from employee emp join employee jef
on (emp.superssn = jef.ssn);
```

4. **Obtener el nombre de los empleados que ganen más que su jefe.**
```sql
select emp.fname "nombre empleado", jef.fname "nombre jefe", emp.salary "salario de empleado"
from employee emp join employee jef
on (emp.superssn = jef.ssn)
where emp.salary>jef.salary;
```

5. **Obtener el nombre de los departamentos que tienen exactamente 2 mujeres en su personal.**

```sql
select dname as nombre_departamento, count(sex) as sexo_femenino 
from (select * from employee, department where dno = dnumber)  
where sex = 'F'
group by dname
having count(sex)=2;
```

6. **Obtener para cada empleado su nombre y apellido, el nombre del departamento donde trabaja y el nombre de su jefe.**

***Aqui falta que se muestre el nombre del jefe***
```sql
SELECT fname,lname,dname FROM department, employee WHERE dno = dnumber;
```

9. **Adicionar la información del nuevo Departamento de Ventas(Sales) que tendrá el código(Dpto) de 6 y será administrado por Alicia Zelaya (MGRSSN=999887777).**

```sql

```
