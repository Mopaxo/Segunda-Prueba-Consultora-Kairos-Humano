/* 5. De los productos sin ventas en el presente año, monto total de ventas en el año anterior
(nombre_producto, marca, total_venta) */
SELECT 
    producto.nombre_producto,
    producto.marca,
    COALESCE(SUM(venta.anterior_unidades_vendidas * producto.precio_unitario), 0) AS total_venta
FROM 
    producto
LEFT JOIN 
    (SELECT * FROM venta WHERE EXTRACT(YEAR FROM fecha_venta) = EXTRACT(YEAR FROM CURRENT_DATE)) AS venta_actual
    ON producto.id_producto = venta_actual.id_producto
LEFT JOIN 
    (SELECT * FROM venta WHERE EXTRACT(YEAR FROM fecha_venta) = EXTRACT(YEAR FROM CURRENT_DATE) - 1) AS venta_anterior
    ON producto.id_producto = venta_anterior.id_producto
WHERE 
    venta_actual.id_venta IS NULL
GROUP BY 
    producto.nombre_producto, producto.marca;
