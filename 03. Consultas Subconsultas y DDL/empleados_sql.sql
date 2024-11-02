-- Creación de la tabla 'puestos'
CREATE TABLE puestos (
    id_puesto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_puesto VARCHAR(100) NOT NULL,
    categoria VARCHAR(2) NOT NULL
);

-- Inserción de registros en la tabla 'puestos'
INSERT INTO puestos (nombre_puesto, categoria) VALUES 
('Desarrollador de Software', 'IT'),
('Administrador de Sistemas', 'IT'),
('Analista de Seguridad', 'IT'),
('Ingeniero DevOps', 'IT'),
('Soporte Técnico', 'IT'),

('Contador General', 'CO'),
('Auditor Financiero', 'CO'),
('Analista de Costos', 'CO'),
('Asistente de Contabilidad', 'CO'),
('Controlador Financiero', 'CO'),

('Gerente de Recursos Humanos', 'RH'),
('Especialista en Selección', 'RH'),
('Consultor de Capacitación', 'RH'),
('Analista de Nóminas', 'RH'),
('Coordinador de Beneficios', 'RH'),

('Supervisor de Producción', 'PR'),
('Operador de Maquinaria', 'PR'),
('Ingeniero de Procesos', 'PR'),
('Encargado de Calidad', 'PR'),
('Planificador de Producción', 'PR'),

('Gerente de Ventas', 'CO'),
('Ejecutivo de Cuentas', 'CO'),
('Coordinador de Marketing', 'CO'),
('Representante de Ventas', 'CO'),
('Analista de Mercado', 'CO');


-- Creación de la tabla 'empleados'
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

-- Inserción de registros en la tabla 'empleados'
INSERT INTO empleados (nombre, puesto, salario) VALUES
-- Desarrollador de Software
('Carlos Pérez', 'Desarrollador de Software', 320000),
('Laura Sánchez', 'Desarrollador de Software', 310000),
('Juan López', 'Desarrollador de Software', 330000),
('Ana Rodríguez', 'Desarrollador de Software', 340000),
('David Gómez', 'Desarrollador de Software', 350000),
('María Fernández', 'Desarrollador de Software', 325000),

-- Administrador de Sistemas
('Luis Martínez', 'Administrador de Sistemas', 300000),
('Sofía Morales', 'Administrador de Sistemas', 290000),
('Jorge Díaz', 'Administrador de Sistemas', 310000),
('Andrea Vargas', 'Administrador de Sistemas', 305000),
('Manuel Gutiérrez', 'Administrador de Sistemas', 295000),
('Carolina Núñez', 'Administrador de Sistemas', 315000),

-- Analista de Seguridad
('Pablo Ramírez', 'Analista de Seguridad', 380000),
('Valeria Torres', 'Analista de Seguridad', 370000),
('Héctor Castillo', 'Analista de Seguridad', 390000),
('Elena Ruiz', 'Analista de Seguridad', 375000),
('Gabriel Hernández', 'Analista de Seguridad', 360000),
('Lucía Romero', 'Analista de Seguridad', 385000),

-- Ingeniero DevOps
('Francisco Jiménez', 'Ingeniero DevOps', 420000),
('Isabel Castro', 'Ingeniero DevOps', 410000),
('Ricardo Peña', 'Ingeniero DevOps', 430000),
('Marta Delgado', 'Ingeniero DevOps', 440000),
('Alberto Navarro', 'Ingeniero DevOps', 425000),
('Raquel Méndez', 'Ingeniero DevOps', 415000),

-- Soporte Técnico
('Enrique Ortiz', 'Soporte Técnico', 250000),
('Claudia Herrera', 'Soporte Técnico', 245000),
('Sergio Luna', 'Soporte Técnico', 260000),
('Patricia Escobar', 'Soporte Técnico', 255000),
('Javier Molina', 'Soporte Técnico', 240000),
('Mónica Rivera', 'Soporte Técnico', 265000),

-- Contador General
('Felipe Rojas', 'Contador General', 320000),
('Susana Reyes', 'Contador General', 315000),
('Miguel Campos', 'Contador General', 330000),
('Daniela Paredes', 'Contador General', 325000),
('Tomás Silva', 'Contador General', 310000),
('Paola Guerrero', 'Contador General', 335000),

