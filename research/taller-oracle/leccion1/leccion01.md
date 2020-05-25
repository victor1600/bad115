# Leccion 01

Balanceador de carga
- Multiples servidores
- Una unica BD en un solo servidor

### Tablespace y DataFile

Oracle crea una zona que se llama SYSTEM y una SYSAUX, entre otros.

Se recomienda crear una zona de almacenamiento logica(**Tablespaces**) para cada area de la empresa: RRHH, Comercial, inventario, etc.
Todo eso se guarda en archivos fisicos(**Datafile**) que se asocian a un tablespaces.

Por ejemplo:
- Table space inventarios -> c:\bases\Inventarios01.DBF (10 MB)




