
--Ejercicio 1.1 Tienda de informatica 

CREATE DATABASE tienda
USE tienda

CREATE TABLE fabricante(
	codigo int identity(1,1) primary key,
	nombre varchar(100) not null
)

CREATE TABLE producto(
	codigo int identity(1,1) primary key,
	nombre varchar(100) not null,
	precio float not null,
	codigo_fabricante int not null,
	FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
)

INSERT INTO fabricante(nombre) VALUES 
('Asus'), ('Lenovo'), ('Hewlett-Packard'),
('Samsung'),( 'Seagate'),( 'Crucial'),
('Gigabyte'),( 'Huawei'),( 'Xiaomi');

INSERT INTO producto(nombre, precio, codigo_fabricante) VALUES
('Disco duro SATA3 1TB', 86.99, 5),
('MemORia RAM DDR4 8GB', 120, 6),
('Disco SSD 1 TB', 150.99, 4),
('GeFORce GTX 1050Ti', 185, 7),
('GeFORce GTX 1080 Xtreme', 755, 6),
('MonitOR 24 LED Full HD', 202, 1),
('MonitOR 27 LED Full HD', 245.99, 1),
('PORtátil Yoga 520', 559, 2),
('PORtátil Ideapd 320', 444, 2),
( 'ImpresORa HP Deskjet 3720', 59.99, 3),
( 'ImpresORa HP Laserjet Pro M26nw', 180, 3);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.1.3 Consultas sobre una tabla
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto

-- Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto

-- Lista todas las columnas de la tabla producto.
SELECT * FROM producto

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, (precio/65) as Euro, (precio/57) as Dolars FROM producto

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre as 'Nombre del producto', (precio/65) as Euro, (precio/57) as Dolars FROM producto

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) as nombre, precio FROM producto

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) as nombre, precio FROM producto

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING (nombre, 1, 2)) as nombre FROM producto

--Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valOR del precio.
SELECT nombre, ROUND(precio, 2) FROM producto

-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valOR del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, ROUND(precio, 0) FROM producto

-- Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante FROM producto

-- Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto

-- Lista los nombres de los fabricantes ORdenados de fORma ASCendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC

-- Lista los nombres de los fabricantes ORdenados de fORma DESCendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC

-- Lista los nombres de los productos ORdenados en primer lugar pOR el nombre de fORma ASCendente y en segundo lugar pOR el precio de fORma DESCendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT TOP 5 * FROM fabricante 

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante WHERE codigo BETWEEN 4 AND 6

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT TOP 1 nombre, precio FROM producto ORDER BY precio ASC

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT TOP 1 nombre, precio FROM producto ORDER BY precio DESC

-- Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM fabricante WHERE codigo = 2

-- Lista el nombre de los productos que tienen un precio menOR o igual a 120€.
SELECT nombre, precio FROM producto WHERE precio <= 120

-- Lista el nombre de los productos que tienen un precio mayOR o igual a 400€.
SELECT nombre, precio FROM producto WHERE precio >= 400

-- Lista el nombre de los productos que no tienen un precio mayOR o igual a 400€.
SELECT nombre, precio FROM producto WHERE precio > 400

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre, precio FROM producto WHERE precio <= 300 AND 80 <= precio 

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre, precio FROM producto WHERE precio <= 200 AND 60 <= precio 

-- Lista todos los productos que tengan un precio mayOR que 200€ y que el código de fabricante sea igual a 6.
SELECT nombre, precio FROM producto WHERE precio >= 200 AND codigo_fabricante = 6

-- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT nombre, precio, codigo_fabricante FROM producto  WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5

-- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT nombre, precio, codigo_fabricante FROM producto WHERE codigo_fabricante IN (1,3,5)

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar pOR 100 el valOR del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, (precio*100) as Centimos FROM producto

-- Lista los nombres de los fabricantes cuyo nombre empiece pOR la letra S.
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%'

-- Lista los nombres de los fabricantes cuyo nombre termine pOR la vocal e.
SELECT nombre FROM fabricante WHERE nombre LIKE '%e'

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%'

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE nombre LIKE '____'

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena PORtátil en el nombre.
SELECT nombre FROM producto WHERE nombre LIKE '%PORtátil%' 

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena MonitOR en el nombre y tienen un precio inferiOR a 215 €.
SELECT nombre, precio FROM producto WHERE precio < 215 AND nombre LIKE '%Monitor%'

-- Lista el nombre y el precio de todos los productos que tengan un precio mayOR o igual a 180€. ORdene el resultado en primer lugar pOR el precio (en ORden DESCendente) y en segundo lugar pOR el nombre (en ORden ASCendente).
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY nombre ASC, precio DESC



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.1.4 Consultas multitabla (Composición interna)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. 
SELECT producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo

--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. ORdene el resultado pOR el nombre del fabricante, pOR ORden alfabético.
SELECT producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre 

--Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo as 'Codigo de producto', producto.nombre as Nombre, 
producto.codigo_fabricante as 'Codigo de fabricante', fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT TOP 1 producto.nombre as 'Nombre', precio as 'Precio', fabricante.nombre as fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT TOP 1 producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC

--Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo'

--Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayOR que 200€.
SELECT producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre = 'Crucial' and precio > 200

--Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy, Seagate. Sin utilizar el operador IN.
SELECT producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE producto.codigo_fabricante = 1 OR producto.codigo_fabricante = 3 OR producto.codigo_fabricante = 5 
ORDER BY fabricante.nombre

--Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE producto.codigo_fabricante IN (1,3,5) ORDER BY fabricante.nombre

--Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine pOR la vocal e.
SELECT fabricante.nombre as Fabricante, producto.nombre as Nombre, precio as Precio 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre LIKE '%e' ORDER BY fabricante.nombre

--Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT fabricante.nombre as Fabricante, producto.nombre as Nombre, precio as Precio 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre LIKE '%w%' ORDER BY fabricante.nombre

--Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayOR o igual a 180€. ORdene el resultado en primer lugar pOR el precio (en ORden DESCendente) y en segundo lugar pOR el nombre (en ORden ASCendente)
SELECT producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE precio >= 180 ORDER BY precio DESC
SELECT producto.nombre as Nombre, precio as Precio, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE precio >= 180 ORDER BY nombre ASC

--Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT distinct fabricante.codigo as 'Codigo de fabricante', fabricante.nombre as Fabricante 
FROM fabricante INNER JOIN producto on producto.codigo_fabricante = fabricante.codigo 
WHERE producto.codigo_fabricante IS NOT NULL



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.1.5 Consultas multitabla (Composición externa
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT fabricante.nombre as Fabricante, producto.nombre as Producto, producto.precio as Precio 
FROM fabricante  LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante 
ORDER BY fabricante.nombre

--Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fabricante.nombre as Fabricante, producto.nombre as Nombre, producto.precio as Precio 
FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante 
WHERE producto.codigo_fabricante IS NULL

--¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
-- No pueden existir productos que no estén relacionados con un fabricante
-- porque estan concatenados por una clave foranea que no es nula.



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.1.6 Consultas resumen
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) AS Cantidad_Productos FROM producto

--Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*) AS Cantidad_Fabricantes FROM fabricante

--Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT codigo_fabricante) AS Fabricantes FROM producto

--Calcula la media del precio de todos los productos.
SELECT AVG(precio) AS Media_Precio FROM producto

--Calcula el precio más barato de todos los productos.
SELECT MIN(precio) AS Precio_Mas_Barato FROM producto

--Calcula el precio más caro de todos los productos.
SELECT MAX(precio) AS Precio_Mas_Caro FROM producto

--Lista el nombre y el precio del producto más barato.
SELECT nombre, precio FROM producto WHERE precio = (SELECT MIN(precio) FROM producto)

--Lista el nombre y el precio del producto más caro.
SELECT nombre, precio FROM producto WHERE precio = (SELECT MAX(precio) FROM producto)

--Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) AS Suma_Precios FROM producto

--Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) AS Cantidad_Productos_Asus, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE producto.codigo_fabricante = 1 GROUP BY fabricante.nombre

--Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) AS Media_Precio_Asus, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE producto.codigo_fabricante = 1 GROUP BY fabricante.nombre

--Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) AS Precio_Mas_Barato_Asus, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE producto.codigo_fabricante = 1 GROUP BY fabricante.nombre

--Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio) AS Precio_Mas_Caro_Asus, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE producto.codigo_fabricante = 1 GROUP BY fabricante.nombre

--Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) AS Suma_Precios_Asus, fabricante.nombre as Fabricante 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE producto.codigo_fabricante = 1 GROUP BY fabricante.nombre

--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT Fabricante.nombre as Fabricante, MAX(precio) AS Precio_Maximo, 
MIN(precio) AS Precio_Minimo, AVG(precio) AS Precio_Medio, COUNT(*) AS Total_Productos 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE codigo_fabricante = 6 GROUP BY fabricante.nombre

--Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. ORdene el resultado DESCendentemente pOR el número de productos.
Select fabricante.nombre as Fabricante, COUNT(*)  as Cantidad_Productos 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
GROUP BY fabricante.nombre ORDER BY Cantidad_Productos DESC

--Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT fabricante.nombre as Fabricante, MAX(precio) as Precio_Maximo, 
MIN(precio) as Precio_Minimo, AVG(precio) as Precio_Medio FROM producto 
INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre

--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superiOR a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT codigo_fabricante as ID_Fabricante, MAX(precio) as Precio_Maximo, 
MIN(precio) as Precio_Minimo, AVG(precio) as Precio_Medio, COUNT(*) as Total_Productos 
FROM producto WHERE precio > 200 GROUP BY codigo_fabricante

--Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superiOR a 200€. Es necesario mostrar el nombre del fabricante.
SELECT fabricante.nombre as Fabricante, MAX(precio) as Precio_Maximo, 
MIN(precio) as Precio_Minimo, AVG(precio) as Precio_Medio, COUNT(*) as Total_Productos 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE precio > 200 GROUP BY fabricante.nombre

--Calcula el número de productos que tienen un precio mayOR o igual a 180€.
SELECT COUNT(*) as Total_Productos FROM producto WHERE precio >= 180

--Calcula el número de productos que tiene cada fabricante con un precio mayOR o igual a 180€.
SELECT fabricante.nombre as Fabricante, COUNT(*) as Total_Productos 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE precio >= 180 GROUP BY fabricante.nombre

--Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT codigo_fabricante as ID_Fabricante, AVG(precio) as Precio_Medio FROM producto GROUP BY codigo_fabricante

--Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT fabricante.nombre as Fabricante, AVG(precio) as Precio_Medio 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre

--Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayOR o igual a 150€.
SELECT fabricante.nombre as Fabricante FROM producto 
INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE precio >= 150 group by fabricante.nombre

--Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre as Fabricante FROM producto INNER JOIN fabricante 
on producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre HAVING COUNT(*) >= 2

--Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superiOR o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT fabricante.nombre as Fabricante, COUNT(*) as Total_Productos 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE precio >= 220 GROUP BY fabricante.nombre

--Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superiOR o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superiOR o igual a 220€ deberá aparecer en el listado con un valOR igual a 0 en el número de productos.
SELECT fabricante.nombre as Fabricante, COUNT(Case when producto.precio >=220 
Then fabricante.nombre else NULL END) as Total_Productos 
FROM fabricante left join producto on producto.codigo_fabricante = fabricante.codigo 
GROUP BY fabricante.nombre

--Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superiOR a 1000 €.
SELECT fabricante.nombre as Fabricante, SUM(precio) as Total_Precio 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
GROUP BY fabricante.nombre HAVING SUM(precio) > 1000

--Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ORdenado alfabéticamente de menOR a mayOR pOR el nombre del fabricante.
Select fabricante.nombre as Fabricante, producto.nombre as Producto, producto.precio as Precio 
FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo 
WHERE precio = (Select max(precio) FROM producto WHERE codigo_fabricante = fabricante.codigo) 
ORDER BY fabricante.nombre, producto.precio DESC



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.1.7 Subconsultas (En la cláusula WHERE)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1.1.7.1 Con operadores básicos de comparación

--Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto WHERE codigo_fabricante = 2

--Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2)

--Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2)

--Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = 3)

--Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2)

--Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto WHERE precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 1)


--1.1.7.2 Subconsultas con ALL y ANY

--Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto WHERE precio >= ALL(SELECT precio FROM producto)

--Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT * FROM producto WHERE precio <= ALL(SELECT precio FROM producto)

--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT fabricante.nombre FROM fabricante WHERE fabricante.codigo = ANY(SELECT codigo FROM producto)

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT fabricante.nombre FROM fabricante WHERE fabricante.codigo = ANY(SELECT fabricante.codigo FROM fabricante
LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.codigo IS NULL )

--1.1.7.3 Subconsultas con IN y NOT IN

--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante WHERE fabricante.codigo IN(SELECT codigo_fabricante FROM producto)

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante WHERE fabricante.codigo NOT IN(SELECT codigo_fabricante FROM producto)

--1.1.7.4 Subconsultas con EXISTS y NOT EXISTS

--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT fabricante.nombre FROM fabricante WHERE EXISTS (SELECT codigo_fabricante FROM producto WHERE producto.codigo_fabricante = fabricante.codigo)

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT fabricante.nombre FROM fabricante WHERE NOT EXISTS (SELECT codigo_fabricante FROM producto WHERE producto.codigo_fabricante = fabricante.codigo)

--1.1.7.5 Subconsultas correlacionadas

--Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT fabricante.nombre, producto.nombre, producto.precio
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio = (SELECT MAX(precio) FROM producto 
WHERE codigo_fabricante = fabricante.codigo)
ORDER BY precio

--Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT fabricante.nombre, producto.nombre, producto.precio
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio >= (SELECT AVG(precio) FROM producto 
WHERE codigo_fabricante = fabricante.codigo)
ORDER BY precio

--Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2)



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.1.8 Subconsultas (En la cláusula HAVING)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT fabricante.nombre AS 'Nombre', COUNT(producto.codigo) AS 'Cantidad de productos'
FROM fabricante INNER JOIN producto 
ON fabricante.codigo = producto.codigo_fabricante 
GROUP BY fabricante.codigo, fabricante.nombre
HAVING COUNT(producto.codigo) >= (SELECT COUNT(producto.codigo) FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo')
ORDER BY fabricante.nombre 
