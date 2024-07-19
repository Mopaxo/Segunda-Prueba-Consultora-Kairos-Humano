CREATE TABLE IF NOT EXISTS Usuarios (
    id SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Publicaciones (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER,
    titulo VARCHAR(255),
    cuerpo TEXT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
 