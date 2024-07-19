import requests
import psycopg2
import os
import logging

# Configurar el logging
logging.basicConfig(level=logging.INFO)

# Endpoints de JSONPlaceholder
USERS_URL = "https://jsonplaceholder.typicode.com/users"
POSTS_URL = "https://jsonplaceholder.typicode.com/posts"

def fetch_data(url):
    response = requests.get(url)
    response.raise_for_status()
    return response.json()

def lambda_handler(event, context):
    # Obtener datos de usuarios y publicaciones
    users = fetch_data(USERS_URL)
    posts = fetch_data(POSTS_URL)
    
    logging.info("Datos de usuarios y publicaciones obtenidos exitosamente.")
    
    try:
        conn = psycopg2.connect(
            dbname=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD'],
            host=os.environ['DB_HOST']
        )
        cursor = conn.cursor()

        # Crear tablas si no existen
        cursor.execute('''
        CREATE TABLE IF NOT EXISTS Usuarios (
            id SERIAL PRIMARY KEY,
            nombre_usuario VARCHAR(255),
            email VARCHAR(255)
        );
        ''')
        
        cursor.execute('''
        CREATE TABLE IF NOT EXISTS Publicaciones (
            id SERIAL PRIMARY KEY,
            usuario_id INTEGER,
            titulo VARCHAR(255),
            cuerpo TEXT,
            FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
        );
        ''')

        # Insertar datos en las tablas
        for user in users:
            cursor.execute('''
            INSERT INTO Usuarios (nombre_usuario, email) VALUES (%s, %s)
            ON CONFLICT (id) DO NOTHING;
            ''', (user['username'], user['email']))
        
        for post in posts:
            cursor.execute('''
            INSERT INTO Publicaciones (usuario_id, titulo, cuerpo) VALUES (%s, %s, %s)
            ON CONFLICT (id) DO NOTHING;
            ''', (post['userId'], post['title'], post['body']))

        conn.commit()
        logging.info("Datos guardados exitosamente en la base de datos.")
    
    except Exception as e:
        logging.error("Error al interactuar con la base de datos: %s", e)
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    lambda_handler(None, None)
