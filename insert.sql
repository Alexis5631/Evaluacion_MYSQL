INSERT INTO libros VALUES ("211816DBA","CRONICAS DE UNA MUERTE ANUNCIADA","DISPONIBLE"),("784894HBS","EL PRINCIPITO","NO DISPONIBLE");

INSERT INTO genero(tipo_genero) VALUES ("ACCION"),("SUSPENSO"),("COMEDIA");

INSERT INTO genero_libro(ISBN,id_genero) VALUES ("211816DBA","202020"),("784894HBS","212121");

INSERT INTO autores VALUES ("1234","GABRIEL GARCIA MARQUEZ"),("54584","JOSE FLOREZ");

INSERT INTO libro_autor(fecha_lanzamiento) VALUES ("25/05/2002"),("10/04/2026");

INSERT INTO miembros(nombre,apellidos,documento,direccion) VALUES ("PEPITO","PEREZ","1097094358","CRA 65A #125-32"),("JORGE","SAENZ","CALLE 27");

INSERT INTO miembro_libro(fecha_lanzamiento) VALUES ("15/12/1999"),("24/11/2006");

INSERT INTO transaccion(fecha_prestamo,fecha_devolucion) VALUES ("12/03/2024"),("16/01/2000");

INSERT INTO libro_transaccion(id_transaccion,id_miembros) VALUES ("151617","161418"),("161718","171819");

INSERT INTO editor(nombre_editor) VALUES ("EL MASCAPITO"),("HARRY POTTER");

INSERT INTO publicaciones(fecha_publicacion,edicciones,id_editor) VALUES ("25/11/1989","451515"),("14/02/2003","461616");

INSERT INTO edicion(id_editor) VALUES ("451515","461616");