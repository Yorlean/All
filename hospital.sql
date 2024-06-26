-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 16:49:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDireccionPaciente` (IN `doc_id` VARCHAR(10), IN `nueva_direccion` VARCHAR(100))   BEGIN
    UPDATE PACIENTES
    SET DIRECCION = nueva_direccion
    WHERE DOC_IDENTIDAD = doc_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDetallesFacturacion` (IN `doc_id` VARCHAR(10))   BEGIN
    SELECT t1.NUM_FACTURA, t1.FECHA_FACTURA, t2.DESCRIPCION AS Medicamento, t1.CANTIDAD, t1.PRECIO_VENTA, t1.TOTAL_A_PAGAR
    FROM FACTURA t1
    INNER JOIN MEDICAMENTOS t2 ON t1.COD_MEDICAMENTOS = t2.COD_MEDICAMENTOS
    WHERE t1.DOC_IDENT_PACIENTE = doc_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTotalIngresos` (IN `doc_id` VARCHAR(10))   BEGIN
    SELECT COUNT(*) AS TotalIngresos
    FROM INGRESOS
    WHERE DOC_IDENTIFICA_PACIENTE = doc_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `COD_DIAGNOSTICO` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `SINTOMAS` text DEFAULT NULL,
  `TRATAMIENTO` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diagnosticos`
--

