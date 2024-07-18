/* Seleccionar el título y el nombre del autor de todos los libros de la categoría "Ficción" */
SELECT 
    Libros.titulo, 
    Autores.nombre AS autor_nombre
FROM 
    Libros
JOIN 
    Autores ON Libros.autor_id = Autores.id_autor
JOIN 
    Categorias ON Libros.categoria_id = Categorias.id_categoria
WHERE 
    Categorias.nombre = 'Ficción';
/* Se utilizan JOIN para combinar las tablas Libros, Autores y Categorias basadas en las claves foráneas.
La condición en el WHERE filtra los resultados para la categoría "Ficción". */