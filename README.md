![ERDDiagram1](https://github.com/user-attachments/assets/9f8344df-66c4-483f-94c7-d05db6fc0ba4)


CONSULTA

Nota: crea un archivo README.md que incluya únicamente estas consultas, siguiendo
el formato correspondiente.
Listar todos los libros disponibles
```sql
SELECT ISBN,titulo,disponibilidad
FROM libros 
WHERE disponibilidad = "DISPONIBLE";
```
Buscar libros por género
```sql
SELECT libros.*
FROM libros
JOIN genero_libro ON libros.ISBN = genero_libro.ISBN
JOIN genero ON genero_libro.id_genero = genero.id_genero
WHERE genero.tipo_genero = "ACCION";
```
Obtener información de un libro por ISBN
```sql
SELECT ISBN 
FROM libros
WHERE ISBN = "ISBN";
```
Contar el número de libros en la biblioteca
```sql
SELECT COUNT(*)
AS total_libros 
FROM libros;
```
Listar todos los autores
```sql
SELECT *
FROM autores;
```
Buscar autores por nombre
```sql
SELECT *
FROM autores
WHERE nombre
LIKE "%JOSE FLOREZ%";
```
Obtener todos los libros de un autor específico
```sql
SELECT libros.*
FROM libros
JOIN libro_autor ON libros.ISBN = libro_autor.ISBN
JOIN autores ON libro_autor.id_libroAutor = autores.id_libroAutor
WHERE autores.nombre = "GABRIEL GARCIA MARQUEZ";
```
Listar todas las ediciones de un libro
```sql
SELECT *
FROM edicion
WHERE id_editor IN (
    SELECT id_editor
    FROM publicaciones
    WHERE id_publicaciones IN (
        SELECT id_publicaciones
        FROM libros
        WHERE ISBN = "211816DBA"
    )
);
```
Obtener la última edición de un libro
```sql
SELECT *
FROM edicion
WHERE id_editor = (
    SELECT id_editor FROM publicaciones
    WHERE id_publicaciones IN (
        SELECT id_publicaciones 
        FROM libros
        WHERE ISBN = "784894HBS"
    )
)
ORDER BY id_edicion DESC LIMIT 1;
```
Contar cuántas ediciones hay de un libro específico
```sql
SELECT COUNT(*)
AS total_ediciones
FROM edicion
WHERE id_editor IN (
    SELECT id_editor
    FROM publicaciones
    WHERE id_publicaciones IN(
        SELECT id_publicaciones
        FROM libros
        WHERE ISBN = "784894HBS"
    )
);
```
Listar todas las transacciones de préstamo
```sql
SELECT *
FROM transaccion;
```
Obtener los libros prestados actualmente
```sql
SELECT libros.*
FROM libros
JOIN libro_transaccion ON libros.ISBN = libro_transaccion.ISBN
JOIN transaccion ON libro_transaccion.id_transaccion  = transaccion.id_transaccion
WHERE transaccion.fecha_devolucion IS NULL;
```
Contar el número de transacciones de un miembro específico
```sql
SELECT COUNT(*)
AS total_transacciones
FROM transaccion
JOIN libro_transaccion ON transaccion.id_transaccion = libro_transaccion.id_transaccion
WHERE libro_transaccion.id_miembros = "1";
```
Listar todos los miembros de la biblioteca
```sql
SELECT *
FROM miembros;
```
Buscar un miembro por nombre:
```sql
SELECT *
FROM miembros
WHERE nombre LIKE "%JORGE%";
```
Obtener las transacciones de un miembro específico
```sql
SELECT *
FROM transaccion
JOIN libro_transaccion ON transaccion.id_transaccion = libro_transaccion.id_transaccion
WHERE libro_transaccion.id_miembros = "2";
```
Listar todos los libros y sus autores
```sql
SELECT libros.titulo, autores.nombre
FROM libros
JOIN libro_autor ON libros.ISBN = libro_autor.ISBN
JOIN autores ON libro_autor.id_libroAutor = autores.id_libroAutor;
```
Obtener el historial de préstamos de un libro específico
```sql
SELECT miembros.nombre, transaccion.fecha_prestamo, transaccion.fecha_devolucion
FROM miembros
JOIN libro_transaccion ON miembros.id_miembros = libro_transaccion.id_miembros
JOIN transaccion ON libro_transaccion.id_transaccion = transaccion.id_transaccion
WHERE libro_transaccion.ISBN = "784894HBS";
```
Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(*)
AS total_prestamos 
FROM libro_transaccion;
```
Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT libros.titulo, edicion.id_edicion, libros.disponibilidad
FROM libros
LEFT JOIN edicion ON edicion.id_editor = (
    SELECT id_editor
    FROM publicaciones
    WHERE id_publicaciones IN (
        SELECT id_publicaciones
        FROM libros
        WHERE libros.ISBN = edicion.id_editor
    )
)
ORDER BY edicion.id_edicion DESC;