INSERT INTO `diagnosticos` (`COD_DIAGNOSTICO`, `NOMBRE`, `SINTOMAS`, `TRATAMIENTO`) VALUES
(1, 'Resfriado común', 'Congestión nasal, estornudos, dolor de garganta, tos', 'Fisioterapia y reposo en cama'),
(2, 'Gripe', 'Fiebre, dolor de cabeza, fatiga, dolor muscular, congestión nasal', 'Descanso, líquidos, analgésicos, antivirales'),
(3, 'Esguince de tobillo', 'Dolor, inflamación, dificultad para mover el tobillo', 'Reposo, hielo, compresión, elevación'),
(4, 'Bronquitis', 'Tos persistente, dificultad para respirar, producción de esputo', 'Descanso, líquidos, antitusígenos, antibióticos en caso de infección bacteriana'),
(5, 'Neumonía', 'Fiebre, tos con flema, dolor en el pecho, dificultad para respirar', 'Hospitalización, oxígeno, antibióticos'),
(6, 'Conjuntivitis', 'Enrojecimiento del ojo, secreción, picazón, sensación de cuerpo extraño', 'Lavado ocular, compresas frías, gotas antibióticas en caso de infección bacteriana'),
(7, 'Gastritis', 'Dolor abdominal, acidez, náuseas, vómitos', 'Dieta blanda, antiácidos, evitar alimentos irritantes'),
(8, 'Anemia', 'Fatiga, palidez, debilidad, falta de concentración', 'Suplementos de hierro, ácido fólico, cambios en la dieta'),
(9, 'Hipertensión arterial', 'Dolor de cabeza, mareos, visión borrosa, fatiga', 'Dieta baja en sodio, ejercicio regular, medicamentos antihipertensivos'),
(10, 'Diabetes mellitus tipo 2', 'Aumento de la sed, aumento de la frecuencia urinaria, fatiga, visión borrosa', 'Dieta balanceada, ejercicio regular, medicamentos hipoglucemiantes'),
(11, 'Infección urinaria', 'Dolor al orinar, urgencia urinaria, frecuencia urinaria aumentada, dolor abdominal bajo', 'Antibióticos, aumento de la ingesta de líquidos'),
(12, 'Dermatitis atópica', 'Picazón intensa, enrojecimiento, piel seca, descamación', 'Hidratación regular de la piel, cremas antiinflamatorias, evitar irritantes'),
(13, 'Asma', 'Sibilancias, dificultad para respirar, opresión en el pecho, tos', 'Inhaladores de alivio rápido, corticosteroides inhalados, evitar desencadenantes'),
(14, 'Úlcera péptica', 'Dolor abdominal, acidez, sensación de saciedad, náuseas', 'Antagonistas del receptor de histamina, inhibidores de la bomba de protones, evitar irritantes'),
(15, 'Artritis reumatoide', 'Dolor en las articulaciones, rigidez matutina, inflamación, fatiga', 'Antiinflamatorios no esteroides, medicamentos modificadores de la enfermedad, fisioterapia'),
(16, 'Migraña', 'Dolor de cabeza intenso, sensibilidad a la luz y al sonido, náuseas, vómitos', 'Analgésicos específicos para migraña, triptanos, evitar desencadenantes'),
(17, 'Depresión', 'Tristeza persistente, pérdida de interés en actividades, cambios en el sueño y el apetito, fatiga', 'Terapia psicológica, antidepresivos, apoyo social'),
(18, 'Ansiedad', 'Nerviosismo, preocupación excesiva, irritabilidad, dificultad para concentrarse', 'Terapia cognitivo-conductual, ansiolíticos, técnicas de relajación'),
(19, 'Insomnio', 'Dificultad para conciliar o mantener el sueño, despertar temprano, sensación de no descansar lo suficiente', 'Higiene del sueño, terapia cognitivo-conductual, medicamentos hipnóticos'),
(20, 'Alergia', 'Estornudos, picazón en los ojos, secreción nasal, urticaria', 'Antihistamínicos, evitar alérgenos, inmunoterapia en casos graves');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `COD_ESPECIALIDAD` int(11) NOT NULL,
  `ESPECIALIDAD` varchar(255) DEFAULT NULL,
  `REGISTRO_MSN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`COD_ESPECIALIDAD`, `ESPECIALIDAD`, `REGISTRO_MSN`) VALUES
(1, 'Medicina General', '123ABC'),
(2, 'Traumatología', '456DEF'),
(3, 'Pediatría', '789GHI'),
(4, 'Dermatología', 'ABC123'),
(5, 'Gastroenterología', 'DEF456'),
(6, 'Cardiología', 'GHI789'),
(7, 'Neurología', '123ABC'),
(8, 'Oftalmología', '456DEF'),
(9, 'Endocrinología', '789GHI'),
(10, 'Psiquiatría', 'ABC123'),
(11, 'Oncología', 'DEF456'),
(12, 'Reumatología', 'GHI789'),
(13, 'Neumología', '123ABC'),
(14, 'Otorrinolaringología', '456DEF'),
(15, 'Urología', '789GHI'),
(16, 'Ginecología', 'ABC123'),
(17, 'Hematología', 'DEF456'),
(18, 'Infectología', 'GHI789'),
(19, 'Geriatría', '123ABC'),
(20, 'Nefrología', '456DEF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `NUM_FACTURA` int(11) NOT NULL,
  `NUMERO_INGRESO` int(11) DEFAULT NULL,
  `DOC_IDENT_PACIENTE` varchar(255) DEFAULT NULL,
  `FECHA_FACTURA` timestamp NOT NULL DEFAULT current_timestamp(),
  `COD_MEDICAMENTOS` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `PRECIO_VENTA` decimal(10,2) DEFAULT NULL,
  `TOTAL_A_PAGAR` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`NUM_FACTURA`, `NUMERO_INGRESO`, `DOC_IDENT_PACIENTE`, `FECHA_FACTURA`, `COD_MEDICAMENTOS`, `CANTIDAD`, `PRECIO_VENTA`, `TOTAL_A_PAGAR`) VALUES
(1, 101, '123456789', '2024-04-10 05:00:00', 1, 2, 5.50, 11.00),
(2, 102, '234567890', '2024-04-11 05:00:00', 2, 1, 3.75, 3.75),
(3, 103, '345678901', '2024-04-12 05:00:00', 3, 1, 7.25, 7.25),
(4, 104, '456789012', '2024-04-13 05:00:00', 4, 1, 10.00, 10.00),
(5, 105, '567890123', '2024-04-14 05:00:00', 5, 3, 8.20, 24.60),
(6, 106, '678901234', '2024-04-15 05:00:00', 6, 1, 4.50, 4.50),
(7, 107, '789012345', '2024-04-16 05:00:00', 7, 2, 9.75, 19.50),
(8, 108, '890123456', '2024-04-17 05:00:00', 8, 1, 6.80, 6.80),
(9, 109, '901234567', '2024-04-18 05:00:00', 9, 1, 3.25, 3.25),
(10, 110, '012345678', '2024-04-19 05:00:00', 10, 1, 12.00, 12.00),
(11, 111, '123456789', '2024-04-20 05:00:00', 11, 1, 8.50, 8.50),
(12, 112, '234567890', '2024-04-21 05:00:00', 12, 1, 11.75, 11.75),
(13, 113, '345678901', '2024-04-22 05:00:00', 13, 2, 6.30, 12.60),
(14, 114, '456789012', '2024-04-23 05:00:00', 14, 1, 9.00, 9.00),
(15, 115, '567890123', '2024-04-24 05:00:00', 15, 1, 8.75, 8.75),
(16, 116, '678901234', '2024-04-25 05:00:00', 16, 1, 5.25, 5.25),
(17, 117, '789012345', '2024-04-26 05:00:00', 17, 1, 10.50, 10.50),
(18, 118, '890123456', '2024-04-27 05:00:00', 18, 1, 7.10, 7.10),
(19, 119, '901234567', '2024-04-28 05:00:00', 19, 2, 4.80, 9.60),
(20, 120, '012345678', '2024-04-29 05:00:00', 20, 1, 6.95, 6.95);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `NUMERO_INGRESO` int(11) NOT NULL,
  `HABITACION` varchar(255) DEFAULT NULL,
  `CAMA` varchar(255) DEFAULT NULL,
  `FECHA_INGRESO` timestamp NOT NULL DEFAULT current_timestamp(),
  `DOC_IDENTIFICA_PACIENTE` varchar(255) DEFAULT NULL,
  `DOC_IDENTIFICA_MEDICO` varchar(255) DEFAULT NULL,
  `COD_DIAGNOSTICO` int(11) DEFAULT NULL,
  `EXAMENES_REALIZADOS` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`NUMERO_INGRESO`, `HABITACION`, `CAMA`, `FECHA_INGRESO`, `DOC_IDENTIFICA_PACIENTE`, `DOC_IDENTIFICA_MEDICO`, `COD_DIAGNOSTICO`, `EXAMENES_REALIZADOS`) VALUES
(101, '101A', 'CAMA01', '2024-04-10 05:00:00', '123456789', 'ABC123', 1, 'Radiografía de tórax, análisis de sangre'),
(102, '102B', 'CAMA02', '2024-04-11 05:00:00', '987654321', 'DEF456', 2, 'Examen de garganta, pruebas de laboratorio'),
(103, '103C', 'CAMA03', '2024-04-12 05:00:00', '456789123', 'GHI789', 3, 'Ecografía abdominal, análisis de orina'),
(104, '104D', 'CAMA04', '2024-04-13 05:00:00', '234567890', 'JKL012', 4, 'Radiografía de abdomen, endoscopia'),
(105, '105E', 'CAMA05', '2024-04-14 05:00:00', '345678901', 'MNO345', 5, 'Radiografía de tórax, análisis de gases en sangre'),
(106, '106F', 'CAMA06', '2024-04-15 05:00:00', '456789012', 'PQR678', 6, 'Examen de piel, biopsia'),
(107, '107G', 'CAMA07', '2024-04-16 05:00:00', '567890123', 'STU901', 7, 'Electroencefalograma, resonancia magnética cerebral'),
(108, '108H', 'CAMA08', '2024-04-17 05:00:00', '678901234', 'VWX123', 8, 'Ecocardiograma, prueba de esfuerzo'),
(109, '109I', 'CAMA09', '2024-04-18 05:00:00', '789012345', 'YZA456', 9, 'Análisis de tiroides, medición de glucosa en sangre'),
(110, '110J', 'CAMA10', '2024-04-19 05:00:00', '890123456', 'BCD789', 10, 'Entrevista psiquiátrica, evaluación neuropsicológica'),
(111, '111K', 'CAMA11', '2024-04-20 05:00:00', '901234567', 'EFG012', 11, 'Biopsia de tumor, resonancia magnética'),
(112, '112L', 'CAMA12', '2024-04-21 05:00:00', '012345678', 'HIJ345', 12, 'Radiografía de articulaciones, análisis de sangre'),
(113, '113M', 'CAMA13', '2024-04-22 05:00:00', '123456789', 'KLM678', 13, 'Prueba de función pulmonar, radiografía de tórax'),
(114, '114N', 'CAMA14', '2024-04-23 05:00:00', '234567890', 'NOP901', 14, 'Endoscopia digestiva, análisis de heces'),
(115, '115O', 'CAMA15', '2024-04-24 05:00:00', '345678901', 'PQR234', 15, 'Ecografía de articulaciones, análisis de líquido sinovial'),
(116, '116P', 'CAMA16', '2024-04-25 05:00:00', '456789012', 'STU567', 16, 'Citología vaginal, examen pélvico'),
(117, '117Q', 'CAMA17', '2024-04-26 05:00:00', '567890123', 'VWX890', 17, 'Biopsia de médula ósea, análisis de sangre'),
(118, '118R', 'CAMA18', '2024-04-27 05:00:00', '678901234', 'YZA012', 18, 'Pruebas de laboratorio para detección de infecciones, análisis de sangre'),
(119, '119S', 'CAMA19', '2024-04-28 05:00:00', '789012345', 'BCD345', 19, 'Evaluación geriátrica, pruebas de memoria'),
(120, '120T', 'CAMA20', '2024-04-29 05:00:00', '890123456', 'EFG678', 20, 'Ecografía renal, análisis de orina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `COD_MEDICAMENTOS` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `PRESENTACION` varchar(255) DEFAULT NULL,
  `DOSIS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`COD_MEDICAMENTOS`, `DESCRIPCION`, `PRESENTACION`, `DOSIS`) VALUES
