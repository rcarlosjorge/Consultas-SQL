

--Ejercicio 1.3 Gestion de ventas 

CREATE DATABASE ventas 
USE ventas

CREATE TABLE cliente (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categor�a INT
);

CREATE TABLE comercial (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comisi�n FLOAT
);

CREATE TABLE pedido (
  id INT IDENTITY(1,1) PRIMARY KEY,
  total FLOAT NOT NULL,
  fecha DATE,
  id_cliente INT NOT NULL,
  id_comercial INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente(nombre, apellido1, apellido2, ciudad, categor�a) VALUES
('Aar�n', 'Rivero', 'G�mez', 'Almer�a', 100),
('Adela', 'Salas', 'D�az', 'Granada', 200),
('Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL),
('Adri�n', 'Su�rez', NULL, 'Ja�n', 300),
('Marcos', 'Loyola', 'M�ndez', 'Almer�a', 200),
('Mar�a', 'Santana', 'Moreno', 'C�diz', 100),
('Pilar', 'Ruiz', NULL, 'Sevilla', 300),
('Pepe', 'Ruiz', 'Santana', 'Huelva', 200),
('Guillermo', 'L�pez', 'G�mez', 'Granada', 225),
( 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial(nombre, apellido1, apellido2, comisi�n) VALUES
('Daniel', 'S�ez', 'Vega', 0.15),
('Juan', 'G�mez', 'L�pez', 0.13),
('Diego','Flores', 'Salas', 0.11),
('Marta','Herrera', 'Gil', 0.14),
('Antonio','Carretero', 'Ortega', 0.12),
('Manuel','Dom�nguez', 'Hern�ndez', 0.13),
('Antonio','Vega', 'Hern�ndez', 0.11),
('Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido(total, fecha, id_cliente, id_comercial) VALUES
(150.5, '2017-10-05', 5, 2),
(270.65, '2016-09-10', 1, 5),
(65.26, '2017-10-05', 2, 1),
(110.5, '2016-08-17', 8, 3),
(948.5, '2017-09-10', 5, 2),
(2400.6, '2016-07-27', 7, 1),
(5760, '2015-09-10', 2, 1),
(1983.43, '2017-10-10', 4, 6),
(2480.4, '2016-10-10', 8, 3),
( 250.45, '2015-06-27', 8, 2),
( 75.29, '2016-08-17', 3, 7),
( 3045.6, '2017-04-25', 2, 1),
( 545.75, '2019-01-25', 6, 1),
( 145.82, '2017-02-02', 6, 1),
( 370.85, '2019-03-11', 1, 5),
( 2389.23, '2019-03-11', 1, 5);



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.3.3 Consultas sobre una tabla
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realizaci�n, mostrando en primer lugar los pedidos m�s recientes.
SELECT * FROM pedido ORDER BY total DESC

--Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT TOP 2 * FROM pedido ORDER BY total DESC

--Devuelve un listado con los identificadores de los clientes que han realizado alg�n pedido. Tenga en cuenta que no debe mostrar identificadores que est�n repetidos.
SELECT DISTINCT id_cliente FROM pedido GROUP BY id_cliente

--Devuelve un listado de todos los pedidos que se realizaron durante el a�o 2017, cuya cantidad total sea superior a 500�.
SELECT * FROM pedido WHERE fecha LIKE '%2017%' AND total > 500

--Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisi�n entre 0.05 y 0.11.
SELECT nombre, apellido1, apellido2 FROM comercial WHERE comercial.comisi�n BETWEEN 0.05 AND 0.11 ORDER BY comisi�n DESC

--Devuelve el valor de la comisi�n de mayor valor que existe en la tabla comercial.
SELECT MAX(comisi�n) AS Mayor FROM comercial

--Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deber� estar ordenado alfab�ticamente por apellidos y nombre.
SELECT nombre, apellido1 FROM cliente WHERE apellido2 IS NOT NULL

--Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y tambi�n los nombres que empiezan por P. El listado deber� estar ordenado alfab�ticamente.
SELECT nombre FROM cliente WHERE (nombre LIKE 'A%' AND nombre LIKE '%N') OR nombre LIKE '%P' ORDER BY nombre ASC

--Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deber� estar ordenado alfab�ticamente.
SELECT nombre FROM cliente WHERE nombre NOT LIKE 'A%' ORDER BY nombre ASC

--Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deber�n eliminar los nombres repetidos.
SELECT nombre FROM cliente WHERE nombre LIKE 'EL%' OR nombre LIKE '%O'  ORDER BY nombre ASC



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.3.4 Consultas multitabla (Composici�n interna)
--Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado alg�n pedido. El listado debe estar ordenado alfab�ticamente y se deben eliminar los elementos repetidos.
SELECT cliente.id, nombre, apellido1, apellido2
FROM cliente INNER JOIN pedido ON cliente.id = id_cliente
GROUP BY nombre, cliente.id, apellido1, apellido2
ORDER BY nombre ASC

--Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfab�ticamente.
SELECT cliente.id, nombre, apellido1, apellido2, pedido.id as pedidoID, fecha, total
FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente
ORDER BY nombre ASC

--Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfab�ticamente.
SELECT comercial.id as comercialid, nombre, apellido1, apellido2, pedido.id as pedidoid, fecha, total
FROM comercial INNER JOIN pedido ON comercial.id = pedido.id_comercial
ORDER BY comercial.nombre ASC

--Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
SELECT cliente.id, cliente.nombre as nombrecliente, cliente.apellido1 as apellido1,
cliente.apellido2 as apellido, pedido.id as pedidoid, total, comercial.id as comercialid,
comercial.nombre as comercialnombre, comercial.apellido1 as comerapellido1, comercial.apellido2 as comerapellido2
FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente
INNER JOIN comercial ON pedido.id_comercial = comercial.id
ORDER BY cliente.nombre ASC

--Devuelve un listado de todos los clientes que realizaron un pedido durante el a�o 2017, cuya cantidad est� entre 300 � y 1000 �.
SELECT nombre, apellido1, apellido2, pedido.id as pedidoid, fecha, total
FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente
WHERE pedido.fecha LIKE '%2017%' AND pedido.total BETWEEN 300 AND 1000
ORDER BY cliente.nombre ASC

--Devuelve el nombre y los apellidos de todos los comerciales que ha participado en alg�n pedido realizado por Mar�a Santana Moreno.
SELECT comercial.nombre + ' ' + comercial.apellido1 + ' ' + comercial.apellido2 as Comerciante,
cliente.nombre + ' ' + cliente.apellido1 + ' ' + cliente.apellido2 as Cliente
FROM comercial INNER JOIN pedido ON comercial.id = pedido.id_comercial
INNER JOIN cliente ON pedido.id_cliente = cliente.id
WHERE cliente.nombre = 'Mar�a' AND cliente.apellido1 = 'Santana' AND  cliente.apellido2 = 'Moreno'
ORDER BY comercial.nombre ASC

--Devuelve el nombre de todos los clientes que han realizado alg�n pedido con el comercial Daniel S�ez Vega.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2,'') as Cliente,
comercial.nombre + ' ' + comercial.apellido1 + ' ' + comercial.apellido2 as Comerciante
FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente
INNER JOIN comercial ON pedido.id_comercial = comercial.id
WHERE comercial.nombre = 'Daniel' AND comercial.apellido1 = 'S�ez' AND  comercial.apellido2 = 'Vega'
ORDER BY cliente.nombre ASC

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.3.5 Consultas multitabla (Composici�n externa)
--Resuelva todas las consultas utilizando las cl�usulas LEFT JOIN y RIGHT JOIN.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado tambi�n debe incluir los clientes que no han realizado ning�n pedido. El listado debe estar ordenado alfab�ticamente por el primer apellido, segundo apellido y nombre de los clientes.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2,'') as Cliente,
pedido.id AS pedidoid, fecha, total
FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente
GROUP BY nombre, apellido1, apellido2, pedido.id, fecha, total
ORDER BY apellido1, apellido2, nombre

--Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado tambi�n debe incluir los comerciales que no han realizado ning�n pedido. El listado debe estar ordenado alfab�ticamente por el primer apellido, segundo apellido y nombre de los comerciales.
SELECT comercial.nombre + ' ' + comercial.apellido1 + ' ' + comercial.apellido2 as Comerciante,
pedido.id AS pedidoid, fecha, total
FROM comercial LEFT JOIN pedido ON comercial.id = pedido.id_comercial
GROUP BY nombre, apellido1, apellido2, pedido.id, fecha, total
ORDER BY  apellido1, apellido2, nombre

--Devuelve un listado que solamente muestre los clientes que no han realizado ning�n pedido.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2,'') as Cliente,
pedido.id AS pedidoid, fecha, total
FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente
WHERE pedido.id IS NULL

--Devuelve un listado que solamente muestre los comerciales que no han realizado ning�n pedido.
SELECT comercial.nombre + ' ' + comercial.apellido1 + ' ' + comercial.apellido2 as Comerciante,
pedido.id AS pedidoid, fecha, total
FROM comercial LEFT JOIN pedido ON comercial.id = pedido.id_comercial
WHERE pedido.id IS NULL

--Devuelve un listado con los clientes que no han realizado ning�n pedido y de los comerciales que no han participado en ning�n pedido. Ordene el listado alfab�ticamente por los apellidos y el nombre. En en listado deber� diferenciar de alg�n modo los clientes y los comerciales.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2,'') as Cliente,
comercial.nombre + ' ' + comercial.apellido1 + ' ' + comercial.apellido2 as Comerciante,
pedido.id AS pedidoid, fecha, total
FROM cliente FULL OUTER JOIN pedido ON cliente.id = pedido.id_cliente
FULL OUTER JOIN comercial ON comercial.id = pedido.id_comercial
WHERE pedido.id IS NULL

