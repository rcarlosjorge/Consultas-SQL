DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas;
USE ventas;

CREATE TABLE cliente (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoría INT
);


CREATE TABLE comercial (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comisión FLOAT
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

SET IDENTITY_INSERT cliente ON
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente(id,nombre,apellido1,apellido2,ciudad,categoría) VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente (id,nombre,apellido1,apellido2,ciudad,categoría)VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);
SET IDENTITY_INSERT cliente OFF

SET IDENTITY_INSERT comercial ON
INSERT INTO comercial(id,nombre,apellido1,apellido2,comisión) VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial(id,nombre,apellido1,apellido2,comisión) VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial(id,nombre,apellido1,apellido2,comisión) VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial(id,nombre,apellido1,apellido2,comisión) VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial(id,nombre,apellido1,apellido2,comisión) VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial(id,nombre,apellido1,apellido2,comisión) VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial(id,nombre,apellido1,apellido2,comisión) VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial(id,nombre,apellido1,apellido2,comisión) VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);
SET IDENTITY_INSERT comercial OFF

SET IDENTITY_INSERT pedido ON
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido(id,total,fecha,id_cliente,id_comercial) VALUES(16, 2389.23, '2019-03-11', 1, 5);
SET IDENTITY_INSERT pedido OFF

--1.3.3 Consultas sobre una tabla
--Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM pedido ORDER BY fecha DESC;

--Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT TOP(2) * FROM pedido ORDER BY total DESC;

--Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT(id_cliente) FROM pedido;

--Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
SELECT * FROM pedido WHERE YEAR(fecha) = 2017 AND total > 500;

--Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
SELECT nombre, apellido1, apellido2 FROM comercial WHERE comisión BETWEEN 0.05 AND 0.11;

--Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
SELECT MAX(comisión) FROM comercial;

--Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
SELECT id, nombre, apellido1 FROM cliente WHERE apellido2 IS NOT NULL;

--Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM cliente WHERE nombre LIKE 'A%' AND nombre LIKE '%n' OR nombre LIKE 'P%' ORDER BY nombre ASC;

--Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM cliente WHERE nombre NOT LIKE 'A%';

--Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT nombre FROM comercial WHERE nombre LIKE '%el' OR nombre LIKE '%o';

--1.3.4 Consultas multitabla (Composición interna)
--Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT cliente.id, nombre, apellido1, apellido2 FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente GROUP BY cliente.nombre, cliente.id, cliente.apellido1, cliente.apellido2 ORDER BY cliente.nombre ASC;

--Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT comercial.id, comercial.nombre, comercial.apellido1, comercial.apellido2, pedido.id, pedido.fecha,pedido.total FROM comercial INNER JOIN pedido ON comercial.id = pedido.id_comercial ORDER BY comercial.nombre ASC;

--Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
SELECT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.id, pedido.fecha, pedido.total, comercial.id, comercial.nombre, comercial.apellido1, comercial.apellido2 FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente INNER JOIN comercial ON pedido.id_comercial = comercial.id ORDER BY cliente.nombre ASC;

--Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
SELECT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.id, pedido.fecha, pedido.total, comercial.id, comercial.nombre, comercial.apellido1, comercial.apellido2 FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente INNER JOIN comercial ON pedido.id_comercial = comercial.id;

--Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
SELECT cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.id, pedido.fecha, pedido.total FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente WHERE pedido.fecha LIKE '2017%' AND pedido.total BETWEEN 300 AND 1000 ORDER BY cliente.nombre ASC;

--Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT c.nombre, c.apellido1, c.apellido2 FROM pedido p INNER JOIN comercial c ON p.id_comercial = c.id INNER JOIN cliente cli ON p.id_cliente = cli.id WHERE cli.nombre = 'María' AND cli.apellido1 = 'Santana' AND cli.apellido2 = 'Moreno';

--Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
SELECT cliente.nombre FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente INNER JOIN comercial ON comercial.id = pedido.id_comercial where comercial.nombre= 'Daniel' and comercial.apellido1='Sáez' and comercial.apellido2='Vega';

--1.3.5 Consultas multitabla (Composición externa)
--Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), pedido.id, pedido.fecha, pedido.total FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente GROUP BY cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.id, pedido.fecha, pedido.total;

--Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
SELECT comercial.nombre + ' ' + comercial.apellido1 + ' ' + ISNULL(comercial.apellido2, ''), pedido.id, pedido.fecha, pedido.total FROM comercial LEFT JOIN pedido ON comercial.id = pedido.id_comercial GROUP BY comercial.nombre, comercial.apellido1, comercial.apellido2, pedido.id, pedido.fecha, pedido.total ORDER BY comercial.apellido1, comercial.apellido2, comercial.nombre;

--Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), pedido.id, pedido.fecha, pedido.total FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente WHERE pedido.id IS NULL;

--Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
SELECT comercial.nombre + ' ' + comercial.apellido1 + ' ' + ISNULL(comercial.apellido2, ''), pedido.id, pedido.fecha, pedido.total FROM comercial LEFT JOIN pedido ON comercial.id = pedido.id_comercial WHERE pedido.id IS NULL;

--Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), comercial.nombre + ' ' + comercial.apellido1 + ' ' + ISNULL(comercial.apellido2, ''), pedido.id, pedido.fecha, pedido.total FROM cliente FULL OUTER JOIN pedido ON cliente.id = pedido.id_cliente FULL OUTER JOIN comercial ON comercial.id = pedido.id_comercial WHERE pedido.id IS NULL;

--1.3.6 Consultas resumen
--Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(total) FROM pedido;

--Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(total) FROM pedido;

--Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(DISTINCT id_comercial) FROM pedido;

--Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(*) FROM cliente;

--Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(total) FROM pedido;

--Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(total) FROM pedido;

--Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT ciudad, Max(categoría) FROM cliente GROUP BY ciudad;

--Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT cliente.id, cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), pedido.fecha, MAX(pedido.total) FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.fecha;

--Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
SELECT cliente.id, cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), pedido.fecha, MAX(pedido.total) FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente WHERE pedido.total > 2000 GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.fecha;

--Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
SELECT comercial.id, pedido.fecha, comercial.nombre + ' ' + comercial.apellido1 + ' ' + ISNULL(comercial.apellido2, ''), pedido.total FROM comercial INNER JOIN pedido ON comercial.id = pedido.id_comercial WHERE pedido.fecha = '2016-08-17';

--Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
SELECT cliente.id, cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), COALESCE(COUNT(pedido.id),0) FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2;

--Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
SELECT cliente.id, cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), COALESCE(COUNT(pedido.id),0) FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente WHERE pedido.fecha LIKE '2017%' GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2;

--Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.
SELECT cliente.id, cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), COALESCE(MAX(pedido.total),0) FROM cliente LEFT JOIN pedido ON cliente.id = pedido.id_cliente WHERE pedido.fecha LIKE '2017%' GROUP BY cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2;

--Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT cliente.nombre + ' ' + cliente.apellido1 + ' ' + ISNULL(cliente.apellido2, ''), YEAR(pedido.fecha), MAX(pedido.total) FROM pedido INNER JOIN cliente ON pedido.id_cliente = cliente.id WHERE pedido.fecha IN(SELECT MAX(fecha) FROM pedido GROUP BY YEAR(fecha)) GROUP BY Year(pedido.fecha), cliente.nombre, cliente.apellido1, cliente.apellido2;

--Devuelve el número total de pedidos que se han realizado cada año.
SELECT YEAR(pedido.fecha), COUNT(pedido.id) FROM pedido GROUP BY Year(pedido.fecha);

--1.3.7 Subconsultas
--Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
SELECT * FROM pedido WHERE id_cliente = (SELECT id FROM cliente WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'Diaz');

--Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
SELECT COUNT(*) FROM pedido WHERE id_comercial = (SELECT id FROM comercial WHERE nombre = 'Daniel' AND apellido1 = 'Sáez' AND apellido2 = 'Vega');

--Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
SELECT * FROM cliente WHERE id = (SELECT id_cliente FROM pedido WHERE total = (SELECT MAX(total) FROM pedido WHERE YEAR(fecha) = 2019));

--Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha, total FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente WHERE cliente.nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana' AND pedido.total = (SELECT MIN(total) FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente WHERE cliente.nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana');

--Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
SELECT * FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente WHERE YEAR(pedido.fecha) = 2017 AND pedido.total >= (SELECT AVG(total) FROM pedido WHERE YEAR(fecha) = 2017);

--1.3.7.2 Subconsultas con ALL y ANY
--Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM pedido WHERE total >= ALL(SELECT total FROM pedido);

--Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT * FROM cliente WHERE id != ALL (SELECT id_cliente FROM pedido);

--Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT * FROM comercial WHERE id != ALL (SELECT id_comercial FROM pedido);

--1.3.7.3 Subconsultas con IN y NOT IN
--Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * FROM cliente WHERE id NOT IN (SELECT id_cliente FROM pedido);

--Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * FROM comercial WHERE id NOT IN (SELECT id_comercial FROM pedido);

--1.3.7.4 Subconsultas con EXISTS y NOT EXISTS
--Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM cliente WHERE NOT EXISTS (SELECT id_cliente FROM pedido WHERE cliente.id = pedido.id_cliente);

--Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM comercial WHERE NOT EXISTS (SELECT id_comercial FROM pedido WHERE comercial.id = pedido.id_comercial);
