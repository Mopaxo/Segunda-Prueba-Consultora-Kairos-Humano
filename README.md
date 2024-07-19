# Segunda-Prueba-Consultora-Kairos-Humano
Este repositorio contiene el desarrollo de la tarea asignada para el puesto de desarrollador full-stack.

# Desarrollo de requerimientos planteados en PDF

Este proyecto es la solución puntual para cada pregunta planteada en las instrucciones del PDF del repositorio.

## Estructura del Proyecto
```
Segunda-Prueba-Consultora-Kairos-Humano/
├── pregunta2/
│   ├── parte1.sql
│   ├── parte2.sql
│   └── parte3.sql
├── pregunta3/
│   ├── init-db/
│   │   └── create_tables.sql
│   ├── docker-compose.yml
│   ├── pregunta3.py
│   └── pregunta3.txt
├── pregunta4/
│   ├── parte1.sql
│   ├── parte2.sql
│   ├── parte3.sql
│   ├── parte4.sql
│   └── parte5.sql
├── listado_libros.csv
├── pregunta1.py
├── Prueba Desarrollador FullStack.pdf
└── README.md
```
### Descripción de Directorios y Archivos

- `/pregunta2`: Contiene los archivos que responden la pregunta 2 del PDF.
  - `parte1.sql`: Seleccione el título y el nombre del autor de todos los libros de la categoría "Ficción".
  - `parte2.sql`: Calcule el precio promedio de todos los libros en la tabla Libros.
  - `parte3.sql`: Actualice el precio de todos los libros escritos por el autor con id_autor = 5 en un 10% de descuento.
- `/pregunta3`: Contiene los archivos que responden la pregunta 4 del PDF.
  - `/init-db/create_tables.sql`: Query SQL utilizada en pregunta3.py para crear las tablas si esque no estaban creadas.
  - `docker-compose.yml`: Archivo docker-compose.yml para implementar el contenedor de Postgresql.
  - `pregunta3.py`: Desarrollo de la pregunta 3 del PDF de forma completa.
  - `pregunta3.txt`: Instrucciones de mi eleccion AWS para en esquema NearRealTime.
- `/pregunta4`: Contiene los archivos que responden la pregunta 4 del PDF.
  - `parte1.sql`: Listado de ventas del mes actual (nombre_sucursal, nombre_vendedor, marca, nombre_producto,fecha_venta, unidades_vendidas, precio_unitario, valor_venta).
  - `parte2.sql`: Ventas totales por sucursal, vendedor y marca, incluyendo los vendedores que no tuvieron ventas (nombre_sucursal, nombre_vendedor, marca, total_venta)
  - `parte3.sql`: Productos con más de 1000 unidades vendidas en los últimos 2 meses (nombre_producto, marca, unidades_vendidas)
  - `parte4.sql`: Productos sin ventas en el presente año (nombre_producto, marca)
  - `parte5.sql`: De los productos sin ventas en el presente año, monto total de ventas en el año anterior (nombre_producto, marca, total_venta)
- `listado_libros.csv`: Archivo contiene los libros solicitados en la pregunta 1 del PDF
- `pregunta1.py`: Archivo que responde la pregunta 1 del PDF
- `Prueba Desarrollador FullStack.pdf`: Archivo PDF con las instrucciones de la prueba técnica.
- `README.md`: Este archivo, con instrucciones y documentación del proyecto.

## Requisitos del Sistema

- Python 3.10
- Entorno virtual de python a gusto para instalar las dependencias necesarias como panda, psycopg2, etc.
- Postgresql 17
- Sistema operativo Linux o MacOs
