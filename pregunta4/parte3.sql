/* 3. Productos con más de 1000 unidades vendidas en los últimos 2 meses (nombre_producto, marca,
unidades_vendidas) */
SELECT 
    producto.nombre_producto,
    producto.marca,
    SUM(venta.unidades_vendidas) AS unidades_vendidas
FROM 
    venta
JOIN 
    producto ON venta.id_producto = producto.id_producto
WHERE 
    venta.fecha_venta >= (CURRENT_DATE - INTERVAL '2 months')
GROUP BY 
    producto.nombre_producto, producto.marca
HAVING 
    SUM(venta.unidades_vendidas) > 1000;
