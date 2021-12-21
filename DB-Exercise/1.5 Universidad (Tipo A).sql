--Ejercicio 1.5 Universidad tipo A 

CREATE DATABASE universidad_tipoA
USE universidad

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
    sexo VARCHAR(10) NOT NULL CHECK (sexo IN('H', 'M')),
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN('profesor', 'alumno'))
);

CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

 CREATE TABLE grado (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE asignatura (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN('básica', 'obligatoria', 'optativa')),
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
INSERT INTO departamento(nombre) VALUES 
('Informática'),
('Matemáticas'),
('Economía y Empresa'),
('Educación'),
('Agronomía'),
('Química y Física'),
('Filología'),
('Derecho'),
('Biología y Geología');
 
SELECT * FROM departamento

 /* Persona */
INSERT INTO persona (nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES 
('26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno'),
('89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno'),
('11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor'),
('17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno'),
('38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor'),
('04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H', 'alumno'),
('97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno'),
('79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor'),
('82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno'),
( '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 'profesor'),
( '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno'),
( '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
( '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor'),
( '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor'),
( '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor'),
( '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor'),
( '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 'profesor'),
( '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor'),
( '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno'),
( '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor'),
( '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno'),
( '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno'),
( '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno'),
( '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');

SELECT * FROM persona

/* Profesor */
INSERT INTO profesor(id_profesor, id_departamento) VALUES 
(3, 1),
(5, 2),
(8, 3),
(10, 4),
(12, 4),
(13, 6),
(14, 1),
(15, 2),
(16, 3),
(17, 4),
(18, 5),
(20, 6);

SELECT * FROM profesor

 /* Grado */
INSERT INTO grado(nombre) VALUES 
('Grado en Ingeniería Agrícola (Plan 2015)'),
('Grado en Ingeniería Eléctrica (Plan 2014)'),
('Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
('Grado en Ingeniería Informática (Plan 2015)'),
('Grado en Ingeniería Mecánica (Plan 2010)'),
('Grado en Ingeniería Química Industrial (Plan 2010)'),
('Grado en Biotecnología (Plan 2015)'),
('Grado en Ciencias Ambientales (Plan 2009)'),
('Grado en Matemáticas (Plan 2010)'),
( 'Grado en Química (Plan 2009)');

SELECT * FROM grado

/* Asignatura */
INSERT INTO asignatura (nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES 
('Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4),
('Cálculo', 6, 'básica', 1, 1, 14, 4),
('Física para informática', 6, 'básica', 1, 1, 3, 4),
('Introducción a la programación', 6, 'básica', 1, 1, 14, 4),
('Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4),
('Estadística', 6, 'básica', 1, 2, 14, 4),
('Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4),
('Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4),
('Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4),
( 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4),
( 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4),
( 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
( 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4),
( 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
( 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
( 'Bases de Datos', 6, 'básica', 2, 2, 14, 4),
( 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
( 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4),
( 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4),
( 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
( 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
( 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
( 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
( 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4),
( 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
( 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
( 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4), 
( 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4),
( 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4),
( 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
( 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4),
( 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4),
( 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4),
( 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4),
( 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4),
( 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
( 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
( 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
( 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4),
( 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
( 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
( 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
( 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
( 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4),
( 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4),
( 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4),
( 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
( 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4),
( 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
( 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4),
( 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4),
( 'Biologia celular', 6, 'básica', 1, 1, NULL, 7),
( 'Física', 6, 'básica', 1, 1, NULL, 7),
( 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7),
( 'Química general', 6, 'básica', 1, 1, NULL, 7),
( 'Química orgánica', 6, 'básica', 1, 1, NULL, 7),
( 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7),
( 'Bioquímica', 6, 'básica', 1, 2, NULL, 7),
( 'Genética', 6, 'básica', 1, 2, NULL, 7),
( 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7),
( 'Microbiología', 6, 'básica', 1, 2, NULL, 7),
( 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Virología', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
( 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
( 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7),
( 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7),
( 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
( 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
( 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7),
( 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7),
( 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
( 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7),
( 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7),
( 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

SELECT * FROM asignatura

/* Curso escolar */
INSERT INTO curso_escolar(anyo_inicio, anyo_fin) VALUES 
('2014-01-01', '2015-01-01'),
('2015-01-01', '2016-01-01'),
('2016-01-01', '2017-01-01'),
('2017-01-01', '2018-01-01'),
('2018-01-01', '2019-01-01');

SELECT * FROM curso_escolar
/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura(id_alumno, id_asignatura, id_curso_escolar) VALUES 
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(24, 1, 5),
(24, 2, 5),
(24, 3, 5),
(24, 4, 5),
(24, 5, 5),
(24, 6, 5),
(24, 7, 5),
(24, 8, 5),
(24, 9, 5),
(24, 10, 5),
(23, 1, 5),
(23, 2, 5),
(23, 3, 5),
(23, 4, 5),
(23, 5, 5),
(23, 6, 5),
(23, 7, 5),
(23, 8, 5),
(23, 9, 5),
(23, 10, 5),
(19, 1, 5),
(19, 2, 5),
(19, 3, 5),
(19, 4, 5),
(19, 5, 5),
(19, 6, 5),
(19, 7, 5),
(19, 8, 5),
(19, 9, 5),
(19, 10, 5);



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.5.4 Consultas sobre una tabla
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre FROM persona  ORDER BY apellido1, apellido2, nombre

--Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre as Nombre, apellido1 + ' ' + apellido2 as Apellidos, telefono
FROM persona WHERE telefono IS NULL 

--Devuelve el listado de los alumnos que nacieron en 1999.
SELECT nombre + ' ' + apellido1 + ' ' + apellido2 as Alumnos, YEAR(fecha_nacimiento) AS Fecha_Nacimiento FROM persona WHERE year(fecha_nacimiento) = '1999'

--Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
SELECT nif as NIF, nombre + ' ' + apellido1 + ' ' + apellido2 as Profesor,
Telefono as Telefono FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
WHERE nif like '%K' and persona.telefono IS NULL

--Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT nombre as Asignatura FROM asignatura WHERE cuatrimestre = 1 and id_grado = 7



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.5.5 Consultas multitabla (Composición interna)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT persona.nombre + ' ' + apellido1 + ' ' + apellido2 as Alumna, grado.nombre as Grado
FROM persona INNER JOIN alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN grado on asignatura.id_grado = grado.id
WHERE persona.sexo = 'M' and asignatura.id_grado = 4

--Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
SELECT asignatura.nombre as Asignatura, grado.nombre as Grado
FROM asignatura INNER JOIN grado on asignatura.id_grado = grado.id 
WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)'

--Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
SELECT persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido, persona.nombre as Nombre, departamento.nombre as Departamento
FROM profesor INNER JOIN departamento on profesor.id_departamento = departamento.id
INNER JOIN persona on persona.id = id_profesor
Order by apellido1, apellido2, nombre ASC

--Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
SELECT persona.nif AS NIF, asignatura.nombre AS Asignaturas, curso_escolar.anyo_inicio as Inicio_Ciclo, curso_escolar.anyo_fin as Fin_Ciclo
FROM persona INNER JOIN alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN asignatura on asignatura.id = alumno_se_matricula_asignatura.id_asignatura
INNER JOIN curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE persona.nif = '26902806M'

--Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT departamento.nombre AS Departamento, persona.nombre + ' ' +  persona.apellido1 + ' ' + persona.apellido2 AS Profesor, asignatura.nombre as Asignatura, grado.nombre AS Grado 
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
INNER JOIN departamento on departamento.id =  profesor.id_departamento
INNER JOIN asignatura on asignatura.id_profesor = profesor.id_profesor
INNER JOIN grado on grado.id = asignatura.id_grado

--Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT persona.nombre + ' ' + persona.apellido1 + ' ' + persona.apellido2 as Alumno, curso_escolar.anyo_inicio AS Inicio_Ciclo, curso_escolar.anyo_fin as Fin_Ciclo
FROM persona INNER JOIN alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE curso_escolar.anyo_inicio like '2018%' and curso_escolar.anyo_fin like '2019%'



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.5.6 Consultas multitabla (Composición externa)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT departamento.nombre as Departamento, persona.nombre as Nombre, persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
LEFT JOIN departamento on profesor.id_departamento = departamento.id
ORDER BY departamento.nombre, apellido1, apellido2, persona.nombre asc

--Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT persona.nombre as Nombre, persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido, departamento.nombre as Departamento
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
Left join departamento on profesor.id_departamento = departamento.id
WHERE departamento.id IS NULL 

--Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT departamento.nombre as Departamento, persona.nombre as Nombre,
persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
Right join departamento on profesor.id_departamento = departamento.id
WHERE id_profesor IS NULL 

--Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT persona.nombre as Nombre, persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido, Asignatura.nombre as Asignatura
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
left join asignatura on profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id IS NULL

--Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT asignatura.nombre as Asignatura, persona.nombre + ' ' + persona.apellido1 + ' ' + persona.apellido2 as Profesor
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
right join asignatura on profesor.id_profesor = asignatura.id_profesor
WHERE profesor.id_profesor IS NULL

--Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
SELECT departamento.nombre as Departamento, asignatura.nombre as Asignatura, alumno_se_matricula_asignatura.id_curso_escolar as Curso
FROM departamento INNER JOIN profesor on departamento.id = profesor.id_departamento
INNER JOIN asignatura on asignatura.id_profesor = profesor.id_profesor
left join alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
WHERE alumno_se_matricula_asignatura.id_curso_escolar IS NULL



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.5.7 Consultas resumen
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve el número total de alumnas que hay.
SELECT COUNT(*) as Numero_Alumnos FROM persona;
--Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(*) as Numero_Alumnos_1999 FROM persona WHERE year(fecha_nacimiento) = '1999';

--Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
SELECT departamento.nombre, COUNT(profesor.id_profesor) as Numero_Profesores FROM profesor INNER JOIN departamento on profesor.id_departamento = departamento.id
GROUP BY departamento.nombre ORDER BY Numero_Profesores DESC;

--Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
SELECT departamento.nombre, COUNT(profesor.id_profesor) as Numero_Profesores 
FROM profesor RIGHT JOIN departamento on profesor.id_departamento = departamento.id
GROUP BY departamento.nombre

--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT grado.nombre, COUNT(asignatura.id) as Numero_Asignaturas FROM asignatura RIGHT JOIN grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre ORDER BY Numero_Asignaturas DESC

--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT grado.nombre, COUNT(asignatura.id) as Numero_Asignaturas FROM asignatura RIGHT JOIN grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre having (Count(asignatura.id) > 40)

--Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
SELECT grado.nombre as Grado, Upper(asignatura.tipo) as Tipo, SUM(asignatura.creditos) as Total_Creditos
FROM asignatura Left join grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre, asignatura.tipo ORDER BY Total_Creditos DESC

--Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_alumno) as Numero_Alumnos
FROM alumno_se_matricula_asignatura RIGHT JOIN curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
GROUP BY curso_escolar.anyo_inicio, alumno_se_matricula_asignatura.id_curso_escolar

--Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT profesor.id_profesor as ID,  persona.nombre AS Nombre,  persona.apellido1 AS Primer_Apellido, persona.apellido2 AS Segundo_Apellido, COUNT(asignatura.id) as Numero_Asignaturas
FROM profesor LEFT JOIN asignatura on profesor.id_profesor = asignatura.id_profesor
INNER JOIN persona on profesor.id_profesor = persona.id
GROUP BY profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2
ORDER BY Numero_Asignaturas DESC



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.5.8 Subconsultas
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve todos los datos del alumno más joven.
SELECT nombre + ' ' + apellido1 +  ' ' + apellido2 AS Alumno_Mas_Joven FROM persona 
WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona)

--Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT nombre + ' ' + apellido1 +  ' ' + apellido2 AS Profesor_Sin_Departamento FROM persona 
INNER JOIN profesor on profesor.id_profesor =  persona.id
WHERE id_departamento IS NULL

--Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT nombre AS Departamento_Sin_Profesor FROM departamento 
left join profesor on departamento.id = profesor.id_departamento
WHERE profesor.id_departamento IS NULL

--Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT persona.nombre + ' ' + apellido1 +  ' ' + apellido2 AS Profesor_Sin_Asignatura, asignatura.nombre AS Asignatura_Impartida
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
Left join asignatura on asignatura.id = asignatura.id_profesor
WHERE profesor.id_departamento IS NOT NULL AND asignatura.id_profesor IS NULL

--Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT persona.nombre + ' ' + apellido1 +  ' ' + apellido2 AS Profesor, asignatura.nombre AS Asignatura_Impartida
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
RIGHT JOIN asignatura on asignatura.id = asignatura.id_profesor
WHERE profesor.id_profesor IS NULL and asignatura.id IS NOT NULL

--Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT DISTINCT departamento.nombre as 'Departamento',  asignatura.nombre as 'Asignatura', alumno_se_matricula_asignatura.id_curso_escolar as 'Curso'
FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento  
INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor 
LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura 
WHERE alumno_se_matricula_asignatura.id_curso_escolar IS NULL
