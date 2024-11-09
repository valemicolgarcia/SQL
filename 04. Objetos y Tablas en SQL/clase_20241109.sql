CREATE DATABASE escuela;
USE escuela;

DROP  TABLE Cursos;

CREATE TABLE Tipo_Curso
	(id_tipo_curso varchar(3), 
    descripcion varchar(50), 
    primary key(id_tipo_curso));

CREATE TABLE Cursos
	(id_curso INT NOT NULL AUTO_INCREMENT, 
    nro_comision  INT NOT NULL,
    nombre VARCHAR(50) NOT NULL, 
    fecha_inicio DATE NOT NULL, 
    fecha_fin DATE,
    id_tipo_curso VARCHAR(3),
    CONSTRAINT pk_cursos PRIMARY KEY (id_curso),
    CONSTRAINT uk_curso_comision UNIQUE KEY (nro_comision),
    CONSTRAINT fk_curso_tipo_curso FOREIGN KEY (id_tipo_curso) REFERENCES Tipo_Curso(id_tipo_curso)
    );
    
    
SELECT * FROM Tipo_Curso;
SELECT * FROM cursos;


INSERT INTO cursos (nro_comision, nombre, fecha_inicio, fecha_fin, id_tipo_curso)
VALUES (44555,'Curso Prueba', '2024-10-01','2024-12-31', 'SQL');


INSERT INTO cursos (id_curso,nro_comision, nombre, fecha_inicio, fecha_fin, id_tipo_curso)
VALUES (10, 88889,'Curso Prueba2', '2024-10-01','2024-12-31', 'PHY');
    
INSERT INTO cursos (nro_comision, nombre, fecha_inicio, fecha_fin, id_tipo_curso)
VALUES (676767,'Curso Prueba', '2024-10-01','2024-12-31', 'SQL');

CREATE TABLE Profesores
	(id_profesor INT NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(50) NOT NULL, 
    email VARCHAR(100) NOT NULL, 
    PRIMARY KEY(id_profesor)
    );
    
INSERT INTO Profesores (nombre, email)
VALUES ('Santiago Acosta','ss@dd.com');

INSERT INTO Profesores (nombre, email)
VALUES ('Leonel Lo Presti','ss2@dd.com');

INSERT INTO Profesores (nombre, email)
VALUES ('Jose Loli Haro','ss3@dd.com');


CREATE TABLE Alumnos 
( id_alumno INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL, 
	tipo_documento VARCHAR(2) NOT NULL,
	nro_documento INT NOT NULL, 
    PRIMARY KEY (id_alumno)
);

INSERT INTO Alumnos  (nombre, tipo_documento, nro_documento)
VALUES ('Valeria Garcia','DU',33222222);

INSERT INTO Alumnos  (nombre, tipo_documento, nro_documento)
VALUES ('Lionel Paz','DU',77788888);

INSERT INTO Alumnos  (nombre, tipo_documento, nro_documento)
VALUES ('Martin Gentile','DU',9988899);


alter table cursos add column id_profesor int not null;
alter table cursos add foreign key(id_profesor) references Profesores(id_profesor);
    
ALTER TABLE Alumnos
ADD COLUMN genero VARCHAR(1) NOT NULL;

SELECT * FROM Alumnos;

ALTER TABLE Alumnos
ADD UNIQUE KEY (tipo_documento, nro_documento, genero);

DROP TABLE Inscripciones;

CREATE TABLE Inscripciones (
    id_curso INT NOT NULL,
    id_alumno INT NOT NULL, 
    PRIMARY KEY (id_curso, id_alumno),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso), 
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno)
    );

SELECT * FROm Inscripciones;

DROP TABLE Asistencia;

CREATE TABLE Asistencia (
	id_asistencia INT NOT NULL auto_increment,
    fecha_clase DATE NOT NULL,
    id_curso INT NOT NULL,
    id_alumno INT NOT NULL, 
    PRIMARY KEY (id_asistencia),
    FOREIGN KEY (id_curso, id_alumno) REFERENCES Inscripciones(id_curso,id_alumno), 
    UNIQUE KEY (fecha_clase, id_curso, id_alumno)
    );
    
SELECT * FROM Asistencia;
