
USE SistemaHospitalario

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAS GENERALES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PACIENTE 
SELECT * FROM Pacientes
SELECT * FROM InformacionSecundariaPaciente
SELECT * FROM InformacionHospitalariaPaciente

--EMPLEADO
SELECT * FROM Empleados
SELECT * FROM InformaciónSecundariaEmpleado
SELECT * FROM InformaciónHospitalariaEmpleado

--HOSPITAL
SELECT * FROM Ambulancias ORDER BY aId ASC
SELECT * FROM Servicios
SELECT * FROM Categoria
SELECT * FROM Inventario
SELECT * FROM ComerciantesProveedores
SELECT * FROM Habitacion
SELECT * FROM Hospital
SELECT * FROM TipoCat
SELECT * FROM Area
SELECT * FROM Seccion

--FACTURACION
SELECT * FROM Preinscripcion
SELECT * FROM SistemaFacturacion
SELECT * FROM Historial --auto

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAS ORDEN, LIKE, + '' +, ETC. ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Empleados registrados de primero a último y viceversa
SELECT * FROM Pacientes ORDER BY pId DESC
SELECT * from Pacientes ORDER BY pId ASC

--Empleados que su nombre tiene 5 digitos
SELECT *  FROM Empleados
WHERE Empleados.ePrimerNombre LIKE '_____'

--Empleados cuyos apellidos inician con T y su seguro y id del seguro
SELECT Empleados.eIdEmpleado, Empleados.ePrimerApellido, Empleados.ePrimerNombre, 
InformaciónSecundariaEmpleado.eIdSeguro, InformaciónSecundariaEmpleado.eSeguro FROM Empleados
INNER JOIN InformaciónSecundariaEmpleado ON Empleados.eIdEmpleado = InformaciónSecundariaEmpleado.eIdEmpleado
WHERE Empleados.ePrimerApellido LIKE 'T%'

-- Nombre completo de empleados
SELECT eIdEmpleado, (ePrimerNombre + ' '+ ePrimerApellido + ' ' + eSegundoApellido) AS 'Nombre Completo' FROM Empleados

-- Empleado con id EMP-3
SELECT * FROM InformaciónSecundariaEmpleado WHERE eIdEmpleado = 'EMP-3'

--Empleado que trabaja en el area de tecnologia
SELECT * FROM InformaciónHospitalariaEmpleado WHERE ePosición = 'Tecnologia'
SELECT * FROM InformaciónHospitalariaEmpleado WHERE ePosición LIKE '%tecnologia%'

--UPDATE telefonos
UPDATE Pacientes SET pNúmeroCelular = '8095366475' WHERE pIdPaciente = 'PAC-3'
UPDATE Pacientes SET pNúmeroCelular = '8291929080' WHERE pIdPaciente = 'PAC-7'
UPDATE Pacientes SET pNúmeroCelular = '8291929080' WHERE pIdPaciente = 'PAC-8'
UPDATE Pacientes SET pNúmeroCelular = '8295321027' WHERE pIdPaciente = 'PAC-9'
UPDATE Pacientes SET pNúmeroCelular = '8297092030' WHERE pIdPaciente = 'PAC-10'
UPDATE Pacientes SET pNúmeroCelular = '8292331027' WHERE pIdPaciente = 'PAC-11'


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAS CON JOINS ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Toda la informacion de los empleados
SELECT *  FROM Empleados
INNER JOIN InformaciónHospitalariaEmpleado ON InformaciónHospitalariaEmpleado.eIdEmpleado = Empleados.eIdEmpleado
INNER JOIN InformaciónSecundariaEmpleado ON InformaciónHospitalariaEmpleado.eIdEmpleado = InformaciónSecundariaEmpleado.eIdEmpleado

--Toda la información de los pacientes
SELECT *  FROM Pacientes
INNER JOIN InformacionHospitalariaPaciente ON InformacionHospitalariaPaciente.pIdPaciente = Pacientes.pIdPaciente
INNER JOIN InformacionSecundariaPaciente ON InformacionHospitalariaPaciente.pIdPaciente = InformacionSecundariaPaciente.pIdPaciente

-- Todas las areas y secciones
SELECT *  FROM Area
INNER JOIN Seccion ON Area.IdArea = Seccion.sIdArea

--Todas las preinscripciones, sistema de facturacion, historial
SELECT * FROM Preinscripcion
INNER JOIN SistemaFacturacion ON Preinscripcion.rNumInscripción = SistemaFacturacion.fNumInscripción
INNER JOIN Historial ON Historial.hPreinscripción = SistemaFacturacion.fNumInscripción

--Las habitaciones del hospital con todos sus datos
SELECT * FROM Seccion
INNER JOIN Habitacion ON Habitacion.hoSeccion = Seccion.IdSeccion
INNER JOIN Hospital ON Habitacion.hoSeccion = Hospital.hoSeccion

--Inventario con sus comerciantes y categorias
SELECT * FROM Inventario 
INNER JOIN Categoria ON Inventario.iIdCategoria = Categoria.cIdCategoria
INNER JOIN ComerciantesProveedores ON ComerciantesProveedores.cIdProveedor = Inventario.iIdProveedor

--Servicios y su categorizacion
SELECT * FROM Servicios
INNER JOIN Categoria ON Servicios.sIdCategoría = Categoria.cIdCategoria 

--Sistema de facturacion desde agendar, pago y historial (factura)
SELECT * FROM Preinscripcion
INNER JOIN SistemaFacturacion ON Preinscripcion.rNumInscripción = SistemaFacturacion.fNumInscripción
INNER JOIN Historial ON SistemaFacturacion.fIdFactura = Historial.hFactura

--Asociar ambulancia y sus tipos
SELECT * FROM Ambulancias
INNER JOIN TipoCat ON Ambulancias.aIdTipo = TipoCat.tIdTipo