(1, '5.50', 'Tabletas de 500 mg', 'Cada 8 horas'),
(2, '3.75', 'Cápsulas de 400 mg', '1 cápsula cada 8 horas'),
(3, '7.25', 'Suspensión oral de 250 mg/5 ml', '5 ml cada 12 horas'),
(4, '10.00', 'Cápsulas de liberación retardada de 20 mg', '1 cápsula al día antes del desayuno'),
(5, '8.20', 'Tabletas de 5 mg', '1 tableta cada 8 horas según necesidad'),
(6, '4.50', 'Tabletas de 10 mg', '1 tableta al día'),
(7, '9.75', 'Tabletas de 20 mg', '1 tableta al día'),
(8, '6.80', 'Tabletas de 850 mg', '1 tableta dos veces al día con alimentos'),
(9, '3.25', 'Tabletas de 50 mg', '1 tableta al día'),
(10, '12.00', 'Inhalador de dosis medida de 100 mcg', '2 inhalaciones cada 4-6 horas según necesidad'),
(11, '8.50', 'Tabletas de 5 mg', 'Dosis individualizada según INR'),
(12, '11.75', 'Pluma precargada de 100 unidades/ml', 'Dosis individualizada según glucemia'),
(13, '6.30', 'Tabletas de 75 mg', '1 tableta al día'),
(14, '9.00', 'Tabletas de 10 mg', '1 tableta al día'),
(15, '8.75', 'Tabletas de 0.25 mg', 'Dosis individualizada según función renal'),
(16, '5.25', 'Tabletas de liberación prolongada de 50 mg', '1 tableta al día'),
(17, '10.50', 'Cápsulas de 20 mg', '1 cápsula al día por la mañana'),
(18, '7.10', 'Tabletas de 150 mg', '1 tableta dos veces al día'),
(19, '4.80', 'Tabletas de 40 mg', '1 tableta una o dos veces al día según indicación '),
(20, '6.95', 'Tabletas de 10 mg', '1 tableta al día');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `DOC_IDENTIDAD` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `APELLIDOS` varchar(255) DEFAULT NULL,
  `FECHA_NACIMIENTO` datetime DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(20) DEFAULT NULL,
  `CIUDAD` varchar(255) DEFAULT NULL,
  `COD_ESPECIALIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`DOC_IDENTIDAD`, `NOMBRE`, `APELLIDOS`, `FECHA_NACIMIENTO`, `DIRECCION`, `TELEFONO`, `CIUDAD`, `COD_ESPECIALIDAD`) VALUES
('ABC123', 'Juan', 'Pérez', '1980-01-15 00:00:00', 'Calle Principal 123', '555-1234', 'Ciudad A', 1),
('BCD345', 'Carmen', 'Hernández', '1978-04-15 00:00:00', 'Carrera Este 123', '555-6789', 'Ciudad A', 1),
('BCD789', 'Ana', 'Martínez', '1979-02-22 00:00:00', 'Carrera Este 123', '555-6789', 'Ciudad A', 1),
('DEF456', 'María', 'García', '1975-05-20 00:00:00', 'Avenida Central 456', '555-5678', 'Ciudad B', 2),
('EFG012', 'Roberto', 'Pérez', '1984-06-17 00:00:00', 'Calle Sur 456', '555-2345', 'Ciudad B', 2),
('EFG678', 'Daniel', 'Martínez', '1982-09-20 00:00:00', 'Calle Sur 456', '555-9012', 'Ciudad B', 2),
('GHI789', 'Carlos', 'López', '1988-09-08 00:00:00', 'Carrera 789', '555-9012', 'Ciudad C', 3),
('HIJ345', 'Luis', 'García', '1970-09-28 00:00:00', 'Avenida Norte 789', '555-9012', 'Ciudad C', 3),
('JKL012', 'Laura', 'Rodríguez', '1982-03-10 00:00:00', 'Avenida Sur 789', '555-3456', 'Ciudad A', 1),
('KLM678', 'Marta', 'Sánchez', '1976-01-14 00:00:00', 'Carrera Oeste 123', '555-3456', 'Ciudad A', 1),
('MNO345', 'Roberto', 'Martínez', '1973-07-25 00:00:00', 'Calle Norte 456', '555-6789', 'Ciudad B', 2),
('NOP901', 'Javier', 'Hernández', '1989-05-08 00:00:00', 'Calle Poniente 456', '555-6789', 'Ciudad B', 2),
('PQR234', 'Sandra', 'Martínez', '1983-10-03 00:00:00', 'Avenida Este 789', '555-1234', 'Ciudad C', 3),
('PQR678', 'Ana', 'Fernández', '1985-11-12 00:00:00', 'Avenida Este 123', '555-7890', 'Ciudad C', 3),
('STU567', 'Pablo', 'Gómez', '1974-02-19 00:00:00', 'Carrera Sur 123', '555-5678', 'Ciudad A', 1),
('STU901', 'Pedro', 'Sánchez', '1977-04-18 00:00:00', 'Carrera Oeste 789', '555-2345', 'Ciudad A', 1),
('VWX123', 'Luisa', 'Gómez', '1990-08-05 00:00:00', 'Calle Poniente 456', '555-4567', 'Ciudad B', 2),
('VWX890', 'María', 'López', '1987-07-27 00:00:00', 'Calle Norte 456', '555-9012', 'Ciudad B', 2),
('YZA012', 'Jorge', 'Sánchez', '1980-11-02 00:00:00', 'Avenida Oeste 789', '555-2345', 'Ciudad C', 3),
('YZA456', 'David', 'Hernández', '1981-12-30 00:00:00', 'Avenida Norte 789', '555-8901', 'Ciudad C', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `DOC_IDENTIDAD` varchar(255) NOT NULL,
  `NOMBRE_PACIENTE` varchar(255) DEFAULT NULL,
  `APELLIDOS` varchar(255) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(20) DEFAULT NULL,
  `SEXO` varchar(10) DEFAULT NULL,
  `HISTORIAL_ENFERMEDAD` text DEFAULT NULL,
  `GRUPO_SANGUINEO` varchar(5) DEFAULT NULL,
  `FOTO` blob DEFAULT NULL,
  `FECHA_INGRESO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`DOC_IDENTIDAD`, `NOMBRE_PACIENTE`, `APELLIDOS`, `FECHA_NACIMIENTO`, `DIRECCION`, `TELEFONO`, `SEXO`, `HISTORIAL_ENFERMEDAD`, `GRUPO_SANGUINEO`, `FOTO`, `FECHA_INGRESO`) VALUES
