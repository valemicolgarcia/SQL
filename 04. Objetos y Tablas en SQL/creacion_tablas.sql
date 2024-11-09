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
    
    