-- Auditor Financiero
('Vicente Flores', 'Auditor Financiero', 370000),
('Alicia Cárdenas', 'Auditor Financiero', 365000),
('Julián Fuentes', 'Auditor Financiero', 380000),
('Gloria Espinosa', 'Auditor Financiero', 375000),
('Óscar Lozano', 'Auditor Financiero', 360000),
('Lorena Vega', 'Auditor Financiero', 385000),

-- Analista de Costos
('Iván Meza', 'Analista de Costos', 310000),
('Gabriela Zúñiga', 'Analista de Costos', 305000),
('Rodrigo Miranda', 'Analista de Costos', 320000),
('Teresa Beltrán', 'Analista de Costos', 315000),
('Pedro Carrillo', 'Analista de Costos', 300000),
('Sandra Soto', 'Analista de Costos', 325000),

-- Asistente de Contabilidad
('Andrés Figueroa', 'Asistente de Contabilidad', 240000),
('Margarita Ruiz', 'Asistente de Contabilidad', 235000),
('Alejandro Salinas', 'Asistente de Contabilidad', 250000),
('Natalia Serrano', 'Asistente de Contabilidad', 245000),
('Gustavo Morales', 'Asistente de Contabilidad', 230000),
('Rosa Bautista', 'Asistente de Contabilidad', 255000),

-- Controlador Financiero
('Ignacio Ibarra', 'Controlador Financiero', 400000),
('Carmen Barrios', 'Controlador Financiero', 395000),
('René Domínguez', 'Controlador Financiero', 410000),
('Marisol Correa', 'Controlador Financiero', 405000),
('Federico Salgado', 'Controlador Financiero', 390000),
('Verónica Ríos', 'Controlador Financiero', 415000),

-- Gerente de Recursos Humanos
('Nicolás Blanco', 'Gerente de Recursos Humanos', 450000),
('Sonia Gallardo', 'Gerente de Recursos Humanos', 440000),
('Diego Salazar', 'Gerente de Recursos Humanos', 460000),
('Clara Solís', 'Gerente de Recursos Humanos', 455000),
('Rafael Muñoz', 'Gerente de Recursos Humanos', 430000),
('Elvira Moreno', 'Gerente de Recursos Humanos', 465000),

-- Especialista en Selección
('Ángel Medina', 'Especialista en Selección', 350000),
('Raquel Cáceres', 'Especialista en Selección', 345000),
('Esteban Aguilar', 'Especialista en Selección', 360000),
('Julia Pacheco', 'Especialista en Selección', 355000),
('Vicente Araya', 'Especialista en Selección', 340000),
('Lourdes Ramos', 'Especialista en Selección', 365000),

-- Consultor de Capacitación
('Matías Bustos', 'Consultor de Capacitación', 370000),
('Pamela Pizarro', 'Consultor de Capacitación', 365000),
('Leonardo Sepúlveda', 'Consultor de Capacitación', 380000),
('Bárbara Tapia', 'Consultor de Capacitación', 375000),
('Sebastián Villanueva', 'Consultor de Capacitación', 360000),
('Diana Campos', 'Consultor de Capacitación', 385000),

-- Analista de Nóminas
('Mauricio Vargas', 'Analista de Nóminas', 320000),
('Francisca Molina', 'Analista de Nóminas', 315000),
('Rodolfo Peralta', 'Analista de Nóminas', 330000),
('Carmen Rojas', 'Analista de Nóminas', 325000),
('Alberto Valenzuela', 'Analista de Nóminas', 310000),
('Inés Valdivia', 'Analista de Nóminas', 335000),

-- Coordinador de Beneficios
('Gonzalo Espinoza', 'Coordinador de Beneficios', 340000),
('Natalia Castro', 'Coordinador de Beneficios', 335000),
('Samuel Medina', 'Coordinador de Beneficios', 350000),
('Verónica Flores', 'Coordinador de Beneficios', 345000),
('Felipe Uribe', 'Coordinador de Beneficios', 330000),
('Cecilia Vargas', 'Coordinador de Beneficios', 355000),

