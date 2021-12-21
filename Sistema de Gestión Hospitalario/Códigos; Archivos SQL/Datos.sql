
USE SistemaHospitalario

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DATOS INSERTADOS ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PACIENTES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Paciente1
INSERT INTO Pacientes VALUES ('Rosa','Arianna','Suero','Payano','00578990769','','2003-08-21','8098884444', '8095254444');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-1', 'COVID-19', 'C719', 'Cedensa', 'Ninguna', 'Inyecciones para COVID-19', 'Sufre de diabetes', 'Admitido', '2003-08-21');
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-1', '10005', 'Yamasa', 'Santo Domingo', 'Monte Plata', 'Estudiante', 'raicelys@gmail.com');
--Paciente2
INSERT INTO Pacientes VALUES ('Teresa','Susy','Solano','Perez','00578989410','','1980-09-23','8098885555', '8095255475');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-2', 'SIKA', 'T467', 'ARS', 'Al mani', '', 'Sufre de hipertension', 'No admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-2', '10380', 'San Felipe', 'Santo Domingo', 'Puerto Plata', 'Maestra', 'sysy000@gmail.com');
--Paciente3
INSERT INTO Pacientes VALUES ('Susana','Alexa','Soto','Simet','00578990674','','1999-08-21','8098885984', '80952544368');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-3', 'Cancer', 'C099', 'Cedensa', 'Ninguna', 'Tratramiento contra cancer', 'Sufre de diabetes', 'Admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-3', '10749', 'Hatillo', 'Santo Domingo', 'Cotui', 'Seguridad', 'alesoto@gmail.com');
--Paciente4
INSERT INTO Pacientes VALUES ('Jonas','Angel','Perez','Mena','00578990123','','1975-08-21','8098882324', '8095253268');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-4', 'Chincunguya', 'C389', 'Cedensa', 'Ninguna', 'Inyecciones para chincunguya', 'Sufre de la vista', 'Admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-4', '10273', 'Distrito Nacional', 'Santo Domingo', 'Santo Domingo', 'Prestamista', 'perez34@gmail.com');
--Paciente5
INSERT INTO Pacientes VALUES ('Pelvida','Melany','Jesus','Vargas','005709890769','','1988-08-21','8098889999', '8095259999');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-5', 'Infeccion', 'C762', 'Cedensa', 'Lactosa', 'Inyecciones para COVID-19', 'Sufre de sinopsitis', 'No admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-5', '10248', 'Yamasa', 'Santo Domingo', 'Monte Plata', 'Enfermera', 'meljesu4@gmail.com');
--Paciente6
INSERT INTO Pacientes VALUES ('Pedro','Jose','Martinez','Lopez','00580439903','','2000-01-13','8097869080', '82953221134');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-6', 'Fiebre', 'S999', 'Agrodosa', 'Ninguna', 'Tratramiento contra la fiebre', 'Sufre de la presion', 'Admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-6', '10801', 'Alcarrizos', 'Santo Domingo', 'Santo Domingo Oeste', 'Estudiante', 'PJmartinez@gmail.com');
--Paciente7
INSERT INTO Pacientes VALUES ('Juan','Jose','Ventura','Ramon','00582943200','','2000-03-22','8090781785', '82997316201');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-7', 'Fractura', 'C191', 'Angloamericana ', 'Ninguna', 'Yeso para pierna izquierda', '', 'Admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-7', '10731', 'Boca chica', 'Santo Domingo', 'Santo Domingo Este', 'Profesor', 'Jventura@gmail.com');
--Paciente8
INSERT INTO Pacientes VALUES ('Martin','Daniel','Rodriguez','Madera','00587219413','','2000-04-11','8095672093', '82990890432');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-8', 'Dengue', 'C243', 'Humano Seguros ', 'Polvo', 'Tratamiento contra el dengue', 'Diabetes', 'Admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-8', '10444', 'Alma Rosa', 'Santo Domingo', 'Santo Domingo Este', 'Estudiante', 'mrmadera14@gmail.com');
--Paciente9
INSERT INTO Pacientes VALUES ('Gabriel','Jose','Espinal','Lopez','00598709322','','2002-11-23','8095314215', '82964709812');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-9', 'COVID-19', 'Z123', 'ARS SEMMA ', '', '2 vacunas Pfizer ', '', 'Admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-9', '10313', 'Los minas', 'Santo Domingo', 'Santo Domingo Este', 'desempleado', 'gabrielj1212@gmail.com');
--Paciente10
INSERT INTO Pacientes VALUES ('Lía','Marie','Guerrero','Díaz','00598319355','','2001-06-11','8094900914', '82964709812');
INSERT INTO InformacionHospitalariaPaciente VALUES ('PAC-10', 'Influencia', 'I623', 'Mapfre BHD ', '', 'Tratamiento para la Influencia', 'osteoporosis', 'Admitido', getdate());
INSERT INTO InformacionSecundariaPaciente VALUES ('PAC-10', '10462', 'Naco', 'Santo Domingo', 'Distrito Nacional', 'Estudiante', 'liaguerrero11@gmail.com');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AREAS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Area VALUES
('A-0','Area externa'),
('A-1','Area general'),
('A-2','Area de urgencias'),
('A-3','Area de utilidad'),
('B-1','Area de analisis'),
('C-1','Area de imagenes'),
('E-1','Area administrativa'),
('D-1','Area de consulta');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SECCION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Seccion VALUES ('P0','Parqueo','A-0'), 
('M0','Morge','A-0'),
('C1','Comedor','A-1'),
('F1','Farmacia','A-1'), 
('A1','Auditorio','A-1'), 
('R1','Recepcion','A-1'), 
('CA1','Cajero automatico','A-1'),
('SE2','Salas de emergencia','A-2'), 
('RE2','Recepcion urgencia','A-2'), 
('SI2','Salas intensivas','A-2'),
('SQ2','Salas quirurgicas','A-2'), 
('SDE2','Sala de espera','A-2'),
('CO3','Cocina','A-3'), 
('LAV3','Lavanderia','A-3'), 
('EDS3','Estacion de servicios','A-3'), 
('VE3','Vestidor de empleados','A-3'),
('BDE3','Baños de empleado','A-3'), 
('RX1','Rayos X','B-1'), 
('IM1','Imagenes','B-1'), 
('RYC1','Recepcion y caja','B-1'), 
('LDA1','Laboratorio alergias','B-1'), 
('BOD1','Bodegas','B-1'), 
('ECO1','Ecografia','C-1'), 
('MAM1','Mamografia','C-1'), 
('RAD1','Radiografia','C-1'), 
('IMM1','Imagenes manegticas','C-1'), 
('OFI1','Oficina','E-1'), 
('SAR1','Sala de reuniones','E-1'), 
('SAD1','Sala de administracion','E-1'), 
('CON1','Contabilidad','E-1'),
('TEC1','Tecnologia','E-1'),
('EST1','Estadistica','E-1');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TIPO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TipoCat VALUES
('Salas'),
('Habitacion'),
('Oficina'),
('Servicio'),
('Utilidad'),
('Zona privada'),
('Monopaciente'),
('Multipaciente'),
('Bipaciente'),
('Enfermeria ambulante'),
('Traslado');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CATEGORIA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Categoria VALUES 
('Cocina','Utiliarios de cocina','Utiliarios'),
('Medico','Batas y accesorios','Ropa'),
('Oficina','Documentacion','Papeleria'),
('Equipos medicos','Quirugico',''),
('Equipos medicos','Materiales medicos','Tijeras'),
('Consulta','Chequeo paciente','Chequeo'),
('Cita','Cita medica','Revision'),
('Intervencion','Operacion a paciente','Operacion');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AMBULANCIAS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Ambulancias VALUES
('102830M','Land Cruiser Hardtop', getdate(),'Rural','TIPO-7','Peralvillo', 'Monte Plata'),
('213942Z','Land Cruiser Hardtop', getdate(),'Urbana','TIPO-7','Mameyes', 'Santo Domingo'),
('123682T','Land Cruiser Hardtop', getdate(),'Rural','TIPO-7','Esperanza', 'La Vega'),
('389102A','Land Cruiser Hardtop', getdate(),'Urbana','TIPO-8','Cayo Levantado', 'La Romana'),
('532930B','Land Cruiser Hardtop', getdate(),'Rural','TIPO-8','Frontera', 'Pedernales'),
('472190G','Land Cruiser Hardtop', getdate(),'Urbana','TIPO-9','La Cigua', 'Santiago Rodriguez'),
('272949Y','Land Cruiser Hardtop', getdate(),'Rural','TIPO-9','San Felipe', 'Puerto Plata'),
('379132L','Land Cruiser Hardtop', getdate(),'Urbana','TIPO-10','Pueblo central', 'Santiago'),
('387291J','Land Cruiser Hardtop', getdate(),'Rural','TIPO-10','San Juan', 'Azua'),
('371901K','Land Cruiser Hardtop', getdate(),'Rural','TIPO-11','Colina Arriva', 'San Cristobal');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SERVICIOS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Servicios VALUES
('Mamografia', 'Imagens medicas','CAT-6',779.99),
('Consulta de vista', 'Consulta ocular','CAT-7',1500.00),
('Estiparcion de tumor', 'Operacion cancerigena','CAT-8',69890.99),
('Operacion ocular','Estirpacion de uña', 'CAT-8', 89999.99);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--COMERCIANTES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ComerciantesProveedores VALUES
('Pedro','Antonio','Perez', 'Collado', 'pedroan@gmail.com','8293860987','Villa Mella','Distrito nacional','Santo Domingo','Via web'),
('Maire','Teresa','Jorge', 'Reyes', 'e728n@gmail.com','8293784287','Toro bajo','Sabana Grande','Monte Plata','Envio'),
('Angel','Junior','Jonas', 'Jesus', 'p56an@gmail.com','8295680987','Jimani','Corrido','Perdenales','Empresa virtual'),
('Timon','Gary','Tritan', 'Tomas', 'garun@gmail.com','8293308687','Yaguana','Pueblo bajo','San Cristobal','Empresa presencial'),
('Leidy','Coley','Claus', 'Smith', 'lalae@gmail.com','8297938765','Cacao','San Felipe','Azua','Adquision directa');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--INVENTARIO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Inventario VALUES
('Hilo','Hilo de puntadas','PRO-1', 12,'CAT-4', 44.99,'Nilon'),
('Suero','Suero de hidratacion','PRO-2', 24,'CAT-4', 90,'Hidratico'),
('Sonda','Sondas vesicales','PRO-3', 78,'CAT-4', 45.79, 'Vesiles'),
('Tijeras pequeñas','Tijeras internas', 'PRO-4', 48,'CAT-5', 68.99,'Pulsante'),
('Navajas','Navaja pequeña','PRO-5',56,'CAT-5', 178.56,'Cortante');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--HOSPITAL
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Hospital VALUES
('P0','A-0',5),
('M0','A-0',3),
('CA1','A-1',9),
('C1','A-1',7),
('BOD1', 'B-1', 9),
('ECO1', 'C-1',10),
('BDE3', 'A-3',5),
('RX1','B-1', 8);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--EMPLEADO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Empleado 1
INSERT INTO Empleados VALUES ('Luisa','Maria','Terreno','Roma','78905478942','1999-01-23','8096789654','8095253849','Activo');
INSERT INTO InformaciónHospitalariaEmpleado VALUES ('EMP-1', 'A-0','P0', 'Seguridad', '2019-09-12', '08:30:00', '03:30:00', 'lm@gmail.com');
INSERT INTO InformaciónSecundariaEmpleado VALUES ('EMP-1', '27930', 'C7392', 'Semma', 'Ninguna', 'Mamayes', 'Villa Mella', 'Santo Domingo');
--Empleado 2
INSERT INTO Empleados VALUES ('Timon','Mario','Tomas','Rojas','4490908942','1995-01-02','8096706854','8095250009','No activo');
INSERT INTO InformaciónHospitalariaEmpleado VALUES ('EMP-2', 'A-3','CO3', 'Chef principal', '2015-09-30', '04:30:00', '12:30:00', 'timw@gmail.com');
INSERT INTO InformaciónSecundariaEmpleado VALUES ('EMP-2', '27926', 'C9038', 'Semma', 'Mani', 'Bella Vista', 'Distrito nacional', 'Santo Domingo');
--Empleado 3
INSERT INTO Empleados VALUES ('Yayo','Tanis','Toro','Roa','5550908942','1985-11-02','8090006854','8095258888','Activo');
INSERT INTO InformaciónHospitalariaEmpleado VALUES ('EMP-3', 'C-1','C1', 'Vendedora de comedor', '2015-09-30', '09:30:00', '16:30:00', 'vmo34w@gmail.com');
INSERT INTO InformaciónSecundariaEmpleado VALUES ('EMP-3', '27886', 'C9082', 'Semma', 'Ninguno', 'San Tomas', 'Pueblo nuevo', 'Santiago');
--Empleado 4
INSERT INTO Empleados VALUES ('Katia','Massiel','Suero','Cruz','9005678942','2003-12-02','8090005599','8095258764','No activo');
INSERT INTO InformaciónHospitalariaEmpleado VALUES ('EMP-4', 'A-2','SI2', 'Enfermera', '2015-09-30', '07:00:00', '17:00:00', 'martaa93@gmail.com');
INSERT INTO InformaciónSecundariaEmpleado VALUES ('EMP-4', '20002', 'C9062', 'ARS', 'Ninguno', 'Los Coquitos', 'Yamasa', 'Monte Plata');
--Empleado 5
INSERT INTO Empleados VALUES ('Yoseet','Leo','Tiros','Bordes','5550908111','1999-11-02','8090001234','80952502973','Activo');
INSERT INTO InformaciónHospitalariaEmpleado VALUES ('EMP-5', 'E-1','TEC1', 'Tecnologia', '2010-09-30', '14:00:00', '19:00:00', 'yose330@gmail.com');
INSERT INTO InformaciónSecundariaEmpleado VALUES ('EMP-5', '379405', 'C7000', 'Cedensa', 'Ninguno', 'San Marcos', 'Frontera', 'Pedernales');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HABITACION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Habitacion VALUES
('TIPO-1','SAR1'),
('TIPO-1','SDE2'),
('TIPO-1','SE2'),
('TIPO-1','SQ2'),
('TIPO-3','SAD1'),
('TIPO-3','TEC1'),
('TIPO-3','OFI1'),
('TIPO-2','SI2'),
('TIPO-2','SI2'),
('TIPO-5','BDE3'),
('TIPO-5','CO3'),
('TIPO-5','BOD1'),
('TIPO-6','LAV3'),
('TIPO-6','VE3'),
('TIPO-4','ECO1'),
('TIPO-4','F1'),
('TIPO-4','CA1'),
('TIPO-4','RYC1');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PREINSCRIPCION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Preinscripcion 
INSERT INTO Preinscripcion(rIdPaciente, rIdEmpleado,rFecha, rHora, rIdServicio) VALUES 
('PAC-4','EMP-4','2022-05-11','16:00:00','SER-19')
INSERT INTO Preinscripcion(rIdPaciente, rIdEmpleado,rFecha, rHora, rIdServicio) VALUES 
('PAC-2','EMP-4','2022-02-18','14:30:00','SER-17')
INSERT INTO Preinscripcion(rIdPaciente, rIdEmpleado,rFecha, rHora, rIdServicio) VALUES 
('PAC-1','EMP-4','2022-01-28','14:30:00','SER-18')
INSERT INTO Preinscripcion(rIdPaciente, rIdEmpleado,rFecha, rHora, rIdServicio) VALUES 
('PAC-3','EMP-4','2022-03-05','15:30:00','SER-16')

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE FACTURACION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SistemaFacturacion VALUES (GETDATE(), 'PRE-1','C389','PAC-4','Tarjeta');
INSERT INTO SistemaFacturacion VALUES (GETDATE(), 'PRE-2','T467','PAC-2','Efectivo');
INSERT INTO SistemaFacturacion VALUES (GETDATE(), 'PRE-3','C719','PAC-1','Efectivo');
INSERT INTO SistemaFacturacion VALUES (GETDATE(), 'PRE-4','C099','PAC-3','Tarjeta');


