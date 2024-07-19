/* Listado de ventas del mes actual (nombre_sucursal, nombre_vendedor, marca, nombre_producto,
fecha_venta, unidades_vendidas, precio_unitario, valor_venta) */
SELECT 
    sucursal.nombre_sucursal,
    vendedor.nombre_vendedor,
    producto.marca,
    producto.nombre_producto,
    venta.fecha_venta,
    venta.unidades_vendidas,
    producto.precio_unitario,
    (venta.unidades_vendidas * producto.precio_unitario) AS valor_venta
FROM 
    venta
JOIN 
    sucursal ON venta.id_sucursal = sucursal.id_sucursal
JOIN 
    vendedor ON venta.id_vendedor = vendedor.id_vendedor
JOIN 
    producto ON venta.id_producto = producto.id_producto
WHERE 
    EXTRACT(MONTH FROM venta.fecha_venta) = EXTRACT(MONTH FROM CURRENT_DATE)
    AND EXTRACT(YEAR FROM venta.fecha_venta) = EXTRACT(YEAR FROM CURRENT_DATE);
