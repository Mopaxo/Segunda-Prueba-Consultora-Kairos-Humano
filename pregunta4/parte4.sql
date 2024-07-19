/* 4. Productos sin ventas en el presente año (nombre_producto, marca) */
SELECT 
    producto.nombre_producto,
    producto.marca
FROM 
    producto
LEFT JOIN 
    venta ON producto.id_producto = venta.id_producto 
             AND EXTRACT(YEAR FROM venta.fecha_venta) = EXTRACT(YEAR FROM CURRENT_DATE)
WHERE 
    venta.id_venta IS NULL;
