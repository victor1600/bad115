### Ver informacion de SP utilizando la vista del diccionario de Datos

- Consultando el procedimiento add_dep
```sql
SELECT text
FROM user_source
WHERE name = 'ADD_DEPT' AND type= 'PROCEDURE'
ORDER BY line;
```


### Recomendaciones

- Manejar excepciones, utilizar aunque sea ```when others```
- Seguridad