--�Se podr�an realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.
-- Diria que no, porque esta implica que no se utilice la clausula ON, que en su mayoria esta
-- presente. Ademas, Se necesitan asociar multiples veces para obtener la respuesta que deseamos.



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.3.6 Consultas resumen
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(total) FROM pedido

--Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(total) FROM pedido

--Calcula el n�mero total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(DISTINCT comercial.id) FROM comercial

--Calcula cu�l es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(total) as Mayor FROM pedido

-- Calcula cu�l es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(total) as Menor FROM pedido

--Calcula cu�l es el valor m�ximo de categor�a para cada una de las ciudades que aparece en la tabla cliente.
SELECT ciudad, MAX(categor�a) as MayorCateg FROM cliente GROUP BY ciudad

--Calcula cu�l es el m�ximo valor de los pedidos realizados durante el mismo d�a para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo d�a. Se pide que se calcule cu�l es el pedido de m�ximo valor para cada uno de los d�as en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT cliente.id as clienteid, cliente.nombre + ' ' + cliente.apellido1 + ' ' +  
ISNULL(cliente.apellido2,'') AS Cliente, pedido.fecha AS Fecha, MAX(pedido.total) as Total
FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente
GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.fecha
ORDER BY pedido.fecha DESC

--Calcula cu�l es el m�ximo valor de los pedidos realizados durante el mismo d�a para cada uno de los clientes, teniendo en cuenta que s�lo queremos mostrar aquellos pedidos que superen la cantidad de 2000 �.
SELECT cliente.id as clienteid, cliente.nombre + ' ' + cliente.apellido1 + ' ' +  
ISNULL(cliente.apellido2,'') AS Cliente, pedido.fecha AS Fecha, MAX(pedido.total) as Total
FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente
WHERE pedido.total > 2000
GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.fecha
ORDER BY pedido.fecha DESC

