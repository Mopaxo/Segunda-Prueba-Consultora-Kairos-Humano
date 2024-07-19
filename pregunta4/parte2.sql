/* 2. Ventas totales por sucursal, vendedor y marca, incluyendo los vendedores que no tuvieron ventas
(nombre_sucursal, nombre_vendedor, marca, total_venta) */
SELECT 
    sucursal.nombre_sucursal,
    vendedor.nombre_vendedor,
    producto.marca,
    COALESCE(SUM(venta.unidades_vendidas * producto.precio_unitario), 0) AS total_venta
FROM 
    sucursal
CROSS JOIN 
    vendedor
CROSS JOIN 
    producto
LEFT JOIN 
    venta ON venta.id_sucursal = sucursal.id_sucursal 
             AND venta.id_vendedor = vendedor.id_vendedor 
             AND venta.id_producto = producto.id_producto
GROUP BY 
    sucursal.nombre_sucursal, vendedor.nombre_vendedor, producto.marca;
