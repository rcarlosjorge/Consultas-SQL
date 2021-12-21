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
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN('b�sica', 'obligatoria', 'optativa')),
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
('Inform�tica'),
('Matem�ticas'),
('Econom�a y Empresa'),
('Educaci�n'),
('Agronom�a'),
('Qu�mica y F�sica'),
('Filolog�a'),
('Derecho'),
('Biolog�a y Geolog�a');
 
SELECT * FROM departamento

 /* Persona */
INSERT INTO persona (nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES 
('26902806M', 'Salvador', 'S�nchez', 'P�rez', 'Almer�a', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno'),
('89542419S', 'Juan', 'Saez', 'Vega', 'Almer�a', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno'),
('11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almer�a', 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor'),
('17105885A', 'Pedro', 'Heller', 'Pagac', 'Almer�a', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno'),
('38223286T', 'David', 'Schmidt', 'Fisher', 'Almer�a', 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor'),
('04233869Y', 'Jos�', 'Koss', 'Bayer', 'Almer�a', 'C/ J�piter', '628349590', '1998/01/28', 'H', 'alumno'),
('97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almer�a', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno'),
('79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almer�a', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor'),
('82842571K', 'Ram�n', 'Herzog', 'Tremblay', 'Almer�a', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno'),
( '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almer�a', 'C/ Plut�n', NULL, '1977/05/19', 'M', 'profesor'),
( '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almer�a', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno'),
( '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almer�a', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
( '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almer�a', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor'),
( '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almer�a', 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor'),
( '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almer�a', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor'),
( '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almer�a', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor'),
( '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almer�a', 'C/ Sierra de G�dor', NULL, '1973/05/05', 'H', 'profesor'),
( '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almer�a', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor'),
( '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almer�a', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno'),
( '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almer�a', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor'),
( '79089577Y', 'Juan', 'Guti�rrez', 'L�pez', 'Almer�a', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno'),
( '41491230N', 'Antonio', 'Dom�nguez', 'Guerrero', 'Almer�a', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno'),
( '64753215G', 'Irene', 'Hern�ndez', 'Mart�nez', 'Almer�a', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno'),
( '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almer�a', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');

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
('Grado en Ingenier�a Agr�cola (Plan 2015)'),
('Grado en Ingenier�a El�ctrica (Plan 2014)'),
('Grado en Ingenier�a Electr�nica Industrial (Plan 2010)'),
('Grado en Ingenier�a Inform�tica (Plan 2015)'),
('Grado en Ingenier�a Mec�nica (Plan 2010)'),
('Grado en Ingenier�a Qu�mica Industrial (Plan 2010)'),
('Grado en Biotecnolog�a (Plan 2015)'),
('Grado en Ciencias Ambientales (Plan 2009)'),
('Grado en Matem�ticas (Plan 2010)'),
( 'Grado en Qu�mica (Plan 2009)');

SELECT * FROM grado

/* Asignatura */
INSERT INTO asignatura (nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES 
('�lgegra lineal y matem�tica discreta', 6, 'b�sica', 1, 1, 3, 4),
('C�lculo', 6, 'b�sica', 1, 1, 14, 4),
('F�sica para inform�tica', 6, 'b�sica', 1, 1, 3, 4),
('Introducci�n a la programaci�n', 6, 'b�sica', 1, 1, 14, 4),
('Organizaci�n y gesti�n de empresas', 6, 'b�sica', 1, 1, 3, 4),
('Estad�stica', 6, 'b�sica', 1, 2, 14, 4),
('Estructura y tecnolog�a de computadores', 6, 'b�sica', 1, 2, 3, 4),
('Fundamentos de electr�nica', 6, 'b�sica', 1, 2, 14, 4),
('L�gica y algor�tmica', 6, 'b�sica', 1, 2, 3, 4),
( 'Metodolog�a de la programaci�n', 6, 'b�sica', 1, 2, 14, 4),
( 'Arquitectura de Computadores', 6, 'b�sica', 2, 1, 3, 4),
( 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
( 'Ingenier�a del Software', 6, 'obligatoria', 2, 1, 14, 4),
( 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
( 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
( 'Bases de Datos', 6, 'b�sica', 2, 2, 14, 4),
( 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
( 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4),
( 'Planificaci�n y Gesti�n de Proyectos Inform�ticos', 6, 'obligatoria', 2, 2, 3, 4),
( 'Programaci�n de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
( 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
( 'Ingenier�a de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
( 'Integraci�n de las Tecnolog�as de la Informaci�n en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
( 'Modelado y Dise�o del Software 1', 6, 'optativa', 3, 1, NULL, 4),
( 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
( 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
( 'Sistema de Informaci�n para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4), 
( 'Tecnolog�as web', 6, 'optativa', 3, 1, NULL, 4),
( 'Teor�a de c�digos y criptograf�a', 6, 'optativa', 3, 1, NULL, 4),
( 'Administraci�n de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
( 'Herramientas y M�todos de Ingenier�a del Software', 6, 'optativa', 3, 2, NULL, 4),
( 'Inform�tica industrial y rob�tica', 6, 'optativa', 3, 2, NULL, 4),
( 'Ingenier�a de Sistemas de Informaci�n', 6, 'optativa', 3, 2, NULL, 4),
( 'Modelado y Dise�o del Software 2', 6, 'optativa', 3, 2, NULL, 4),
( 'Negocio Electr�nico', 6, 'optativa', 3, 2, NULL, 4),
( 'Perif�ricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
( 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
( 'Tecnolog�as de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
( 'Tratamiento digital de im�genes', 6, 'optativa', 3, 2, NULL, 4),
( 'Administraci�n de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
( 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
( 'Fiabilidad y Gesti�n de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
( 'L�neas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
( 'Procesos de Ingenier�a del Software 1', 6, 'optativa', 4, 1, NULL, 4),
( 'Tecnolog�as multimedia', 6, 'optativa', 4, 1, NULL, 4),
( 'An�lisis y planificaci�n de las TI', 6, 'optativa', 4, 2, NULL, 4),
( 'Desarrollo R�pido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
( 'Gesti�n de la Calidad y de la Innovaci�n Tecnol�gica', 6, 'optativa', 4, 2, NULL, 4),
( 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
( 'Procesos de Ingenier�a del Software 2', 6, 'optativa', 4, 2, NULL, 4),
( 'Seguridad Inform�tica', 6, 'optativa', 4, 2, NULL, 4),
( 'Biologia celular', 6, 'b�sica', 1, 1, NULL, 7),
( 'F�sica', 6, 'b�sica', 1, 1, NULL, 7),
( 'Matem�ticas I', 6, 'b�sica', 1, 1, NULL, 7),
( 'Qu�mica general', 6, 'b�sica', 1, 1, NULL, 7),
( 'Qu�mica org�nica', 6, 'b�sica', 1, 1, NULL, 7),
( 'Biolog�a vegetal y animal', 6, 'b�sica', 1, 2, NULL, 7),
( 'Bioqu�mica', 6, 'b�sica', 1, 2, NULL, 7),
( 'Gen�tica', 6, 'b�sica', 1, 2, NULL, 7),
( 'Matem�ticas II', 6, 'b�sica', 1, 2, NULL, 7),
( 'Microbiolog�a', 6, 'b�sica', 1, 2, NULL, 7),
( 'Bot�nica agr�cola', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Fisiolog�a vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Gen�tica molecular', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Ingenier�a bioqu�mica', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Termodin�mica y cin�tica qu�mica aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
( 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Biotecnolog�a microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Ingenier�a gen�tica', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Inmunolog�a', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Virolog�a', 6, 'obligatoria', 2, 2, NULL, 7),
( 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
( 'Fisiolog�a animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
( 'Metabolismo y bios�ntesis de biomol�culas', 6, 'obligatoria', 3, 1, NULL, 7),
( 'Operaciones de separaci�n', 6, 'obligatoria', 3, 1, NULL, 7),
( 'Patolog�a molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
( 'T�cnicas instrumentales b�sicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
( 'Bioinform�tica', 4.5, 'obligatoria', 3, 2, NULL, 7),
( 'Biotecnolog�a de los productos hortofrut�culas', 4.5, 'obligatoria', 3, 2, NULL, 7),
( 'Biotecnolog�a vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
( 'Gen�mica y prote�mica', 4.5, 'obligatoria', 3, 2, NULL, 7),
( 'Procesos biotecnol�gicos', 6, 'obligatoria', 3, 2, NULL, 7),
( 'T�cnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

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

--Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deber� estar ordenado alfab�ticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre FROM persona  ORDER BY apellido1, apellido2, nombre

--Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su n�mero de tel�fono en la base de datos.
SELECT nombre as Nombre, apellido1 + ' ' + apellido2 as Apellidos, telefono
FROM persona WHERE telefono IS NULL 

--Devuelve el listado de los alumnos que nacieron en 1999.
SELECT nombre + ' ' + apellido1 + ' ' + apellido2 as Alumnos, YEAR(fecha_nacimiento) AS Fecha_Nacimiento FROM persona WHERE year(fecha_nacimiento) = '1999'

--Devuelve el listado de profesores que no han dado de alta su n�mero de tel�fono en la base de datos y adem�s su nif termina en K.
SELECT nif as NIF, nombre + ' ' + apellido1 + ' ' + apellido2 as Profesor,
Telefono as Telefono FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
WHERE nif like '%K' and persona.telefono IS NULL

--Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT nombre as Asignatura FROM asignatura WHERE cuatrimestre = 1 and id_grado = 7



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.5.5 Consultas multitabla (Composici�n interna)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingenier�a Inform�tica (Plan 2015).
SELECT DISTINCT persona.nombre + ' ' + apellido1 + ' ' + apellido2 as Alumna, grado.nombre as Grado
FROM persona INNER JOIN alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN grado on asignatura.id_grado = grado.id
WHERE persona.sexo = 'M' and asignatura.id_grado = 4

--Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingenier�a Inform�tica (Plan 2015).
SELECT asignatura.nombre as Asignatura, grado.nombre as Grado
FROM asignatura INNER JOIN grado on asignatura.id_grado = grado.id 
WHERE grado.nombre = 'Grado en Ingenier�a Inform�tica (Plan 2015)'

--Devuelve un listado de los profesores junto con el nombre del departamento al que est�n vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estar� ordenado alfab�ticamente de menor a mayor por los apellidos y el nombre.
SELECT persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido, persona.nombre as Nombre, departamento.nombre as Departamento
FROM profesor INNER JOIN departamento on profesor.id_departamento = departamento.id
INNER JOIN persona on persona.id = id_profesor
Order by apellido1, apellido2, nombre ASC

--Devuelve un listado con el nombre de las asignaturas, a�o de inicio y a�o de fin del curso escolar del alumno con nif 26902806M.
SELECT persona.nif AS NIF, asignatura.nombre AS Asignaturas, curso_escolar.anyo_inicio as Inicio_Ciclo, curso_escolar.anyo_fin as Fin_Ciclo
FROM persona INNER JOIN alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN asignatura on asignatura.id = alumno_se_matricula_asignatura.id_asignatura
INNER JOIN curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE persona.nif = '26902806M'

--Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingenier�a Inform�tica (Plan 2015).
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
--1.5.6 Consultas multitabla (Composici�n externa)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado tambi�n debe mostrar aquellos profesores que no tienen ning�n departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estar� ordenado alfab�ticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT departamento.nombre as Departamento, persona.nombre as Nombre, persona.apellido1 as Primer_Apellido, persona.apellido2 as Segundo_Apellido
FROM persona INNER JOIN profesor on persona.id = profesor.id_profesor
LEFT JOIN departamento on profesor.id_departamento = departamento.id
ORDER BY departamento.nombre, apellido1, apellido2, persona.nombre asc

--Devuelve un listado con los profesores que no est�n asociados a un departamento.
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

--Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ning�n curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
SELECT departamento.nombre as Departamento, asignatura.nombre as Asignatura, alumno_se_matricula_asignatura.id_curso_escolar as Curso
FROM departamento INNER JOIN profesor on departamento.id = profesor.id_departamento
INNER JOIN asignatura on asignatura.id_profesor = profesor.id_profesor
left join alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
WHERE alumno_se_matricula_asignatura.id_curso_escolar IS NULL



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.5.7 Consultas resumen
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve el n�mero total de alumnas que hay.
SELECT COUNT(*) as Numero_Alumnos FROM persona;
--Calcula cu�ntos alumnos nacieron en 1999.
SELECT COUNT(*) as Numero_Alumnos_1999 FROM persona WHERE year(fecha_nacimiento) = '1999';

--Calcula cu�ntos profesores hay en cada departamento. El resultado s�lo debe mostrar dos columnas, una con el nombre del departamento y otra con el n�mero de profesores que hay en ese departamento. El resultado s�lo debe incluir los departamentos que tienen profesores asociados y deber� estar ordenado de mayor a menor por el n�mero de profesores.
SELECT departamento.nombre, COUNT(profesor.id_profesor) as Numero_Profesores FROM profesor INNER JOIN departamento on profesor.id_departamento = departamento.id
GROUP BY departamento.nombre ORDER BY Numero_Profesores DESC;

--Devuelve un listado con todos los departamentos y el n�mero de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos tambi�n tienen que aparecer en el listado.
SELECT departamento.nombre, COUNT(profesor.id_profesor) as Numero_Profesores 
FROM profesor RIGHT JOIN departamento on profesor.id_departamento = departamento.id
GROUP BY departamento.nombre

--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el n�mero de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados tambi�n tienen que aparecer en el listado. El resultado deber� estar ordenado de mayor a menor por el n�mero de asignaturas.
SELECT grado.nombre, COUNT(asignatura.id) as Numero_Asignaturas FROM asignatura RIGHT JOIN grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre ORDER BY Numero_Asignaturas DESC

--Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el n�mero de asignaturas que tiene cada uno, de los grados que tengan m�s de 40 asignaturas asociadas.
SELECT grado.nombre, COUNT(asignatura.id) as Numero_Asignaturas FROM asignatura RIGHT JOIN grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre having (Count(asignatura.id) > 40)

--Devuelve un listado que muestre el nombre de los grados y la suma del n�mero total de cr�ditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los cr�ditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el n�mero total de cr�didos.
SELECT grado.nombre as Grado, Upper(asignatura.tipo) as Tipo, SUM(asignatura.creditos) as Total_Creditos
FROM asignatura Left join grado on asignatura.id_grado = grado.id
GROUP BY grado.nombre, asignatura.tipo ORDER BY Total_Creditos DESC

--Devuelve un listado que muestre cu�ntos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deber� mostrar dos columnas, una columna con el a�o de inicio del curso escolar y otra con el n�mero de alumnos matriculados.
SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_alumno) as Numero_Alumnos
FROM alumno_se_matricula_asignatura RIGHT JOIN curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
GROUP BY curso_escolar.anyo_inicio, alumno_se_matricula_asignatura.id_curso_escolar

--Devuelve un listado con el n�mero de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrar� cinco columnas: id, nombre, primer apellido, segundo apellido y n�mero de asignaturas. El resultado estar� ordenado de mayor a menor por el n�mero de asignaturas.
SELECT profesor.id_profesor as ID,  persona.nombre AS Nombre,  persona.apellido1 AS Primer_Apellido, persona.apellido2 AS Segundo_Apellido, COUNT(asignatura.id) as Numero_Asignaturas
FROM profesor LEFT JOIN asignatura on profesor.id_profesor = asignatura.id_profesor
INNER JOIN persona on profesor.id_profesor = persona.id
GROUP BY profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2
ORDER BY Numero_Asignaturas DESC



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.5.8 Subconsultas
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve todos los datos del alumno m�s joven.
SELECT nombre + ' ' + apellido1 +  ' ' + apellido2 AS Alumno_Mas_Joven FROM persona 
WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona)

--Devuelve un listado con los profesores que no est�n asociados a un departamento.
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

--Devuelve un listado con todos los departamentos que no han impartido asignaturas en ning�n curso escolar.
SELECT DISTINCT departamento.nombre as 'Departamento',  asignatura.nombre as 'Asignatura', alumno_se_matricula_asignatura.id_curso_escolar as 'Curso'
FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento  
INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor 
LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura 
WHERE alumno_se_matricula_asignatura.id_curso_escolar IS NULL
