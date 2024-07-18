import requests
import pandas as pd

# URLs de las dos primeras páginas
url1 = "https://gutendex.com/books?page=1"
url2 = "https://gutendex.com/books?page=2"

# Hacer las solicitudes a la API
response1 = requests.get(url1)
response2 = requests.get(url2)

# Verificar que las solicitudes fueron exitosas
if response1.status_code == 200 and response2.status_code == 200:
    data1 = response1.json()
    data2 = response2.json()
    
    # Contar el número total de libros en las dos páginas
    total_books = len(data1['results']) + len(data2['results'])
    print(f"Total de libros en las 2 paginas consultadas: {total_books}")

    # Combinar los resultados en un solo DataFrame
    books = data1['results'] + data2['results']
    df = pd.DataFrame(books)
    
    # Guardar los datos en un archivo CSV
    df.to_csv('listado_libros.csv', index=False)
    print("Informacion guardada en listado_libros.csv")
else:
    print("Error en obtener informacion desde la API")
