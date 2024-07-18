/* Calcular el precio promedio de todos los libros en la tabla Libros */
SELECT 
    AVG(Libros.precio) AS precio_promedio
FROM 
    Libros;
/* La función AVG calcula el precio promedio de todos los registros en la tabla Libros. */