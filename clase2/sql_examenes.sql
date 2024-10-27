CREATE TABLE Examenes (
  `id_examen` int NOT NULL,
  `Id_Alumno` int DEFAULT NULL,
  `nombre_alumno` varchar(50) DEFAULT NULL,
  `fecha_examen` date DEFAULT NULL,
  `nota` int DEFAULT NULL,
  PRIMARY KEY (`id_examen`)
);

INSERT INTO Examenes (id_examen,Id_Alumno,nombre_alumno,fecha_examen,nota) VALUES
	 (1,1,'Modestine Labrenz','2023-12-23',5),
	 (2,2,'Douglass Afonso','2023-12-16',10),
	 (3,2,'Douglass Afonso','2024-05-24',2),
	 (4,3,'Cosette Jarrel','2024-02-25',9),
	 (5,4,'Katherine Aizik','2023-12-25',10),
	 (6,3,'Cosette Jarrel','2023-10-27',10),
	 (7,4,'Katherine Aizik','2023-10-29',7),
	 (8,2,'Douglass Afonso','2023-11-06',3),
	 (9,4,'Katherine Aizik','2024-04-08',6),
	 (10,4,'Katherine Aizik','2023-10-16',9);
INSERT INTO Examenes (id_examen,Id_Alumno,nombre_alumno,fecha_examen,nota) VALUES
	 (11,3,'Cosette Jarrel','2024-03-28',3),
	 (12,2,'Douglass Afonso','2024-01-06',3),
	 (13,4,'Katherine Aizik','2024-02-21',3),
	 (14,3,'Cosette Jarrel','2023-08-25',7),
	 (15,2,'Douglass Afonso','2024-02-17',5),
	 (16,4,'Katherine Aizik','2024-05-26',8),
	 (17,3,'Cosette Jarrel','2024-06-11',3),
	 (18,2,'Douglass Afonso','2023-08-20',9),
	 (19,4,'Katherine Aizik','2024-07-16',10),
	 (20,4,'Katherine Aizik','2024-06-10',8);
INSERT INTO Examenes (id_examen,Id_Alumno,nombre_alumno,fecha_examen,nota) VALUES
	 (21,2,'Douglass Afonso','2023-10-21',9),
	 (22,3,'Cosette Jarrel','2024-05-07',1),
	 (23,3,'Cosette Jarrel','2023-09-14',7),
	 (24,4,'Katherine Aizik','2023-11-08',1),
	 (25,2,'Douglass Afonso','2024-04-30',8),
	 (26,4,'Katherine Aizik','2024-05-13',3),
	 (27,3,'Cosette Jarrel','2024-06-05',1),
	 (28,2,'Douglass Afonso','2023-10-16',10),
	 (29,4,'Katherine Aizik','2024-02-23',7),
	 (30,3,'Cosette Jarrel','2023-11-26',5);
