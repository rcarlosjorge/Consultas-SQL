

--Ejercicio 1.2 Gestion de empleados 

DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados
USE empleados

CREATE TABLE departamento (
  codigo INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto FLOAT NOT NULL,
  gastos FLOAT NOT NULL
);

CREATE TABLE empleado (
  codigo INT IDENTITY(1,1) PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  codigo_departamento INT,
  FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

INSERT INTO empleado (nif, nombre, apellido1, apellido2, codigo_departamento) VALUES
( '32481596F', 'Aarón', 'Rivero', 'Gómez', 1),
( 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2),
( 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3),
( '77705545E', 'Adrián', 'Suárez', NULL, 4),
( '17087203C', 'Marcos', 'Loyola', 'Méndez', 5),
( '38382980M', 'María', 'Santana', 'Moreno', 1),
( '80576669X', 'Pilar', 'Ruiz', NULL, 2),
( '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3),
( '56399183D', 'Juan', 'Gómez', 'López', 2),
('46384486H', 'Diego','Flores', 'Salas', 5),
( '67389283A', 'Marta','Herrera', 'Gil', 1),
( '41234836R', 'Irene','Salas', 'Flores', NULL),
( '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

INSERT INTO departamento (nombre, presupuesto, gastos) VALUES
('Desarrollo', 120000, 6000),
('Sistemas', 150000, 21000),
('Recursos Humanos', 280000, 25000),
('Contabilidad', 110000, 3000),
('I+D', 375000, 380000),
('Proyectos', 0, 0),
('Publicidad', 0, 1000);



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.2.3 Consultas sobre una tabla
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Lista el primer apellido de todos los empleados.
SELECT apellido1 FROM empleado

-- Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT apellido1 FROM empleado

-- Lista todas las columnas de la tabla empleado.
SELECT *FROM empleado

-- Lista el nombre y los apellidos de todos los empleados.
SELECT nombre, apellido1, apellido2 FROM empleado

-- Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT codigo_departamento FROM empleado

-- Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_departamento FROM empleado

-- Lista el nombre y apellidos de los empleados en una única columna.
SELECT nombre + ' ' + apellido1 + ' ' + apellido2 as 'Nombre completo' FROM empleado

-- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT UPPER(nombre + ' ' + apellido1 + ' ' + apellido2) as 'Nombre completo' FROM empleado

-- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LOWER(nombre + ' ' + apellido1 + ' ' + apellido2) as 'Nombre completo' FROM empleado

-- Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
SELECT nif, SUBSTRING(nif,1,ISNULL(NULLIF(PATINDEX('%[^0-9]%',LTRIM(RTRIM(nif))),0)-1,LEN(nif))) AS NIFNUM, RIGHT(nif, 1) AS NIFCHAR FROM empleado

-- Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
SELECT nombre, presupuesto, gastos, (presupuesto - gastos) as 'Presupuesto actual'  FROM departamento

-- Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre, presupuesto, gastos, (presupuesto - gastos) as 'Presupuesto actual'  FROM departamento ORDER BY 'Presupuesto actual' ASC

-- Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre FROM departamento ORDER BY nombre ASC

-- Lista el nombre de todos los departamentos ordenados de forma desscendente.
SELECT nombre FROM departamento ORDER BY nombre DESC

-- Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
SELECT nombre, apellido1, apellido2 FROM empleado ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC

-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT TOP 3 nombre, presupuesto FROM departamento ORDER BY presupuesto DESC

-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT TOP 3 nombre, presupuesto FROM departamento ORDER BY presupuesto ASC

-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
SELECT TOP 2 nombre, gastos FROM departamento ORDER BY gastos DESC

-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
SELECT TOP 2 nombre, gastos FROM departamento ORDER BY gastos ASC

-- Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
SELECT TOP 5 * FROM empleado WHERE codigo >= 3

-- Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 150000

-- Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
SELECT nombre, gastos FROM departamento WHERE presupuesto < 5000

-- Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 100000 AND presupuesto <= 200000

-- Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM departamento WHERE NOT presupuesto >= 100000 OR presupuesto >= 200000

-- Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT nombre, presupuesto FROM departamento WHERE presupuesto BETWEEN 100000 AND 200000

-- Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT nombre, presupuesto FROM departamento WHERE NOT presupuesto BETWEEN 100000 AND 200000

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
SELECT nombre, presupuesto, gastos FROM departamento WHERE gastos > presupuesto

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
SELECT nombre, presupuesto, gastos FROM departamento WHERE gastos < presupuesto

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
SELECT nombre, presupuesto, gastos FROM departamento WHERE gastos = presupuesto

-- Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT nombre, apellido2 FROM empleado WHERE apellido2 IS NULL

-- Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
SELECT nombre, apellido2 FROM empleado WHERE apellido2 IS NOT NULL

-- Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT nombre, apellido2 FROM empleado WHERE apellido2 = 'López'

-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
SELECT nombre, apellido2 FROM empleado WHERE apellido2 = 'Díaz' OR  apellido2 = 'Moreno'

-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
SELECT nombre, apellido2 FROM empleado WHERE apellido2 IN('Díaz','Moreno')

-- Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT nombre, apellido1, apellido2, nif, codigo_departamento FROM empleado WHERE codigo_departamento IN(1)

-- Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
SELECT nombre, apellido1, apellido2, nif, codigo_departamento FROM empleado WHERE codigo_departamento IN(2,4,5)




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.2.4 Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT empleado.nombre, apellido1, apellido2, departamento.nombre as Nombre_Depart, presupuesto, gastos
FROM empleado INNER JOIN departamento ON empleado.codigo_departamento = departamento.codigo

--Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.
SELECT empleado.nombre, apellido1, apellido2, departamento.nombre, presupuesto, gastos
FROM empleado INNER JOIN departamento ON empleado.codigo_departamento = departamento.codigo
ORDER BY departamento.nombre, apellido1, apellido2, empleado.nombre

--Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT departamento.codigo AS Codigo, departamento.nombre AS Nombre
FROM departamento inner join empleado ON empleado.codigo_departamento = departamento.codigo
GROUP BY departamento.codigo, departamento.nombre

--Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
SELECT departamento.codigo AS Codigo, departamento.nombre AS Nombre, departamento.presupuesto - departamento.gastos AS Presupuesto_actual
FROM departamento inner join empleado ON empleado.codigo_departamento = departamento.codigo
GROUP BY departamento.codigo, departamento.nombre, departamento.presupuesto, departamento.gastos

--Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
SELECT departamento.nombre AS Nombre, Empleado.nombre + + apellido1 as Empleado, empleado.nif as Nif
FROM departamento inner join empleado on empleado.codigo_departamento = departamento.codigo
WHERE empleado.nif = '38382980M';

--Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT departamento.nombre AS Departamento, empleado.nombre + ' ' + apellido1 + ' ' + apellido2 as Empleado
FROM departamento INNER JOIN empleado on departamento.codigo = empleado.codigo_departamento
WHERE empleado.nombre = 'Pepe' and empleado.apellido1 = 'Ruiz' and empleado.apellido2 = 'Santana';

--Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT empleado.nombre AS Nombre, empleado.apellido1 AS Primer_Apellido, empleado.apellido2 AS Segundo_Apellido
FROM empleado inner join departamento on empleado.codigo_departamento = departamento.codigo
WHERE departamento.nombre = 'I+D'
ORDER BY empleado.nombre, empleado.apellido1, empleado.apellido2;

--Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT empleado.nombre AS Nombre, empleado.apellido1 AS Primer_Apellido, empleado.apellido2 AS Segundo_Apellido
FROM empleado inner join departamento on empleado.codigo_departamento = departamento.codigo
WHERE departamento.nombre IN ('Sistemas','Contabilidad','1I+D');

--Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100008 y 200000 euros.
SELECT empleado.nombre AS Nombre, empleado.apellido1 AS Primer_Apellido, empleado.apellido2 AS Segundo_Apellido
FROM empleado inner join departamento on empleado.codigo_departamento = departamento.codigo
WHERE departamento.presupuesto not BETWEEN 100000 AND 200000;

--Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
SELECT departamento.nombre AS Departamento
FROM departamento inner join empleado on empleado.codigo_departamento = departamento.codigo
WHERE empleado.apellido2 is NULL;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.2.5 Consultas multitabla (Composición externa)
--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
SELECT empleado.nombre + ' ' + empleado.apellido1 + ' ' + ISNULL(empleado.apellido2,'') AS Nombre,
departamento.nombre AS Departamento, departamento.presupuesto AS Presupuesto, departamento.gastos AS Gastos
FROM empleado LEFT JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
ORDER BY empleado.nombre

--Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
SELECT empleado.nombre + ' ' + empleado.apellido1 + ' ' + ISNULL(empleado.apellido2,'') AS Nombre,
departamento.nombre AS Departamento 
FROM empleado LEFT JOIN departamento
ON empleado.codigo_departamento = departamento.codigo
WHERE departamento.codigo IS NULL

--Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
SELECT departamento.nombre AS Departamento, departamento.presupuesto AS Presupuesto, departamento.gastos AS Gastos
FROM departamento LEFT JOIN empleado
ON empleado.codigo_departamento = departamento.codigo
WHERE empleado.codigo_departamento IS NULL

--Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
SELECT empleado.nombre + ' ' + empleado.apellido1 + ' ' + ISNULL(empleado.apellido2,'') AS Nombre, gastos, presupuesto
FROM departamento FULL OUTER JOIN empleado
ON empleado.codigo_departamento = departamento.codigo
ORDER BY departamento.nombre

--Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
SELECT empleado.nombre + ' ' + empleado.apellido1 + ' ' + ISNULL(empleado.apellido2,'') AS Nombre,departamento.nombre as departamento
FROM departamento FULL OUTER JOIN empleado
ON empleado.codigo_departamento = departamento.codigo
WHERE empleado.codigo_departamento IS NULL



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.2.6 Consultas resumen
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Calcula la suma del presupuesto de todos los departamentos.
SELECT SUM(presupuesto) as Total_Presupuesto FROM departamento

--Calcula la media del presupuesto de todos los departamentos.
SELECT Round(AVG(presupuesto),2) as Promedio FROM departamento

--Calcula el valor mínimo del presupuesto de todos los departamentos.
SELECT MIN(presupuesto) as Minimo FROM departamento

 --Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
SELECT nombre, presupuesto FROM departamento WHERE presupuesto = (SELECT MIN(presupuesto) from departamento)

--Calcula el valor máximo del presupuesto de todos los departamentos.
SELECT MAX(presupuesto) as Maximo FROM departamento

--Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
SELECT nombre, presupuesto FROM departamento WHERE presupuesto = (SELECT MAX(presupuesto) FROM departamento)

--Calcula el número total de empleados que hay en la tabla empleado.
SELECT COUNT(*) as CantEmpleados FROM empleado

--Calcula el número de empleados que no tienen NULL en su segundo apellido.
SELECT COUNT(*) as SinApellido FROM empleado WHERE apellido2 IS NULL

--Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
SELECT departamento.nombre as Nombre, COUNT(*) as CantEmpleados
FROM departamento INNER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
GROUP BY departamento.codigo, departamento.nombre

--Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
SELECT departamento.nombre as Nombre, COUNT(*) as CantEmpleados
FROM departamento INNER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
GROUP BY departamento.codigo, departamento.nombre
HAVING COUNT(*) > 2

--Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.
SELECT isnull(departamento.nombre, 'Sin Departamento') as Nombre, 
COUNT(empleado.nombre) as Total_Empleados
FROM departamento FULL OUTER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
GROUP BY departamento.codigo, departamento.nombre



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.2.7 Subconsultas
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1.2.7.1 Con operadores básicos de comparación

--Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
SELECT nombre + ' ' + apellido1 + ' ' + ISNULL(apellido2, '') as Nombre FROM empleado WHERE codigo_departamento = 2

--Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
SELECT nombre as Departamento, presupuesto, gastos FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) FROM departamento) ORDER BY presupuesto ASC

--Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT nombre as Departamento, presupuesto, gastos FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto) FROM departamento) ORDER BY presupuesto ASC

