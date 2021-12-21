DROP DATABASE SistemaHospitalario
CREATE DATABASE SistemaHospitalario
USE SistemaHospitalario

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PACIENTES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Pacientes(
	pId INT IDENTITY(00001,1),
	pIdPaciente AS 'PAC-' + RIGHT(CONVERT(VARCHAR(20), pId), 16) PERSISTED PRIMARY KEY, --Primary key
	pPrimerNombre VARCHAR(15) NOT NULL, 
	pSegundoNombre VARCHAR(15),
	pPrimerApellido VARCHAR(15) NOT NULL,
	pSegundoApellido VARCHAR(15),
	pC�dula VARCHAR(11),
	pActaNacimiento VARCHAR(11),
	pFechaNacimiento DATE NOT NULL,
	pN�meroTelef�nico VARCHAR(12),
	pN�meroCelular VARCHAR(15) NOT NULL
);

CREATE TABLE InformacionHospitalariaPaciente(

	pIdPaciente VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Pacientes(pIdPaciente), --Llave foranea
	pDiagn�stico TEXT,
	pIdSeguro VARCHAR(30),
	pSeguro VARCHAR(20),
	pAlergias TEXT,
	pTratamiento VARCHAR(50),
	pObservaciones TEXT,
	pEstado VARCHAR(20) NOT NULL,
	pFechaIngreso DATE NOT NULL,
)

