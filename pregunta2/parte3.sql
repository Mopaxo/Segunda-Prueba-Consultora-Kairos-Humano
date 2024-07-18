/* Actualizar el precio de todos los libros escritos por el autor con id_autor = 5 en un 10% de descuento */
UPDATE 
    Libros
SET 
    Libros.precio = Libros.precio * 0.9
WHERE 
    Libros.autor_id = 5;
/*  Se utiliza UPDATE para modificar el campo precio de los libros del autor con id_autor = 5.
Se aplica un descuento del 10% multiplicando el precio por 0.9.*/