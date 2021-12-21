DROP DATABASE IF EXISTS universidad;
CREATE DATABASE universidad;
USE universidad;

CREATE TABLE departamento (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo varchar(1) NOT NULL,
    tipo varchar(20) NOT NULL
);


CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);


CREATE TABLE grado (
    id INT IDENTITY(1,1)PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE asignatura (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    tipo varchar(20) NOT NULL,
    curso TINYINT NOT NULL,
    cuatrimestre TINYINT NOT NULL,
    id_profesor INT,
    id_grado INT NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);

CREATE TABLE curso_escolar (
    id INT IDENTITY(1,1) PRIMARY KEY,
    anyo_inicio DATE NOT NULL,
    anyo_fin DATE NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso_escolar INT NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);


/* Departamento */
SET IDENTITY_INSERT departamento ON
INSERT INTO departamento(id,nombre) VALUES (1, 'Informática');
INSERT INTO departamento(id,nombre) VALUES (2, 'Matemáticas');
INSERT INTO departamento(id,nombre) VALUES (3, 'Economía y Empresa');
INSERT INTO departamento(id,nombre) VALUES (4, 'Educación');
INSERT INTO departamento(id,nombre) VALUES (5, 'Agronomía');
INSERT INTO departamento(id,nombre) VALUES (6, 'Química y Física');
INSERT INTO departamento(id,nombre) VALUES (7, 'Filología');
INSERT INTO departamento(id,nombre) VALUES (8, 'Derecho');
INSERT INTO departamento(id,nombre) VALUES (9, 'Biología y Geología');
SET IDENTITY_INSERT departamento OFF


 /* Persona */
SET IDENTITY_INSERT persona ON
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno');
INSERT INTO persona(id,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,tipo) VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
 SET IDENTITY_INSERT persona OFF

/* Profesor */
INSERT INTO profesor(id_profesor,id_departamento) VALUES (3, 1);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (5, 2);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (8, 3);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (10, 4);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (12, 4);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (13, 6);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (14, 1);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (15, 2);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (16, 3);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (17, 4);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (18, 5);
INSERT INTO profesor(id_profesor,id_departamento) VALUES (20, 6);
 
 /* Grado */
SET IDENTITY_INSERT grado ON
INSERT INTO grado(id,nombre) VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado(id,nombre) VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado(id,nombre) VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grado(id,nombre) VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado(id,nombre) VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado(id,nombre) VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grado(id,nombre) VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado(id,nombre) VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado(id,nombre) VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado(id,nombre) VALUES (10, 'Grado en Química (Plan 2009)');
SET IDENTITY_INSERT grado OFF
 
/* Asignatura */
SET IDENTITY_INSERT asignatura ON
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (2, 'Cálculo', 6, 'básica', 1, 1, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (3, 'Física para informática', 6, 'básica', 1, 1, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (6, 'Estadística', 6, 'básica', 1, 2, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura(id,nombre,creditos,tipo,curso,cuatrimestre,id_profesor,id_grado) VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);
SET IDENTITY_INSERT asignatura OFF


/* Curso escolar */
SET IDENTITY_INSERT curso_escolar ON
INSERT INTO curso_escolar(id,anyo_inicio,anyo_fin) VALUES (1, '2014', '2015');
INSERT INTO curso_escolar(id,anyo_inicio,anyo_fin) VALUES (2, '2015', '2016');
INSERT INTO curso_escolar(id,anyo_inicio,anyo_fin) VALUES (3, '2016', '2017');
INSERT INTO curso_escolar(id,anyo_inicio,anyo_fin) VALUES (4, '2017', '2018');
INSERT INTO curso_escolar(id,anyo_inicio,anyo_fin) VALUES (5, '2018', '2019');
SET IDENTITY_INSERT curso_escolar OFF

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (2, 3, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (4, 3, 1);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 1, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 2, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 3, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 4, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 5, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 6, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 7, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 8, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 9, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (24, 10, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 1, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 2, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 3, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 4, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 5, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 6, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 7, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 8, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 9, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (23, 10, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 1, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 2, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 3, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 4, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 5, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 6, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 7, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 8, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 9, 5);
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura,id_curso_escolar) VALUES (19, 10, 5);

--1.5.4 Consultas sobre una tabla

--Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado debera estar ordenado alfabaticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre FROM persona  ORDER BY apellido1, apellido2, nombre;

--Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su numero de telefono en la base de datos.
SELECT nombre as Nombre, apellido1 + ' ' + apellido2 as Apellidos, telefono
FROM persona WHERE telefono IS NULL;

--Devuelve el listado de los alumnos que nacieron en 1999.
SELECT nombre + ' ' + apellido1 + ' ' + apellido2 as Alumnos, YEAR(fecha_nacimiento) AS Fecha_Nacimiento FROM persona WHERE year(fecha_nacimiento) = '1999';

--Devuelve el listado de profesores que no han dado de alta su numero de telefono en la base de datos y ademas su nif termina en K.
SELECT nif as NIF, nombre + ' ' + apellido1 + ' ' + apellido2 as Profesor,
Telefono as Telefono FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
WHERE nif like '%K' and persona.telefono IS NULL;

--Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT nombre as Asignatura FROM asignatura WHERE cuatrimestre = 1 and id_grado = 7;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.5.5 Consultas multitabla (Composicion interna)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingenieria Informatica (Plan 2015).
SELECT DISTINCT persona.nombre + ' ' + apellido1 + ' ' + apellido2 as Alumna, grado.nombre as Grado
FROM persona INNER JOIN alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN grado on asignatura.id_grado = grado.id
WHERE persona.sexo = 'M' and asignatura.id_grado = 4;

--Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingenieria Informatica (Plan 2015).
SELECT asignatura.nombre as Asignatura, grado.nombre as Grado
FROM asignatura INNER JOIN grado on asignatura.id_grado = grado.id 
WHERE grado.nombre = 'Grado en Ingenieria Informatica (Plan 2015)';

--Devuelve un listado de los profesores junto con el nombre del departamento al que estan vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estara ordenado alfabaticamente de menor a mayor por los apellidos y el nombre.
SELECT persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido, persona.nombre as Nombre, departamento.nombre as Departamento
FROM profesor INNER JOIN departamento on profesor.id_departamento = departamento.id
INNER JOIN persona on persona.id = id_profesor
Order by apellido1, apellido2, nombre ASC;

--Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
SELECT persona.nif AS NIF, asignatura.nombre AS Asignaturas, curso_escolar.anyo_inicio as Inicio_Ciclo, curso_escolar.anyo_fin as Fin_Ciclo
FROM persona INNER JOIN alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN asignatura on asignatura.id = alumno_se_matricula_asignatura.id_asignatura
INNER JOIN curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE persona.nif = '26902806M';

--Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingenieria Informatica (Plan 2015).
SELECT DISTINCT departamento.nombre AS Departamento, persona.nombre + ' ' +  persona.apellido1 + ' ' + persona.apellido2 AS Profesor, asignatura.nombre as Asignatura, grado.nombre AS Grado 
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
INNER JOIN departamento on departamento.id =  profesor.id_departamento
INNER JOIN asignatura on asignatura.id_profesor = profesor.id_profesor
INNER JOIN grado on grado.id = asignatura.id_grado;

--Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT persona.nombre + ' ' + persona.apellido1 + ' ' + persona.apellido2 as Alumno, curso_escolar.anyo_inicio AS Inicio_Ciclo, curso_escolar.anyo_fin as Fin_Ciclo
FROM persona INNER JOIN alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE curso_escolar.anyo_inicio like '2018%' and curso_escolar.anyo_fin like '2019%';



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.5.6 Consultas multitabla (Composicion externa)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado tambien debe mostrar aquellos profesores que no tienen ningun departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estara ordenado alfabaticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT departamento.nombre as Departamento, persona.nombre as Nombre, persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
LEFT JOIN departamento on profesor.id_departamento = departamento.id
ORDER BY departamento.nombre, apellido1, apellido2, persona.nombre asc;

--Devuelve un listado con los profesores que no estan asociados a un departamento.
SELECT persona.nombre as Nombre, persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido, departamento.nombre as Departamento
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
Left join departamento on profesor.id_departamento = departamento.id
WHERE departamento.id IS NULL;

--Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT departamento.nombre as Departamento, persona.nombre as Nombre,
persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
Right join departamento on profesor.id_departamento = departamento.id
WHERE id_profesor IS NULL;

--Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT persona.nombre as Nombre, persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido, Asignatura.nombre as Asignatura
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
left join asignatura on profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id IS NULL;

--Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT asignatura.nombre as Asignatura, persona.nombre + ' ' + persona.apellido1 + ' ' + persona.apellido2 as Profesor
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
right join asignatura on profesor.id_profesor = asignatura.id_profesor
WHERE profesor.id_profesor IS NULL;

--Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningun curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
SELECT departamento.nombre as Departamento, asignatura.nombre as Asignatura, alumno_se_matricula_asignatura.id_curso_escolar as Curso
FROM departamento INNER JOIN profesor on departamento.id = profesor.id_departamento
INNER JOIN asignatura on asignatura.id_profesor = profesor.id_profesor
left join alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
WHERE alumno_se_matricula_asignatura.id_curso_escolar IS NULL;

--1.5.7 Consultas resumen

--Devuelve el numero total de alumnas que hay.
SELECT COUNT(*) as Numero_Alumnos FROM persona;
--Calcula cuantos alumnos nacieron en 1999.
SELECT COUNT(*) as Numero_Alumnos_1999 FROM persona WHERE year(fecha_nacimiento) = '1999';

--Calcula cuantos profesores hay en cada departamento. El resultado solo debe mostrar dos columnas, una con el nombre del departamento y otra con el numero de profesores que hay en ese departamento. El resultado solo debe incluir los departamentos que tienen profesores asociados y debera estar ordenado de mayor a menor por el numero de profesores.
SELECT departamento.nombre, COUNT(profesor.id_profesor) as Numero_Profesores FROM profesor INNER JOIN departamento on profesor.id_departamento = departamento.id
GROUP BY departamento.nombre ORDER BY Numero_Profesores DESC;

--Devuelve un listado con todos los departamentos y el numero de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos tambien tienen que aparecer en el listado.
SELECT departamento.nombre, COUNT(profesor.id_profesor) as Numero_Profesores 
FROM profesor RIGHT JOIN departamento on profesor.id_departamento = departamento.id
GROUP BY departamento.nombre;

--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el numero de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados tambien tienen que aparecer en el listado. El resultado debera estar ordenado de mayor a menor por el numero de asignaturas.
SELECT grado.nombre, COUNT(asignatura.id) as Numero_Asignaturas FROM asignatura RIGHT JOIN grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre ORDER BY Numero_Asignaturas DESC;

--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el numero de asignaturas que tiene cada uno, de los grados que tengan mas de 40 asignaturas asociadas.
SELECT grado.nombre, COUNT(asignatura.id) as Numero_Asignaturas FROM asignatura RIGHT JOIN grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre having (Count(asignatura.id) > 40);

--Devuelve un listado que muestre el nombre de los grados y la suma del numero total de creditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los creditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el numero total de credidos.
SELECT grado.nombre as Grado, Upper(asignatura.tipo) as Tipo, SUM(asignatura.creditos) as Total_Creditos
FROM asignatura Left join grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre, asignatura.tipo ORDER BY Total_Creditos DESC;

--Devuelve un listado que muestre cuantos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado debera mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el numero de alumnos matriculados.
SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_alumno) as Numero_Alumnos
FROM alumno_se_matricula_asignatura RIGHT JOIN curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
GROUP BY curso_escolar.anyo_inicio, alumno_se_matricula_asignatura.id_curso_escolar;

--Devuelve un listado con el numero de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrara cinco columnas: id, nombre, primer apellido, segundo apellido y numero de asignaturas. El resultado estara ordenado de mayor a menor por el numero de asignaturas.
SELECT profesor.id_profesor as ID,  persona.nombre AS Nombre,  persona.apellido1 AS Primer_Apellido, persona.apellido2 AS Segundo_Apellido, COUNT(asignatura.id) as Numero_Asignaturas
FROM profesor LEFT JOIN asignatura on profesor.id_profesor = asignatura.id_profesor
INNER JOIN persona on profesor.id_profesor = persona.id
GROUP BY profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2
ORDER BY Numero_Asignaturas DESC;

--1.5.8 Subconsultas

--Devuelve todos los datos del alumno mas joven.
SELECT nombre + ' ' + apellido1 +  ' ' + apellido2 AS Alumno_Mas_Joven FROM persona 
WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona);

--Devuelve un listado con los profesores que no estan asociados a un departamento.
SELECT nombre + ' ' + apellido1 +  ' ' + apellido2 AS Profesor_Sin_Departamento FROM persona 
INNER JOIN profesor on profesor.id_profesor =  persona.id
WHERE id_departamento IS NULL

--Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT nombre AS Departamento_Sin_Profesor FROM departamento 
left join profesor on departamento.id = profesor.id_departamento
WHERE profesor.id_departamento IS NULL;

--Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT persona.nombre + ' ' + apellido1 +  ' ' + apellido2 AS Profesor_Sin_Asignatura, asignatura.nombre AS Asignatura_Impartida
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
Left join asignatura on asignatura.id = asignatura.id_profesor
WHERE profesor.id_departamento IS NOT NULL AND asignatura.id_profesor IS NULL;

--Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT persona.nombre + ' ' + apellido1 +  ' ' + apellido2 AS Profesor, asignatura.nombre AS Asignatura_Impartida
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
RIGHT JOIN asignatura on asignatura.id = asignatura.id_profesor
WHERE profesor.id_profesor IS NULL and asignatura.id IS NOT NULL;

--Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningun curso escolar.
SELECT DISTINCT departamento.nombre as 'Departamento',  asignatura.nombre as 'Asignatura', alumno_se_matricula_asignatura.id_curso_escolar as 'Curso'
FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento  
INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor 
LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura 
WHERE alumno_se_matricula_asignatura.id_curso_escolar IS NULL;