CREATE TABLE InformacionSecundariaPaciente(
	pIdPaciente VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Pacientes(pIdPaciente), --Llave foranea
	pC�digoPostal VARCHAR(10),
	pDirecci�n VARCHAR(20) NOT NULL,
	pCiudad VARCHAR(20) NOT NULL,
	pProvincia VARCHAR(20) NOT NULL,
	pOcupaci�n VARCHAR(20) NOT NULL,
	pCorreo VARCHAR(40)
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AREA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Area(
	IdArea VARCHAR(20) NOT NULL PRIMARY KEY,
	NombreArea VARCHAR(20) NOT NULL
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SECCION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Seccion(
	IdSeccion VARCHAR(20) NOT NULL PRIMARY KEY,
	NombreSeccion VARCHAR(20) NOT NULL,
	sIdArea VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Area(IdArea)
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EMPLEADOS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Empleados(
	eId INT IDENTITY(00001,1),
	eIdEmpleado AS 'EMP-' + RIGHT(CONVERT(VARCHAR(20), eId), 16) PERSISTED PRIMARY KEY, --Primary key
	ePrimerNombre VARCHAR(15) NOT NULL,
	eSegundoNombre VARCHAR(15),
	ePrimerApellido VARCHAR(15) NOT NULL,
	eSegundoApellido VARCHAR(15),
	eC�dula VARCHAR(11),
	eFechaNacimiento DATE,
	eN�meroTelef�nico VARCHAR(15) NOT NULL,
	eN�meroCelular VARCHAR(15) NOT NULL,
	eEstado VARCHAR(20) NOT NULL
);

CREATE TABLE Informaci�nHospitalariaEmpleado(
	eIdEmpleado VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Empleados(eIdEmpleado), --Llave foranea
	eIdArea VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Area(IdArea),  --Llave foranea
	eIdSeccion VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Seccion(IdSeccion), --Llave foranea
	ePosici�n VARCHAR(20) NOT NULL,
	eFechaIngreso DATE NOT NULL, --GETDATE()
	eHorarioEntrada TIME NOT NULL, 
	eHorarioSalida TIME NOT NULL,
	eCorreo VARCHAR(40) NOT NULL
);

CREATE TABLE Informaci�nSecundariaEmpleado(
	eIdEmpleado VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Empleados(eIdEmpleado), --Llave foranea
	eC�digoPostal VARCHAR(10),
	eIdSeguro VARCHAR(15),
	eSeguro VARCHAR(30),
	eAlergias TEXT,
	eDirecci�n VARCHAR(20) NOT NULL,
	eCiudad VARCHAR(20) NOT NULL,
	eProvincia VARCHAR(20) NOT NULL
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--COMERCIANTES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ComerciantesProveedores(
	cId INT IDENTITY(00001,1),
	cIdProveedor AS 'PRO-' + RIGHT(CONVERT(VARCHAR(20), cId), 16) PERSISTED PRIMARY KEY, --Primary key
	cPrimerNombre VARCHAR(20) NOT NULL,
	cSegundoNombre VARCHAR(20),
	cPrimerApellido VARCHAR(20) NOT NULL,
	cSegundoApellido VARCHAR(20),
	cCorreo VARCHAR(30) NOT NULL,
	cTelefono VARCHAR(15) NOT NULL,
	cDirecci�n VARCHAR(20) NOT NULL,
	cCiudad VARCHAR(20) NOT NULL,
	cProvincia VARCHAR(20) NOT NULL,
	cCanal VARCHAR(20) NOT NULL
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CATEGORIA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Categoria(
	cIdCat INT IDENTITY(00001,1), 
	cIdCategoria AS 'CAT-' + RIGHT(CONVERT(VARCHAR(20), cIdCat), 16) PERSISTED PRIMARY KEY, --Primary key
	cNombreCategoria VARCHAR(20) NOT NULL,
	cDescripcion TEXT,
	cTipo VARCHAR(20) NOT NULL
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INVENTARIO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Inventario(
	iId INT IDENTITY(00001,1),
	iCodigo AS 'INV-' + RIGHT(CONVERT(VARCHAR(20), iId), 16) PERSISTED PRIMARY KEY, --Primary key
	iNombre VARCHAR(20) NOT NULL,
	iDescripci�n TEXT,
	iIdProveedor VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES ComerciantesProveedores(cIdProveedor), --Llave foranea
	iCantidadAlmacenada INT NOT NULL,
	iIdCategoria VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Categoria(cIdCategoria), --Llave foranea
	iPrecioCompra FLOAT NOT NULL,
	iTipo VARCHAR(15) NOT NULL
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TIPO DE CATEGORIA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TipoCat(
	tIdT INT IDENTITY(00001,1), 
	tIdTipo AS 'TIPO-' + RIGHT(CONVERT(VARCHAR(20), tIdT), 20) PERSISTED PRIMARY KEY, --Primary key
	tNombreTipo VARCHAR(20) NOT NULL
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AMBULANCIAS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Ambulancias(
	aId INT IDENTITY(00001,1),
	aMatricula AS 'AMB-' + RIGHT(CONVERT(VARCHAR(20), aId), 16) PERSISTED PRIMARY KEY, --Primary key
	aIdPlaca VARCHAR(20) NOT NULL,
	aModelo VARCHAR(30),
	aFechaAdquisi�n DATE NOT NULL,
	aZona VARCHAR(16) NOT NULL,
	aIdTipo VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES TipoCat(tIdTipo),
	aUbicacion VARCHAR(30) NOT NULL,
	aProvincia VARCHAR(20) NOT NULL,
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SERVICIOS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Servicios(
	s_Id INT IDENTITY(00001,1),
	sIdServicio AS 'SER-' + RIGHT(CONVERT(VARCHAR(20), s_Id), 16) PERSISTED PRIMARY KEY, --Primary key
	sNombre VARCHAR(20) NOT NULL,
	sDescripci�n VARCHAR(30),
	sIdCategor�a VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Categoria(cIdCategoria),
	sPrecio FLOAT NOT NULL 
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PREINSCRIPCION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Preinscripcion(
	rId INT IDENTITY(00001,1),
	rNumInscripci�n AS 'PRE-' + RIGHT(CONVERT(VARCHAR(20), rId), 16) PERSISTED PRIMARY KEY, --Primary key
	rIdPaciente VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Pacientes(pIdPaciente), --Llave foranea
	rPrimerNombrePaciente VARCHAR(15),
	rPrimerApellidoPaciente VARCHAR(15),
	rIdEmpleado VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Empleados(eIdEmpleado), --Llave foranea
	rPrimerNombreEmpleado VARCHAR(15),
	rPrimerApellidoEmpleado VARCHAR(15),
	rFecha DATE NOT NULL,
	rHora TIME NOT NULL,
	rIdServicio VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Servicios(sIdServicio) --Llave foranea
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE FACTURACION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE SistemaFacturacion(
	fId INT IDENTITY(00001,1),
	fIdFactura AS 'FAC-' + RIGHT(CONVERT(VARCHAR(20), fId), 16) PERSISTED PRIMARY KEY, --Primary key
	fFecha DATETIME NOT NULL, --auto
	fNumInscripci�n VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Preinscripcion(rNumInscripci�n), --Llave foranea
	pIdSeguro VARCHAR(10), 
	fIdPaciente VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Pacientes(pIdPaciente), --Llave foranea
	fMetodoPago VARCHAR(20) NOT NULL,
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--HOSPITAL
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Hospital (
    hoId INT IDENTITY (00001,1),
    hoIdHospital AS 'HOS-' + RIGHT (CONVERT(VARCHAR(20),hoId), 16 ) PERSISTED PRIMARY KEY, --Primary key
    hoSeccion VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Seccion(idSeccion),
    hoArea VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Area(IdArea),
    hoCantidadHabitacion INT NOT NULL
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HABITACION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Habitacion (
    haId INT IDENTITY (00001,1),
    haNumeroHabitacion AS 'HAB-' + RIGHT (CONVERT(VARCHAR(20),haId),16) PERSISTED PRIMARY KEY, --Primary key
    HaTipoHabitacion VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES TipoCat(tIdTipo), 
    hoSeccion VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Seccion(idSeccion) --Llave foranea
);


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HISTORIAL -- AUTOCOMPLETE WITH TRIGGERS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Historial(
	hId INT IDENTITY(00001,1),
	hIdHistorial AS 'HIS-' + RIGHT(CONVERT(VARCHAR(20), hId), 16) PERSISTED PRIMARY KEY, 
	hPreinscripci�n VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Preinscripcion(rNumInscripci�n), --Llave foranea
	hFactura VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES SistemaFacturacion(fIdFactura), --Llave foranea 
	hServicio VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Servicios(sIdServicio), --Llave foranea
	hIdPaciente VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Pacientes(pIdPaciente), --Llave foranea
	hIdEspecialista VARCHAR(20),
	hTotal FLOAT NOT NULL, 
	hFecha DATE NOT NULL, 
	hIdResponsable VARCHAR(20) 
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS 1

GO
CREATE TRIGGER Historialsf
ON SistemaFacturacion FOR INSERT
AS
SET NOCOUNT ON

DECLARE @hPreinscripci�n  VARCHAR(20) 
SELECT @hPreinscripci�n = fNumInscripci�n FROM inserted
DECLARE @hFactura VARCHAR(20) 
SELECT @hFactura = fIdFactura FROM inserted
DECLARE @hServicio VARCHAR(20) 
SELECT @hServicio = rIdServicio FROM Preinscripcion WHERE @hPreinscripci�n = rNumInscripci�n
DECLARE @hIdPaciente VARCHAR(20) 
SELECT @hIdPaciente = fIdPaciente FROM inserted
DECLARE @hIdEspecialista VARCHAR(20) 
SELECT @hIdEspecialista = (rPrimerNombreEmpleado + ' ' + rPrimerApellidoEmpleado) 
FROM Preinscripcion WHERE @hPreinscripci�n = rNumInscripci�n
DECLARE @hTotal FLOAT 
SELECT @hTotal = sPrecio FROM Servicios WHERE @hServicio = sIdServicio
DECLARE @UsuarioActual VARCHAR(20) = 'Luis Reyes'

INSERT INTO Historial VALUES(@hPreinscripci�n, @hFactura, @hServicio, 
@hIdPaciente, @hIdEspecialista,@hTotal, getdate(), @UsuarioActual);

GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS 2
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

GO
CREATE TRIGGER PreinscripcionCompletado
ON Preinscripcion FOR INSERT
AS

DECLARE @hPreinscripci�n VARCHAR(20) 
SELECT @hPreinscripci�n = rNumInscripci�n FROM inserted
DECLARE @rIdPaciente VARCHAR(20) 

SELECT @rIdPaciente = rIdPaciente FROM inserted
DECLARE @rPrimerNombrePaciente VARCHAR(20) 

SELECT  @rPrimerNombrePaciente = pPrimerNombre 
FROM Pacientes WHERE pIdPaciente = @rIdPaciente
DECLARE @rPrimerApellidoPaciente VARCHAR(20) 

SELECT @rPrimerApellidoPaciente = pPrimerApellido 
FROM Pacientes WHERE pIdPaciente = @rIdPaciente
DECLARE @eIdEmpleado VARCHAR(20) 
SELECT @eIdEmpleado = rIdEmpleado FROM inserted

DECLARE @rPrimerNombreEmpleado VARCHAR(20) 
SELECT @rPrimerNombreEmpleado = ePrimerNombre 
FROM Empleados WHERE eIdEmpleado = @eIdEmpleado
DECLARE @rPrimerApellidoEmpleado VARCHAR(20) 
SELECT @rPrimerApellidoEmpleado = ePrimerApellido 
FROM Empleados WHERE eIdEmpleado = @eIdEmpleado

UPDATE Preinscripcion SET 
rPrimerNombrePaciente = @rPrimerNombrePaciente,
rPrimerApellidoPaciente = @rPrimerApellidoPaciente,
rPrimerNombreEmpleado = @rPrimerNombreEmpleado,
rPrimerApellidoEmpleado = @rPrimerApellidoEmpleado
WHERE rNumInscripci�n = @hPreinscripci�n;
GO