('012345678', 'Luis', 'Hernández', '1979-07-25', 'Avenida Norte 456', '555-4567', 'Masculino', 'Sin antecedentes relevantes', 'A+', NULL, 2147483647),
('012345789', 'Lucía', 'Martínez', '1989-12-18', 'Avenida Norte 123', '555-6789', 'Femenino', 'Sin antecedentes relevantes', 'B-', NULL, NULL),
('123456789', 'Ana', 'Martínez', '1980-05-10', 'Calle Principal 123', '555-1234', 'Femenino', 'Sin antecedentes relevantes', 'A+', NULL, 2147483647),
('123456890', 'Alejandro', 'García', '1987-06-23', 'Carrera Este 456', '555-7890', 'Masculino', 'Sin antecedentes relevantes', 'AB-', NULL, NULL),
('234567890', 'Pedro', 'Gómez', '1975-08-15', 'Avenida Central 456', '555-5678', 'Masculino', 'Asma diagnosticada en la infancia', 'O-', NULL, 2147483647),
('234567891', 'Elena', 'López', '1982-02-28', 'Carrera Norte 789', '555-5678', 'Femenino', 'Sin antecedentes relevantes', 'O+', NULL, NULL),
('345678901', 'Laura', 'Rodríguez', '1988-03-20', 'Carrera 789', '555-9012', 'Femenino', 'Hipertensión arterial', 'AB+', NULL, 2147483647),
('345678912', 'Javier', 'Martínez', '1976-09-03', 'Calle Sur 789', '555-6789', 'Masculino', 'Sin antecedentes relevantes', 'B-', NULL, NULL),
('456789012', 'Juan', 'López', '1973-09-25', 'Calle Sur 123', '555-2345', 'Masculino', 'Diabetes tipo 2 controlada con medicación', 'B-', NULL, 2147483647),
('456789123', 'Carmen', 'García', '1991-04-08', 'Avenida Oeste 12', '555-7890', 'Femenino', 'Sin antecedentes relevantes', 'A+', NULL, 2147483647),
('567890123', 'María', 'García', '1986-04-30', 'Avenida Norte 456', '555-6789', 'Femenino', 'Sin antecedentes relevantes', 'A+', NULL, 2147483647),
('567890234', 'Pablo', 'Fernández', '1983-10-13', 'Carrera Oeste 456', '555-9012', 'Masculino', 'Asma diagnosticada en la infancia', 'AB+', NULL, NULL),
('678901234', 'Carlos', 'Fernández', '1981-10-05', 'Carrera Este 789', '555-7890', 'Masculino', 'Hipotiroidismo en tratamiento', 'O+', NULL, 2147483647),
('678901345', 'Marina', 'Pérez', '1978-05-18', 'Calle Norte 789', '555-2345', 'Femenino', 'Sin antecedentes relevantes', 'B+', NULL, NULL),
('789012345', 'Sofía', 'Martínez', '1977-01-10', 'Calle Poniente 123', '555-8901', 'Femenino', 'Sin antecedentes relevantes', 'AB-', NULL, 2147483647),
('789012456', 'Miguel', 'Hernández', '1985-11-23', 'Avenida Principal 123', '555-3456', 'Masculino', 'Sin antecedentes relevantes', 'O-', NULL, NULL),
('890123456', 'Daniel', 'Pérez', '1990-06-15', 'Avenida Oeste 456', '555-2345', 'Masculino', 'Sin antecedentes relevantes', 'B+', NULL, 2147483647),
('890123567', 'Silvia', 'Gómez', '1980-08-28', 'Carrera Central 456', '555-4567', 'Femenino', 'Diabetes tipo 2 controlada con dieta y ejercicio', 'A+', NULL, NULL),
('901234567', 'Ana', 'Gómez', '1984-11-20', 'Calle Principal 789', '555-3456', 'Femenino', 'Asma diagnosticada en la infancia', 'O-', NULL, 2147483647),
('901234678', 'Diego', 'López', '1974-03-03', 'Calle Sur 789', '555-5678', 'Masculino', 'Hipertensión arterial', 'O+', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalles_ingresos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_detalles_ingresos` (
`DOC_IDENTIDAD` varchar(255)
,`NOMBRE_PACIENTE` varchar(255)
,`APELLIDOS` varchar(255)
,`FECHA_INGRESO` timestamp
,`HABITACION` varchar(255)
,`CAMA` varchar(255)
,`DOC_IDENTIFICA_MEDICO` varchar(255)
,`NOMBRE_MEDICO` varchar(255)
,`APELLIDO_MEDICO` varchar(255)
,`ESPECIALIDAD` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_facturacion_detallada`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_facturacion_detallada` (
`DOC_IDENTIDAD` varchar(255)
,`NOMBRE_PACIENTE` varchar(255)
,`APELLIDOS` varchar(255)
,`NUM_FACTURA` int(11)
,`FECHA_FACTURA` timestamp
,`COD_MEDICAMENTOS` int(11)
,`NOMBRE_MEDICAMENTO` varchar(255)
,`CANTIDAD` int(11)
,`PRECIO_VENTA` decimal(10,2)
,`TOTAL_A_PAGAR` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicamentos_por_medico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicamentos_por_medico` (
`DOC_IDENTIDAD` varchar(255)
,`NOMBRE_MEDICO` varchar(255)
,`APELLIDO_MEDICO` varchar(255)
,`CIUDAD` varchar(255)
,`FECHA_INGRESO` timestamp
,`DOC_IDENTIFICA_PACIENTE` varchar(255)
,`COD_DIAGNOSTICO` int(11)
,`NOMBRE_MEDICAMENTO` varchar(255)
,`PRESENTACION` varchar(255)
,`DOSIS` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medico_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medico_especialidad` (
`DOC_IDENTIDAD` varchar(255)
,`NOMBRE_MEDICO` varchar(255)
,`APELLIDO_MEDICO` varchar(255)
,`FECHA_NACIMIENTO` datetime
,`TELEFONO` varchar(20)
,`DIRECCION` varchar(255)
,`CIUDAD` varchar(255)
,`ESPECIALIDAD` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_paciente_diagnostico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_paciente_diagnostico` (
`DOC_IDENTIDAD` varchar(255)
,`NOMBRE_PACIENTE` varchar(255)
,`APELLIDOS` varchar(255)
,`FECHA_NACIMIENTO` date
,`TELEFONO` varchar(20)
,`DIRECCION` varchar(255)
,`COD_DIAGNOSTICO` int(11)
,`NOMBRE_DIAGNOSTICO` varchar(255)
,`SINTOMAS` mediumtext
,`TRATAMIENTO` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalles_ingresos`
--
DROP TABLE IF EXISTS `vista_detalles_ingresos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_detalles_ingresos`  AS SELECT `t1`.`DOC_IDENTIDAD` AS `DOC_IDENTIDAD`, `t1`.`NOMBRE_PACIENTE` AS `NOMBRE_PACIENTE`, `t1`.`APELLIDOS` AS `APELLIDOS`, `t2`.`FECHA_INGRESO` AS `FECHA_INGRESO`, `t2`.`HABITACION` AS `HABITACION`, `t2`.`CAMA` AS `CAMA`, `t2`.`DOC_IDENTIFICA_MEDICO` AS `DOC_IDENTIFICA_MEDICO`, (select `t3`.`NOMBRE` from `medicos` `t3` where `t3`.`DOC_IDENTIDAD` = `t2`.`DOC_IDENTIFICA_MEDICO` limit 1) AS `NOMBRE_MEDICO`, (select `t3`.`APELLIDOS` from `medicos` `t3` where `t3`.`DOC_IDENTIDAD` = `t2`.`DOC_IDENTIFICA_MEDICO` limit 1) AS `APELLIDO_MEDICO`, (select `t4`.`ESPECIALIDAD` from (`medicos` `t3` join `especialidad` `t4` on(`t3`.`COD_ESPECIALIDAD` = `t4`.`COD_ESPECIALIDAD`)) where `t3`.`DOC_IDENTIDAD` = `t2`.`DOC_IDENTIFICA_MEDICO` limit 1) AS `ESPECIALIDAD` FROM (`pacientes` `t1` join `ingresos` `t2` on(`t1`.`DOC_IDENTIDAD` = `t2`.`DOC_IDENTIFICA_PACIENTE`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_facturacion_detallada`
--
DROP TABLE IF EXISTS `vista_facturacion_detallada`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_facturacion_detallada`  AS SELECT `t1`.`DOC_IDENTIDAD` AS `DOC_IDENTIDAD`, `t1`.`NOMBRE_PACIENTE` AS `NOMBRE_PACIENTE`, `t1`.`APELLIDOS` AS `APELLIDOS`, `t2`.`NUM_FACTURA` AS `NUM_FACTURA`, `t2`.`FECHA_FACTURA` AS `FECHA_FACTURA`, `t3`.`COD_MEDICAMENTOS` AS `COD_MEDICAMENTOS`, `t3`.`DESCRIPCION` AS `NOMBRE_MEDICAMENTO`, `t2`.`CANTIDAD` AS `CANTIDAD`, `t2`.`PRECIO_VENTA` AS `PRECIO_VENTA`, `t2`.`TOTAL_A_PAGAR` AS `TOTAL_A_PAGAR` FROM ((`pacientes` `t1` join `factura` `t2` on(`t1`.`DOC_IDENTIDAD` = `t2`.`DOC_IDENT_PACIENTE`)) join `medicamentos` `t3` on(`t2`.`COD_MEDICAMENTOS` = `t3`.`COD_MEDICAMENTOS`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medicamentos_por_medico`
--
DROP TABLE IF EXISTS `vista_medicamentos_por_medico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicamentos_por_medico`  AS SELECT `t1`.`DOC_IDENTIDAD` AS `DOC_IDENTIDAD`, `t1`.`NOMBRE` AS `NOMBRE_MEDICO`, `t1`.`APELLIDOS` AS `APELLIDO_MEDICO`, `t1`.`CIUDAD` AS `CIUDAD`, (select `t2`.`FECHA_INGRESO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_MEDICO` = `t1`.`DOC_IDENTIDAD` limit 1) AS `FECHA_INGRESO`, (select `t2`.`DOC_IDENTIFICA_PACIENTE` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_MEDICO` = `t1`.`DOC_IDENTIDAD` limit 1) AS `DOC_IDENTIFICA_PACIENTE`, (select `t2`.`COD_DIAGNOSTICO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_MEDICO` = `t1`.`DOC_IDENTIDAD` limit 1) AS `COD_DIAGNOSTICO`, (select `t3`.`NOMBRE` from `diagnosticos` `t3` where `t3`.`COD_DIAGNOSTICO` = (select `t2`.`COD_DIAGNOSTICO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_MEDICO` = `t1`.`DOC_IDENTIDAD` limit 1) limit 1) AS `NOMBRE_MEDICAMENTO`, (select `t3`.`NOMBRE` from `diagnosticos` `t3` where `t3`.`COD_DIAGNOSTICO` = (select `t2`.`COD_DIAGNOSTICO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_MEDICO` = `t1`.`DOC_IDENTIDAD` limit 1) limit 1) AS `PRESENTACION`, (select `t3`.`TRATAMIENTO` from `diagnosticos` `t3` where `t3`.`COD_DIAGNOSTICO` = (select `t2`.`COD_DIAGNOSTICO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_MEDICO` = `t1`.`DOC_IDENTIDAD` limit 1) limit 1) AS `DOSIS` FROM `medicos` AS `t1` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_medico_especialidad`
--
DROP TABLE IF EXISTS `vista_medico_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medico_especialidad`  AS SELECT `t1`.`DOC_IDENTIDAD` AS `DOC_IDENTIDAD`, `t1`.`NOMBRE` AS `NOMBRE_MEDICO`, `t1`.`APELLIDOS` AS `APELLIDO_MEDICO`, `t1`.`FECHA_NACIMIENTO` AS `FECHA_NACIMIENTO`, `t1`.`TELEFONO` AS `TELEFONO`, `t1`.`DIRECCION` AS `DIRECCION`, `t1`.`CIUDAD` AS `CIUDAD`, `t2`.`ESPECIALIDAD` AS `ESPECIALIDAD` FROM (`medicos` `t1` join `especialidad` `t2` on(`t1`.`COD_ESPECIALIDAD` = `t2`.`COD_ESPECIALIDAD`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_paciente_diagnostico`
--
DROP TABLE IF EXISTS `vista_paciente_diagnostico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_paciente_diagnostico`  AS SELECT `t1`.`DOC_IDENTIDAD` AS `DOC_IDENTIDAD`, `t1`.`NOMBRE_PACIENTE` AS `NOMBRE_PACIENTE`, `t1`.`APELLIDOS` AS `APELLIDOS`, `t1`.`FECHA_NACIMIENTO` AS `FECHA_NACIMIENTO`, `t1`.`TELEFONO` AS `TELEFONO`, `t1`.`DIRECCION` AS `DIRECCION`, (select `t2`.`COD_DIAGNOSTICO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_PACIENTE` = `t1`.`DOC_IDENTIDAD` limit 1) AS `COD_DIAGNOSTICO`, (select `t3`.`NOMBRE` from `diagnosticos` `t3` where `t3`.`COD_DIAGNOSTICO` = (select `t2`.`COD_DIAGNOSTICO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_PACIENTE` = `t1`.`DOC_IDENTIDAD` limit 1) limit 1) AS `NOMBRE_DIAGNOSTICO`, (select `t3`.`SINTOMAS` from `diagnosticos` `t3` where `t3`.`COD_DIAGNOSTICO` = (select `t2`.`COD_DIAGNOSTICO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_PACIENTE` = `t1`.`DOC_IDENTIDAD` limit 1) limit 1) AS `SINTOMAS`, (select `t3`.`TRATAMIENTO` from `diagnosticos` `t3` where `t3`.`COD_DIAGNOSTICO` = (select `t2`.`COD_DIAGNOSTICO` from `ingresos` `t2` where `t2`.`DOC_IDENTIFICA_PACIENTE` = `t1`.`DOC_IDENTIDAD` limit 1) limit 1) AS `TRATAMIENTO` FROM `pacientes` AS `t1` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`COD_DIAGNOSTICO`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`COD_ESPECIALIDAD`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`NUM_FACTURA`),
  ADD KEY `NUMERO_INGRESO` (`NUMERO_INGRESO`),
  ADD KEY `DOC_IDENT_PACIENTE` (`DOC_IDENT_PACIENTE`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`NUMERO_INGRESO`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`COD_MEDICAMENTOS`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`DOC_IDENTIDAD`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`DOC_IDENTIDAD`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`NUMERO_INGRESO`) REFERENCES `ingresos` (`NUMERO_INGRESO`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`DOC_IDENT_PACIENTE`) REFERENCES `pacientes` (`DOC_IDENTIDAD`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