-- Supervisor de Producción
('Martín Morales', 'Supervisor de Producción', 360000),
('Eugenia Guzmán', 'Supervisor de Producción', 355000),
('Andrés Silva', 'Supervisor de Producción', 370000),
('Renata Riquelme', 'Supervisor de Producción', 365000),
('Alejandro Cornejo', 'Supervisor de Producción', 350000),
('Paula Castro', 'Supervisor de Producción', 375000),

-- Operador de Maquinaria
('Tomás Ortiz', 'Operador de Maquinaria', 250000),
('Daniela Vargas', 'Operador de Maquinaria', 245000),
('Miguel Navarro', 'Operador de Maquinaria', 260000),
('Valeria Soto', 'Operador de Maquinaria', 255000),
('Jorge Álvarez', 'Operador de Maquinaria', 240000),
('Pamela Miranda', 'Operador de Maquinaria', 265000),

-- Ingeniero de Procesos
('Patricio Rivas', 'Ingeniero de Procesos', 420000),
('Claudia León', 'Ingeniero de Procesos', 410000),
('Roberto Vega', 'Ingeniero de Procesos', 430000),
('Camila Maldonado', 'Ingeniero de Procesos', 425000),
('Luis Rojas', 'Ingeniero de Procesos', 415000),
('Isabel Flores', 'Ingeniero de Procesos', 435000),

-- Encargado de Calidad
('Fernando Carvajal', 'Encargado de Calidad', 340000),
('Ximena Ponce', 'Encargado de Calidad', 335000),
('Hernán Farias', 'Encargado de Calidad', 350000),
('Lorena Soto', 'Encargado de Calidad', 345000),
('Jaime Ramírez', 'Encargado de Calidad', 330000),
('Marta Herrera', 'Encargado de Calidad', 355000),

-- Planificador de Producción
('Camilo Silva', 'Planificador de Producción', 390000),
('Adriana Ortiz', 'Planificador de Producción', 385000),
('Rodrigo Correa', 'Planificador de Producción', 400000),
('Jessica Flores', 'Planificador de Producción', 395000),
('Marcelo Bravo', 'Planificador de Producción', 380000),
('Valentina Cáceres', 'Planificador de Producción', 405000),

-- Gerente de Ventas
('Federico Rojas', 'Gerente de Ventas', 450000),
('Sonia Torres', 'Gerente de Ventas', 440000),
('Diego Figueroa', 'Gerente de Ventas', 460000),
('Clara Jiménez', 'Gerente de Ventas', 455000),
('Rafael Gutiérrez', 'Gerente de Ventas', 430000),
('Elvira Paredes', 'Gerente de Ventas', 465000),

-- Ejecutivo de Cuentas
('Carlos Morales', 'Ejecutivo de Cuentas', 350000),
('Laura Espinoza', 'Ejecutivo de Cuentas', 345000),
('Juan González', 'Ejecutivo de Cuentas', 360000),
('Ana Salinas', 'Ejecutivo de Cuentas', 355000),
('David Núñez', 'Ejecutivo de Cuentas', 340000),
('María Ramos', 'Ejecutivo de Cuentas', 365000),

-- Coordinador de Marketing
('Luis Medina', 'Coordinador de Marketing', 370000),
('Sofía Vargas', 'Coordinador de Marketing', 365000),
('Jorge Fuentes', 'Coordinador de Marketing', 380000),
('Andrea Pizarro', 'Coordinador de Marketing', 375000),
('Manuel Díaz', 'Coordinador de Marketing', 360000),
('Carolina Araya', 'Coordinador de Marketing', 385000),

-- Representante de Ventas
('Pablo Castillo', 'Representante de Ventas', 310000),
('Valeria Zambrano', 'Representante de Ventas', 305000),
('Héctor Navarro', 'Representante de Ventas', 320000),
('Elena Miranda', 'Representante de Ventas', 315000),
('Gabriel Vásquez', 'Representante de Ventas', 300000),
('Lucía Jiménez', 'Representante de Ventas', 325000),

-- Analista de Mercado
('Francisco Torres', 'Analista de Mercado', 340000),
('Isabel Vega', 'Analista de Mercado', 335000),
('Ricardo Ponce', 'Analista de Mercado', 350000),
('Marta Romero', 'Analista de Mercado', 345000),
('Alberto Ramírez', 'Analista de Mercado', 330000),
('Raquel Hernández', 'Analista de Mercado', 355000);
