CREATE DATABASE bibliotecaCampus;
USE bibliotecaCampus;

CREATE TABLE IF NOT EXISTS libros (
    ISBN VARCHAR(50) UNIQUE,
    titulo VARCHAR(150),
    disponibilidad VARCHAR(50),
    PRIMARY KEY (ISBN)
);


CREATE TABLE IF NOT EXISTS genero (
    id_genero INT AUTO_INCREMENT,
    tipo_genero VARCHAR (50),
    PRIMARY KEY (id_genero)
);


CREATE TABLE IF NOT EXISTS genero_libro(
    id_generoLibro INT AUTO_INCREMENT,
    ISBN VARCHAR(50),
    id_genero INT,
    PRIMARY KEY (id_generoLibro),
    CONSTRAINT fk_libro_fk FOREIGN KEY (ISBN) REFERENCES libros,
    CONSTRAINT fk_genero_fk FOREIGN KEY (id_genero) REFERENCES genero
);

CREATE TABLE IF NOT EXISTS autores (
    id_autores INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    id_libroAutor INT,
    PRIMARY KEY (id_autores),
    CONSTRAINT fk_libroAutor_fk FOREIGN KEY (id_libroAutor) REFERENCES libro_autor(id_libroAutor)
);


CREATE TABLE IF NOT EXISTS libro_autor (
    id_libroAutor INT AUTO_INCREMENT,
    ISBN VARCHAR(50),
    fecha_lanzamiento DATE,
    PRIMARY KEY (id_libroAutor),
    CONSTRAINT fk_libro_fk FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
);




CREATE TABLE IF NOT EXISTS miembros (
    id_miembros INT AUTO_INCREMENT,
    nombre VARCHAR (100) NOT NULL,
    apellidos VARCHAR (100),
    documento DATE UNIQUE,
    direccion DATE UNIQUE,
    PRIMARY KEY (id_miembros)
);

CREATE TABLE IF NOT EXISTS miembro_libro (
    id_miembroLibro INT AUTO_INCREMENT,
    id_miembros INT,
    id_libros INT,
    fecha_lanzamiento DATE,
    PRIMARY KEY (id_miembroLibro),
    CONSTRAINT fk_miembro_fk FOREIGN KEY (id_miembros) REFERENCES miembros,
    CONSTRAINT fk_libro_fk FOREIGN KEY (id_libros) REFERENCES libros
);

CREATE TABLE IF NOT EXISTS transaccion (
    id_transaccion INT AUTO_INCREMENT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    PRIMARY KEY (id_transaccion)
);

CREATE TABLE IF NOT EXISTS libro_transaccion (
    id_libroTransaccion INT AUTO_INCREMENT,
    id_transaccion INT,
    id_miembros INT,
    id_libros VARCHAR(50),
    PRIMARY KEY (id_libroTransaccion),
    CONSTRAINT fk_transaccion_fk FOREIGN KEY (id_transaccion) REFERENCES transaccion(id_transaccion),
    CONSTRAINT fk_miembro_fk FOREIGN KEY (id_miembros) REFERENCES miembros(id_miembros),
    CONSTRAINT fk_libro_fk FOREIGN KEY (id_libros) REFERENCES libros(ISBN)
);


CREATE TABLE IF NOT EXISTS editor (
    id_editor INT AUTO_INCREMENT,
    nombre_editor VARCHAR(100) UNIQUE,
    PRIMARY KEY (id_editor)
);

CREATE TABLE IF NOT EXISTS publicaciones (
    id_publicaciones INT AUTO_INCREMENT,
    fecha_publicacion DATE NOT NULL,
    id_editor INT,
    PRIMARY KEY (id_publicaciones),
    CONSTRAINT fk_editor_fk FOREIGN KEY (id_editor) REFERENCES libros
);

CREATE TABLE IF NOT EXISTS edicion (
    id_edicion INT AUTO_INCREMENT,
    id_editor INT,
    PRIMARY KEY (id_edicion),
    CONSTRAINT KEY fk_editor_fk FOREIGN KEY (id_editor) REFERENCES editor
);