

--Ejercicio 1.4 Jardineria 

DROP DATABASE IF EXISTS jardineria
CREATE DATABASE jardineria
USE jardineria

CREATE TABLE oficina (
  codigo_oficina VARCHAR(10) NOT NULL,
  ciudad VARCHAR(30) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado (
  codigo_empleado INTEGER NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) DEFAULT NULL,
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  codigo_oficina VARCHAR(10) NOT NULL,
  codigo_jefe INTEGER DEFAULT NULL,
  puesto VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE gama_producto (
  gama VARCHAR(50) NOT NULL,
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen VARCHAR(256),
  PRIMARY KEY (gama)
);

CREATE TABLE cliente (
  codigo_cliente INTEGER NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30) DEFAULT NULL,
  apellido_contacto VARCHAR(30) DEFAULT NULL,
  telefono VARCHAR(15) NOT NULL,
  fax VARCHAR(15) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  ciudad VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  pais VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  codigo_empleado_rep_ventAS INTEGER DEFAULT NULL,
  limite_credito NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado_rep_ventAS) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido (
  codigo_pedido INTEGER NOT NULL,
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado VARCHAR(15) NOT NULL,
  comentarios TEXT,
  codigo_cliente INTEGER NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE producto (
  codigo_producto VARCHAR(15) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  gama VARCHAR(50) NOT NULL,
  dimensiones VARCHAR(25) NULL,
  proveedor VARCHAR(50) DEFAULT NULL,
  descripcion text NULL,
  cantidad_en_stock SMALLINT NOT NULL,
  precio_venta NUMERIC(15,2) NOT NULL,
  precio_proveedor NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE detalle_pedido (
  codigo_pedido INTEGER NOT NULL,
  codigo_producto VARCHAR(15) NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad NUMERIC(15,2) NOT NULL,
  numero_linea SMALLINT NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);

CREATE TABLE pago (
  codigo_cliente INTEGER NOT NULL,
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago date NOT NULL,
  total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

-- Datos
INSERT INTO oficina (codigo_oficina,
ciudad,
pais,
region,
codigo_postal,
telefono,
linea_direccion1,
linea_direccion2) VALUES 
('BCN-ES','Barcelona','España','Barcelona','08019','+34 93 3561182','Avenida Diagonal, 38','3A escalera Derecha'),
('BOS-USA','Boston','EEUU','MA','02108','+1 215 837 0825','1550 Court Place','Suite 102'),
('LON-UK','Londres','Inglaterra','EMEA','EC2N 1HN','+44 20 78772041','52 Old Broad Street','Ground Floor'),
('MAD-ES','Madrid','España','Madrid','28032','+34 91 7514487','Bulevar Indalecio Prieto, 32',''),
('PAR-FR','Paris','Francia','EMEA','75017','+33 14 723 4404','29 Rue Jouffroy d''abbans',''),
('SFC-USA','San Francisco','EEUU','CA','94080','+1 650 219 4782','100 Market Street','Suite 300'),
('SYD-AU','Sydney','Australia','APAC','NSW 2010','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2'),
('TAL-ES','Talavera de la Reina','España','CAStilla-LaMancha','45632','+34 925 867231','Francisco Aguirre, 32','5º piso (exterior)'),
('TOK-JP','Tokyo','Japón','Chiyoda-Ku','102-8578','+81 33 224 5000','4-1 Kioicho','');

INSERT INTO empleado (codigo_empleado,
nombre,
apellido1,
apellido2,
extension,
email,
codigo_oficina,
codigo_jefe,
puesto) VALUES 
(1,'Marcos','Magaña','Perez','3897','marcos@jardineria.es','TAL-ES',NULL,'Director General'),
(2,'Ruben','López','Martinez','2899','rlopez@jardineria.es','TAL-ES',1,'Subdirector Marketing'),
(3,'Alberto','Soria','CarrASco','2837','ASoria@jardineria.es','TAL-ES',2,'Subdirector VentAS'),
(4,'Maria','Solís','Jerez','2847','msolis@jardineria.es','TAL-ES',2,'Secretaria'),
(5,'Felipe','RosAS','Marquez','2844','frosAS@jardineria.es','TAL-ES',3,'Representante VentAS'),
(6,'Juan Carlos','Ortiz','Serrano','2845','cortiz@jardineria.es','TAL-ES',3,'Representante VentAS'),
(7,'Carlos','Soria','Jimenez','2444','csoria@jardineria.es','MAD-ES',3,'Director Oficina'),
(8,'Mariano','López','Murcia','2442','mlopez@jardineria.es','MAD-ES',7,'Representante VentAS'),
(9,'Lucio','Campoamor','Martín','2442','lcampoamor@jardineria.es','MAD-ES',7,'Representante VentAS'),
(10,'Hilario','Rodriguez','HuertAS','2444','hrodriguez@jardineria.es','MAD-ES',7,'Representante VentAS'),
(11,'Emmanuel','Magaña','Perez','2518','manu@jardineria.es','BCN-ES',3,'Director Oficina'),
(12,'José Manuel','Martinez','De la Osa','2519','jmmart@hotmail.es','BCN-ES',11,'Representante VentAS'),
(13,'David','Palma','Aceituno','2519','dpalma@jardineria.es','BCN-ES',11,'Representante VentAS'),
(14,'Oscar','Palma','Aceituno','2519','opalma@jardineria.es','BCN-ES',11,'Representante VentAS'),
(15,'Francois','Fignon','','9981','ffignon@gardening.com','PAR-FR',3,'Director Oficina'),
(16,'Lionel','Narvaez','','9982','lnarvaez@gardening.com','PAR-FR',15,'Representante VentAS'),
(17,'Laurent','Serra','','9982','lserra@gardening.com','PAR-FR',15,'Representante VentAS'),
(18,'Michael','Bolton','','7454','mbolton@gardening.com','SFC-USA',3,'Director Oficina'),
(19,'Walter Santiago','Sanchez','Lopez','7454','wssanchez@gardening.com','SFC-USA',18,'Representante VentAS'),
(20,'Hilary','WAShington','','7565','hwAShington@gardening.com','BOS-USA',3,'Director Oficina'),
(21,'Marcus','Paxton','','7565','mpaxton@gardening.com','BOS-USA',20,'Representante VentAS'),
(22,'Lorena','Paxton','','7665','lpaxton@gardening.com','BOS-USA',20,'Representante VentAS'),
(23,'Nei','Nishikori','','8734','nnishikori@gardening.com','TOK-JP',3,'Director Oficina'),
(24,'Narumi','Riko','','8734','nriko@gardening.com','TOK-JP',23,'Representante VentAS'),
(25,'Takuma','Nomura','','8735','tnomura@gardening.com','TOK-JP',23,'Representante VentAS'),
(26,'Amy','Johnson','','3321','ajohnson@gardening.com','LON-UK',3,'Director Oficina'),
(27,'Larry','Westfalls','','3322','lwestfalls@gardening.com','LON-UK',26,'Representante VentAS'),
(28,'John','Walton','','3322','jwalton@gardening.com','LON-UK',26,'Representante VentAS'),
(29,'Kevin','Fallmer','','3210','kfalmer@gardening.com','SYD-AU',3,'Director Oficina'),
(30,'Julian','Bellinelli','','3211','jbellinelli@gardening.com','SYD-AU',29,'Representante VentAS'),
(31,'Mariko','Kishi','','3211','mkishi@gardening.com','SYD-AU',29,'Representante VentAS');

INSERT INTO gama_producto (gama,
descripcion_texto,
descripcion_html,
imagen) VALUES 
('HerbaceAS','PlantAS para jardin decorativAS',NULL,NULL),
('HerramientAS','HerramientAS para todo tipo de acción',NULL,NULL),
('AromáticAS','PlantAS aromáticAS',NULL,NULL),
('Frutales','Árboles pequeños de producción frutal',NULL,NULL),
('Ornamentales','PlantAS vistosAS para la decoración del jardín',NULL,NULL);

INSERT INTO cliente (codigo_cliente,
nombre_cliente,
nombre_contacto,
apellido_contacto,
telefono,
fax,
linea_direccion1,
linea_direccion2,
ciudad,
region,
pais,
codigo_postal,
codigo_empleado_rep_ventAS,
limite_credito) VALUES 
(1,'GoldFish Garden','Daniel G','GoldFish','5556901745','5556901746','False Street 52 2 A',NULL,'San Francisco',NULL,'USA','24006',19,3000),
(3,'Gardening ASsociates','Anne','WRIGHT','5557410345','5557410346','Wall-e Avenue',NULL,'Miami','Miami','USA','24010',19,6000),
(4,'Gerudo Valley','Link','Flaute','5552323129','5552323128','Oaks Avenue nº22',NULL,'New York',NULL,'USA','85495',22,12000),
(5,'Tendo Garden','Akane','Tendo','55591233210','55591233211','NULL Street nº69',NULL,'Miami',NULL,'USA','696969',22,600000),
(6,'LASAS S.A.','Antonio','LASAS','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310),
(7,'Beragua','Jose','Bermejo','654987321','916549872','C/pintor segundo','Getafe','Madrid','Madrid','Spain','28942',11,20000),
(8,'Club Golf Puerta del hierro','Paco','Lopez','62456810','919535678','C/sinesio delgado','Madrid','Madrid','Madrid','Spain','28930',11,40000),
(9,'Naturagua','Guillermo','Rengifo','689234750','916428956','C/majadahonda','Boadilla','Madrid','Madrid','Spain','28947',11,32000),
(10,'DaraDistribuciones','David','Serrano','675598001','916421756','C/azores','Fuenlabrada','Madrid','Madrid','Spain','28946',11,50000),
(11,'Madrileña de riegos','Jose','Tacaño','655983045','916689215','C/LagañAS','Fuenlabrada','Madrid','Madrid','Spain','28943',11,20000),
(12,'LASAS S.A.','Antonio','LASAS','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310),
(13,'CamunAS Jardines S.L.','Pedro','CamunAS','34914873241','34914871541','C/Virgenes 45','C/PrincesAS 2 1ºB','San Lorenzo del Escorial','Madrid','Spain','28145',8,16481),
(14,'Dardena S.A.','Juan','Rodriguez','34912453217','34912484764','C/Nueva York 74',NULL,'Madrid','Madrid','Spain','28003',8,321000),
(15,'Jardin de Flores','Javier','Villar','654865643','914538776','C/ Oña 34',NULL,'Madrid','Madrid','Spain','28950',30,40000),
(16,'Flores Marivi','Maria','Rodriguez','666555444','912458657','C/Leganes24',NULL,'Fuenlabrada','Madrid','Spain','28945',5,1500),
(17,'Flowers, S.A','Beatriz','Fernandez','698754159','978453216','C/Luis Salquillo4',NULL,'Montornes del valles','Barcelona','Spain','24586',5,3500),
(18,'Naturajardin','Victoria','Cruz','612343529','916548735','Plaza Magallón 15',NULL,'Madrid','Madrid','Spain','28011',30,5050),
(19,'Golf S.A.','Luis','Martinez','916458762','912354475','C/Estancado',NULL,'Santa cruz de Tenerife','IslAS CanariAS','Spain','38297',12,30000),
(20,'Americh Golf Management SL','Mario','Suarez','964493072','964493063','C/Letardo',NULL,'Barcelona','Cataluña','Spain','12320',12,20000),
(21,'Aloha','Cristian','Rodrigez','916485852','914489898','C/Roman 3',NULL,'CanariAS','CanariAS','Spain','35488',12,50000),
(22,'El Prat','Francisco','Camacho','916882323','916493211','Avenida Tibidabo',NULL,'Barcelona','Cataluña','Spain','12320',12,30000),
(23,'Sotogrande','Maria','Santillana','915576622','914825645','C/PASeo del Parque',NULL,'Sotogrande','Cadiz','Spain','11310',12,60000),
(24,'Vivero Humanes','Federico','Gomez','654987690','916040875','C/Miguel Echegaray 54',NULL,'Humanes','Madrid','Spain','28970',30,7430),
(25,'Fuenla City','Tony','Muñoz Mena','675842139','915483754','C/Callo 52',NULL,'Fuenlabrada','Madrid','Spain','28574',5,4500),
(26,'Jardines y Mansiones Cactus SL','Eva María','Sánchez','916877445','914477777','Polígono Industrial MASpalomAS, Nº52','Móstoles','Madrid','Madrid','Spain','29874',9,76000),
(27,'JardineríAS MatíAS SL','MatíAS','San Martín','916544147','917897474','C/Francisco Arce, Nº44','Bustarviejo','Madrid','Madrid','Spain','37845',9,100500),
(28,'Agrojardin','Benito','Lopez','675432926','916549264','C/Mar CASpio 43',NULL,'Getafe','Madrid','Spain','28904',30,8040),
(29,'Top Campo','Joseluis','Sanchez','685746512','974315924','C/Ibiza 32',NULL,'Humanes','Madrid','Spain','28574',5,5500),
(30,'Jardineria Sara','Sara','Marquez','675124537','912475843','C/Lima 1',NULL,'Fuenlabrada','Madrid','Spain','27584',5,7500),
(31,'Campohermoso','Luis','Jimenez','645925376','916159116','C/Peru 78',NULL,'Fuenlabrada','Madrid','Spain','28945',30,3250),
(32,'france telecom','FraÃ§ois','Toulou','(33)5120578961','(33)5120578961','6 place d Alleray 15Ã¨me',NULL,'Paris',NULL,'France','75010',16,10000),
(33,'Musée du Louvre','Pierre','Delacroux','(33)0140205050','(33)0140205442','Quai du Louvre',NULL,'Paris',NULL,'France','75058',16,30000),
(35,'Tutifruti S.A','Jacob','Jones','2 9261-2433','2 9283-1695','level 24, St. Martins Tower.-31 Market St.',NULL,'Sydney','Nueva Gales del Sur','Australia','2000',31,10000),
(36,'Flores S.L.','Antonio','Romero','654352981','685249700','Avenida España',NULL,'Madrid','Fuenlabrada','Spain','29643',18,6000),
(37,'The Magic Garden','Richard','Mcain','926523468','9364875882','Lihgting Park',NULL,'London','London','United Kingdom','65930',18,10000),
(38,'El Jardin Viviente S.L','Justin','Smith','2 8005-7161','2 8005-7162','176 Cumberland Street The rocks',NULL,'Sydney','Nueva Gales del Sur','Australia','2003',31,8000);

INSERT INTO pedido (codigo_pedido,
fecha_pedido,
fecha_esperada,
fecha_entrega,
estado,
comentarios,
codigo_cliente) VALUES 
 (1,'2006-01-17','2006-01-19','2006-01-19','Entregado','Pagado a plazos',5),
 (2,'2007-10-23','2007-10-28','2007-10-26','Entregado','La entrega llego antes de lo esperado',5),
 (3,'2008-06-20','2008-06-25',NULL,'Rechazado','Limite de credito superado',5),
 (4,'2009-01-20','2009-01-26',NULL,'Pendiente',NULL,5),
 (8,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturAS',1),
 (9,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1),
 (10,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3),
 (11,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1),
 (12,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1),
 (13,'2009-01-12','2009-01-14','2009-01-15','Entregado',NULL,7),
 (14,'2009-01-02','2009-01-02',NULL,'Rechazado','mal pago',7),
 (15,'2009-01-09','2009-01-12','2009-01-11','Entregado',NULL,7),
 (16,'2009-01-06','2009-01-07','2009-01-15','Entregado',NULL,7),
 (17,'2009-01-08','2009-01-09','2009-01-11','Entregado','mal estado',7),
 (18,'2009-01-05','2009-01-06','2009-01-07','Entregado',NULL,9),
 (19,'2009-01-18','2009-02-12',NULL,'Pendiente','entregar en murcia',9),
 (20,'2009-01-20','2009-02-15',NULL,'Pendiente',NULL,9),
 (21,'2009-01-09','2009-01-09','2009-01-09','Rechazado','mal pago',9),
 (22,'2009-01-11','2009-01-11','2009-01-13','Entregado',NULL,9),
 (23,'2008-12-30','2009-01-10',NULL,'Rechazado','El pedido fue anulado por el cliente',5),
 (24,'2008-07-14','2008-07-31','2008-07-25','Entregado',NULL,14),
 (25,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta ASociada',1),
 (26,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mAS producto',3),
 (27,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3),
 (28,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bAStante de la espera ASociada al producto',3),
 (29,'2008-08-01','2008-09-01','2008-09-01','Rechazado','El cliente no está conforme con el pedido',14),
 (30,'2008-08-03','2008-09-03','2008-08-31','Entregado',NULL,13),
 (31,'2008-09-04','2008-09-30','2008-10-04','Rechazado','El cliente ha rechazado por llegar 5 diAS tarde',13),
 (32,'2007-01-07','2007-01-19','2007-01-27','Entregado','Entrega tardia, el cliente puso reclamacion',4),
 (33,'2007-05-20','2007-05-28',NULL,'Rechazado','El pedido fue anulado por el cliente',4),
 (34,'2007-06-20','2008-06-28','2008-06-28','Entregado','Pagado a plazos',4),
 (35,'2008-03-10','2009-03-20',NULL,'Rechazado','Limite de credito superado',4),
 (36,'2008-10-15','2008-12-15','2008-12-10','Entregado',NULL,14),
 (37,'2008-11-03','2009-11-13',NULL,'Pendiente','El pedido nunca llego a su destino',4),
 (38,'2009-03-05','2009-03-06','2009-03-07','Entregado',NULL,19),
 (39,'2009-03-06','2009-03-07','2009-03-09','Pendiente',NULL,19),
 (40,'2009-03-09','2009-03-10','2009-03-13','Rechazado',NULL,19),
 (41,'2009-03-12','2009-03-13','2009-03-13','Entregado',NULL,19),
 (42,'2009-03-22','2009-03-23','2009-03-27','Entregado',NULL,19),
 (43,'2009-03-25','2009-03-26','2009-03-28','Pendiente',NULL,23),
 (44,'2009-03-26','2009-03-27','2009-03-30','Pendiente',NULL,23),
 (45,'2009-04-01','2009-03-04','2009-03-07','Entregado',NULL,23),
 (46,'2009-04-03','2009-03-04','2009-03-05','Rechazado',NULL,23),
 (47,'2009-04-15','2009-03-17','2009-03-17','Entregado',NULL,23),
 (48,'2008-03-17','2008-03-30','2008-03-29','Entregado','Según el Cliente, el pedido llegó defectuoso',26),
 (49,'2008-07-12','2008-07-22','2008-07-30','Entregado','El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora',26),
 (50,'2008-03-17','2008-08-09',NULL,'Pendiente','Al parecer, el pedido se ha extraviado a la altura de Sotalbo (Ávila)',26),
 (51,'2008-10-01','2008-10-14','2008-10-14','Entregado','Todo se entregó a tiempo y en perfecto estado, a pesar del pésimo estado de lAS carreterAS.',26),
 (52,'2008-12-07','2008-12-21',NULL,'Pendiente','El transportista ha llamado a Eva María para indicarle que el pedido llegará más tarde de lo esperado.',26),
 (53,'2008-10-15','2008-11-15','2008-11-09','Entregado','El pedido llega 6 diAS antes',13),
 (54,'2009-01-11','2009-02-11',NULL,'Pendiente',NULL,14),
 (55,'2008-12-10','2009-01-10','2009-01-11','Entregado','RetrASado 1 dia por problemAS de transporte',14),
 (56,'2008-12-19','2009-01-20',NULL,'Rechazado','El cliente a anulado el pedido el dia 2009-01-10',13),
 (57,'2009-01-05','2009-02-05',NULL,'Pendiente',NULL,13),
 (58,'2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',3),
 (59,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturAS',1),
 (60,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1),
 (61,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3),
 (62,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1),
 (63,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1),
 (64,'2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',1),
 (65,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta ASociada',1),
 (66,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mAS producto',3),
 (67,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3),
 (68,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bAStante de la espera ASociada al producto',3),
 (74,'2009-01-14','2009-01-22',NULL,'Rechazado','El pedido no llego el dia que queria el cliente por fallo del transporte',15),
 (75,'2009-01-11','2009-01-13','2009-01-13','Entregado','El pedido llego perfectamente',15),
 (76,'2008-11-15','2008-11-23','2008-11-23','Entregado',NULL,15),
 (77,'2009-01-03','2009-01-08',NULL,'Pendiente','El pedido no pudo ser entregado por problemAS meteorologicos',15),
 (78,'2008-12-15','2008-12-17','2008-12-17','Entregado','Fue entregado, pero faltaba mercancia que sera entregada otro dia',15),
 (79,'2009-01-12','2009-01-13','2009-01-13','Entregado',NULL,28),
 (80,'2009-01-25','2009-01-26',NULL,'Pendiente','No terminó el pago',28),
 (81,'2009-01-18','2009-01-24',NULL,'Rechazado','Los producto estaban en mal estado',28),
 (82,'2009-01-20','2009-01-29','2009-01-29','Entregado','El pedido llego un poco mAS tarde de la hora fijada',28),
 (83,'2009-01-24','2009-01-28',NULL,'Entregado',NULL,28),
 (89,'2007-10-05','2007-12-13','2007-12-10','Entregado','La entrega se realizo diAS antes de la fecha esperada por lo que el cliente quedo satisfecho',35),
 (90,'2009-02-07','2008-02-17',NULL,'Pendiente','Debido a la nevada caída en la sierra, el pedido no podrá llegar hASta el día ',27),
 (91,'2009-03-18','2009-03-29','2009-03-27','Entregado','Todo se entregó a su debido tiempo, incluso con un día de antelación',27),
 (92,'2009-04-19','2009-04-30','2009-05-03','Entregado','El pedido se entregó tarde debido a la festividad celebrada en España durante esAS fechAS',27),
 (93,'2009-05-03','2009-05-30','2009-05-17','Entregado','El pedido se entregó antes de lo esperado.',27),
 (94,'2009-10-18','2009-11-01',NULL,'Pendiente','El pedido está en camino.',27),
 (95,'2008-01-04','2008-01-19','2008-01-19','Entregado',NULL,35),
 (96,'2008-03-20','2008-04-12','2008-04-13','Entregado','La entrega se retrASo un dia',35),
 (97,'2008-10-08','2008-11-25','2008-11-25','Entregado',NULL,35),
 (98,'2009-01-08','2009-02-13',NULL,'Pendiente',NULL,35),
 (99,'2009-02-15','2009-02-27',NULL,'Pendiente',NULL,16),
 (100,'2009-01-10','2009-01-15','2009-01-15','Entregado','El pedido llego perfectamente',16),
 (101,'2009-03-07','2009-03-27',NULL,'Rechazado','El pedido fue rechazado por el cliente',16),
 (102,'2008-12-28','2009-01-08','2009-01-08','Entregado','Pago pendiente',16),
 (103,'2009-01-15','2009-01-20','2009-01-24','Pendiente',NULL,30),
 (104,'2009-03-02','2009-03-06','2009-03-06','Entregado',NULL,30),
 (105,'2009-02-14','2009-02-20',NULL,'Rechazado','el producto ha sido rechazado por la pesima calidad',30),
 (106,'2009-05-13','2009-05-15','2009-05-20','Pendiente',NULL,30),
 (107,'2009-04-06','2009-04-10','2009-04-10','Entregado',NULL,30),
 (108,'2009-04-09','2009-04-15','2009-04-15','Entregado',NULL,16),
 (109,'2006-05-25','2006-07-28','2006-07-28','Entregado',NULL,38),
 (110,'2007-03-19','2007-04-24','2007-04-24','Entregado',NULL,38),
 (111,'2008-03-05','2008-03-30','2008-03-30','Entregado',NULL,36),
 (112,'2009-03-05','2009-04-06','2009-05-07','Pendiente',NULL,36),
 (113,'2008-10-28','2008-11-09','2009-01-09','Rechazado','El producto ha sido rechazado por la tardanza de el envio',36),
 (114,'2009-01-15','2009-01-29','2009-01-31','Entregado','El envio llego dos diAS más tarde debido al mal tiempo',36),
 (115,'2008-11-29','2009-01-26','2009-02-27','Pendiente',NULL,36),
 (116,'2008-06-28','2008-08-01','2008-08-01','Entregado',NULL,38),
 (117,'2008-08-25','2008-10-01',NULL,'Rechazado','El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente',38),
 (118,'2009-02-15','2009-02-27',NULL,'Pendiente',NULL,16),
 (119,'2009-01-10','2009-01-15','2009-01-15','Entregado','El pedido llego perfectamente',16),
 (120,'2009-03-07','2009-03-27',NULL,'Rechazado','El pedido fue rechazado por el cliente',16),
 (121,'2008-12-28','2009-01-08','2009-01-08','Entregado','Pago pendiente',16),
 (122,'2009-04-09','2009-04-15','2009-04-15','Entregado',NULL,16),
 (123,'2009-01-15','2009-01-20','2009-01-24','Pendiente',NULL,30),
 (124,'2009-03-02','2009-03-06','2009-03-06','Entregado',NULL,30),
 (125,'2009-02-14','2009-02-20',NULL,'Rechazado','el producto ha sido rechazado por la pesima calidad',30),
 (126,'2009-05-13','2009-05-15','2009-05-20','Pendiente',NULL,30),
 (127,'2009-04-06','2009-04-10','2009-04-10','Entregado',NULL,30),
 (128,'2008-11-10','2008-12-10','2008-12-29','Rechazado','El pedido ha sido rechazado por el cliente por el retrASo en la entrega',38);


 INSERT INTO producto(codigo_producto,
 nombre,
 gama,
 dimensiones,
 proveedor,
 descripcion,
 cantidad_en_stock ,
 precio_venta,
 precio_proveedor) VALUES 
 ('11679','Sierra de Poda 400MM','HerramientAS','0,258','HiperGarden Tools','GraciAS a la poda se consigue manipular un poco la naturaleza, dándole la forma que más nos guste. Este trabajo básico de jardinería también facilita que lAS plantAS crezcan de un modo más equilibrado, y que lAS flores y los frutos vuelvan cada año con regularidad. Lo mejor es dar forma cuando los ejemplares son jóvenes, de modo que exijan pocos cuidados cuando sean adultos. Además de saber cuándo y cómo hay que podar, tener unAS herramientAS adecuadAS para esta labor es también de vital importancia.',15,14,11),
('21636','Pala','HerramientAS','0,156','HiperGarden Tools','PalAS de acero con cresta de corte en la punta para cortar bien el terreno. Buena penetración en tierrAS muy compactAS.',15,14,13),
('22225','RAStrillo de Jardín','HerramientAS','1,064','HiperGarden Tools','Fabuloso rAStillo que le ayudará a eliminar piedrAS, hojAS, ramAS y otros elementos incómodos en su jardín.',15,12,11),
('30310','Azadón','HerramientAS','0,168','HiperGarden Tools','Longitud:24cm. Herramienta fabricada en acero y pintura epoxi,alargando su durabilidad y preveniendo la corrosión.Diseño pensado para el ahorro de trabajo.',15,12,11),
('AR-001','Ajedrea','AromáticAS','15-20','Murcia SeASons','Planta aromática que fresca se utiliza para condimentar carnes y ensaladAS, y seca, para pAStAS, sopAS y guisantes',140,1,0),
('AR-002','Lavándula Dentata','AromáticAS','15-20','Murcia SeASons','Espliego de jardín, Alhucema rizada, Alhucema dentada, Cantueso rizado. Familia: Lamiaceae.Origen: España y Portugal. Mata de unos 60 cm de alto. LAS hojAS son aromáticAS, dentadAS y de color verde grisáceAS.  Produce compactAS espigAS de flores pequeñAS, ligeramente aromáticAS, tubulares,de color azulado y con brácteAS púrpurAS.  Frutos: nuececillAS alargadAS encerradAS en el tubo del cáliz.  Se utiliza en jardineria y no en perfumeria como otros cantuesos, espliegos y lavandAS.  Tiene propiedades aromatizantes y calmantes. AdecuadAS para la formación de setos bajos. Se dice que su aroma ahuyenta pulgones y otros insectos perjudiciales para lAS plantAS vecinAS.',140,1,0),
('AR-003','Mejorana','AromáticAS','15-20','Murcia SeASons','Origanum majorana. No hay que confundirlo con el orégano. Su sabor se parece más al tomillo, pero es más dulce y aromático.Se usan lAS hojAS frescAS o secAS, picadAS, machacadAS o en polvo, en sopAS, rellenos, quiches y tartAS, tortillAS, platos con papAS y, como aderezo, en ramilletes de hierbAS.El sabor delicado de la mejorana se elimina durante la cocción, de manera que es mejor agregarla cuando el plato esté en su punto o en aquéllos que apenAS necesitan cocción.',140,1,0),
('AR-004','Melissa ','AromáticAS','15-20','Murcia SeASons','Es una planta perenne (dura varios años) conocida por el agradable y característico olor a limón que desprenden en verano. Nunca debe faltar en la huerta o jardín por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy fácil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horAS de sol por día. Cada año, su abonado mineral correspondiente.En otoño, la melisa pierde el agradable olor a limón que desprende en verano sus flores azules y blancAS. En este momento se debe cortar a unos 20 cm. del suelo. Brotará de forma densa en primavera.',140,1,0),
('AR-005','Mentha Sativa','AromáticAS','15-20','Murcia SeASons','¿Quién no conoce la Hierbabuena? Se trata de una plantita muy aromática, agradable y cultivada extensamente por toda España. Es hierba perenne (por tanto vive varios años, no es anual). Puedes cultivarla en maceta o plantarla en la tierra del jardín o en un rincón del huerto. Lo más importante es que cuente con bAStante agua. En primavera debes aportar fertilizantes minerales. Vive mejor en semisombra que a pleno sol.Si ves orugAS o los agujeros en hojAS consecuencia de su ataque, retíralAS una a una a mano, no uses insecticidAS químicos.',140,1,0),
('AR-006','Petrosilium Hortense (Peregil)','AromáticAS','15-20','Murcia SeASons','Nombre científico o latino: Petroselinum hortense, Petroselinum crispum. Nombre común o vulgar: Perejil, Perejil rizado Familia: Umbelliferae (UmbelíferAS). Origen: el origen del perejil se encuentra en el Mediterraneo. Esta naturalizada en cASi toda Europa. Se utiliza como condimento y para adorno, pero también en ensaladAS. Se suele regalar en lAS fruteríAS y verduleríAS.El perejil lo hay de 2 tipos: de hojAS planAS y de hojAS rizadAS.',140,1,0),
('AR-007','Salvia Mix','AromáticAS','15-20','Murcia SeASons','La Salvia es un pequeño arbusto que llega hASta el metro de alto.Tiene una vida breve, de unos pocos años.En el jardín, como otrAS aromáticAS, queda muy bien en una rocalla o para hacer una bordura perfumada a cada lado de un camino de Salvia. Abona después de cada corte y recorta el arbusto una vez pASe la floración.',140,1,0),
('AR-008','Thymus Citriodra (Tomillo limón)','AromáticAS','15-20','Murcia SeASons','Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (LabiadAS).Origen: Región mediterránea.Arbustillo bajo, de 15 a 40 cm de altura. LAS hojAS son muy pequeñAS, de unos 6 mm de longitud, según la variedad pueden ser verdes, verdes grisáceAS, amarillAS, o jASpeadAS. LAS flores aparecen de mediados de primavera hASta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancAS. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispAS y abejAS. En jardinería se usa como manchAS, para hacer bordurAS, para aromatizar el ambiente, llenar huecos, cubrir rocAS, para jardines en miniatura, etc. Arranque lAS flores y hojAS secAS del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbAS o en la almohada.También puede usar lAS ramAS secAS con flores para añadir aroma y textura a cestos abiertos.',140,1,0),
('AR-009','Thymus Vulgaris','AromáticAS','15-20','Murcia SeASons','Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (LabiadAS). Origen: Región mediterránea. Arbustillo bajo, de 15 a 40 cm de altura. LAS hojAS son muy pequeñAS, de unos 6 mm de longitud, según la variedad pueden ser verdes, verdes grisáceAS, amarillAS, o jASpeadAS. LAS flores aparecen de mediados de primavera hASta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancAS. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispAS y abejAS.\r\n En jardinería se usa como manchAS, para hacer bordurAS, para aromatizar el ambiente, llenar huecos, cubrir rocAS, para jardines en miniatura, etc. Arranque lAS flores y hojAS secAS del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbAS o en la almohada. También puede usar lAS ramAS secAS con flores para añadir aroma y textura a cestos abiertos.',140,1,0),
('AR-010','Santolina Chamaecyparys','AromáticAS','15-20','Murcia SeASons','',140,1,0),
('FR-1','Expositor Cítricos Mix','Frutales','100-120','Frutales Talavera S.A','',15,7,5),
('FR-10','Limonero 2 años injerto','Frutales','','NaranjASValencianAS.com','El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste ASiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosAS modificaciones debidAS tanto a la selección natural mediante hibridaciones espontáneAS como a lAS producidAS por el hombre, en este cASo buscando lAS necesidades del mercado.',15,7,5),
('FR-100','Nectarina','Frutales','8/10','Frutales Talavera S.A','Se trata de un árbol derivado por mutación de los melocotoneros comunes, y los únicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unAS dimensiones mediAS de 4-6 metros',50,11,8),
('FR-101','Nogal','Frutales','8/10','Frutales Talavera S.A','',50,13,10),
('FR-102','Olea-Olivos','Frutales','8/10','Frutales Talavera S.A','Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de lAS costAS de Siria, Líbano e Israel y otra que considera que lo considera originario de ASia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e IslAS del Mar Egeo, pASando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en lAS costAS mediterráneAS españolAS coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.',50,18,14),
('FR-103','Olea-Olivos','Frutales','10/12','Frutales Talavera S.A','Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de lAS costAS de Siria, Líbano e Israel y otra que considera que lo considera originario de ASia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e IslAS del Mar Egeo, pASando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en lAS costAS mediterráneAS españolAS coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.',50,25,20),
('FR-104','Olea-Olivos','Frutales','12/4','Frutales Talavera S.A','Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de lAS costAS de Siria, Líbano e Israel y otra que considera que lo considera originario de ASia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e IslAS del Mar Egeo, pASando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en lAS costAS mediterráneAS españolAS coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.',50,49,39),
('FR-105','Olea-Olivos','Frutales','14/16','Frutales Talavera S.A','Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de lAS costAS de Siria, Líbano e Israel y otra que considera que lo considera originario de ASia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e IslAS del Mar Egeo, pASando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en lAS costAS mediterráneAS españolAS coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.',50,70,56),
('FR-106','Peral','Frutales','8/10','Frutales Talavera S.A','Árbol piramidal, redondeado en su juventud, luego oval, que llega hASta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placAS lenticulares.LAS ramAS se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosAS lenticelAS.',50,11,8),
('FR-107','Peral','Frutales','10/12','Frutales Talavera S.A','Árbol piramidal, redondeado en su juventud, luego oval, que llega hASta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placAS lenticulares.LAS ramAS se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosAS lenticelAS.',50,22,17),
('FR-108','Peral','Frutales','12/14','Frutales Talavera S.A','Árbol piramidal, redondeado en su juventud, luego oval, que llega hASta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placAS lenticulares.LAS ramAS se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosAS lenticelAS.',50,32,25),
('FR-11','Limonero 30/40','Frutales','','NaranjASValencianAS.com','El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste ASiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosAS modificaciones debidAS tanto a la selección natural mediante hibridaciones espontáneAS como a lAS producidAS por el',15,100,80),
('FR-12','Kunquat ','Frutales','','NaranjASValencianAS.com','su nombre científico se origina en honor a un hoticultor escocés que recolectó especímenes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y \"margarita\", del latín margaritus-a-um = perla, en alusión a sus pequeños y brillantes frutos. Se trata de un arbusto o árbol pequeño de 2-3 m de altura, inerme o con escASAS espinAS.HojAS lanceoladAS de 4-8 (-15) cm de longitud, con el ápice redondeado y la bASe cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el envés más pálido.Pecíolo ligeramente marginado.Flores perfumadAS solitariAS o agrupadAS en inflorescenciAS axilares, blancAS.El fruto es lo más característico, es el más pequeño de todos los cítricos y el único cuya cáscara se puede comer.Frutos pequeños, con semillAS, de corteza fina, dulce, aromática y comestible, y de pulpa naranja amarillenta y ligeramente ácida.Sus frutos son muy pequeños y tienen un carácter principalmente ornamental.',15,21,16),
('FR-13','Kunquat  EXTRA con FRUTA','Frutales','150-170','NaranjASValencianAS.com','su nombre científico se origina en honor a un hoticultor escocés que recolectó especímenes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y \"margarita\", del latín margaritus-a-um = perla, en alusión a sus pequeños y brillantes frutos. Se trata de un arbusto o árbol pequeño de 2-3 m de altura, inerme o con escASAS espinAS.HojAS lanceoladAS de 4-8 (-15) cm de longitud, con el ápice redondeado y la bASe cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el envés más pálido.Pecíolo ligeramente marginado.Flores perfumadAS solitariAS o agrupadAS en inflorescenciAS axilares, blancAS.El fruto es lo más característico, es el más pequeño de todos los cítricos y el único cuya cáscara se puede comer.Frutos pequeños, con semillAS, de corteza fina, dulce, aromática y comestible, y de pulpa naranja amarillenta y ligeramente ácida.Sus frutos son muy pequeños y tienen un carácter principalmente ornamental.',15,57,45),
('FR-14','Calamondin Mini','Frutales','','Frutales Talavera S.A','Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortAS espinAS. Sus hojAS son pequeñAS, elípticAS de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de lAS ramillAS.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocAS semillAS, esféricos u ovales, con la zona apical aplanada, corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..',15,10,8),
('FR-15','Calamondin Copa ','Frutales','','Frutales Talavera S.A','Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortAS espinAS. Sus hojAS son pequeñAS, elípticAS de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de lAS ramillAS.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocAS semillAS, esféricos u ovales, con la zona apical aplanada, corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..',15,25,20),
('FR-16','Calamondin Copa EXTRA Con FRUTA','Frutales','100-120','Frutales Talavera S.A','Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortAS espinAS. Sus hojAS son pequeñAS, elípticAS de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de lAS ramillAS.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocAS semillAS, esféricos u ovales, con la zona apical aplanada, corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..',15,45,36),
('FR-17','Rosal bajo 1Âª -En maceta-inicio brotación','Frutales','','Frutales Talavera S.A','',15,2,1),
('FR-18','ROSAL TREPADOR','Frutales','','Frutales Talavera S.A','',350,4,3),
('FR-19','Camelia Blanco, Chrysler Rojo, Soraya Naranja, ','Frutales','','NaranjASValencianAS.com','',350,4,3),
('FR-2','Naranjo -Plantón joven 1 año injerto','Frutales','','NaranjASValencianAS.com','El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica graciAS a la poda. Su tronco es de color gris y liso, y lAS hojAS son perennes, coriáceAS, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el cASo del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.',15,6,4),
('FR-20','Landora Amarillo, Rose Gaujard bicolor blanco-rojo','Frutales','','Frutales Talavera S.A','',350,4,3),
('FR-21','Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte','Frutales','','Frutales Talavera S.A','',350,4,3),
('FR-22','Pitimini rojo','Frutales','','Frutales Talavera S.A','',350,4,3),
('FR-23','Rosal copa ','Frutales','','Frutales Talavera S.A','',400,8,6),
('FR-24','Albaricoquero Corbato','Frutales','','Melocotones de Cieza S.A.','árbol que puede pASar de los 6 m de altura, en la región mediterránea con ramAS formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, lAS ramAS son rojizAS y extendidAS cuando jóvenes y lAS ramAS secundariAS son cortAS, divergentes y escASAS. LAS yemAS latentes son frecuentes especialmente sobre lAS ramAS viejAS.',400,8,6),
('FR-25','Albaricoquero Moniqui','Frutales','','Melocotones de Cieza S.A.','árbol que puede pASar de los 6 m de altura, en la región mediterránea con ramAS formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, lAS ramAS son rojizAS y extendidAS cuando jóvenes y lAS ramAS secundariAS son cortAS, divergentes y escASAS. LAS yemAS latentes son frecuentes especialmente sobre lAS ramAS viejAS.',400,8,6),
('FR-26','Albaricoquero Kurrot','Frutales','','Melocotones de Cieza S.A.','árbol que puede pASar de los 6 m de altura, en la región mediterránea con ramAS formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, lAS ramAS son rojizAS y extendidAS cuando jóvenes y lAS ramAS secundariAS son cortAS, divergentes y escASAS. LAS yemAS latentes son frecuentes especialmente sobre lAS ramAS viejAS.',400,8,6),
('FR-27','Cerezo Burlat','Frutales','','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',400,8,6),
('FR-28','Cerezo Picota','Frutales','','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',400,8,6),
('FR-29','Cerezo Napoleón','Frutales','','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',400,8,6),
('FR-3','Naranjo 2 años injerto','Frutales','','NaranjASValencianAS.com','El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica graciAS a la poda. Su tronco es de color gris y liso, y lAS hojAS son perennes, coriáceAS, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el cASo del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.',15,7,5),
('FR-30','Ciruelo R. Claudia Verde   ','Frutales','','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',400,8,6),
('FR-31','Ciruelo Santa Rosa','Frutales','','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',400,8,6),
('FR-32','Ciruelo Golden Japan','Frutales','','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',400,8,6),
('FR-33','Ciruelo Friar','Frutales','','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',400,8,6),
('FR-34','Ciruelo Reina C. De Ollins','Frutales','','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',400,8,6),
('FR-35','Ciruelo Claudia Negra','Frutales','','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',400,8,6),
('FR-36','Granado Mollar de Elche','Frutales','','Frutales Talavera S.A','pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. LAS ramitAS jóvenes son más o menos cuadrangulares o angostAS y de cuatro alAS, posteriormente se vuelven redondAS con corteza de color café grisáceo, la mayoría de lAS ramAS, pero especialmente lAS pequeñAS ramitAS axilares, son en forma de espina o terminan en una espina aguda, la copa es extendida.',400,9,7),
('FR-37','Higuera Napolitana','Frutales','','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',400,9,7),
('FR-38','Higuera Verdal','Frutales','','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',400,9,7),
('FR-39','Higuera Breva','Frutales','','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',400,9,7),
('FR-4','Naranjo calibre 8/10','Frutales','','NaranjASValencianAS.com','El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica graciAS a la poda. Su tronco es de color gris y liso, y lAS hojAS son perennes, coriáceAS, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el cASo del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.',15,29,23),
('FR-40','Manzano Starking Delicious','Frutales','','Frutales Talavera S.A','alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelAS, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre lAS partes viejAS del árbol. Tiene una vida de unos 60-80 años. LAS ramAS se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina',400,8,6),
('FR-41','Manzano Reineta','Frutales','','Frutales Talavera S.A','alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelAS, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre lAS partes viejAS del árbol. Tiene una vida de unos 60-80 años. LAS ramAS se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina',400,8,6),
('FR-42','Manzano Golden Delicious','Frutales','','Frutales Talavera S.A','alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelAS, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre lAS partes viejAS del árbol. Tiene una vida de unos 60-80 años. LAS ramAS se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina',400,8,6),
('FR-43','Membrillero Gigante de Wranja','Frutales','','Frutales Talavera S.A','',400,8,6),
('FR-44','Melocotonero Spring Crest','Frutales','','Melocotones de Cieza S.A.','Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojAS son alargadAS con el margen ligeramente ASerrado, de color verde brillante, algo más clarAS por el envés. El melocotonero está muy arraigado en la cultura ASiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',400,8,6),
('FR-45','Melocotonero Amarillo de Agosto','Frutales','','Melocotones de Cieza S.A.','Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojAS son alargadAS con el margen ligeramente ASerrado, de color verde brillante, algo más clarAS por el envés. El melocotonero está muy arraigado en la cultura ASiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',400,8,6),
('FR-46','Melocotonero Federica','Frutales','','Melocotones de Cieza S.A.','Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojAS son alargadAS con el margen ligeramente ASerrado, de color verde brillante, algo más clarAS por el envés. El melocotonero está muy arraigado en la cultura ASiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',400,8,6),
('FR-47','Melocotonero Paraguayo','Frutales','','Melocotones de Cieza S.A.','Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojAS son alargadAS con el margen ligeramente ASerrado, de color verde brillante, algo más clarAS por el envés. El melocotonero está muy arraigado en la cultura ASiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',400,8,6),
('FR-48','Nogal Común','Frutales','','Frutales Talavera S.A','',400,9,7),
('FR-49','Parra Uva de Mesa','Frutales','','Frutales Talavera S.A','',400,8,6),
('FR-5','Mandarino -Plantón joven','Frutales','','Frutales Talavera S.A','',15,6,4),
('FR-50','Peral CAStell','Frutales','','Frutales Talavera S.A','Árbol piramidal, redondeado en su juventud, luego oval, que llega hASta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placAS lenticulares.LAS ramAS se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosAS lenticelAS.',400,8,6),
('FR-51','Peral Williams','Frutales','','Frutales Talavera S.A','Árbol piramidal, redondeado en su juventud, luego oval, que llega hASta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placAS lenticulares.LAS ramAS se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosAS lenticelAS.',400,8,6),
('FR-52','Peral Conference','Frutales','','Frutales Talavera S.A','Árbol piramidal, redondeado en su juventud, luego oval, que llega hASta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placAS lenticulares.LAS ramAS se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosAS lenticelAS.',400,8,6),
('FR-53','Peral Blanq. de Aranjuez','Frutales','','Frutales Talavera S.A','Árbol piramidal, redondeado en su juventud, luego oval, que llega hASta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placAS lenticulares.LAS ramAS se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosAS lenticelAS.',400,8,6),
('FR-54','Níspero Tanaca','Frutales','','Frutales Talavera S.A','Aunque originario del Sudeste de China, el níspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se inició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a lAS zonAS de cultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de los 70, cuando comenzaron a implantarse lAS variedades y técnicAS de cultivo actualmente utilizadAS.',400,9,7),
('FR-55','Olivo Cipresino','Frutales','','Frutales Talavera S.A','Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de lAS costAS de Siria, Líbano e Israel y otra que considera que lo considera originario de ASia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e IslAS del Mar Egeo, pASando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en lAS costAS mediterráneAS españolAS coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.',400,8,6),
('FR-56','Nectarina','Frutales','','Frutales Talavera S.A','',400,8,6),
('FR-57','Kaki Rojo Brillante','Frutales','','NaranjASValencianAS.com','De crecimiento algo lento los primeros años, llega a alcanzar hASta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal, aunque con la edad se hace más globoso.',400,9,7),
('FR-58','Albaricoquero','Frutales','8/10','Melocotones de Cieza S.A.','árbol que puede pASar de los 6 m de altura, en la región mediterránea con ramAS formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, lAS ramAS son rojizAS y extendidAS cuando jóvenes y lAS ramAS secundariAS son cortAS, divergentes y escASAS. LAS yemAS latentes son frecuentes especialmente sobre lAS ramAS viejAS.',200,11,8),
('FR-59','Albaricoquero','Frutales','10/12','Melocotones de Cieza S.A.','árbol que puede pASar de los 6 m de altura, en la región mediterránea con ramAS formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, lAS ramAS son rojizAS y extendidAS cuando jóvenes y lAS ramAS secundariAS son cortAS, divergentes y escASAS. LAS yemAS latentes son frecuentes especialmente sobre lAS ramAS viejAS.',200,22,17),
('FR-6','Mandarino 2 años injerto','Frutales','','Frutales Talavera S.A','',15,7,5),
('FR-60','Albaricoquero','Frutales','12/14','Melocotones de Cieza S.A.','árbol que puede pASar de los 6 m de altura, en la región mediterránea con ramAS formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, lAS ramAS son rojizAS y extendidAS cuando jóvenes y lAS ramAS secundariAS son cortAS, divergentes y escASAS. LAS yemAS latentes son frecuentes especialmente sobre lAS ramAS viejAS.',200,32,25),
('FR-61','Albaricoquero','Frutales','14/16','Melocotones de Cieza S.A.','árbol que puede pASar de los 6 m de altura, en la región mediterránea con ramAS formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, lAS ramAS son rojizAS y extendidAS cuando jóvenes y lAS ramAS secundariAS son cortAS, divergentes y escASAS. LAS yemAS latentes son frecuentes especialmente sobre lAS ramAS viejAS.',200,49,39),
('FR-62','Albaricoquero','Frutales','16/18','Melocotones de Cieza S.A.','árbol que puede pASar de los 6 m de altura, en la región mediterránea con ramAS formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, lAS ramAS son rojizAS y extendidAS cuando jóvenes y lAS ramAS secundariAS son cortAS, divergentes y escASAS. LAS yemAS latentes son frecuentes especialmente sobre lAS ramAS viejAS.',200,70,56),
('FR-63','Cerezo','Frutales','8/10','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',300,11,8),
('FR-64','Cerezo','Frutales','10/12','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',15,22,17),
('FR-65','Cerezo','Frutales','12/14','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',200,32,25),
('FR-66','Cerezo','Frutales','14/16','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',50,49,39),
('FR-67','Cerezo','Frutales','16/18','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',50,70,56),
('FR-68','Cerezo','Frutales','18/20','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',50,80,64),
('FR-69','Cerezo','Frutales','20/25','Jerte Distribuciones S.L.','LAS principales especies de cerezo cultivadAS en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerASus) y el cerezo \"Duke\", híbrido de los anteriores. AmbAS especies son naturales del sureste de Europa y oeste de ASia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar CASpio, difundiéndose después hacia Europa y ASia, llevado por los pájaros y lAS migraciones humanAS. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversAS. En la actualidad, el cerezo se encuentra difundido por numerosAS regiones y países del mundo con clima templado',50,91,72),
('FR-7','Mandarino calibre 8/10','Frutales','','Frutales Talavera S.A','',15,29,23),
('FR-70','Ciruelo','Frutales','8/10','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',50,11,8),
('FR-71','Ciruelo','Frutales','10/12','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',50,22,17),
('FR-72','Ciruelo','Frutales','12/14','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramAS alternAS, pequeñAS, delgadAS, unAS veces lisAS, glabrAS y otrAS pubescentes y vellosAS',50,32,25),
('FR-73','Granado','Frutales','8/10','Frutales Talavera S.A','pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. LAS ramitAS jóvenes son más o menos cuadrangulares o angostAS y de cuatro alAS, posteriormente se vuelven redondAS con corteza de color café grisáceo, la mayoría de lAS ramAS, pero especialmente lAS pequeñAS ramitAS axilares, son en forma de espina o terminan en una espina aguda, la copa es extendida.',50,13,10),
('FR-74','Granado','Frutales','10/12','Frutales Talavera S.A','pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. LAS ramitAS jóvenes son más o menos cuadrangulares o angostAS y de cuatro alAS, posteriormente se vuelven redondAS con corteza de color café grisáceo, la mayoría de lAS ramAS, pero especialmente lAS pequeñAS ramitAS axilares, son en forma de espina o terminan en una espina aguda, la copa es extendida.',50,22,17),
('FR-75','Granado','Frutales','12/14','Frutales Talavera S.A','pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. LAS ramitAS jóvenes son más o menos cuadrangulares o angostAS y de cuatro alAS, posteriormente se vuelven redondAS con corteza de color café grisáceo, la mayoría de lAS ramAS, pero especialmente lAS pequeñAS ramitAS axilares, son en forma de espina o terminan en una espina aguda, la copa es extendida.',50,32,25),
('FR-76','Granado','Frutales','14/16','Frutales Talavera S.A','pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. LAS ramitAS jóvenes son más o menos cuadrangulares o angostAS y de cuatro alAS, posteriormente se vuelven redondAS con corteza de color café grisáceo, la mayoría de lAS ramAS, pero especialmente lAS pequeñAS ramitAS axilares, son en forma de espina o terminan en una espina aguda, la copa es extendida.',50,49,39),
('FR-77','Granado','Frutales','16/18','Frutales Talavera S.A','pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. LAS ramitAS jóvenes son más o menos cuadrangulares o angostAS y de cuatro alAS, posteriormente se vuelven redondAS con corteza de color café grisáceo, la mayoría de lAS ramAS, pero especialmente lAS pequeñAS ramitAS axilares, son en forma de espina o terminan en una espina aguda, la copa es extendida.',50,70,56),
('FR-78','Higuera','Frutales','8/10','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',50,15,12),
('FR-79','Higuera','Frutales','10/12','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',50,22,17),
('FR-8','Limonero -Plantón joven','Frutales','','NaranjASValencianAS.com','El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste ASiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosAS modificaciones debidAS tanto a la selección natural mediante hibridaciones espontáneAS como a lAS producidAS por el',15,6,4),
('FR-80','Higuera','Frutales','12/14','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',50,32,25),
('FR-81','Higuera','Frutales','14/16','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',50,49,39),
('FR-82','Higuera','Frutales','16/18','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',50,70,56),
('FR-83','Higuera','Frutales','18/20','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. LAS únicAS higuerAS con cuidados culturales esmerados, en muchAS comarcAS, son lAS brevales, por el interés económico de su primera cosecha, la de brevAS.',50,80,64),
('FR-84','Kaki','Frutales','8/10','NaranjASValencianAS.com','De crecimiento algo lento los primeros años, llega a alcanzar hASta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal, aunque con la edad se hace más globoso.',50,13,10),
('FR-85','Kaki','Frutales','16/18','NaranjASValencianAS.com','De crecimiento algo lento los primeros años, llega a alcanzar hASta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal, aunque con la edad se hace más globoso.',50,70,56),
('FR-86','Manzano','Frutales','8/10','Frutales Talavera S.A','alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelAS, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre lAS partes viejAS del árbol. Tiene una vida de unos 60-80 años. LAS ramAS se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina',50,11,8),
('FR-87','Manzano','Frutales','10/12','Frutales Talavera S.A','alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelAS, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre lAS partes viejAS del árbol. Tiene una vida de unos 60-80 años. LAS ramAS se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina',50,22,17),
('FR-88','Manzano','Frutales','12/14','Frutales Talavera S.A','alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelAS, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre lAS partes viejAS del árbol. Tiene una vida de unos 60-80 años. LAS ramAS se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina',50,32,25),
('FR-89','Manzano','Frutales','14/16','Frutales Talavera S.A','alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelAS, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre lAS partes viejAS del árbol. Tiene una vida de unos 60-80 años. LAS ramAS se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina',50,49,39),
('FR-9','Limonero calibre 8/10','Frutales','','NaranjASValencianAS.com','El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste ASiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosAS modificaciones debidAS tanto a la selección natural mediante hibridaciones espontáneAS como a lAS producidAS por el',15,29,23),
('FR-90','Níspero','Frutales','16/18','Frutales Talavera S.A','Aunque originario del Sudeste de China, el níspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se inició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a lAS zonAS de cultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de los 70, cuando comenzaron a implantarse lAS variedades y técnicAS de cultivo actualmente utilizadAS.',50,70,56),
('FR-91','Níspero','Frutales','18/20','Frutales Talavera S.A','Aunque originario del Sudeste de China, el níspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se inició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a lAS zonAS de cultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de los 70, cuando comenzaron a implantarse lAS variedades y técnicAS de cultivo actualmente utilizadAS.',50,80,64),
('FR-92','Melocotonero','Frutales','8/10','Melocotones de Cieza S.A.','Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojAS son alargadAS con el margen ligeramente ASerrado, de color verde brillante, algo más clarAS por el envés. El melocotonero está muy arraigado en la cultura ASiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',50,11,8),
('FR-93','Melocotonero','Frutales','10/12','Melocotones de Cieza S.A.','Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojAS son alargadAS con el margen ligeramente ASerrado, de color verde brillante, algo más clarAS por el envés. El melocotonero está muy arraigado en la cultura ASiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',50,22,17),
('FR-94','Melocotonero','Frutales','12/14','Melocotones de Cieza S.A.','Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojAS son alargadAS con el margen ligeramente ASerrado, de color verde brillante, algo más clarAS por el envés. El melocotonero está muy arraigado en la cultura ASiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',50,32,25),
('FR-95','Melocotonero','Frutales','14/16','Melocotones de Cieza S.A.','Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojAS son alargadAS con el margen ligeramente ASerrado, de color verde brillante, algo más clarAS por el envés. El melocotonero está muy arraigado en la cultura ASiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',50,49,39),
('FR-96','Membrillero','Frutales','8/10','Frutales Talavera S.A','arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamAS con la edad. Copa irregular, con ramAS inermes, flexuosAS, parduzcAS, punteadAS. RamillAS jóvenes tomentosAS',50,11,8),
('FR-97','Membrillero','Frutales','10/12','Frutales Talavera S.A','arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamAS con la edad. Copa irregular, con ramAS inermes, flexuosAS, parduzcAS, punteadAS. RamillAS jóvenes tomentosAS',50,22,17),
('FR-98','Membrillero','Frutales','12/14','Frutales Talavera S.A','arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamAS con la edad. Copa irregular, con ramAS inermes, flexuosAS, parduzcAS, punteadAS. RamillAS jóvenes tomentosAS',50,32,25),
('FR-99','Membrillero','Frutales','14/16','Frutales Talavera S.A','arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamAS con la edad. Copa irregular, con ramAS inermes, flexuosAS, parduzcAS, punteadAS. RamillAS jóvenes tomentosAS',50,49,39),
('OR-001','Arbustos Mix Maceta','Ornamentales','40-60','Valencia Garden Service','',25,5,4),
('OR-100','Mimosa Injerto CLASICA Dealbata ','Ornamentales','100-110','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,12,9),
('OR-101','Expositor Mimosa Semilla Mix','Ornamentales','170-200','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,6,4),
('OR-102','Mimosa Semilla Bayleyana  ','Ornamentales','170-200','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,6,4),
('OR-103','Mimosa Semilla Bayleyana   ','Ornamentales','200-225','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,10,8),
('OR-104','Mimosa Semilla Cyanophylla    ','Ornamentales','200-225','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,10,8),
('OR-105','Mimosa Semilla Espectabilis  ','Ornamentales','160-170','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,6,4),
('OR-106','Mimosa Semilla Longifolia   ','Ornamentales','200-225','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,10,8),
('OR-107','Mimosa Semilla Floribunda 4 estaciones','Ornamentales','120-140','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,6,4),
('OR-108','Abelia Floribunda','Ornamentales','35-45','Viveros EL OASIS','',100,5,4),
('OR-109','Callistemom (Mix)','Ornamentales','35-45','Viveros EL OASIS','Limpitatubos. arbolito de 6-7 m de altura. RamAS flexibles y colgantes (de ahí lo de \"llorón\")..',100,5,4),
('OR-110','Callistemom (Mix)','Ornamentales','40-60','Viveros EL OASIS','Limpitatubos. arbolito de 6-7 m de altura. RamAS flexibles y colgantes (de ahí lo de \"llorón\")..',100,2,1),
('OR-111','Corylus Avellana \"Contorta\"','Ornamentales','35-45','Viveros EL OASIS','',100,5,4),
('OR-112','Escallonia (Mix)','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-113','Evonimus Emerald Gayeti','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-114','Evonimus Pulchellus','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-115','Forsytia Intermedia \"Lynwood\"','Ornamentales','35-45','Viveros EL OASIS','',120,7,5),
('OR-116','Hibiscus Syriacus  \"Diana\" -Blanco Puro','Ornamentales','35-45','Viveros EL OASIS','Por su capacidad de soportar podAS, pueden ser fácilmente moldeadAS como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenAS dura 1 día, pero continuamente aparecen nuevAS y la floración se prolonga durante todo el periodo de crecimiento vegetativo.',120,7,5),
('OR-117','Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo','Ornamentales','35-45','Viveros EL OASIS','Por su capacidad de soportar podAS, pueden ser fácilmente moldeadAS como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenAS dura 1 día, pero continuamente aparecen nuevAS y la floración se prolonga durante todo el periodo de crecimiento vegetativo.',120,7,5),
('OR-118','Hibiscus Syriacus \"Pink Giant\" Rosa','Ornamentales','35-45','Viveros EL OASIS','Por su capacidad de soportar podAS, pueden ser fácilmente moldeadAS como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenAS dura 1 día, pero continuamente aparecen nuevAS y la floración se prolonga durante todo el periodo de crecimiento vegetativo.',120,7,5),
('OR-119','Laurus Nobilis Arbusto - Ramificado Bajo','Ornamentales','40-50','Viveros EL OASIS','',120,5,4),
('OR-120','Lonicera Nitida ','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-121','Lonicera Nitida \"Maigrum\"','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-122','Lonicera Pileata','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-123','Philadelphus \"Virginal\"','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-124','Prunus pisardii  ','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-125','Viburnum Tinus \"Eve Price\"','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-126','Weigelia \"Bristol Ruby\"','Ornamentales','35-45','Viveros EL OASIS','',120,5,4),
('OR-127','Camelia japonica','Ornamentales','40-60','Viveros EL OASIS','Arbusto excepcional por su floración otoñal, invernal o primaveral. Flores: LAS flores son solitariAS, aparecen en el ápice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.',50,7,5),
('OR-128','Camelia japonica ejemplar','Ornamentales','200-250','Viveros EL OASIS','Arbusto excepcional por su floración otoñal, invernal o primaveral. Flores: LAS flores son solitariAS, aparecen en el ápice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.',50,98,78),
('OR-129','Camelia japonica ejemplar','Ornamentales','250-300','Viveros EL OASIS','Arbusto excepcional por su floración otoñal, invernal o primaveral. Flores: LAS flores son solitariAS, aparecen en el ápice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.',50,110,88),
('OR-130','Callistemom COPA','Ornamentales','110/120','Viveros EL OASIS','Limpitatubos. arbolito de 6-7 m de altura. RamAS flexibles y colgantes (de ahí lo de \"llorón\")..',50,18,14),
('OR-131','Leptospermum formado PIRAMIDE','Ornamentales','80-100','Viveros EL OASIS','',50,18,14),
('OR-132','Leptospermum COPA','Ornamentales','110/120','Viveros EL OASIS','',50,18,14),
('OR-133','Nerium oleander-CALIDAD \"GARDEN\"','Ornamentales','40-45','Viveros EL OASIS','',50,2,1),
('OR-134','Nerium Oleander Arbusto GRANDE','Ornamentales','160-200','Viveros EL OASIS','',100,38,30),
('OR-135','Nerium oleander COPA  Calibre 6/8','Ornamentales','50-60','Viveros EL OASIS','',100,5,4),
('OR-136','Nerium oleander ARBOL Calibre 8/10','Ornamentales','225-250','Viveros EL OASIS','',100,18,14),
('OR-137','ROSAL TREPADOR','Ornamentales','','Viveros EL OASIS','',100,4,3),
('OR-138','Camelia Blanco, Chrysler Rojo, Soraya Naranja, ','Ornamentales','','Viveros EL OASIS','',100,4,3),
('OR-139','Landora Amarillo, Rose Gaujard bicolor blanco-rojo','Ornamentales','','Viveros EL OASIS','',100,4,3),
('OR-140','Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte','Ornamentales','','Viveros EL OASIS','',100,4,3),
('OR-141','Pitimini rojo','Ornamentales','','Viveros EL OASIS','',100,4,3),
('OR-142','Solanum Jazminoide','Ornamentales','150-160','Viveros EL OASIS','',100,2,1),
('OR-143','Wisteria Sinensis  azul, rosa, blanca','Ornamentales','','Viveros EL OASIS','',100,9,7),
('OR-144','Wisteria Sinensis INJERTADAS DECÃ“','Ornamentales','140-150','Viveros EL OASIS','',100,12,9),
('OR-145','Bougamvillea Sanderiana Tutor','Ornamentales','80-100','Viveros EL OASIS','',100,2,1),
('OR-146','Bougamvillea Sanderiana Tutor','Ornamentales','125-150','Viveros EL OASIS','',100,4,3),
('OR-147','Bougamvillea Sanderiana Tutor','Ornamentales','180-200','Viveros EL OASIS','',100,7,5),
('OR-148','Bougamvillea Sanderiana Espaldera','Ornamentales','45-50','Viveros EL OASIS','',100,7,5),
('OR-149','Bougamvillea Sanderiana Espaldera','Ornamentales','140-150','Viveros EL OASIS','',100,17,13),
('OR-150','Bougamvillea roja, naranja','Ornamentales','110-130','Viveros EL OASIS','',100,2,1),
('OR-151','Bougamvillea Sanderiana, 3 tut. piramide','Ornamentales','','Viveros EL OASIS','',100,6,4),
('OR-152','Expositor Árboles clima continental','Ornamentales','170-200','Viveros EL OASIS','',100,6,4),
('OR-153','Expositor Árboles clima mediterráneo','Ornamentales','170-200','Viveros EL OASIS','',100,6,4),
('OR-154','Expositor Árboles borde del mar','Ornamentales','170-200','Viveros EL OASIS','',100,6,4),
('OR-155','Acer Negundo  ','Ornamentales','200-225','Viveros EL OASIS','',100,6,4),
('OR-156','Acer platanoides  ','Ornamentales','200-225','Viveros EL OASIS','',100,10,8),
('OR-157','Acer Pseudoplatanus ','Ornamentales','200-225','Viveros EL OASIS','',100,10,8),
('OR-158','Brachychiton Acerifolius  ','Ornamentales','200-225','Viveros EL OASIS','',100,6,4),
('OR-159','Brachychiton Discolor  ','Ornamentales','200-225','Viveros EL OASIS','',100,6,4),
('OR-160','Brachychiton Rupestris','Ornamentales','170-200','Viveros EL OASIS','',100,10,8),
('OR-161','CASsia Corimbosa  ','Ornamentales','200-225','Viveros EL OASIS','',100,6,4),
('OR-162','CASsia Corimbosa ','Ornamentales','200-225','Viveros EL OASIS','',100,10,8),
('OR-163','Chitalpa Summer Bells   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8),
('OR-164','Erytrina Kafra','Ornamentales','170-180','Viveros EL OASIS','',80,6,4),
('OR-165','Erytrina Kafra','Ornamentales','200-225','Viveros EL OASIS','',80,10,8),
('OR-166','Eucalyptus Citriodora  ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4),
('OR-167','Eucalyptus Ficifolia  ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4),
('OR-168','Eucalyptus Ficifolia   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8),
('OR-169','Hibiscus Syriacus  Var. InjertadAS 1 Tallo ','Ornamentales','170-200','Viveros EL OASIS','',80,12,9),
('OR-170','Lagunaria Patersonii  ','Ornamentales','140-150','Viveros EL OASIS','',80,6,4),
('OR-171','Lagunaria Patersonii   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8),
('OR-172','Lagunaria patersonii  calibre 8/10','Ornamentales','200-225','Viveros EL OASIS','',80,18,14),
('OR-173','Morus Alba  ','Ornamentales','200-225','Viveros EL OASIS','',80,6,4),
('OR-174','Morus Alba  calibre 8/10','Ornamentales','200-225','Viveros EL OASIS','',80,18,14),
('OR-175','Platanus Acerifolia   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8),
('OR-176','Prunus pisardii  ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8),
('OR-177','Robinia Pseudoacacia CASque Rouge   ','Ornamentales','200-225','Viveros EL OASIS','',80,15,12),
('OR-178','Salix Babylonica  Pendula  ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4),
('OR-179','Sesbania Punicea   ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4),
('OR-180','Tamarix  Ramosissima Pink CAScade   ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4),
('OR-181','Tamarix  Ramosissima Pink CAScade   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8),
('OR-182','Tecoma Stands   ','Ornamentales','200-225','Viveros EL OASIS','',80,6,4),
('OR-183','Tecoma Stands  ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8),
('OR-184','Tipuana Tipu  ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4),
('OR-185','PleioblAStus distichus-Bambú enano','Ornamentales','15-20','Viveros EL OASIS','',80,6,4),
('OR-186','SASa palmata ','Ornamentales','20-30','Viveros EL OASIS','',80,6,4),
('OR-187','SASa palmata ','Ornamentales','40-45','Viveros EL OASIS','',80,10,8),
('OR-188','SASa palmata ','Ornamentales','50-60','Viveros EL OASIS','',80,25,20),
('OR-189','Phylostachys aurea','Ornamentales','180-200','Viveros EL OASIS','',80,22,17),
('OR-190','Phylostachys aurea','Ornamentales','250-300','Viveros EL OASIS','',80,32,25),
('OR-191','Phylostachys Bambusa Spectabilis','Ornamentales','180-200','Viveros EL OASIS','',80,24,19),
('OR-192','Phylostachys biseti','Ornamentales','160-170','Viveros EL OASIS','',80,22,17),
('OR-193','Phylostachys biseti','Ornamentales','160-180','Viveros EL OASIS','',80,20,16),
('OR-194','PseudosASa japonica (Metake)','Ornamentales','225-250','Viveros EL OASIS','',80,20,16),
('OR-195','PseudosASa japonica (Metake) ','Ornamentales','30-40','Viveros EL OASIS','',80,6,4),
('OR-196','Cedrus Deodara ','Ornamentales','80-100','Viveros EL OASIS','',80,10,8),
('OR-197','Cedrus Deodara \"Feeling Blue\" Novedad','Ornamentales','rAStrero','Viveros EL OASIS','',80,12,9),
('OR-198','Juniperus chinensis \"Blue Alps\"','Ornamentales','20-30','Viveros EL OASIS','',80,4,3),
('OR-199','Juniperus Chinensis Stricta','Ornamentales','20-30','Viveros EL OASIS','',80,4,3),
('OR-200','Juniperus horizontalis Wiltonii','Ornamentales','20-30','Viveros EL OASIS','',80,4,3),
('OR-201','Juniperus squamata \"Blue Star\"','Ornamentales','20-30','Viveros EL OASIS','',80,4,3),
('OR-202','Juniperus x media Phitzeriana verde','Ornamentales','20-30','Viveros EL OASIS','',80,4,3),
('OR-203','Pinus Canariensis','Ornamentales','80-100','Viveros EL OASIS','',80,10,8),
('OR-204','Pinus Halepensis','Ornamentales','160-180','Viveros EL OASIS','',80,10,8),
('OR-205','Pinus Pinea -Pino Piñonero','Ornamentales','70-80','Viveros EL OASIS','',80,10,8),
('OR-206','Thuja Esmeralda ','Ornamentales','80-100','Viveros EL OASIS','',80,5,4),
('OR-207','Tuja Occidentalis Woodwardii','Ornamentales','20-30','Viveros EL OASIS','',80,4,3),
('OR-208','Tuja orientalis \"Aurea nana\"','Ornamentales','20-30','Viveros EL OASIS','',80,4,3),
('OR-209','Archontophoenix Cunninghamiana','Ornamentales','80 - 100','Viveros EL OASIS','',80,10,8),
('OR-210','Beucarnea Recurvata','Ornamentales','130  - 150','Viveros EL OASIS','',2,39,31),
('OR-211','Beucarnea Recurvata','Ornamentales','180 - 200','Viveros EL OASIS','',5,59,47),
('OR-212','Bismarckia Nobilis','Ornamentales','200 - 220','Viveros EL OASIS','',4,217,173),
('OR-213','Bismarckia Nobilis','Ornamentales','240 - 260','Viveros EL OASIS','',4,266,212),
('OR-214','Brahea Armata','Ornamentales','45 - 60','Viveros EL OASIS','',0,10,8),
('OR-215','Brahea Armata','Ornamentales','120 - 140','Viveros EL OASIS','',100,112,89),
('OR-216','Brahea Edulis','Ornamentales','80 - 100','Viveros EL OASIS','',100,19,15),
('OR-217','Brahea Edulis','Ornamentales','140 - 160','Viveros EL OASIS','',100,64,51),
('OR-218','Butia Capitata','Ornamentales','70 - 90','Viveros EL OASIS','',100,25,20),
('OR-219','Butia Capitata','Ornamentales','90 - 110','Viveros EL OASIS','',100,29,23),
('OR-220','Butia Capitata','Ornamentales','90 - 120','Viveros EL OASIS','',100,36,28),
('OR-221','Butia Capitata','Ornamentales','85 - 105','Viveros EL OASIS','',100,59,47),
('OR-222','Butia Capitata','Ornamentales','130 - 150','Viveros EL OASIS','',100,87,69),
('OR-223','Chamaerops Humilis','Ornamentales','40 - 45','Viveros EL OASIS','',100,4,3),
('OR-224','Chamaerops Humilis','Ornamentales','50 - 60','Viveros EL OASIS','',100,7,5),
('OR-225','Chamaerops Humilis','Ornamentales','70 - 90','Viveros EL OASIS','',100,10,8),
('OR-226','Chamaerops Humilis','Ornamentales','115 - 130','Viveros EL OASIS','',100,38,30),
('OR-227','Chamaerops Humilis','Ornamentales','130 - 150','Viveros EL OASIS','',100,64,51),
('OR-228','Chamaerops Humilis \"Cerifera\"','Ornamentales','70 - 80','Viveros EL OASIS','',100,32,25),
('OR-229','Chrysalidocarpus Lutescens -ARECA','Ornamentales','130 - 150','Viveros EL OASIS','',100,22,17),
('OR-230','Cordyline Australis -DRACAENA','Ornamentales','190 - 210','Viveros EL OASIS','',100,38,30),
('OR-231','CycAS Revoluta','Ornamentales','55 - 65','Viveros EL OASIS','',100,15,12),
('OR-232','CycAS Revoluta','Ornamentales','80 - 90','Viveros EL OASIS','',100,34,27),
('OR-233','Dracaena Drago','Ornamentales','60 - 70','Viveros EL OASIS','',1,13,10),
('OR-234','Dracaena Drago','Ornamentales','130 - 150','Viveros EL OASIS','',2,64,51),
('OR-235','Dracaena Drago','Ornamentales','150 - 175','Viveros EL OASIS','',2,92,73),
('OR-236','Jubaea Chilensis','Ornamentales','','Viveros EL OASIS','',100,49,39),
('OR-237','Livistonia Australis','Ornamentales','100 - 125','Viveros EL OASIS','',50,19,15),
('OR-238','Livistonia Decipiens','Ornamentales','90 - 110','Viveros EL OASIS','',50,19,15),
('OR-239','Livistonia Decipiens','Ornamentales','180 - 200','Viveros EL OASIS','',50,49,39),
('OR-240','Phoenix Canariensis','Ornamentales','110 - 130','Viveros EL OASIS','',50,6,4),
('OR-241','Phoenix Canariensis','Ornamentales','180 - 200','Viveros EL OASIS','',50,19,15),
('OR-242','Rhaphis Excelsa','Ornamentales','80 - 100','Viveros EL OASIS','',50,21,16),
('OR-243','Rhaphis Humilis','Ornamentales','150- 170','Viveros EL OASIS','',50,64,51),
('OR-244','Sabal Minor','Ornamentales','60 - 75','Viveros EL OASIS','',50,11,8),
('OR-245','Sabal Minor','Ornamentales','120 - 140','Viveros EL OASIS','',50,34,27),
('OR-246','Trachycarpus Fortunei','Ornamentales','90 - 105','Viveros EL OASIS','',50,18,14),
('OR-247','Trachycarpus Fortunei','Ornamentales','250-300','Viveros EL OASIS','',2,462,369),
('OR-248','WAShingtonia Robusta','Ornamentales','60 - 70','Viveros EL OASIS','',15,3,2),
('OR-249','WAShingtonia Robusta','Ornamentales','130 - 150','Viveros EL OASIS','',15,5,4),
('OR-250','Yucca Jewel','Ornamentales','80 - 105','Viveros EL OASIS','',15,10,8),
('OR-251','Zamia Furfuracaea','Ornamentales','90 - 110','Viveros EL OASIS','',15,168,134),
('OR-99','Mimosa DEALBATA Gaulois AStier  ','Ornamentales','200-225','Viveros EL OASIS','Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojAS son de textura fina, de color verde y sus flores amarillAS que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre lAS semillAS, que se disponen en el fruto longitudinalmente...',100,14,11);


INSERT INTO detalle_pedido (codigo_pedido,
codigo_producto,
cantidad,
precio_unidad,
numero_linea) VALUES 
(1,'FR-67',10,70,3),
(1,'OR-127',40,4,1),
(1,'OR-141',25,4,2),
(1,'OR-241',15,19,4),
(1,'OR-99',23,14,5),
(2,'FR-4',3,29,6),
(2,'FR-40',7,8,7),
(2,'OR-140',50,4,3),
(2,'OR-141',20,5,2),
(2,'OR-159',12,6,5),
(2,'OR-227',67,64,1),
(2,'OR-247',5,462,4),
(3,'FR-48',120,9,6),
(3,'OR-122',32,5,4),
(3,'OR-123',11,5,5),
(3,'OR-213',30,266,1),
(3,'OR-217',15,65,2),
(3,'OR-218',24,25,3),
(4,'FR-31',12,8,7),
(4,'FR-34',42,8,6),
(4,'FR-40',42,9,8),
(4,'OR-152',3,6,5),
(4,'OR-155',4,6,3),
(4,'OR-156',17,9,4),
(4,'OR-157',38,10,2),
(4,'OR-222',21,59,1),
(8,'FR-106',3,11,1),
(8,'FR-108',1,32,2),
(8,'FR-11',10,100,3),
(9,'AR-001',80,1,3),
(9,'AR-008',450,1,2),
(9,'FR-106',80,8,1),
(9,'FR-69',15,91,2),
(10,'FR-82',5,70,2),
(10,'FR-91',30,75,1),
(10,'OR-234',5,64,3),
(11,'AR-006',180,1,3),
(11,'OR-247',80,8,1),
(12,'AR-009',290,1,1),
(13,'11679',5,14,1),
(13,'21636',12,14,2),
(13,'FR-11',5,100,3),
(14,'FR-100',8,11,2),
(14,'FR-13',13,57,1),
(15,'FR-84',4,13,3),
(15,'OR-101',2,6,2),
(15,'OR-156',6,10,1),
(15,'OR-203',9,10,4),
(16,'30310',12,12,1),
(16,'FR-36',10,9,2),
(17,'11679',5,14,1),
(17,'22225',5,12,3),
(17,'FR-37',5,9,2),
(17,'FR-64',5,22,4),
(17,'OR-136',5,18,5),
(18,'22225',4,12,2),
(18,'FR-22',2,4,1),
(18,'OR-159',10,6,3),
(19,'30310',9,12,5),
(19,'FR-23',6,8,4),
(19,'FR-75',1,32,2),
(19,'FR-84',5,13,1),
(19,'OR-208',20,4,3),
(20,'11679',14,14,1),
(20,'30310',8,12,2),
(21,'21636',5,14,3),
(21,'FR-18',22,4,1),
(21,'FR-53',3,8,2),
(22,'OR-240',1,6,1),
(23,'AR-002',110,1,4),
(23,'FR-107',50,22,3),
(23,'FR-85',4,70,2),
(23,'OR-249',30,5,1),
(24,'22225',3,15,1),
(24,'FR-1',4,7,4),
(24,'FR-23',2,7,2),
(24,'OR-241',10,20,3),
(25,'FR-77',15,69,1),
(25,'FR-9',4,30,3),
(25,'FR-94',10,30,2),
(26,'FR-15',9,25,3),
(26,'OR-188',4,25,1),
(26,'OR-218',14,25,2),
(27,'OR-101',22,6,2),
(27,'OR-102',22,6,3),
(27,'OR-186',40,6,1),
(28,'FR-11',8,99,3),
(28,'OR-213',3,266,2),
(28,'OR-247',1,462,1),
(29,'FR-82',4,70,4),
(29,'FR-9',4,28,1),
(29,'FR-94',20,31,5),
(29,'OR-129',2,111,2),
(29,'OR-160',10,9,3),
(30,'AR-004',10,1,6),
(30,'FR-108',2,32,2),
(30,'FR-12',2,19,3),
(30,'FR-72',4,31,5),
(30,'FR-89',10,45,1),
(30,'OR-120',5,5,4),
(31,'AR-009',25,2,3),
(31,'FR-102',1,20,1),
(31,'FR-4',6,29,2),
(32,'11679',1,14,4),
(32,'21636',4,15,5),
(32,'22225',1,15,3),
(32,'OR-128',29,100,2),
(32,'OR-193',5,20,1),
(33,'FR-17',423,2,4),
(33,'FR-29',120,8,3),
(33,'OR-214',212,10,2),
(33,'OR-247',150,462,1),
(34,'FR-3',56,7,4),
(34,'FR-7',12,29,3),
(34,'OR-172',20,18,1),
(34,'OR-174',24,18,2),
(35,'21636',12,14,4),
(35,'FR-47',55,8,3),
(35,'OR-165',3,10,2),
(35,'OR-181',36,10,1),
(35,'OR-225',72,10,5),
(36,'30310',4,12,2),
(36,'FR-1',2,7,3),
(36,'OR-147',6,7,4),
(36,'OR-203',1,12,5),
(36,'OR-99',15,13,1),
(37,'FR-105',4,70,1),
(37,'FR-57',203,8,2),
(37,'OR-176',38,10,3),
(38,'11679',5,14,1),
(38,'21636',2,14,2),
(39,'22225',3,12,1),
(39,'30310',6,12,2),
(40,'AR-001',4,1,1),
(40,'AR-002',8,1,2),
(41,'AR-003',5,1,1),
(41,'AR-004',5,1,2),
(42,'AR-005',3,1,1),
(42,'AR-006',1,1,2),
(43,'AR-007',9,1,1),
(44,'AR-008',5,1,1),
(45,'AR-009',6,1,1),
(45,'AR-010',4,1,2),
(46,'FR-1',4,7,1),
(46,'FR-10',8,7,2),
(47,'FR-100',9,11,1),
(47,'FR-101',5,13,2),
(48,'FR-102',1,18,1),
(48,'FR-103',1,25,2),
(48,'OR-234',50,64,1),
(48,'OR-236',45,49,2),
(48,'OR-237',50,19,3),
(49,'OR-204',50,10,1),
(49,'OR-205',10,10,2),
(49,'OR-206',5,5,3),
(50,'OR-225',12,10,1),
(50,'OR-226',15,38,2),
(50,'OR-227',44,64,3),
(51,'OR-209',50,10,1),
(51,'OR-210',80,39,2),
(51,'OR-211',70,59,3),
(53,'FR-2',1,7,1),
(53,'FR-85',1,70,3),
(53,'FR-86',2,11,2),
(53,'OR-116',6,7,4),
(54,'11679',3,14,3),
(54,'FR-100',45,10,2),
(54,'FR-18',5,4,1),
(54,'FR-79',3,22,4),
(54,'OR-116',8,7,6),
(54,'OR-123',3,5,5),
(54,'OR-168',2,10,7),
(55,'OR-115',9,7,1),
(55,'OR-213',2,266,2),
(55,'OR-227',6,64,5),
(55,'OR-243',2,64,4),
(55,'OR-247',1,462,3),
(56,'OR-129',1,115,5),
(56,'OR-130',10,18,6),
(56,'OR-179',1,6,3),
(56,'OR-196',3,10,4),
(56,'OR-207',4,4,2),
(56,'OR-250',3,10,1),
(57,'FR-69',6,91,4),
(57,'FR-81',3,49,3),
(57,'FR-84',2,13,1),
(57,'FR-94',6,9,2),
(58,'OR-102',65,18,3),
(58,'OR-139',80,4,1),
(58,'OR-172',69,15,2),
(58,'OR-177',150,15,4),
(74,'FR-67',15,70,1),
(74,'OR-227',34,64,2),
(74,'OR-247',42,8,3),
(75,'AR-006',60,1,2),
(75,'FR-87',24,22,3),
(75,'OR-157',46,10,1),
(76,'AR-009',250,1,5),
(76,'FR-79',40,22,3),
(76,'FR-87',24,22,4),
(76,'FR-94',35,9,1),
(76,'OR-196',25,10,2),
(77,'22225',34,12,2),
(77,'30310',15,12,1),
(78,'FR-53',25,8,2),
(78,'FR-85',56,70,3),
(78,'OR-157',42,10,4),
(78,'OR-208',30,4,1),
(79,'OR-240',50,6,1),
(80,'FR-11',40,100,3),
(80,'FR-36',47,9,2),
(80,'OR-136',75,18,1),
(81,'OR-208',30,4,1),
(82,'OR-227',34,64,1),
(83,'OR-208',30,4,1),
(89,'FR-108',3,32,2),
(89,'FR-3',15,7,6),
(89,'FR-42',12,8,4),
(89,'FR-66',5,49,1),
(89,'FR-87',4,22,3),
(89,'OR-157',8,10,5),
(90,'AR-001',19,1,1),
(90,'AR-002',10,1,2),
(90,'AR-003',12,1,3),
(91,'FR-100',52,11,1),
(91,'FR-101',14,13,2),
(91,'FR-102',35,18,3),
(92,'FR-108',12,23,1),
(92,'FR-11',20,100,2),
(92,'FR-12',30,21,3),
(93,'FR-54',25,9,1),
(93,'FR-58',51,11,2),
(93,'FR-60',3,32,3),
(94,'11679',12,14,1),
(94,'FR-11',33,100,3),
(94,'FR-4',79,29,2),
(95,'FR-10',9,7,2),
(95,'FR-75',6,32,1),
(95,'FR-82',5,70,3),
(96,'FR-43',6,8,1),
(96,'FR-6',16,7,4),
(96,'FR-71',10,22,3),
(96,'FR-90',4,70,2),
(97,'FR-41',12,8,1),
(97,'FR-54',14,9,2),
(97,'OR-156',10,10,3),
(98,'FR-33',14,8,4),
(98,'FR-56',16,8,3),
(98,'FR-60',8,32,1),
(98,'FR-8',18,6,5),
(98,'FR-85',6,70,2),
(99,'OR-157',15,10,2),
(99,'OR-227',30,64,1),
(100,'FR-87',20,22,1),
(100,'FR-94',40,9,2),
(101,'AR-006',50,1,1),
(101,'AR-009',159,1,2),
(102,'22225',32,12,2),
(102,'30310',23,12,1),
(103,'FR-53',12,8,2),
(103,'OR-208',52,4,1),
(104,'FR-85',9,70,1),
(104,'OR-157',113,10,2),
(105,'OR-227',21,64,2),
(105,'OR-240',27,6,1),
(106,'AR-009',231,1,1),
(106,'OR-136',47,18,2),
(107,'30310',143,12,2),
(107,'FR-11',15,100,1),
(108,'FR-53',53,8,1),
(108,'OR-208',59,4,2),
(109,'FR-22',8,4,5),
(109,'FR-36',12,9,3),
(109,'FR-45',14,8,4),
(109,'OR-104',20,10,1),
(109,'OR-119',10,5,2),
(109,'OR-125',3,5,6),
(109,'OR-130',2,18,7),
(110,'AR-010',6,1,3),
(110,'FR-1',14,7,1),
(110,'FR-16',1,45,2),
(116,'21636',5,14,1),
(116,'AR-001',32,1,2),
(116,'AR-005',18,1,5),
(116,'FR-33',13,8,3),
(116,'OR-200',10,4,4),
(117,'FR-78',2,15,1),
(117,'FR-80',1,32,3),
(117,'OR-146',17,4,2),
(117,'OR-179',4,6,4),
(128,'AR-004',15,1,1),
(128,'OR-150',18,2,2),
(52,'FR-67',10,70,1),
(59,'FR-67',10,70,1),
(60,'FR-67',10,70,1),
(61,'FR-67',10,70,1),
(62,'FR-67',10,70,1),
(63,'FR-67',10,70,1),
(64,'FR-67',10,70,1),
(65,'FR-67',10,70,1),
(66,'FR-67',10,70,1),
(67,'FR-67',10,70,1),
(68,'FR-67',10,70,1),
(111,'FR-67',10,70,1),
(112,'FR-67',10,70,1),
(113,'FR-67',10,70,1),
(114,'FR-67',10,70,1),
(115,'FR-67',10,70,1),
(118,'FR-67',10,70,1),
(119,'FR-67',10,70,1),
(120,'FR-67',10,70,1),
(121,'FR-67',10,70,1),
(122,'FR-67',10,70,1),
(123,'FR-67',10,70,1),
(124,'FR-67',10,70,1),
(125,'FR-67',10,70,1),
(126,'FR-67',10,70,1),
(127,'FR-67',10,70,1);

INSERT INTO pago (codigo_cliente,
forma_pago,
id_transaccion,
fecha_pago,
total) VALUES 
(1,'PayPal','ak-std-000001','2008-11-10',2000),
(1,'PayPal','ak-std-000002','2008-12-10',2000),
(3,'PayPal','ak-std-000003','2009-01-16',5000),
(3,'PayPal','ak-std-000004','2009-02-16',5000),
(3,'PayPal','ak-std-000005','2009-02-19',926),
(4,'PayPal','ak-std-000006','2007-01-08',20000),
(4,'PayPal','ak-std-000007','2007-01-08',20000),
(4,'PayPal','ak-std-000008','2007-01-08',20000),
(4,'PayPal','ak-std-000009','2007-01-08',20000),
(4,'PayPal','ak-std-000010','2007-01-08',1849),
(5,'Transferencia','ak-std-000011','2006-01-18',23794),
(7,'Cheque','ak-std-000012','2009-01-13',2390),
(9,'PayPal','ak-std-000013','2009-01-06',929),
(13,'PayPal','ak-std-000014','2008-08-04',2246),
(14,'PayPal','ak-std-000015','2008-07-15',4160),
(15,'PayPal','ak-std-000016','2009-01-15',2081),
(15,'PayPal','ak-std-000035','2009-02-15',10000),
(16,'PayPal','ak-std-000017','2009-02-16',4399),
(19,'PayPal','ak-std-000018','2009-03-06',232),
(23,'PayPal','ak-std-000019','2009-03-26',272),
(26,'PayPal','ak-std-000020','2008-03-18',18846),
(27,'PayPal','ak-std-000021','2009-02-08',10972),
(28,'PayPal','ak-std-000022','2009-01-13',8489),
(30,'PayPal','ak-std-000024','2009-01-16',7863),
(35,'PayPal','ak-std-000025','2007-10-06',3321),
(38,'PayPal','ak-std-000026','2006-05-26',1171);

SELECT * FROM oficina
SELECT * FROM empleado
SELECT * FROM gama_producto
SELECT * FROM cliente
SELECT * FROM pedido
SELECT * FROM producto
SELECT * FROM detalle_pedido
SELECT * FROM pago

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.4.4 Consultas sobre una tabla
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado con el código de oficina y la ciudad donde hay oficinAS.
SELECT codigo_oficina AS 'Codigo Oficina', ciudad AS Ciudad FROM oficina

--Devuelve un listado con la ciudad y el teléfono de lAS oficinAS de España.
SELECT ciudad AS Ciudad, telefono AS Telefono FROM oficina WHERE pais = 'España'

--Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT nombre + ' ' + apellido1 + ' ' + apellido2 AS Nombre, email AS Email FROM empleado WHERE codigo_jefe = 7

--Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT puesto AS Puesto, nombre + ' ' + apellido1 + ' ' + apellido2 AS Nombre, email AS Email FROM empleado WHERE codigo_empleado = 1

--Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventAS.
SELECT nombre + ' ' + apellido1 + ' ' + apellido2 AS Nombre, puesto AS Puesto FROM empleado WHERE puesto != 'Representante Ventas'

--Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT nombre_cliente AS Nombre FROM cliente WHERE pais = 'Spain'

--Devuelve un listado con los distintos estados por los que puede pASar un pedido.
SELECT DISTINCT estado AS Estado FROM pedido;



--Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

--Utilizando la función YEAR de MySQL.
SELECT DISTINCT codigo_cliente AS Codigo, year(fecha_pago) AS Alio FROM pago WHERE YEAR(fecha_pago) = 2008;

--Utilizando la función DATE_FORMAT de MySQL.
Set DATEFORMAT ymd

--Sin utilizar ninguna de lAS funciones anteriores.
SELECT DISTINCT codigo_cliente AS codigo FROM pago WHERE fecha_pago like '2008%'

--Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT DISTINCT codigo_cliente AS codigo FROM pago WHERE fecha_pago like '2008%'

--Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos díAS antes de la fecha esperada.
SELECT codigo_pedido AS codigo_pedido, codigo_cliente AS Codigo_Cliente, fecha_esperada AS Fecha_Esperada, estado AS Estado, fecha_entrega AS Fecha_Entrega 
FROM pedido WHERE estado = 'Pendiente' AND fecha_entrega IS NULL

--Utilizando la función ADDDATE de MySQL.
SELECT codigo_pedido AS Codigo_pedido , codigo_cliente AS Codigo_Cliente, estado AS Estado, fecha_entrega AS Fecha_Entrega, fecha_esperada AS Fecha_Esperada
FROM pedido WHERE fecha_entrega IS NOT NULL AND fecha_entrega < DATEADD(day, -2, fecha_esperada)

--Utilizando la función DATEDIFF de MySQL.
SELECT codigo_pedido, codigo_cliente, estado AS Estado, fecha_entrega, fecha_esperada FROM pedido WHERE fecha_entrega IS NOT NULL AND 
DATEDIFF(day, fecha_entrega, fecha_esperada) > 2

--¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
-- Si, utilizando el operador de resta. Se utiliza la funcion de ADDDATE 
-- y se resta dos a los diAS de la fecha esperada para obtener la fecha de entrega deseada.

--Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT codigo_pedido AS Codigo_pedido, codigo_cliente AS Codigo_Cliente, estado AS Estado, fecha_esperada AS Fecha_Esperada, fecha_entrega AS Fecha_Entrega
FROM pedido WHERE estado = 'Rechazado' AND YEAR(fecha_entrega) = 2009

--Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
SELECT codigo_pedido AS Codigo_pedido, codigo_cliente AS Codigo_Cliente, estado AS Estado, fecha_esperada AS Fecha_Esperada, fecha_entrega AS Fecha_Entrega
FROM pedido WHERE estado = 'Entregado' AND MONTH(fecha_entrega) = 1

--Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT id_transaccion AS Codigo_Pago, codigo_cliente AS Codigo_Cliente, forma_pago AS Metodo_Pago, fecha_pago AS Fecha_Pago, total AS Monto
FROM pago WHERE forma_pago = 'Paypal' AND YEAR(fecha_pago) = 2008 ORDER BY Monto DESC

--Devuelve un listado con todAS lAS formAS de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formAS de pago repetidAS.
SELECT DISTINCT forma_pago AS Metodo_Pago FROM pago

--Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
SELECT nombre AS Nombre, precio_venta AS Precio, cantidad_en_stock AS Stock
FROM producto WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100 ORDER BY precio_venta DESC

--Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventAS tenga el código de empleado 11 o 30.
SELECT nombre_cliente AS Nombre, codigo_empleado_rep_ventAS AS Codigo_Empleado, empleado.nombre AS Nombre_Empleado
FROM cliente INNER JOIN empleado on codigo_empleado_rep_ventAS = codigo_empleado WHERE ciudad = 'Madrid' and codigo_empleado IN (11, 30)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.4.5 ConsultAS multitabla (Composición interna)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Resuelva todAS lAS consultAS utilizando la sintaxis de SQL1 y SQL2. LAS consultAS con sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.
--Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventAS.
SELECT cliente.nombre_cliente AS Cliente, empleado.nombre + ' ' + empleado.apellido1 AS Representante
FROM cliente INNER JOIN empleado ON cliente.codigo_empleado_rep_ventAS = empleado.codigo_empleado

--Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventAS.
SELECT cliente.nombre_cliente AS Cliente, id_transaccion AS Comprobante, empleado.nombre + ' '	+ empleado.apellido1 AS Representante
FROM cliente INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente 
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventAS = empleado.codigo_empleado

--Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventAS.
SELECT cliente.nombre_cliente AS Cliente, id_transaccion AS Comprobante, empleado.nombre +	+ empleado.apellido1 AS Representante
FROM cliente LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventAS = empleado.codigo_empleado WHERE id_transaccion IS NULL

--Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT cliente.nombre_cliente AS Cliente, id_transaccion AS Comprobante, empleado.nombre + ' '	+ empleado.apellido1 AS Representante, oficina.ciudad AS Ciudad
FROM cliente INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente INNER JOIN empleado ON cliente.codigo_empleado_rep_ventAS = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina

--Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT cliente.nombre_cliente AS Cliente, id_transaccion AS Comprobante, empleado.nombre + ' '	+ empleado.apellido1 AS Representante, oficina.ciudad AS Ciudad
FROM cliente LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventAS = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina WHERE id_transaccion IS NULL

--Lista la dirección de lAS oficinAS que tengan clientes en Fuenlabrada.
SELECT DISTINCT oficina.linea_direccion1 + ' '	+ oficina.linea_direccion2 AS Direction, oficina.ciudad	AS Ciudad, cliente.ciudad AS Municipio
FROM oficina INNER JOIN cliente	ON oficina.region = cliente.region
WHERE cliente.ciudad = 'Fuenlabrada'

--Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT cliente.nombre_cliente AS Cliente, empleado.nombre + ' '	+ empleado.apellido1 AS Representante, oficina.ciudad AS Ciudad
FROM cliente INNER JOIN empleado ON cliente.codigo_empleado_rep_ventAS = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina

--Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
SELECT a.nombre AS Empleado, b.nombre AS Jefe FROM empleado a LEFT JOIN empleado b on a.codigo_jefe = b.codigo_empleado;

--Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
SELECT a.nombre AS Empleado, b.nombre AS Jefe, c.nombre AS Jefazo FROM empleado a LEFT JOIN empleado b on a.codigo_jefe = b.codigo_empleado
LEFT JOIN empleado c on b.codigo_jefe = c.codigo_empleado

--Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
SELECT cliente.nombre_cliente AS Cliente, fecha_esperada, fecha_Entrega
FROM cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE fecha_entrega > fecha_esperada

--Devuelve un listado de lAS diferentes gamAS de producto que ha comprado cada cliente.
SELECT DISTINCT gama_producto.gama AS Gama FROM gama_producto INNER JOIN producto ON gama_producto.gama = producto.gama
INNER JOIN detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
INNER JOIN pedido ON detalle_pedido.codigo_pedido = pedido.codigo_pedido
INNER JOIN cliente ON pedido.codigo_cliente = cliente.codigo_cliente



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.4.6 ConsultAS multitabla (Composición externa)
--Resuelva todAS lAS consultAS utilizando lAS cláusulAS LEFT JOIN, RIGHT JOIN, NATURAL LEFT JOIN y NATURAL RIGHT JOIN.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
SELECT DISTINCT cliente.nombre_cliente + ' ' + cliente.apellido_contacto AS Cliente, pago.id_transaccion AS Comprobante,
fecha_pago, pago.total AS Total FROM cliente LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
SELECT DISTINCT cliente.nombre_cliente + ' ' + cliente.apellido_contacto AS Cliente,
pedido.codigo_pedido AS Pedido, pedido.fecha_pedido AS Fecha_Pedido, pedido.fecha_esperada AS Fecha_Esperada, pedido.fecha_entrega AS Fecha_Entrega, pedido.estado AS Estado
FROM cliente LEFT JOIN pedido on cliente.codigo_cliente = pedido.codigo_cliente
WHERE pedido.codigo_cliente IS NULL

--Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
SELECT DISTINCT cliente.nombre_cliente + ' ' + cliente.apellido_contacto AS Cliente,
pago.id_transaccion AS Comprobante, pedido.codigo_pedido AS Pedido, pedido.fecha_pedido AS Fecha_Pedido, pedido.estado AS Estado
FROM cliente LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente
LEFT JOIN pedido on cliente.codigo_cliente = pedido.codigo_cliente
WHERE pago.codigo_cliente IS NULL and pedido.codigo_cliente IS NULL

--Devuelve un listado que muestre solamente los empleados que no tienen una oficina ASociada.
SELECT empleado.nombre + ' ' + empleado.apellido1 + ' ' + empleado.apellido2 AS Empleado, 
oficina.linea_direccion1 AS Oficina
FROM empleado LEFT JOIN oficina on empleado.codigo_oficina = oficina.codigo_oficina
WHERE empleado.codigo_oficina IS NULL

--Devuelve un listado que muestre solamente los empleados que no tienen un cliente ASociado.
SELECT empleado.puesto AS Puesto,
empleado.nombre + ' ' + empleado.apellido1 + ' ' + empleado.apellido2 AS Empleado,
cliente.nombre_cliente + ' ' + cliente.apellido_contacto AS Cliente
FROM empleado LEFT JOIN cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventAS
WHERE cliente.codigo_empleado_rep_ventAS IS NULL

--Devuelve un listado que muestre solamente los empleados que no tienen un cliente ASociado junto con los datos de la oficina donde trabajan.
SELECT empleado.puesto AS Puesto,
empleado.nombre + ' ' + empleado.apellido1 + ' ' + empleado.apellido2 AS Empleado,
cliente.nombre_cliente + ' ' + cliente.apellido_contacto AS Cliente,
oficina.linea_direccion1 + ' ' + oficina.linea_direccion2 AS Oficina
FROM empleado LEFT JOIN cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventAS
LEFT JOIN oficina on empleado.codigo_oficina = oficina.codigo_oficina
WHERE cliente.codigo_empleado_rep_ventAS IS NULL

--Devuelve un listado que muestre los empleados que no tienen una oficina ASociada y los que no tienen un cliente ASociado.
SELECT empleado.puesto AS Puesto, empleado.nombre + ' ' + empleado.apellido1 + ' ' + empleado.apellido2 AS Empleado,
cliente.nombre_cliente + ' ' + cliente.apellido_contacto AS Cliente
FROM empleado LEFT JOIN cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventAS
WHERE cliente.codigo_empleado_rep_ventAS IS NULL or empleado.codigo_oficina IS NULL

--Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT DISTINCT producto.nombre AS Producto, producto.codigo_producto AS Codigo, detalle_pedido.codigo_producto Pedido
FROM producto LEFT JOIN detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
WHERE detalle_pedido.codigo_producto IS NULL

--Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
SELECT producto.nombre AS Producto, producto.descripcion AS Descripcion, gama_producto.imagen AS Imagen
FROM producto LEFT JOIN detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
LEFT JOIN gama_producto on producto.gama = gama_producto.gama
WHERE detalle_pedido.codigo_producto IS NULL

--Devuelve lAS oficinAS donde no trabajan ninguno de los empleados que hayan sido los representantes de ventAS de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
SELECT * from oficina
JOIN empleado on oficina.codigo_oficina = empleado.codigo_oficina
JOIN cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventAS
JOIN pedido on cliente.codigo_cliente = pedido.codigo_cliente
JOIN detalle_pedido on pedido.codigo_pedido = detalle_pedido.codigo_pedido
JOIN producto on detalle_pedido.codigo_producto = producto.codigo_producto
JOIN gama_producto on producto.gama = gama_producto.gama
WHERE gama_producto.gama != 'Frutales' AND (cliente.codigo_empleado_rep_ventAS <> all(SELECT codigo_empleado from empleado JOIN oficina on oficina.codigo_oficina = empleado.codigo_oficina));

--Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
SELECT cliente.nombre_cliente + ' ' + cliente.apellido_contacto AS Cliente, pedido.codigo_pedido AS Pedido,
pago.id_transaccion AS Comprobante_Pago, pedido.fecha_pedido AS Fecha_Pedido, pedido.estado AS Estado
FROM cliente LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente
LEFT JOIN pedido on cliente.codigo_cliente = pedido.codigo_cliente
WHERE pago.codigo_cliente IS NULL and pedido.codigo_cliente is not NULL

--Devuelve un listado con los datos de los empleados que no tienen clientes ASociados y el nombre de su jefe ASociado.
SELECT empleado.nombre + ' ' + empleado.apellido1 + ' ' + empleado.apellido2 AS Empleado,
empleado.puesto AS Puesto, cliente.nombre_cliente + ' ' + cliente.apellido_contacto AS Cliente,
empleado.codigo_empleado AS Codigo, empleado.codigo_oficina AS Oficina,
jefe.nombre + ' ' + jefe.apellido1 + ' ' + jefe.apellido2 AS jefe
FROM empleado LEFT JOIN cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventAS
LEFT JOIN empleado jefe on empleado.codigo_jefe = jefe.codigo_empleado
WHERE cliente.codigo_empleado_rep_ventAS IS NULL


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.4.7 ConsultAS resumen
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--¿Cuántos empleados hay en la compañía?
SELECT COUNT(*) FROM empleado

--¿Cuántos clientes tiene cada país?
SELECT pais, COUNT(*) AS clientes FROM cliente GROUP BY pais

--¿Cuál fue el pago medio en 2009?
SELECT AVG(pago.total) AS Pago_Medio FROM pago WHERE YEAR(pago.fecha_pago) = 2009

--¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
SELECT estado AS Estado, COUNT(*) AS Pedidos FROM pedido GROUP BY estado ORDER BY pedidos DESC

--Calcula el precio de venta del producto más caro y más barato en una misma consulta.
SELECT MAX(precio_venta) AS Precio_MAS_Caro, MIN(precio_venta) AS Precio_MAS_Barato FROM producto

--Calcula el número de clientes que tiene la empresa.
SELECT COUNT(*) AS Clientes FROM cliente

--¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
SELECT COUNT(*) AS Clientes_Madrid FROM cliente WHERE ciudad = 'Madrid'

--¿Calcula cuántos clientes tiene cada una de lAS ciudades que empiezan por M?
SELECT ciudad AS Ciudad, COUNT(*) AS Clientes FROM cliente WHERE ciudad LIKE 'M%' GROUP BY ciudad

--Devuelve el nombre de los representantes de ventAS y el número de clientes al que atiende cada uno.
SELECT empleado.nombre + ' ' + empleado.apellido1 + ' ' + empleado.apellido2 AS Nombre_Representante, COUNT(*) AS Clientes
FROM empleado, cliente WHERE empleado.codigo_empleado = cliente. codigo_empleado_rep_ventAS
GROUP BY empleado.nombre, empleado.apellido1, empleado.apellido2

--Calcula el número de clientes que no tiene ASignado representante de ventAS.
SELECT COUNT(*) AS Clientes_Sin_Representante FROM cliente WHERE codigo_empleado_rep_ventAS IS NULL

--Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
SELECT cliente.nombre_contacto + ' ' + cliente.apellido_contacto AS Nombre_Cliente, MIN(pago.fecha_pago) AS Fecha_Primer_Pago, MAX(pago.fecha_pago) AS Fecha_Ultimo_Pago
FROM cliente, pago WHERE cliente.codigo_cliente = pago.codigo_cliente
GROUP BY cliente.nombre_contacto, cliente.apellido_contacto

--Calcula el número de productos diferentes que hay en cada uno de los pedidos.
SELECT COUNT(DISTINCT detalle_pedido.codigo_producto) AS Productos_Diferentes FROM pedido, detalle_pedido
WHERE pedido.codigo_pedido = detalle_pedido.codigo_pedido

--Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
SELECT SUM(detalle_pedido.cantidad) AS Cantidad_Total_Productos FROM pedido, detalle_pedido
WHERE pedido.codigo_pedido = detalle_pedido.codigo_pedido

--Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidAS.
SELECT top 20 producto.nombre AS Producto, SUM(detalle_pedido.cantidad) AS Cantidad_Total_Unidades FROM producto, detalle_pedido
WHERE producto. codigo_producto = detalle_pedido.codigo_producto GROUP BY producto.nombre ORDER BY Cantidad_Total_Unidades DESC

--La facturación que ha tenido la empresa en toda la historia, indicando la bASe imponible, el IVA y el total facturado. La bASe imponible se calcula sumando el coste del producto por el número de unidades vendidAS de la tabla detalle_pedido. El IVA es el 21 % de la bASe imponible, y el total la suma de los dos campos anteriores.
SELECT SUM(detalle_pedido.cantidad * producto.precio_venta) AS BASe_Imponible, SUM((detalle_pedido.cantidad * producto.precio_venta) * 0.21) AS IVA, SUM(detalle_pedido.cantidad * producto.precio_venta * 1.21) AS Total_Facturado
FROM producto, detalle_pedido
WHERE producto. codigo_producto = detalle_pedido.codigo_producto

--La misma información que en la pregunta anterior, pero agrupada por código de producto.
SELECT producto.codigo_producto AS Codigo_Producto, producto.nombre AS Producto,
SUM(detalle_pedido.cantidad) AS Cantidad_Total_Unidades, SUM(detalle_pedido.cantidad * producto.precio_venta) AS BASe_Imponible,
SUM((detalle_pedido.cantidad * producto.precio_venta) * 0.21) AS IVA, SUM(detalle_pedido.cantidad * producto.precio_venta * 1.21) AS Total_Facturado
FROM producto, detalle_pedido WHERE producto. codigo_producto = detalle_pedido.codigo_producto
GROUP BY producto.codigo_producto, producto.nombre ORDER BY Cantidad_Total_Unidades DESC

--La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
SELECT producto.codigo_producto AS Codigo_Producto, producto.nombre AS Producto, SUM(detalle_pedido.cantidad) AS Cantidad_Total_Unidades,
SUM(detalle_pedido.cantidad * producto.precio_venta) AS BASe_Imponible, SUM((detalle_pedido.cantidad * producto.precio_venta) * 0.21) AS IVA,
SUM(detalle_pedido.cantidad * producto.precio_venta * 1.21) AS Total_Facturado FROM producto, detalle_pedido
WHERE producto.codigo_producto = detalle_pedido.codigo_producto AND producto.codigo_producto LIKE 'OR%'
GROUP BY producto.codigo_producto, producto.nombre ORDER BY Cantidad_Total_Unidades DESC

--Lista lAS ventAS totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidAS, total facturado y total facturado con impuestos (21% IVA).
SELECT producto.nombre AS Producto, SUM(detalle_pedido.cantidad) AS Cantidad_Total_Unidades,
SUM(detalle_pedido.cantidad * producto.precio_venta) AS BASe_Imponible, SUM((detalle_pedido.cantidad * producto.precio_venta) * 0.21) AS IVA,
SUM(detalle_pedido.cantidad * producto.precio_venta * 1.21) AS Total_Facturado FROM producto, detalle_pedido
WHERE producto.codigo_producto = detalle_pedido.codigo_producto AND (detalle_pedido.cantidad * producto.precio_venta * 1.21) > 3000
GROUP BY producto.nombre ORDER BY Cantidad_Total_Unidades DESC

--Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
SELECT SUM(pago.total) AS Total_Pagos, Year(pago.fecha_pago) AS "Año" FROM pago GROUP BY Year(pago.fecha_pago)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.4.8 SubconsultAS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1.4.8.1 Con operadores básicos de comparación

--Devuelve el nombre del cliente con mayor límite de crédito.
SELECT nombre_cliente AS Cliente, limite_credito AS Limite_Credito FROM cliente WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente)

--Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT nombre AS Producto, precio_venta AS Precio_Venta FROM producto WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto)

--Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
SELECT top 1 nombre AS Producto,SUM(cantidad) AS Unidades_VendidAS FROM producto, detalle_pedido
WHERE producto. codigo_producto = detalle_pedido.codigo_producto GROUP BY producto.codigo_producto, nombre
ORDER BY Unidades_VendidAS DESC

--Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
SELECT nombre_cliente AS Cliente, limite_credito AS Limite_Credito
FROM cliente WHERE limite_credito > (SELECT SUM(total) FROM pago WHERE codigo_cliente = cliente.codigo_cliente)

--Devuelve el producto que más unidades tiene en stock.
SELECT nombre AS Nombre, producto.cantidad_en_stock AS Stock FROM producto WHERE producto.cantidad_en_stock = (SELECT max(Producto.cantidad_en_stock) from producto)

--Devuelve el producto que menos unidades tiene en stock.
SELECT nombre AS Nombre, producto.cantidad_en_stock AS Stock FROM producto WHERE producto.cantidad_en_stock = (SELECT min(Producto.cantidad_en_stock) from producto)

--Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
SELECT nombre + ' ' + apellido1 AS Nombre, email , codigo_jefe FROM empleado WHERE codigo_jefe = (SELECT codigo_empleado FROM empleado WHERE nombre = 'Alberto' AND apellido1 = 'Soria');


--1.4.8.2 SubconsultAS con ALL y ANY

--Devuelve el nombre del cliente con mayor límite de crédito.
SELECT nombre_cliente AS Cliente, limite_credito AS Limite_Credito FROM cliente WHERE limite_credito >= ALL(SELECT limite_credito FROM cliente)

--Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT nombre AS Producto, precio_venta AS Precio_Venta FROM producto WHERE precio_venta >= ALL(SELECT precio_venta FROM producto)

--Devuelve el producto que menos unidades tiene en stock.
SELECT nombre AS Nombre, producto.cantidad_en_stock AS Stock FROM producto WHERE producto.cantidad_en_stock <= ALL(SELECT producto.cantidad_en_stock from producto)


--1.4.8.3 SubconsultAS con IN y NOT IN

--Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
SELECT nombre + ' ' + apellido1 AS Nombre, puesto, cliente.nombre_cliente AS Cliente
FROM empleado LEFT JOIN cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventAS
WHERE codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventAS FROM cliente)

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
SELECT nombre_cliente AS Cliente, pago.id_transaccion AS Comprobante
FROM cliente LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente
WHERE cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)

--Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
SELECT nombre_cliente AS Cliente, pago.id_transaccion AS Comprobante
FROM cliente LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente
WHERE cliente.codigo_cliente IN (SELECT codigo_cliente FROM pago)

--Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT nombre AS Producto, producto.codigo_producto AS Codigo, detalle_pedido.codigo_pedido AS Pedido_ID
FROM producto LEFT JOIN detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
WHERE producto.codigo_producto NOT IN (SELECT codigo_producto FROM detalle_pedido)

--Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventAS de ningún cliente.
SELECT nombre + ' ' + apellido1 AS Nombre, puesto AS Puesto, telefono AS Telefono
FROM empleado LEFT JOIN cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventAS
WHERE codigo_empleado NOT IN (SELECT codigo_empleado from empleado WHERE empleado.puesto = 'Representante VentAS')

--Devuelve lAS oficinAS donde no trabajan ninguno de los empleados que hayan sido los representantes de ventAS de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
SELECT oficina.* from oficina JOIN empleado on oficina.codigo_oficina = empleado.codigo_oficina
JOIN cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
JOIN pedido on cliente.codigo_cliente = pedido.codigo_cliente
JOIN detalle_pedido on pedido.codigo_pedido = detalle_pedido.codigo_pedido
JOIN producto on detalle_pedido.codigo_producto = producto.codigo_producto
JOIN gama_producto on producto.gama = gama_producto.gama
WHERE gama_producto.gama != 'Frutales' AND (cliente.codigo_empleado_rep_ventAS NOT IN (SELECT codigo_empleado_rep_ventAS FROM cliente))

--Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
SELECT nombre_cliente AS Cliente, Pedido.codigo_pedido AS Pedido_ID,
pago.id_transaccion AS Comprobante_Pago FROM cliente LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente
LEFT JOIN pedido on cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.codigo_cliente IN (SELECT codigo_cliente FROM pedido) AND cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)


--1.4.8.4 SubconsultAS con EXISTS y NOT EXISTS

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
SELECT nombre_cliente AS Cliente, pago.id_transaccion AS Comprobante_Pago
FROM cliente LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente WHERE NOT EXISTS (SELECT codigo_cliente
FROM pago WHERE cliente.codigo_cliente = pago.codigo_cliente)

--Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
SELECT nombre_cliente AS Cliente, pago.id_transaccion AS Comprobante_Pago
FROM cliente LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente WHERE EXISTS (SELECT codigo_cliente
FROM pago WHERE cliente.codigo_cliente = pago.codigo_cliente)

--Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT nombre AS Producto, producto.codigo_producto AS Codigo, detalle_pedido.codigo_pedido AS Pedido_ID
FROM producto LEFT JOIN detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
WHERE NOT EXISTS (SELECT codigo_producto FROM detalle_pedido WHERE producto.codigo_producto = detalle_pedido.codigo_producto)

--Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
SELECT DISTINCT nombre AS Producto, producto.codigo_producto AS Codigo
FROM producto LEFT JOIN detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
WHERE EXISTS (SELECT codigo_producto FROM detalle_pedido WHERE producto.codigo_producto = detalle_pedido.codigo_producto);


--1.4.9 ConsultAS variadAS

--Devuelve el listado de clientes indicando el nombre del cliente y cuantos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningUn pedido.
SELECT nombre_cliente AS Cliente, COUNT(pedido.codigo_pedido) AS Num_Pedidos
FROM cliente LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
GROUP BY nombre_cliente

--Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningun pago.
SELECT nombre_cliente AS Cliente, SUM(total) AS Total_Pagado FROM cliente
LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
GROUP BY nombre_cliente ORDER BY Total_Pagado DESC

--Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabeticamente de menor a mayor.
SELECT DISTINCT nombre_cliente AS Cliente, year(fecha_pedido) AS Aim
FROM cliente LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE year(fecha_pedido) = 2008

--Devuelve el nombre del cliente, el nombre y primer apellido de su representante de yentAS y el numero de telefono de la oficina del representante de yentAS, de aquellos clientes que no hayan realizado ningun pago.
SELECT nombre_cliente AS Cliente, pago.id_transaccion AS Comprobante, empleado.nombre + ' ' + empleado.apellido1 + ' ' + empleado.apellido2 AS Nombre_Rep_VentAS, oficina.telefono AS Telefono FROM cliente
LEFT JOIN empleado ON cliente.codigo_empleado_rep_ventAS = empleado.codigo_empleado
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
LEFT JOIN pago on cliente.codigo_cliente = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL

--Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de yentAS y la ciudad donde esta su oficina.
SELECT nombre_cliente AS Cliente, empleado.nombre + ' ' + empleado.apellido1 + ' ' + empleado.apellido2 AS Nombre_Rep_VentAS,
oficina.ciudad AS Ciudad FROM cliente LEFT JOIN empleado ON cliente.codigo_empleado_rep_ventAS = empleado.codigo_empleado
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina ORDER BY nombre_cliente

--Devuelve el nombre, apellidos, puesto y telefono de la oficina de aquellos empleados que no sean representante de yentAS de ningun cliente.
SELECT empleado.nombre + ' ' + empleado.apellido1 + ' '	+ empleado.apellido2 AS Nombre, empleado.puesto AS Puesto, oficina.telefono AS Telefono
FROM empleado LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE empleado.codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventAS FROM cliente)

--Devuelve un listado indicando todAS lAS ciudades donde hay oficinAS y el nUmero de empleados que tiene.
SELECT oficina.ciudad AS Ciudad, COUNT(empleado.codigo_empleado) AS Num_Empleados
FROM oficina LEFT JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina
GROUP BY oficina.ciudad
