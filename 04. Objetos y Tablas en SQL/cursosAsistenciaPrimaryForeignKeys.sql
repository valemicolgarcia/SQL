-- clase en vivo
DROP DATABASE escuela;
CREATE DATABASE escuela;
USE escuela;

-- formas de poner primary key 

CREATE TABLE Cursos
	(id_curso INT NOT NULL PRIMARY KEY, -- primer opcion para la primary key
	nombre VARCHAR (50) NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL);


CREATE TABLE Cursos
	(id_curso INT NOT NULL, 
	nombre VARCHAR (50) NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL),
    PRIMARY KEY(id_curso) -- segunda opcion
    ;
    
ALTER TABLE Cursos
ADD PRIMARY KEY (id_curso); -- tercer forma de poner la primary key
    
-- ALTER 

ALTER TABLE Cursos
ADD COLUMN nro_comision INT NOT NULL; -- agregar columna

ALTER TABLE Cursos
MODIFY COLUMN nro_comision INT DEFAULT NULL; -- modificar 

ALTER TABLE Cursos
DROP COLUMN nro_comision; -- eliminar 

ALTER TABLE Cursos
ADD CONSTRAINT pk_cursos PRIMARY KEY (id_curso);

-- ejercicios

CREATE TABLE Cursos
	(id_curso INT NOT NULL, 
	nombre VARCHAR (50) NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
    nro_comision INT NOT NULL,
    CONSTRAINT pk_curso PRIMARY KEY(id_curso), -- segunda opcion
    UNIQUE KEY (nro_comision) ,-- ponemos para que el nro de comision no se repita, mismas opciones para poner UNIQUE
    FOREIGN KEY (id_tipo_curso) REFERENCES Tipo_Curso (id_tipo_curso)
    );

-- CONSTRAINT definir restricciones en una tabla y ponerle nombre
CREATE TABLE Tipo_Curso
(id_tipo_curso varchar(3),
descripcion varchar(50),
primary key (id_tipo_curso));

SELECT * FROM Tipo_Curso;

ALTER TABLE Cursos
ADD column id_tipo_curso VARCHAR(3);

SELECT * FROM cursos;

ALTER TABLE Cursos
ADD FOREIGN KEY (id_tipo_curso) REFERENCES Tipo_Curso (id_tipo_curso);

CREATE INDEX idx_curso_comision ON Cursos(nro_comision);



--  OTRAS
 
DROP TABLE Cursos;

SELECT * FROM cursos;

INSERT INTO cursos (id_curso, nro_comision ,nombre, fecha_inicio, fecha_fin, id_tipo_curso)
VALUES (1, 4445, 'Curso Prueba', '2024-10-01', '2024-12-31', 'SQL');

-- Crear tabla de profesores, que tenga un ID, nombre, email,
-- crear tabla de alumnos que tenga ID, nombre, tipo docuemtno y nro docuemnto
-- a la tabla cursos le asignamos el id de profesor
-- creamos una tabla de inscripcion donde podamos relacionar los cursos con los alumnos


CREATE TABLE Profesores
	(id_profesor INT NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(50) NOT NULL, 
    email VARCHAR(100),
    PRIMARY KEY (id_profesor)
    );


INSERT INTO Profesores (nombre, email)
VALUES ('Santiago', 'sssss');

INSERT INTO Profesores (nombre, email)
VALUES ('Valeria', 'sssss');

INSERT INTO Profesores (nombre, email)
VALUES ('Jose', 'sssss');

DROP TABLE Profesores;


CREATE TABLE Alumnos 
( id_alumno INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL, 
tipo_documento VARCHAR(2) NOT NULL,
nro_documento INT NOT NULL,
PRIMARY KEY (id_alumno)
);

INSERT INTO Alumnos (nombre, tipo_documento, nro_documento)
VALUES ('Valeria Garcia', 'DU', 33333);

INSERT INTO Alumnos (nombre, tipo_documento, nro_documento)
VALUES ('Lionel Paz', 'DU', 333777733);

INSERT INTO Alumnos (nombre, tipo_documento, nro_documento)
VALUES ('Martin', 'DU', 222733);

alter table cursos add column id_profesor int not null;
alter table cursos add foreign key (id_profesor) references Profesores (id_profesor);

ALTER TABLE Alumnos
ADD COLUMN genero VARCHAR (1) NOT NULL;

-- compuesta unique
ALTER TABLE Alumnos
ADD UNIQUE KEY (tipo_documento, nro_documento, genero);


SELECT * FROM Alumnos;





CREATE TABLE Inscripcion (
    id_curso INT NOT NULL,
    id_alumno INT NOT NULL,
    PRIMARY KEY (id_curso, id_alumno),
    FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos (id_alumno)
);


SELECT * FROM Inscripcion;


-- si hago tabla asistencia con foreign key compuesta, 
