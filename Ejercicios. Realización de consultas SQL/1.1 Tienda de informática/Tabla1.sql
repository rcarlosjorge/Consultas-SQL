DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda;
USE tienda;

CREATE TABLE fabricante (
  codigo INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio FLOAT NOT NULL,
  codigo_fabricante INT NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

SET IDENTITY_INSERT fabricante ON
INSERT INTO fabricante(codigo,nombre) VALUES(1, 'Asus');
INSERT INTO fabricante(codigo,nombre) VALUES(2, 'Lenovo');
INSERT INTO fabricante(codigo,nombre) VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante(codigo,nombre) VALUES(4, 'Samsung');
INSERT INTO fabricante(codigo,nombre) VALUES(5, 'Seagate');
INSERT INTO fabricante(codigo,nombre) VALUES(6, 'Crucial');
INSERT INTO fabricante(codigo,nombre) VALUES(7, 'Gigabyte');
INSERT INTO fabricante(codigo,nombre) VALUES(8, 'Huawei');
INSERT INTO fabricante(codigo,nombre) VALUES(9, 'Xiaomi');
SET IDENTITY_INSERT fabricante OFF

SET IDENTITY_INSERT producto ON
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
SET IDENTITY_INSERT producto OFF

--1.1.3 Consultas sobre una tabla--

--Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

--Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

--Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, (precio*0.89) as Euro, precio as Dollar FROM producto;

--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS 'Nombre de producto', (precio*0.89) AS Euros, (precio) AS Dólares FROM producto;

--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) AS Nombre, precio from producto;

--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) AS Nombre, precio from producto;

--Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) AS Siglas FROM fabricante;

--Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio,2) AS redondeando FROM producto;

--Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal
SELECT nombre, ROUND(precio,0) FROM producto;

--Lista el código de los fabricantes que tienen productos en la tabla producto
SELECT codigo_fabricante FROM producto;

--Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;

--Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre from fabricante ORDER BY nombre ASC;

--Lista los nombres de los fabricantes ordenados de forma descendente
SELECT nombre from fabricante ORDER BY nombre DESC;

--Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio from producto ORDER BY nombre ASC, precio DESC;

--Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT TOP(5) * from fabricante;

--Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT TOP(2) * FROM fabricante where codigo BETWEEN 4 AND 5;

--Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT TOP(1) nombre, precio FROM producto ORDER BY precio ASC;

--Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT TOP(1) nombre, precio FROM producto ORDER BY precio DESC;

--Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

--Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto WHERE precio <= 120;

--Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE precio >= 400;

--Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre FROM producto where precio > 80 AND precio < 300;

--Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre FROM producto where precio BETWEEN 60 AND 200;

--Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT nombre FROM producto where precio > 200 AND codigo_fabricante = 6;

--Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN
SELECT nombre FROM producto where codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

--Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT nombre FROM producto where codigo_fabricante IN (1,3,5);

--Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio*100 AS céntimos FROM producto;

--Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante where nombre LIKE 'S%';

--Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante where nombre LIKE '%e';

--Lista los nombres de los fabricantes cuyo nombre contenga el carácter w
SELECT nombre FROM fabricante where nombre LIKE '%w%';

--Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante where nombre LIKE '____';

--Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto where nombre LIKE '%Portátil%';

--Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre FROM producto where nombre LIKE '%Monitor%' AND precio < 215;

--Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto where precio >= 180 ORDER BY precio DESC, nombre ASC;


--1.1.4 Consultas multitabla (Composición interna)

--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante =  codigo_fabricante;

--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante =  codigo_fabricante ORDER BY fabricante.nombre ASC;

--Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT TOP(1) producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC;

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT TOP(1) producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC;

--Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo where fabricante.nombre LIKE '%Lenovo%'

--Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo where fabricante.nombre LIKE '%Crucial%' AND Producto.precio > 200;

--Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packardy' OR fabricante.nombre = 'Seagate';

--Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packardy', 'Seagate');

--Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE 'e%';

--Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';

--Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

--Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

--1.1.5 Consultas multitabla (Composición externa)

--Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT fabricante.codigo, fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante; 

--Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fabricante.codigo, fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante where NOT fabricante.codigo != producto.codigo_fabricante;

--1.1.6 Consultas resumen

--Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) AS Total FROM producto;

--Calcula el número total de fabricantes que hay en la tabla fabricante
SELECT COUNT(*) AS Total FROM fabricante;

--Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT codigo_fabricante) AS Total FROM producto;

--Calcula la media del precio de todos los productos
SELECT AVG(precio) AS Media FROM producto;

