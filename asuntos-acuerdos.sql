-- --------------------------------------------------------
-- Host:                         ec2-35-170-123-64.compute-1.amazonaws.com
-- Versión del servidor:         PostgreSQL 13.4 (Ubuntu 13.4-4.pgdg20.04+1) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, 64-bit
-- SO del servidor:              
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando datos para la tabla public.gd_asunto_catalogo: 0 rows
DELETE FROM "gd_asunto_catalogo";
/*!40000 ALTER TABLE "gd_asunto_catalogo" DISABLE KEYS */;
INSERT INTO "gd_asunto_catalogo" ("id", "id_gd_acuerdo_catalogo", "nombre", "descripcion") VALUES
	(1, 1, 'Inscripción Extemporánea', NULL),
	(2, 1, 'Inscripción Del PERA', NULL),
	(3, 1, 'Recuperación Calidad Egresado', NULL),
	(4, 1, 'Prórroga Calidad Egreso', NULL),
	(5, 1, 'Ratificación Dictamen Equivalencia', NULL),
	(6, 1, 'Retiro Asignaturas Extemporáneas', NULL),
	(7, 1, 'Modificación Acdo Cambio De Carrera', NULL),
	(8, 1, 'Ingreso General', NULL),
	(9, 1, 'Ingreso Por Calificación Socioeconómica', NULL),
	(10, 1, 'Ingreso Por Excelencia Académica', NULL),
	(11, 1, 'Ingreso Empleados O Hijos De Empleados', NULL),
	(12, 1, 'Prórroga Finalización Trabajo De Grado', NULL),
	(13, 1, 'Ratificación Notas Parciales Y Finales Trabajo De Grado', NULL),
	(14, 1, 'Nombramiento Tribunal Calificador Trabajo De Grado', NULL),
	(15, 1, 'Nombramiento Docente Asesor De Trabajo De Grado', NULL),
	(16, 1, 'Inscripción De Trabajo De Grado', NULL),
	(17, 1, 'Ratificación De Tema Trabajo De Grado', NULL),
	(18, 1, 'Diploma De Reconocimiento', NULL),
	(19, 1, 'Beca Por Excelencia Académica', NULL),
	(20, 1, 'Cuarta Matrícula', NULL),
	(21, 1, 'Oferta Académica Y Calendarización', NULL),
	(22, 1, 'Ampliación De Oferta Académica', NULL),
	(23, 1, 'Revisión De Carga Académica', NULL),
	(24, 1, 'Dejar Sin Efecto Acuerdo', NULL),
	(25, 1, 'Cursos Académicos', NULL),
	(26, 1, 'Eventos Académicos', NULL),
	(27, 1, 'Otros (Casos Especiales)', NULL),
	(28, 1, 'Nombramiento Representantes Docentes En Comité De Ingreso Universitario', NULL),
	(29, 1, 'Revisión De Acuerdo De Junta Directiva', NULL),
	(30, 2, 'Solicitud De Respuesta', NULL),
	(31, 2, 'Ratificación Toma De Posesión', NULL),
	(32, 2, 'Contratación Por Servicios Personales De Carácter Permanente Con Reserva De Plaza', NULL),
	(33, 2, 'Contratación Por Servicios Personales De Carácter Eventual', NULL),
	(34, 2, 'Contratación Por Servicios Personales De Carácter Temporal', NULL),
	(35, 2, 'Contratación Por Servicios Profesionales De Carácter Eventual', NULL),
	(36, 2, 'Contratación Servicios Profesionales No Personales A Cuarto De Tiempo', NULL),
	(37, 2, 'Contratación Servicios Profesionales No Personales', NULL),
	(38, 2, 'Contratación Servicios Profesionales No Personales Hora Clase', NULL),
	(39, 2, 'Contratación En Tiempo Adicional', NULL),
	(40, 2, 'Contratación En Tiempo Integral', NULL),
	(41, 2, 'Pasivo Laboral', NULL),
	(42, 2, 'Taller Y Financiamiento', NULL),
	(43, 2, 'Ratificación Acuerdo De Decanato', NULL),
	(44, 2, 'Congresos', NULL),
	(45, 2, 'Revisión De Acuerdo De Junta Directiva', NULL),
	(46, 2, 'Cursos', NULL),
	(47, 2, 'Cancelación Deuda A Librería Universitaria', NULL),
	(48, 2, 'Modificación De Acuerdo De JD', NULL),
	(49, 3, 'Reconsideración De Acuerdo De JD', NULL),
	(50, 3, 'Permiso Y Misión Oficial', NULL),
	(51, 3, 'Permiso Con Goce De Sueldo Y Misión Oficial', NULL),
	(52, 3, 'Permiso Con Goce De Sueldo Y Misión Oficial Y Financiamiento', NULL),
	(53, 3, 'Permiso Sin Goce De Sueldo Y Misión Oficial', NULL),
	(54, 3, 'Permiso, Misión Oficial Y Financiamiento', NULL),
	(55, 3, 'Misión Oficial Y Financiamiento', NULL),
	(56, 3, 'Permiso Con Goce De Sueldo, Beca Y Trámites', NULL),
	(57, 3, 'Toma De Posesión Del Cargo Posterior A MO', NULL),
	(58, 4, 'Reconsideración De Contratación', NULL),
	(59, 4, 'Toma De Posesión Del Cargo Posterior A MO', NULL),
	(60, 4, 'Horarios De Permanencia Docentes', NULL),
	(61, 4, 'Validación De Permisos Personales', NULL),
	(62, 4, 'Horarios Académicos De Docentes', NULL),
	(63, 4, 'Apertura De Expediente Disciplinario', NULL),
	(64, 4, 'Informe De Evaluación Docente (CACPA)', NULL),
	(65, 4, 'Exoneración De Cuotas', NULL),
	(66, 4, 'Limpieza Y Oficios Varios', NULL),
	(67, 4, 'Criterios Para Selección De Aspirantes', NULL),
	(68, 4, 'Expediente De Investigación', NULL),
	(69, 4, 'Expediente Identificado', NULL),
	(70, 4, 'Investigaciones', NULL),
	(71, 4, 'Docente Ausente En Clases', NULL),
	(72, 4, 'Recurso De Revisión De Acuerdo De JD', NULL),
	(73, 4, 'Resolución Conciliatoria', NULL),
	(74, 4, 'Modificación De Acuerdo', NULL),
	(75, 4, 'Corrección De Acuerdo De JD', NULL),
	(76, 4, 'Recepción De Donación', NULL),
	(77, 4, 'Descargo De Bienes', NULL),
	(78, 4, 'Lineamientos De Planificación De Servicio Académico', NULL),
	(79, 4, 'Medidas Habilitación De Marcaje Online', NULL),
	(80, 4, 'Medidas Habilitación De Expediente Online', NULL),
	(81, 4, 'Virtualización De Contenidos', NULL),
	(82, 5, 'Apertura Informativo Administrativo Disciplinario', NULL),
	(83, 5, 'Audiencia Única', NULL);
/*!40000 ALTER TABLE "gd_asunto_catalogo" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
