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

-- Volcando datos para la tabla public.gd_acuerdo_catalogo: 0 rows
DELETE FROM "gd_acuerdo_catalogo";
/*!40000 ALTER TABLE "gd_acuerdo_catalogo" DISABLE KEYS */;
INSERT INTO "gd_acuerdo_catalogo" ("id", "nombre", "descripcion", "updated_at", "created_at") VALUES
	(2, 'Asuntos Administrativo-Financieros', NULL, '2021-11-25', '2021-11-25'),
	(1, 'Asuntos Académicos-Administrativos', NULL, '2021-11-25', '2021-11-25'),
	(3, 'Misiones Oficiales', NULL, '2021-11-25', '2021-11-25'),
	(4, 'Funcionamiento', NULL, '2021-11-25', '2021-11-25'),
	(5, 'Denuncias', NULL, '2021-11-25', '2021-11-25');
/*!40000 ALTER TABLE "gd_acuerdo_catalogo" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
