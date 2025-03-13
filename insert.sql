INSERT INTO libros VALUES ("211816DBA","CRONICAS DE UNA MUERTE ANUNCIADA","DISPONIBLE"),("784894HBS","EL PRINCIPITO","NO DISPONIBLE");

INSERT INTO genero(tipo_genero) VALUES ("ACCION"),("SUSPENSO"),("COMEDIA");

INSERT INTO libro_autor(ISBN,fecha_lanzamiento) VALUES ("211816DBA",NOW()),("784894HBS",NOW());

INSERT INTO genero_libro(ISBN,id_genero) VALUES ("211816DBA", 1),("784894HBS", 2);

INSERT INTO autores(nombre, id_libroAutor) VALUES ("GABRIEL GARCIA MARQUEZ", 1),("JOSE FLOREZ", 2);

INSERT INTO miembros(nombre,apellidos,documento,direccion) VALUES ("PEPITO","PEREZ","1097094358","CRA 65A #125-32"),("JORGE","SAENZ","1094095321","CALLE 27 #15-10");

INSERT INTO miembro_libro(id_miembros,ISBN,fecha_lanzamiento) VALUES (1, "211816DBA","1999-12-02"),(2, "784894HBS","2006-11-20");

INSERT INTO transaccion(fecha_prestamo,fecha_devolucion) VALUES ("2024-03-15","2024-03-25"),("2000-01-16","2000-01-26");

INSERT INTO libro_transaccion (id_transaccion, id_miembros, ISBN) VALUES (1, 1, "211816DBA"),(2, 2, "784894HBS");

INSERT INTO editor(nombre_editor) VALUES ("EL MASCAPITO"),("HARRY POTTER");

INSERT INTO publicaciones(fecha_publicacion, id_editor) VALUES ("1999-02-12", 1),("2003-10-26", 2);

INSERT INTO edicion (id_editor) VALUES (1),(2);