--Calcula el m�ximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
SELECT pedido.fecha AS Fecha, comercial.id as comercialid, 
comercial.nombre + ' ' + comercial.apellido1 + ' ' +  ISNULL(comercial.apellido2,'') AS Comerciante, 
pedido.total as total
FROM comercial INNER JOIN pedido ON comercial.id = pedido.id_comercial
WHERE pedido.fecha = '2016/08/17'

--Devuelve un listado con el identificador de cliente, nombre y apellidos y el n�mero total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ning�n pedido. Estos clientes tambi�n deben aparecer en el listado indicando que el n�mero de pedidos realizados es 0.
SELECT cliente.id as clienteid, cliente.nombre + ' ' + cliente.apellido1 + ' ' +  ISNULL(cliente.apellido2,'') AS Cliente, 
COALESCE(COUNT(pedido.id), 0) AS Pedidos
FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente
GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2
ORDER BY cliente.apellido2 DESC

--Devuelve un listado con el identificador de cliente, nombre y apellidos y el n�mero total de pedidos que ha realizado cada uno de clientes durante el a�o 2017.
SELECT cliente.id as clienteid, cliente.nombre + ' ' + cliente.apellido1 + ' ' +  ISNULL(cliente.apellido2,'') AS Cliente, 
COALESCE(COUNT(pedido.id), 0) AS Pedidos
FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente
WHERE pedido.fecha LIKE '%2017%'
GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2
ORDER BY cliente.id

--Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la m�xima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ning�n pedido indicando que la m�xima cantidad de sus pedidos realizados es 0. Puede hacer uso de la funci�n IFNULL.
SELECT cliente.id as clienteid, cliente.nombre + ' ' + cliente.apellido1 + ' ' +  ISNULL(cliente.apellido2,'') AS Cliente, 
COALESCE(MAX(pedido.total), 0) AS Total
FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente
GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2
ORDER BY cliente.id

--Devuelve cu�l ha sido el pedido de m�ximo valor que se ha realizado cada a�o.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' +  ISNULL(cliente.apellido2,'') AS Cliente, 
YEAR(pedido.fecha) AS Fecha, MAX(pedido.total) AS Total
FROM pedido INNER JOIN cliente ON pedido.id_cliente = cliente.id
WHERE pedido.fecha IN (SELECT MAX(fecha) FROM pedido GROUP BY YEAR(fecha))
GROUP BY year(pedido.fecha), cliente.nombre, cliente.apellido1, cliente.apellido2
ORDER BY year(pedido.fecha), cliente.nombre, cliente.apellido1, cliente.apellido2
--Devuelve el n�mero total de pedidos que se han realizado cada a�o.
SELECT YEAR(pedido.fecha) AS Fecha, COUNT(pedido.id) AS Pedidos
FROM pedido GROUP BY YEAR(pedido.fecha) ORDER BY YEAR(pedido.fecha) 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.3.7 Subconsultas
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1.3.7.1 Con operadores b�sicos de comparaci�n

--Devuelve un listado con todos los pedidos que ha realizado Adela Salas D�az. (Sin utilizar INNER JOIN).
SELECT * FROM pedido WHERE id_cliente = (SELECT id FROM cliente WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'D�az')

--Devuelve el n�mero de pedidos en los que ha participado el comercial Daniel S�ez Vega. (Sin utilizar INNER JOIN)
SELECT COUNT(*) AS NumPedido FROM pedido WHERE id_comercial = (SELECT id FROM comercial WHERE nombre = 'Daniel' AND apellido1 = 'S�ez' AND apellido2 = 'Vega')

--Devuelve los datos del cliente que realiz� el pedido m�s caro en el a�o 2019. (Sin utilizar INNER JOIN)
SELECT TOP 1 * FROM cliente WHERE id = (SELECT TOP 1 id_cliente FROM pedido WHERE fecha LIKE '%2019%' ORDER BY total DESC)

--Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT TOP 1 * FROM pedido WHERE id_cliente = (SELECT TOP 1 id FROM cliente WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana' ORDER BY total ASC)

--Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el a�o 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo a�o.
SELECT * FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente WHERE fecha LIKE '2017%' AND total >= (SELECT AVG(total) FROM pedido WHERE fecha LIKE '%2017%')


--1.3.7.2 Subconsultas con ALL y ANY

--Devuelve el pedido m�s caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM pedido WHERE total >= ALL(SELECT total FROM pedido)

--Devuelve un listado de los clientes que no han realizado ning�n pedido. (Utilizando ANY o ALL).
SELECT ALL * FROM cliente WHERE id NOT IN (SELECT id_cliente FROM pedido)

--Devuelve un listado de los comerciales que no han realizado ning�n pedido. (Utilizando ANY o ALL).
SELECT ALL * FROM comercial WHERE id NOT IN (SELECT id_comercial FROM pedido)


--1.3.7.3 Subconsultas con IN y NOT IN

--Devuelve un listado de los clientes que no han realizado ning�n pedido. (Utilizando IN o NOT IN).
SELECT * FROM cliente WHERE id NOT IN (SELECT id_cliente FROM pedido)

--Devuelve un listado de los comerciales que no han realizado ning�n pedido. (Utilizando IN o NOT IN).
SELECT * FROM comercial WHERE id NOT IN (SELECT id_comercial FROM pedido)


--1.3.7.4 Subconsultas con EXISTS y NOT EXISTS

--Devuelve un listado de los clientes que no han realizado ning�n pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM cliente WHERE NOT EXISTS (SELECT * FROM pedido WHERE id_cliente = cliente.id)

--Devuelve un listado de los comerciales que no han realizado ning�n pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM comercial WHERE NOT EXISTS (SELECT * FROM pedido WHERE id_comercial = comercial.id)