--1.2.7.2 Subconsultas con ALL y ANY

--Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT nombre AS departamento, presupuesto, gastos FROM departamento WHERE presupuesto >= ALL(SELECT presupuesto FROM departamento) ORDER BY presupuesto ASC

--Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT nombre AS departamento, presupuesto, gastos FROM departamento WHERE presupuesto <= ALL(SELECT presupuesto FROM departamento) ORDER BY presupuesto DESC

--Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
SELECT DISTINCT departamento.nombre AS departamento
FROM departamento INNER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
WHERE departamento.codigo = ANY(SELECT codigo_departamento FROM empleado)

--Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
SELECT DISTINCT departamento.nombre AS departamento
FROM departamento LEFT JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
WHERE departamento.codigo = ANY(SELECT departamento.codigo FROM departamento
LEFT JOIN empleado ON departamento.codigo = empleado.codigo_departamento
WHERE codigo_departamento IS NULL)

--1.2.7.3 Subconsultas con IN y NOT IN

--Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT DISTINCT departamento.nombre AS departamento
FROM departamento INNER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
WHERE departamento.codigo IN (SELECT codigo_departamento FROM empleado)

--Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT departamento.nombre AS departamento
FROM departamento LEFT JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
WHERE departamento.codigo NOT IN (SELECT codigo_departamento FROM empleado
WHERE codigo_departamento IS NOT NULL)

--1.2.7.4 Subconsultas con EXISTS y NOT EXISTS

--Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT DISTINCT departamento.nombre AS departamento
FROM departamento INNER JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
WHERE EXISTS(SELECT codigo_departamento FROM empleado
WHERE codigo_departamento = departamento.codigo)

--Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT departamento.nombre AS departamento
FROM departamento LEFT JOIN empleado
ON departamento.codigo = empleado.codigo_departamento
WHERE NOT EXISTS(SELECT codigo_departamento FROM empleado
WHERE codigo_departamento = departamento.codigo)