--Calcula el precio más barato de todos los productos.
SELECT MIN(precio) AS Barato FROM producto;

--Calcula el precio más caro de todos los productos.
SELECT MAX(precio) AS Caro FROM producto;

--Lista el nombre y el precio del producto más barato
SELECT nombre, precio AS Barato from producto where precio = (SELECT MIN(precio) from producto);

--Lista el nombre y el precio del producto más caro.
SELECT nombre, precio AS Caro FROM producto where precio = (SELECT MAX(precio) from producto);;

--Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) AS Suma FROM producto;

--Calcula el número de productos que tiene el fabricante Asus
SELECT COUNT(producto.codigo) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante  where fabricante.nombre = 'Asus';

--Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(producto.codigo) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante  where fabricante.nombre = 'Asus';

--Calcula el precio más barato de todos los productos del fabricante Asus
SELECT MIN(producto.precio) AS Barato FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante  where fabricante.nombre = 'Asus';

--Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(producto.precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante  where fabricante.nombre = 'Asus';

--Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(producto.precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante  where fabricante.nombre = 'Asus';

--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(producto.precio), MIN(producto.precio), AVG(producto.precio), COUNT(producto.precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante  where fabricante.nombre = 'Crucial';

--Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT COUNT(producto.codigo) FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.codigo ORDER BY fabricante.codigo DESC;

--Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio) FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre;

--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT codigo_fabricante, MAX(precio), MIN(precio), AVG(precio), COUNT(*) FROM producto GROUP BY codigo_fabricante HAVING AVG(precio) > 200;

--Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio), COUNT(*) FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre HAVING AVG(producto.precio) > 200;

--Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(*) FROM producto WHERE precio >= 180;

--Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT fabricante.nombre, COUNT(*) FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 GROUP BY fabricante.nombre;

--Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT AVG(precio), codigo_fabricante FROM producto GROUP BY codigo_fabricante;

--Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT AVG(precio), fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre;

--Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT AVG(precio), fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre HAVING AVG(precio) >= 150;

--Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre, COUNT(producto.codigo) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.nombre HAVING COUNT(producto.codigo) >= 2;

--Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT fabricante.nombre, COUNT(producto.codigo) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 220 GROUP BY fabricante.nombre ORDER BY 2 DESC;

--Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT fabricante.nombre, COUNT(*) FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE precio >= 220 GROUP BY fabricante.nombre;

--Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT fabricante.nombre, SUM(producto.precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.nombre HAVING SUM(producto.precio) > 1000;

--Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = fabricante.codigo) ORDER BY fabricante.nombre ASC;

--1.1.7 Subconsultas (En la cláusula WHERE)
--Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

--Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE producto.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

--Lista el nombre del producto más caro del fabricante Lenovo
SELECT producto.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' AND producto.precio = (SELECT MAX(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo');

--Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT producto.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard' AND producto.precio = ( SELECT MIN(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard');

--Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo');

--Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' AND producto.precio > (SELECT AVG(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus');

--1.1.7.2 Subconsultas con ALL y ANY
--Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto WHERE precio >= ALL (SELECT precio FROM producto);

--Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT * FROM producto WHERE precio <= ALL (SELECT precio FROM producto);

--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante WHERE codigo = ANY (SELECT codigo_fabricante FROM producto);

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante WHERE codigo != ALL (SELECT codigo_fabricante FROM producto);

--1.1.7.3 Subconsultas con IN y NOT IN
--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante WHERE codigo IN (SELECT codigo_fabricante FROM producto);

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante WHERE codigo NOT IN (SELECT codigo_fabricante FROM producto);

--1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante WHERE EXISTS (SELECT codigo_fabricante FROM producto WHERE producto.codigo_fabricante = fabricante.codigo);

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante WHERE NOT EXISTS (SELECT codigo_fabricante FROM producto WHERE producto.codigo_fabricante = fabricante.codigo);

--1.1.7.5 Subconsultas correlacionadas
--Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = fabricante.codigo);

--Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT * FROM producto AS p1 WHERE precio >= (SELECT AVG(precio) FROM producto AS p2 WHERE p1.codigo_fabricante = p2.codigo_fabricante);

--Lista el nombre del producto más caro del fabricante Lenovo.
SELECT producto.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' AND producto.precio = ( SELECT MAX(precio) FROM producto WHERE codigo_fabricante = fabricante.codigo);

--1.1.8 Subconsultas (En la cláusula HAVING)
--Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT fabricante.nombre, COUNT(producto.codigo) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.nombre HAVING COUNT(producto.codigo) >= (SELECT COUNT(producto.codigo) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo');

