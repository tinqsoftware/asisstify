-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2025 at 09:26 PM
-- Server version: 9.4.0
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asisstify`
--

-- --------------------------------------------------------

--
-- Table structure for table `E_actividades`
--

CREATE TABLE `E_actividades` (
  `id` bigint UNSIGNED NOT NULL,
  `evento_dia_id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `tema` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `requiere_asistencia` tinyint(1) DEFAULT '0',
  `asistencia_rostro` tinyint(1) NOT NULL DEFAULT '0',
  `asistencia_documento` tinyint(1) NOT NULL DEFAULT '0',
  `asistencia_qr` tinyint(1) NOT NULL DEFAULT '0',
  `mostrar_lista_asistencias` tinyint(1) NOT NULL DEFAULT '1',
  `asistencia_layout` json DEFAULT NULL,
  `id_grupo_dirigido` bigint UNSIGNED DEFAULT NULL,
  `permite_asistencia` tinyint(1) NOT NULL DEFAULT '1',
  `requiere_salida` tinyint(1) NOT NULL DEFAULT '0',
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_actividades`
--

INSERT INTO `E_actividades` (`id`, `evento_dia_id`, `titulo`, `descripcion`, `tema`, `imagen`, `hora_inicio`, `hora_fin`, `requiere_asistencia`, `asistencia_rostro`, `asistencia_documento`, `asistencia_qr`, `mostrar_lista_asistencias`, `asistencia_layout`, `id_grupo_dirigido`, `permite_asistencia`, `requiere_salida`, `id_user_create`, `created_at`, `updated_at`) VALUES
(1, 5, 'COORDINACION', NULL, NULL, 'b.png', '01:00:00', '03:00:00', 1, 1, 0, 0, 1, NULL, NULL, 1, 0, 1, '2025-10-31 15:53:26', '2025-10-31 15:53:26'),
(2, 5, 'AWAKE', NULL, NULL, 'b.png', '03:00:00', '04:59:00', 1, 1, 0, 0, 1, NULL, NULL, 1, 0, 1, '2025-10-31 15:53:26', '2025-10-31 15:53:26'),
(3, 5, 'AWAKE', NULL, NULL, 'b.png', '05:00:00', '11:30:00', 0, 0, 0, 0, 1, NULL, NULL, 1, 0, 1, '2025-10-31 15:53:26', '2025-10-31 15:53:26'),
(4, 6, 'Velada de fin de año', NULL, NULL, 'b.png', '13:30:00', '15:30:00', 1, 1, 0, 0, 1, NULL, NULL, 1, 0, 1, '2025-10-31 16:04:19', '2025-10-31 16:04:19'),
(5, 7, 'ffff', NULL, NULL, 'actividades/wUNqhIQVXf5nmEPXMs36aqiXB2q3Vm9qCEMRIshU.jpg', '09:00:00', '11:30:00', 0, 0, 1, 0, 0, '{\"meta\": {\"h\": 11.999522686433064, \"w\": 21.999918619791668, \"x\": 1.9999186197916667, \"y\": 3.9996069182389937}, \"saludo\": {\"h\": 17.999634995507638, \"w\": 37.999674479166664, \"x\": 57.999674479166664, \"y\": 69.99943845462714}, \"documento\": {\"h\": 19.76569519317161, \"w\": 27.589925130208332, \"x\": 27.808837890625, \"y\": 70.38901055705301}}', NULL, 1, 0, 1, '2025-12-20 01:01:16', '2025-12-20 21:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `E_actividad_grupos`
--

CREATE TABLE `E_actividad_grupos` (
  `id` bigint UNSIGNED NOT NULL,
  `actividad_id` bigint UNSIGNED NOT NULL,
  `grupo_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `E_actividad_personas`
--

CREATE TABLE `E_actividad_personas` (
  `id` bigint UNSIGNED NOT NULL,
  `actividad_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `tipo_participante_id` bigint UNSIGNED DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `E_asistencias_actividad`
--

CREATE TABLE `E_asistencias_actividad` (
  `id` bigint UNSIGNED NOT NULL,
  `actividad_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `metodo_entrada` enum('rostro','qr','manual','link','confirmacion') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hora_salida` datetime DEFAULT NULL,
  `metodo_salida` enum('rostro','qr','manual','link','confirmacion') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_asistencias_actividad`
--

INSERT INTO `E_asistencias_actividad` (`id`, `actividad_id`, `usuario_id`, `hora_entrada`, `metodo_entrada`, `hora_salida`, `metodo_salida`, `id_user_create`, `created_at`, `updated_at`) VALUES
(79, 4, 1, '2025-11-27 16:15:29', 'rostro', NULL, NULL, 1, '2025-11-27 21:15:29', '2025-11-27 21:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `E_asistencias_dia`
--

CREATE TABLE `E_asistencias_dia` (
  `id` bigint UNSIGNED NOT NULL,
  `evento_dia_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `metodo_entrada` enum('rostro','qr','manual','link') DEFAULT NULL,
  `hora_salida` datetime DEFAULT NULL,
  `metodo_salida` enum('rostro','qr','manual','link') DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `E_certificados`
--

CREATE TABLE `E_certificados` (
  `id` bigint UNSIGNED NOT NULL,
  `evento_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `regla_certificado_id` bigint UNSIGNED DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  `emitido_el` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archivo` varchar(255) DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `E_encuestas`
--

CREATE TABLE `E_encuestas` (
  `id` bigint UNSIGNED NOT NULL,
  `evento_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `tipo` enum('karaoke','ranking') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ranking',
  `es_abierta` tinyint(1) NOT NULL DEFAULT '0',
  `unica_por_opcion` tinyint(1) NOT NULL DEFAULT '0',
  `max_opciones_por_usuario` int UNSIGNED NOT NULL DEFAULT '1',
  `modo_resultados` enum('tiempo_real','solo_total','final') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tiempo_real',
  `permitir_cambiar_voto` tinyint(1) NOT NULL DEFAULT '0',
  `ronda_actual` int UNSIGNED NOT NULL DEFAULT '1',
  `estado` enum('borrador','activa','cerrada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'borrador',
  `id_user` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `E_encuestas`
--

INSERT INTO `E_encuestas` (`id`, `evento_id`, `nombre`, `slug`, `descripcion`, `tipo`, `es_abierta`, `unica_por_opcion`, `max_opciones_por_usuario`, `modo_resultados`, `permitir_cambiar_voto`, `ronda_actual`, `estado`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 18, 'karaoke', 'karaoke-18', NULL, 'karaoke', 0, 1, 1, 'tiempo_real', 0, 1, 'activa', 1, '2025-11-28 08:35:52', '2025-11-28 08:36:59'),
(2, 19, 'KARAOKE TTT', 'karaoke-ttt-19', NULL, 'karaoke', 0, 1, 1, 'tiempo_real', 0, 2, 'cerrada', 1, '2025-11-28 08:38:08', '2025-12-12 03:06:11'),
(3, 19, 'RANKING', 'ranking-19', NULL, 'ranking', 0, 0, 1, 'solo_total', 0, 1, 'cerrada', 1, '2025-11-28 08:41:28', '2025-11-28 11:05:23'),
(4, 19, 'karaoke 8', 'karaoke-8-19', NULL, 'karaoke', 0, 1, 1, 'tiempo_real', 0, 1, 'cerrada', 1, '2025-12-11 21:12:22', '2025-12-12 03:06:09'),
(5, 19, 'karaoke 16', 'karaoke-16-19', NULL, 'karaoke', 0, 1, 1, 'tiempo_real', 0, 1, 'cerrada', 1, '2025-12-11 21:24:15', '2025-12-12 03:06:10'),
(6, 19, 'karaoke 60', 'karaoke-60-19', NULL, 'ranking', 0, 1, 1, 'tiempo_real', 0, 1, 'cerrada', 1, '2025-12-11 21:29:29', '2025-12-12 03:06:11');

-- --------------------------------------------------------

--
-- Table structure for table `E_encuesta_opciones`
--

CREATE TABLE `E_encuesta_opciones` (
  `id` bigint UNSIGNED NOT NULL,
  `encuesta_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orden` int UNSIGNED DEFAULT NULL,
  `es_activa` tinyint(1) NOT NULL DEFAULT '1',
  `es_bloqueada` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `E_encuesta_opciones`
--

INSERT INTO `E_encuesta_opciones` (`id`, `encuesta_id`, `nombre`, `descripcion`, `imagen`, `color`, `orden`, `es_activa`, `es_bloqueada`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'CANCION 1', NULL, NULL, NULL, 1, 1, 0, 1, '2025-11-28 08:35:52', '2025-11-28 08:35:52'),
(2, 1, 'CANCIÓN 2', NULL, NULL, NULL, 2, 1, 0, 1, '2025-11-28 08:35:52', '2025-11-28 08:35:52'),
(3, 2, 'CANCIÓN 1', NULL, 'encuestas_opciones/ELZ43wg2FlvcRB1wL8xhl4ugfCDL5VzNrqwKtysh.jpg', NULL, 1, 1, 0, 1, '2025-11-28 08:38:08', '2025-11-28 10:19:27'),
(4, 2, 'CANCIÓN 2', NULL, 'encuestas_opciones/4o3W3s2AJWQZnnO1SGByLoyXMETBDBtpd5xstIkQ.png', NULL, 2, 1, 1, 1, '2025-11-28 08:38:08', '2025-11-28 10:19:44'),
(5, 2, 'CANCIÓN 3', NULL, 'encuestas_opciones/XNrhjY6mZFzJwMT1tWS5odFbZmkKVPHydeJtMep5.jpg', NULL, 3, 1, 0, 1, '2025-11-28 08:38:08', '2025-11-28 10:19:27'),
(6, 3, 'PERSONA 1', NULL, 'encuestas_opciones/XNrhjY6mZFzJwMT1tWS5odFbZmkKVPHydeJtMep5.jpg', NULL, 1, 1, 0, 1, '2025-11-28 08:41:28', '2025-11-28 09:14:55'),
(7, 3, 'PERSONA 2', NULL, 'encuestas_opciones/28CjKA1FcG3ZNMqqHgehFqSpFzbEcJAxX3dUf5x5.jpg', NULL, 2, 1, 0, 1, '2025-11-28 08:41:28', '2025-11-28 09:14:55'),
(8, 3, 'PERSONA 3', NULL, 'encuestas_opciones/P0vXgu4NbWOpTcgoisKa1eoXRuRfoiebXdVfqtmR.webp', NULL, 3, 1, 0, 1, '2025-11-28 08:41:28', '2025-11-28 09:14:55'),
(9, 3, 'PERSONA 4', NULL, 'encuestas_opciones/eKYVKg9pJ9oj4RC0i7os6RtbzrdzR9HJP3plEhVE.jpg', NULL, 4, 1, 0, 1, '2025-11-28 08:41:28', '2025-11-28 09:14:55'),
(10, 3, 'PERSONA 5', NULL, 'encuestas_opciones/4o3W3s2AJWQZnnO1SGByLoyXMETBDBtpd5xstIkQ.png', NULL, 5, 1, 0, 1, '2025-11-28 08:41:28', '2025-11-28 09:14:55'),
(11, 3, 'PERSONA 6', NULL, 'encuestas_opciones/ELZ43wg2FlvcRB1wL8xhl4ugfCDL5VzNrqwKtysh.jpg', NULL, 6, 1, 0, 1, '2025-11-28 08:41:28', '2025-11-28 09:14:55'),
(12, 4, '\"Respect\" - Aretha Franklin', NULL, 'encuestas_opciones/Iy9btYMfWxACxRpOmz0JsrqGQMSgrpeW5xODSeKx.jpg', NULL, 1, 1, 0, 1, '2025-12-11 21:12:22', '2025-12-11 21:12:52'),
(13, 4, '\"Billie Jean\" - Michael Jackson', NULL, 'encuestas_opciones/q2uqXWpyv1apZi6WkF6Wx8xgjqrQbRaZkgRxu6C8.jpg', NULL, 2, 1, 1, 1, '2025-12-11 21:12:22', '2025-12-11 21:44:17'),
(14, 4, '\"Imagine\" - John Lennon', NULL, 'encuestas_opciones/Cx32R0s5MthLPzdW8LuQWJyCJgvYPBdXH4LxCMDe.jpg', NULL, 3, 1, 0, 1, '2025-12-11 21:12:22', '2025-12-11 21:12:52'),
(15, 4, '\"Like a Rolling Stone\" - Bob Dylan', NULL, 'encuestas_opciones/7HK56NYoIOI8e9C6keC3taEHnKNrHyyNz3LNcmmq.jpg', NULL, 4, 1, 0, 1, '2025-12-11 21:12:22', '2025-12-11 21:12:52'),
(16, 4, '\"Chica de ayer\" - Nacha Pop', NULL, 'encuestas_opciones/PQLCjmCgb2W9fd1PT9oa0IC5zIv714oys7s1usde.jpg', NULL, 5, 1, 0, 1, '2025-12-11 21:12:22', '2025-12-11 21:12:52'),
(17, 4, '\"A quien le importa\" - Alaska y Dinarama', NULL, 'encuestas_opciones/StvWwJ4cD1joaJEoI2L8bUI52yevUu0voOxBhX4Z.jpg', NULL, 6, 1, 0, 1, '2025-12-11 21:12:22', '2025-12-11 21:12:52'),
(18, 4, '\"La Perla\" - Rosalía & Yahritza Y Su Esencia', NULL, 'encuestas_opciones/WgHAfTZcZL4S0skV0zbGjkOqXzgSlAQQqXygGqsd.jpg', NULL, 7, 1, 0, 1, '2025-12-11 21:12:22', '2025-12-11 21:12:52'),
(19, 4, '\"Down\" - TINI', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 8, 1, 0, 1, '2025-12-11 21:12:22', '2025-12-11 21:12:52'),
(20, 5, '\"Bohemian Rhapsody\" - Queen', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 1, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(21, 5, '\"Dancing Queen\" - ABBA', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 2, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(22, 5, '\"Smells Like Teen Spirit\" - Nirvana', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 3, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(23, 5, '\"Mi soledad y yo\" - Alejandro Sanz', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(24, 5, '\"Respect\" - Aretha Franklin', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(25, 5, '\"Don\'t Stop Me Now\" - Queen', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(26, 5, '\"Mucho mejor\" - Los Rodríguez y Coque Malla', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 7, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(27, 5, '\"A Change Is Gonna Come\" - Sam Cooke', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 8, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(28, 5, '\"Golondrinas\" - Arelys Henao', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 9, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(29, 5, '\"Like a Rolling Stone\" - Bob Dylan', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 10, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(30, 5, '\"Scream\" - Michael y Janet Jackson', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 11, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(31, 5, '\"Entre mis recuerdos\" - Luz Casal', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 12, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(32, 5, '\"Maldita Borrachera\" - Carlos Muñoz', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 13, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(33, 5, '\"Good Vibrations\" - The Beach Boys', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 14, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(34, 5, '\"Te han visto con él\" - Alcides Pamplonas', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 15, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(35, 5, '\"Pero a tu lado\" - Los Secretos', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 16, 1, 0, 1, '2025-12-11 21:24:15', '2025-12-11 21:24:15'),
(36, 6, 'cancion 1', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 1, 1, 0, 1, '2025-12-11 21:29:29', '2025-12-11 21:29:29'),
(37, 6, 'cancion 2', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 2, 1, 0, 1, '2025-12-11 21:29:29', '2025-12-11 21:29:29'),
(38, 6, 'cancion 3', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 3, 1, 0, 1, '2025-12-11 21:29:29', '2025-12-11 21:29:29'),
(39, 6, 'Blinding Lights – The Weeknd', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(40, 6, 'Shape of You – Ed Sheeran', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(41, 6, 'Rolling in the Deep – Adele', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(42, 6, 'Uptown Funk – Mark Ronson ft. Bruno Mars', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(43, 6, 'Someone Like You – Adele', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(44, 6, 'Thinking Out Loud – Ed Sheeran', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(45, 6, 'Perfect – Ed Sheeran', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(46, 6, 'Can’t Stop the Feeling – Justin Timberlake', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(47, 6, 'Happier – Marshmello ft. Bastille', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(48, 6, 'Vivir Mi Vida – Marc Anthony', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(49, 6, 'Despacito – Luis Fonsi ft. Daddy Yankee', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(50, 6, 'Pepas – Farruko', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(51, 6, 'Tusa – Karol G ft. Nicki Minaj', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(52, 6, 'Hawái – Maluma', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(53, 6, 'La Canción – Bad Bunny & J Balvin', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(54, 6, 'Provenza – Karol G', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(55, 6, 'Tití Me Preguntó – Bad Bunny', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(56, 6, 'Mi Gente – J Balvin & Willy William', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(57, 6, 'Call Me Maybe – Carly Rae Jepsen', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(58, 6, 'Roar – Katy Perry', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(59, 6, 'Levitating – Dua Lipa', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(60, 6, 'Shallow – Lady Gaga & Bradley Cooper', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(61, 6, 'Happy – Pharrell Williams', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(62, 6, 'Believer – Imagine Dragons', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(63, 6, 'Radioactive – Imagine Dragons', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(64, 6, 'Viva La Vida – Coldplay', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(65, 6, 'Paradise – Coldplay', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(66, 6, 'Adventure of a Lifetime – Coldplay', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(67, 6, 'Yellow – Coldplay', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL),
(68, 6, 'Counting Stars – OneRepublic', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 6, 1, 0, NULL, NULL, NULL),
(69, 6, 'Apologize – OneRepublic', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 4, 1, 0, NULL, NULL, NULL),
(70, 6, 'Maps – Maroon 5', NULL, 'encuestas_opciones/T1azS4YBcwo48XwqcKC8pKEqp6Fg73RBWcW02C5Y.jpg', NULL, 5, 1, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `E_encuesta_votos`
--

CREATE TABLE `E_encuesta_votos` (
  `id` bigint UNSIGNED NOT NULL,
  `encuesta_id` bigint UNSIGNED NOT NULL,
  `opcion_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED DEFAULT NULL,
  `nombre_invitado` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ronda` int UNSIGNED NOT NULL DEFAULT '1',
  `id_user` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `E_encuesta_votos`
--

INSERT INTO `E_encuesta_votos` (`id`, `encuesta_id`, `opcion_id`, `usuario_id`, `nombre_invitado`, `ronda`, `id_user`, `created_at`, `updated_at`) VALUES
(228, 3, 7, NULL, 'Simulado #1', 1, NULL, '2025-11-28 09:54:04', '2025-11-28 09:54:04'),
(229, 3, 10, NULL, 'Simulado #2', 1, NULL, '2025-11-28 09:54:04', '2025-11-28 09:54:04'),
(230, 3, 9, NULL, 'Simulado #3', 1, NULL, '2025-11-28 09:54:04', '2025-11-28 09:54:04'),
(231, 3, 7, NULL, 'Simulado #4', 1, NULL, '2025-11-28 09:54:05', '2025-11-28 09:54:05'),
(232, 3, 7, NULL, 'Simulado #5', 1, NULL, '2025-11-28 09:54:05', '2025-11-28 09:54:05'),
(233, 3, 6, NULL, 'Simulado #6', 1, NULL, '2025-11-28 09:54:05', '2025-11-28 09:54:05'),
(234, 3, 6, NULL, 'Simulado #7', 1, NULL, '2025-11-28 09:54:05', '2025-11-28 09:54:05'),
(235, 3, 9, NULL, 'Simulado #8', 1, NULL, '2025-11-28 09:54:06', '2025-11-28 09:54:06'),
(236, 3, 7, NULL, 'Simulado #9', 1, NULL, '2025-11-28 09:54:06', '2025-11-28 09:54:06'),
(237, 3, 8, NULL, 'Simulado #10', 1, NULL, '2025-11-28 09:54:06', '2025-11-28 09:54:06'),
(238, 3, 6, NULL, 'Simulado #11', 1, NULL, '2025-11-28 09:54:06', '2025-11-28 09:54:06'),
(239, 3, 6, NULL, 'Simulado #12', 1, NULL, '2025-11-28 09:54:06', '2025-11-28 09:54:06'),
(240, 3, 8, NULL, 'Simulado #13', 1, NULL, '2025-11-28 09:54:07', '2025-11-28 09:54:07'),
(241, 3, 11, NULL, 'Simulado #14', 1, NULL, '2025-11-28 09:54:07', '2025-11-28 09:54:07'),
(242, 3, 6, NULL, 'Simulado #15', 1, NULL, '2025-11-28 09:54:07', '2025-11-28 09:54:07'),
(243, 3, 6, NULL, 'Simulado #16', 1, NULL, '2025-11-28 09:54:07', '2025-11-28 09:54:07'),
(244, 3, 6, NULL, 'Simulado #17', 1, NULL, '2025-11-28 09:54:07', '2025-11-28 09:54:07'),
(245, 3, 7, NULL, 'Simulado #18', 1, NULL, '2025-11-28 09:54:08', '2025-11-28 09:54:08'),
(246, 3, 8, NULL, 'Simulado #19', 1, NULL, '2025-11-28 09:54:08', '2025-11-28 09:54:08'),
(247, 3, 11, NULL, 'Simulado #20', 1, NULL, '2025-11-28 09:54:08', '2025-11-28 09:54:08'),
(248, 3, 7, NULL, 'Simulado #21', 1, NULL, '2025-11-28 09:54:08', '2025-11-28 09:54:08'),
(249, 3, 10, NULL, 'Simulado #22', 1, NULL, '2025-11-28 09:54:08', '2025-11-28 09:54:08'),
(250, 3, 10, NULL, 'Simulado #23', 1, NULL, '2025-11-28 09:54:09', '2025-11-28 09:54:09'),
(251, 3, 9, NULL, 'Simulado #24', 1, NULL, '2025-11-28 09:54:09', '2025-11-28 09:54:09'),
(252, 3, 8, NULL, 'Simulado #25', 1, NULL, '2025-11-28 09:54:09', '2025-11-28 09:54:09'),
(253, 3, 6, NULL, 'Simulado #26', 1, NULL, '2025-11-28 09:54:09', '2025-11-28 09:54:09'),
(254, 3, 7, NULL, 'Simulado #27', 1, NULL, '2025-11-28 09:54:09', '2025-11-28 09:54:09'),
(255, 3, 9, NULL, 'Simulado #28', 1, NULL, '2025-11-28 09:54:10', '2025-11-28 09:54:10'),
(256, 3, 8, NULL, 'Simulado #29', 1, NULL, '2025-11-28 09:54:10', '2025-11-28 09:54:10'),
(257, 3, 7, NULL, 'Simulado #30', 1, NULL, '2025-11-28 09:54:10', '2025-11-28 09:54:10'),
(258, 3, 6, NULL, 'Simulado #31', 1, NULL, '2025-11-28 09:54:10', '2025-11-28 09:54:10'),
(259, 3, 7, NULL, 'Simulado #32', 1, NULL, '2025-11-28 09:54:10', '2025-11-28 09:54:10'),
(260, 3, 8, NULL, 'Simulado #33', 1, NULL, '2025-11-28 09:54:11', '2025-11-28 09:54:11'),
(261, 3, 8, NULL, 'Simulado #34', 1, NULL, '2025-11-28 09:54:11', '2025-11-28 09:54:11'),
(262, 3, 10, NULL, 'Simulado #35', 1, NULL, '2025-11-28 09:54:11', '2025-11-28 09:54:11'),
(263, 3, 8, NULL, 'Simulado #36', 1, NULL, '2025-11-28 09:54:11', '2025-11-28 09:54:11'),
(264, 3, 6, NULL, 'Simulado #37', 1, NULL, '2025-11-28 09:54:12', '2025-11-28 09:54:12'),
(265, 3, 11, NULL, 'Simulado #38', 1, NULL, '2025-11-28 09:54:12', '2025-11-28 09:54:12'),
(266, 3, 9, NULL, 'Simulado #39', 1, NULL, '2025-11-28 09:54:12', '2025-11-28 09:54:12'),
(267, 3, 8, NULL, 'Simulado #40', 1, NULL, '2025-11-28 09:54:12', '2025-11-28 09:54:12'),
(268, 3, 11, NULL, 'Simulado #41', 1, NULL, '2025-11-28 09:54:12', '2025-11-28 09:54:12'),
(269, 3, 6, NULL, 'Simulado #42', 1, NULL, '2025-11-28 09:54:13', '2025-11-28 09:54:13'),
(270, 3, 10, NULL, 'Simulado #43', 1, NULL, '2025-11-28 09:54:13', '2025-11-28 09:54:13'),
(271, 3, 11, NULL, 'Simulado #44', 1, NULL, '2025-11-28 09:54:13', '2025-11-28 09:54:13'),
(272, 3, 11, NULL, 'Simulado #45', 1, NULL, '2025-11-28 09:54:13', '2025-11-28 09:54:13'),
(273, 3, 6, NULL, 'Simulado #46', 1, NULL, '2025-11-28 09:54:13', '2025-11-28 09:54:13'),
(274, 3, 6, NULL, 'Simulado #47', 1, NULL, '2025-11-28 09:54:14', '2025-11-28 09:54:14'),
(275, 3, 11, NULL, 'Simulado #48', 1, NULL, '2025-11-28 09:54:14', '2025-11-28 09:54:14'),
(276, 3, 9, NULL, 'Simulado #49', 1, NULL, '2025-11-28 09:54:14', '2025-11-28 09:54:14'),
(277, 3, 10, NULL, 'Simulado #50', 1, NULL, '2025-11-28 09:54:14', '2025-11-28 09:54:14'),
(278, 3, 9, NULL, 'Simulado #51', 1, NULL, '2025-11-28 09:54:14', '2025-11-28 09:54:14'),
(279, 3, 10, NULL, 'Simulado #52', 1, NULL, '2025-11-28 09:54:15', '2025-11-28 09:54:15'),
(280, 3, 11, NULL, 'Simulado #53', 1, NULL, '2025-11-28 09:54:15', '2025-11-28 09:54:15'),
(281, 3, 11, NULL, 'Simulado #54', 1, NULL, '2025-11-28 09:54:15', '2025-11-28 09:54:15'),
(282, 3, 7, NULL, 'Simulado #55', 1, NULL, '2025-11-28 09:54:15', '2025-11-28 09:54:15'),
(283, 3, 10, NULL, 'Simulado #56', 1, NULL, '2025-11-28 09:54:15', '2025-11-28 09:54:15'),
(284, 3, 6, NULL, 'Simulado #57', 1, NULL, '2025-11-28 09:54:16', '2025-11-28 09:54:16'),
(285, 3, 9, NULL, 'Simulado #58', 1, NULL, '2025-11-28 09:54:16', '2025-11-28 09:54:16'),
(286, 3, 10, NULL, 'Simulado #59', 1, NULL, '2025-11-28 09:54:16', '2025-11-28 09:54:16'),
(287, 3, 9, NULL, 'Simulado #60', 1, NULL, '2025-11-28 09:54:16', '2025-11-28 09:54:16'),
(288, 3, 6, NULL, 'Simulado #61', 1, NULL, '2025-11-28 09:54:16', '2025-11-28 09:54:16'),
(289, 3, 11, NULL, 'Simulado #62', 1, NULL, '2025-11-28 09:54:17', '2025-11-28 09:54:17'),
(290, 3, 9, NULL, 'Simulado #63', 1, NULL, '2025-11-28 09:54:17', '2025-11-28 09:54:17'),
(291, 3, 8, NULL, 'Simulado #64', 1, NULL, '2025-11-28 09:54:17', '2025-11-28 09:54:17'),
(292, 3, 8, NULL, 'Simulado #65', 1, NULL, '2025-11-28 09:54:17', '2025-11-28 09:54:17'),
(293, 3, 7, NULL, 'Simulado #66', 1, NULL, '2025-11-28 09:54:18', '2025-11-28 09:54:18'),
(294, 3, 11, NULL, 'Simulado #67', 1, NULL, '2025-11-28 09:54:18', '2025-11-28 09:54:18'),
(295, 3, 9, NULL, 'Simulado #68', 1, NULL, '2025-11-28 09:54:18', '2025-11-28 09:54:18'),
(296, 3, 7, NULL, 'Simulado #69', 1, NULL, '2025-11-28 09:54:18', '2025-11-28 09:54:18'),
(297, 3, 11, NULL, 'Simulado #70', 1, NULL, '2025-11-28 09:54:18', '2025-11-28 09:54:18'),
(298, 3, 9, NULL, 'Simulado #71', 1, NULL, '2025-11-28 09:54:19', '2025-11-28 09:54:19'),
(299, 3, 8, NULL, 'Simulado #72', 1, NULL, '2025-11-28 09:54:19', '2025-11-28 09:54:19'),
(300, 3, 7, NULL, 'Simulado #73', 1, NULL, '2025-11-28 09:54:19', '2025-11-28 09:54:19'),
(301, 3, 10, NULL, 'Simulado #74', 1, NULL, '2025-11-28 09:54:19', '2025-11-28 09:54:19'),
(302, 3, 9, NULL, 'Simulado #75', 1, NULL, '2025-11-28 09:54:19', '2025-11-28 09:54:19'),
(303, 3, 9, NULL, 'Simulado #76', 1, NULL, '2025-11-28 09:54:20', '2025-11-28 09:54:20'),
(304, 3, 8, NULL, 'Simulado #77', 1, NULL, '2025-11-28 09:54:20', '2025-11-28 09:54:20'),
(305, 3, 11, NULL, 'Simulado #78', 1, NULL, '2025-11-28 09:54:20', '2025-11-28 09:54:20'),
(306, 3, 8, NULL, 'Simulado #79', 1, NULL, '2025-11-28 09:54:20', '2025-11-28 09:54:20'),
(307, 3, 10, NULL, 'Simulado #80', 1, NULL, '2025-11-28 09:54:20', '2025-11-28 09:54:20'),
(308, 3, 8, NULL, 'Simulado #81', 1, NULL, '2025-11-28 09:54:21', '2025-11-28 09:54:21'),
(309, 3, 10, NULL, 'Simulado #82', 1, NULL, '2025-11-28 09:54:21', '2025-11-28 09:54:21'),
(310, 3, 10, NULL, 'Simulado #83', 1, NULL, '2025-11-28 09:54:21', '2025-11-28 09:54:21'),
(311, 3, 9, NULL, 'Simulado #84', 1, NULL, '2025-11-28 09:54:21', '2025-11-28 09:54:21'),
(312, 3, 6, NULL, 'Simulado #85', 1, NULL, '2025-11-28 09:54:21', '2025-11-28 09:54:21'),
(313, 3, 8, NULL, 'Simulado #86', 1, NULL, '2025-11-28 09:54:22', '2025-11-28 09:54:22'),
(314, 3, 10, NULL, 'Simulado #87', 1, NULL, '2025-11-28 09:54:22', '2025-11-28 09:54:22'),
(315, 3, 9, NULL, 'Simulado #88', 1, NULL, '2025-11-28 09:54:22', '2025-11-28 09:54:22'),
(316, 3, 6, NULL, 'Simulado #89', 1, NULL, '2025-11-28 09:54:22', '2025-11-28 09:54:22'),
(317, 3, 7, NULL, 'Simulado #90', 1, NULL, '2025-11-28 09:54:22', '2025-11-28 09:54:22'),
(318, 3, 8, NULL, 'Simulado #91', 1, NULL, '2025-11-28 09:54:23', '2025-11-28 09:54:23'),
(319, 3, 7, NULL, 'Simulado #92', 1, NULL, '2025-11-28 09:54:23', '2025-11-28 09:54:23'),
(320, 3, 9, NULL, 'Simulado #93', 1, NULL, '2025-11-28 09:54:23', '2025-11-28 09:54:23'),
(321, 3, 10, NULL, 'Simulado #94', 1, NULL, '2025-11-28 09:54:23', '2025-11-28 09:54:23'),
(322, 3, 7, NULL, 'Simulado #95', 1, NULL, '2025-11-28 09:54:24', '2025-11-28 09:54:24'),
(323, 3, 6, NULL, 'Simulado #96', 1, NULL, '2025-11-28 09:54:24', '2025-11-28 09:54:24'),
(324, 3, 11, NULL, 'Simulado #97', 1, NULL, '2025-11-28 09:54:24', '2025-11-28 09:54:24'),
(325, 3, 11, NULL, 'Simulado #98', 1, NULL, '2025-11-28 09:54:24', '2025-11-28 09:54:24'),
(326, 3, 11, NULL, 'Simulado #99', 1, NULL, '2025-11-28 09:54:24', '2025-11-28 09:54:24'),
(327, 3, 8, NULL, 'Simulado #100', 1, NULL, '2025-11-28 09:54:25', '2025-11-28 09:54:25'),
(328, 3, 6, NULL, 'Simulado #101', 1, NULL, '2025-11-28 09:54:25', '2025-11-28 09:54:25'),
(329, 3, 9, NULL, 'Simulado #102', 1, NULL, '2025-11-28 09:54:25', '2025-11-28 09:54:25'),
(330, 3, 6, NULL, 'Simulado #103', 1, NULL, '2025-11-28 09:54:25', '2025-11-28 09:54:25'),
(331, 3, 11, NULL, 'Simulado #104', 1, NULL, '2025-11-28 09:54:25', '2025-11-28 09:54:25'),
(332, 3, 10, NULL, 'Simulado #105', 1, NULL, '2025-11-28 09:54:26', '2025-11-28 09:54:26'),
(333, 3, 6, NULL, 'Simulado #106', 1, NULL, '2025-11-28 09:54:26', '2025-11-28 09:54:26'),
(334, 3, 8, NULL, 'Simulado #107', 1, NULL, '2025-11-28 09:54:26', '2025-11-28 09:54:26'),
(335, 3, 7, NULL, 'Simulado #108', 1, NULL, '2025-11-28 09:54:26', '2025-11-28 09:54:26'),
(336, 3, 6, NULL, 'Simulado #109', 1, NULL, '2025-11-28 09:54:26', '2025-11-28 09:54:26'),
(337, 3, 11, NULL, 'Simulado #110', 1, NULL, '2025-11-28 09:54:27', '2025-11-28 09:54:27'),
(338, 3, 9, NULL, 'Simulado #111', 1, NULL, '2025-11-28 09:54:27', '2025-11-28 09:54:27'),
(339, 3, 11, NULL, 'Simulado #112', 1, NULL, '2025-11-28 09:54:27', '2025-11-28 09:54:27'),
(340, 3, 10, NULL, 'Simulado #113', 1, NULL, '2025-11-28 09:54:27', '2025-11-28 09:54:27'),
(341, 3, 10, NULL, 'Simulado #114', 1, NULL, '2025-11-28 09:54:27', '2025-11-28 09:54:27'),
(342, 3, 9, NULL, 'Simulado #115', 1, NULL, '2025-11-28 09:54:28', '2025-11-28 09:54:28'),
(343, 3, 6, NULL, 'Simulado #116', 1, NULL, '2025-11-28 09:54:28', '2025-11-28 09:54:28'),
(344, 3, 11, NULL, 'Simulado #117', 1, NULL, '2025-11-28 09:54:28', '2025-11-28 09:54:28'),
(345, 3, 11, NULL, 'Simulado #118', 1, NULL, '2025-11-28 09:54:28', '2025-11-28 09:54:28'),
(346, 3, 6, NULL, 'Simulado #119', 1, NULL, '2025-11-28 09:54:28', '2025-11-28 09:54:28'),
(347, 3, 8, NULL, 'Simulado #120', 1, NULL, '2025-11-28 09:54:29', '2025-11-28 09:54:29'),
(348, 2, 4, 1, NULL, 2, 1, '2025-11-28 10:19:44', '2025-11-28 10:19:44'),
(349, 4, 13, 1, NULL, 1, 1, '2025-12-11 21:44:17', '2025-12-11 21:44:17');

-- --------------------------------------------------------

--
-- Table structure for table `E_entidades`
--

CREATE TABLE `E_entidades` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_entidades`
--

INSERT INTO `E_entidades` (`id`, `nombre`, `descripcion`, `estado`, `id_user_create`, `created_at`, `updated_at`) VALUES
(1, 'PSSFJ', 'ONG católica', 1, 1, '2025-10-31 13:07:34', '2025-10-31 13:07:51'),
(2, 'NUEVA', NULL, 1, 1, '2025-11-01 01:48:08', '2025-11-01 01:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `E_entidad_usuarios`
--

CREATE TABLE `E_entidad_usuarios` (
  `id` bigint UNSIGNED NOT NULL,
  `entidad_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `rol_entidad_id` bigint UNSIGNED NOT NULL,
  `es_propietario` tinyint(1) NOT NULL DEFAULT '0',
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_entidad_usuarios`
--

INSERT INTO `E_entidad_usuarios` (`id`, `entidad_id`, `usuario_id`, `rol_entidad_id`, `es_propietario`, `id_user_create`, `created_at`, `updated_at`) VALUES
(1, 2, 4815, 8, 0, 1, '2025-12-20 02:56:41', '2025-12-20 02:56:41'),
(2, 1, 1, 4, 0, 1, '2025-12-20 03:00:17', '2025-12-20 03:16:11'),
(3, 1, 201, 4, 0, 1, '2025-12-20 03:01:05', '2025-12-20 03:16:11'),
(4, 2, 4816, 8, 0, 1, '2025-12-20 03:14:39', '2025-12-20 03:14:39'),
(5, 1, 4816, 4, 0, 1, '2025-12-20 03:16:11', '2025-12-20 03:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `E_eventos`
--

CREATE TABLE `E_eventos` (
  `id` bigint UNSIGNED NOT NULL,
  `entidad_id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `imagen_portada` varchar(255) DEFAULT NULL,
  `lugar` varchar(255) DEFAULT NULL,
  `modalidad` enum('presencial','virtual','hibrido') NOT NULL DEFAULT 'virtual',
  `enlace_virtual` varchar(500) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('borrador','publicado','cerrado') NOT NULL DEFAULT 'borrador',
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_eventos`
--

INSERT INTO `E_eventos` (`id`, `entidad_id`, `titulo`, `descripcion`, `imagen_portada`, `lugar`, `modalidad`, `enlace_virtual`, `fecha_inicio`, `fecha_fin`, `estado`, `id_user_create`, `created_at`, `updated_at`) VALUES
(18, 1, 'AWAKE', NULL, NULL, 'PROMOTORA', 'presencial', NULL, '2025-10-31', '2025-11-01', 'publicado', 1, '2025-10-31 15:53:26', '2025-10-31 15:53:26'),
(19, 1, 'TTTT', 'TTTT', NULL, 'TTTTT', 'presencial', NULL, '2025-11-03', '2025-11-05', 'publicado', 1, '2025-10-31 16:04:19', '2025-10-31 16:04:19'),
(20, 1, 'AAAAAA', NULL, NULL, NULL, 'presencial', NULL, '2025-12-20', '2025-12-20', 'publicado', 1, '2025-12-20 00:58:21', '2025-12-20 00:59:53'),
(21, 1, 'BBB', NULL, NULL, NULL, 'presencial', NULL, '2025-12-22', '2025-12-22', 'borrador', 1, '2025-12-20 01:01:16', '2025-12-20 01:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `E_evento_dias`
--

CREATE TABLE `E_evento_dias` (
  `id` bigint UNSIGNED NOT NULL,
  `evento_id` bigint UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `permite_asistencia` tinyint(1) NOT NULL DEFAULT '1',
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_evento_dias`
--

INSERT INTO `E_evento_dias` (`id`, `evento_id`, `fecha`, `titulo`, `permite_asistencia`, `hora_inicio`, `hora_fin`, `id_user_create`, `created_at`, `updated_at`) VALUES
(5, 18, '2025-11-01', 'Día 01/11', 1, NULL, NULL, 1, '2025-10-31 15:53:26', '2025-10-31 15:53:26'),
(6, 19, '2025-11-03', 'Día 03/11', 1, NULL, NULL, 1, '2025-10-31 16:04:19', '2025-10-31 16:04:19'),
(7, 21, '2025-12-22', 'Día 22/12', 1, NULL, NULL, 1, '2025-12-20 01:01:16', '2025-12-20 01:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `E_evento_grupos`
--

CREATE TABLE `E_evento_grupos` (
  `id` bigint UNSIGNED NOT NULL,
  `evento_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `E_evento_grupo_usuarios`
--

CREATE TABLE `E_evento_grupo_usuarios` (
  `id` bigint UNSIGNED NOT NULL,
  `evento_grupo_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `E_grupos_entidad`
--

CREATE TABLE `E_grupos_entidad` (
  `id` bigint UNSIGNED NOT NULL,
  `entidad_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_grupos_entidad`
--

INSERT INTO `E_grupos_entidad` (`id`, `entidad_id`, `nombre`, `descripcion`, `estado`, `id_user_create`, `created_at`, `updated_at`) VALUES
(1, 1, 'GRUPO 1', NULL, 1, 1, '2025-10-31 13:26:49', '2025-10-31 13:28:14'),
(2, 1, 'GRUPO 2', NULL, 1, 1, '2025-10-31 13:28:43', '2025-10-31 13:28:43'),
(3, 2, 'G 1', 'DSFSDF', 1, 1, '2025-11-01 01:48:54', '2025-12-20 03:14:09');

-- --------------------------------------------------------

--
-- Table structure for table `E_grupo_usuarios`
--

CREATE TABLE `E_grupo_usuarios` (
  `id` bigint UNSIGNED NOT NULL,
  `grupo_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_grupo_usuarios`
--

INSERT INTO `E_grupo_usuarios` (`id`, `grupo_id`, `usuario_id`, `id_user_create`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, '2025-10-31 13:43:07', '2025-10-31 13:43:07'),
(4, 3, 4814, 1, '2025-12-20 01:50:52', '2025-12-20 01:50:52'),
(5, 3, 4815, 1, '2025-12-20 02:56:41', '2025-12-20 02:56:41'),
(6, 3, 4816, 1, '2025-12-20 03:14:39', '2025-12-20 03:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `E_perfiles_usuarios`
--

CREATE TABLE `E_perfiles_usuarios` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `nro_documento` varchar(50) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `institucion` varchar(200) DEFAULT NULL,
  `cargo` varchar(150) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `E_reglas_certificado`
--

CREATE TABLE `E_reglas_certificado` (
  `id` bigint UNSIGNED NOT NULL,
  `evento_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `porcentaje_minimo` int NOT NULL DEFAULT '75',
  `requiere_asistencia_dia` tinyint(1) NOT NULL DEFAULT '0',
  `requiere_asistencia_actividades` json DEFAULT NULL,
  `plantilla` varchar(255) DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `E_roles_entidad`
--

CREATE TABLE `E_roles_entidad` (
  `id` bigint UNSIGNED NOT NULL,
  `entidad_id` bigint UNSIGNED DEFAULT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `E_roles_entidad`
--

INSERT INTO `E_roles_entidad` (`id`, `entidad_id`, `codigo`, `nombre`, `descripcion`, `id_user_create`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ADMIN', 'Administrador', NULL, 1, '2025-10-31 13:08:10', '2025-10-31 13:08:10'),
(2, NULL, 'OFICINA', 'Oficina', NULL, 1, '2025-10-31 13:08:48', '2025-10-31 13:08:48'),
(3, NULL, 'MIEMBRO', 'Miembro', NULL, 1, '2025-10-31 13:09:20', '2025-10-31 13:09:20'),
(4, 1, 'ADMIN', 'Administrador', NULL, 1, '2025-12-20 02:21:36', '2025-12-20 02:21:36'),
(5, 2, 'ADMIN', 'Administrador', NULL, 1, '2025-12-20 02:21:36', '2025-12-20 02:21:36'),
(7, 1, 'MIEMBRO', 'Miembro', NULL, 1, '2025-12-20 02:21:36', '2025-12-20 02:21:36'),
(8, 2, 'MIEMBRO', 'Miembro', NULL, 1, '2025-12-20 02:21:36', '2025-12-20 02:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `e_rostros_usuarios`
--

CREATE TABLE `e_rostros_usuarios` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `imagen_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `embedding` longtext COLLATE utf8mb4_general_ci,
  `es_principal` tinyint(1) DEFAULT '0',
  `id_user_create` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `e_rostros_usuarios`
--

INSERT INTO `e_rostros_usuarios` (`id`, `usuario_id`, `imagen_path`, `embedding`, `es_principal`, `id_user_create`, `created_at`, `updated_at`) VALUES
(7, 1, 'rostros/1/ECZva1Pp8AaxHQoq1Xzzxkr3FHGQ9QUGumKASwAK.jpg', '[-0.12117530405521393,0.07570026069879532,0.023278305307030678,0.009570792317390442,0.014522631652653217,-0.03787956386804581,-0.04529367759823799,-0.0268203467130661,0.11416045576334,-0.0833757296204567,0.21989743411540985,-0.03905836492776871,-0.22285471856594086,-0.09975697100162506,-0.08102036267518997,0.1282719075679779,-0.15011927485466003,-0.14956527948379517,-0.009880286641418934,-0.02179795131087303,0.12532606720924377,-0.019048936665058136,-0.04793377220630646,0.1133916899561882,-0.04210346192121506,-0.3101979196071625,-0.04428503289818764,-0.11102387309074402,0.0486869178712368,-0.09855189174413681,-0.05682124197483063,-0.0069284504279494286,-0.1311376839876175,-0.02475901134312153,0.03526252135634422,0.0744294747710228,-0.0008057999657467008,-0.03466496244072914,0.18245182931423187,0.07082939893007278,-0.15593138337135315,0.011140664108097553,0.013393173925578594,0.3322772979736328,0.2010786533355713,0.10206402093172073,-0.043267786502838135,-0.06598684191703796,0.12842144072055817,-0.22543059289455414,0.03149475157260895,0.18506956100463867,0.16078992187976837,0.10461409389972687,0.0932224839925766,-0.17397359013557434,0.021090542897582054,0.11488231271505356,-0.16779418289661407,0.07176434248685837,-0.06706476211547852,-0.04313194379210472,0.08987701684236526,-0.0790945440530777,0.2498217523097992,0.044267356395721436,-0.1737586408853531,-0.09060966223478317,0.11253020912408829,-0.16560609638690948,-0.07999104261398315,0.08332905173301697,-0.08819998800754547,-0.1750490814447403,-0.22912587225437164,0.06250836700201035,0.4060226082801819,0.19914469122886658,-0.21174557507038116,0.030768029391765594,-0.060397204011678696,-0.08886665105819702,0.11313558369874954,0.14806342124938965,-0.045235540717840195,-0.026440272107720375,-0.08136522769927979,-0.12101183086633682,0.1539585143327713,0.05891190469264984,-0.058592017740011215,0.17747847735881805,-0.0704897865653038,0.05818620324134827,0.011802591383457184,-0.014733861200511456,-0.14094431698322296,0.02160269021987915,-0.09678709506988525,-0.12493624538183212,-0.10760784149169922,-0.07607406377792358,-0.0060985456220805645,0.07891691476106644,-0.15835115313529968,0.07489640265703201,0.0018587831873446703,0.029025765135884285,-0.032084234058856964,0.0899173691868782,-0.10704194009304047,-0.006014571990817785,0.06585998088121414,-0.29529061913490295,0.22874444723129272,0.17209932208061218,0.12178212404251099,0.13037072122097015,0.10518859326839447,0.03766835108399391,0.019792048260569572,-0.04998473450541496,-0.11380079388618469,-0.059982869774103165,0.04461658000946045,-0.017474329099059105,0.08919158577919006,-0.04160843789577484]', 0, 1, '2025-10-31 18:55:57', '2025-10-31 18:55:57'),
(8, 1, 'rostros/1/QBjEOHwlaVRbQYB2EqW1x2S4Zwx1RkIOTNREH9pp.jpg', '[-0.16485099494457245,0.0793275237083435,0.0714356005191803,-0.0036296581383794546,-0.0404587984085083,0.010355793870985508,-0.05126303806900978,-0.050954367965459824,0.16232137382030487,-0.09094200283288956,0.16090872883796692,0.03482601419091225,-0.1982141137123108,-0.013314591720700264,-0.06427154690027237,0.05550681799650192,-0.12935487926006317,-0.17729084193706512,-0.03907147794961929,-0.05312056466937065,0.11139268428087234,0.04910612106323242,-0.03213946893811226,0.10961736738681793,-0.15918858349323273,-0.30069980025291443,-0.07820413261651993,-0.15131689608097076,0.060400862246751785,-0.07520493865013123,-0.06001671776175499,-0.10677661001682281,-0.18555611371994019,0.03136248141527176,-0.003361661685630679,0.04445025697350502,0.008266013115644455,-0.06722413748502731,0.15646696090698242,0.037890661507844925,-0.18919236958026886,-0.011910546571016312,0.009328597225248814,0.29521822929382324,0.13913406431674957,0.06958165019750595,-0.0016822661273181438,-0.07448147237300873,0.12039562314748764,-0.19602900743484497,0.08800189197063446,0.22054092586040497,0.10580756515264511,0.09553632140159607,0.04841470718383789,-0.18259552121162415,0.024315183982253075,0.06980022042989731,-0.16405604779720306,0.12932026386260986,0.016606595367193222,0.028129540383815765,-0.021757321432232857,-0.06012866273522377,0.21251776814460754,0.08430004864931107,-0.18269279599189758,-0.14801837503910065,0.11246928572654724,-0.20551526546478271,-0.032445840537548065,0.11971491575241089,-0.14121678471565247,-0.22448930144309998,-0.16587476432323456,0.09291787445545197,0.5123852491378784,0.20212340354919434,-0.19579054415225983,0.021941466256976128,-0.1077754870057106,-0.049071554094552994,0.08168626576662064,0.14772824943065643,-0.06755459308624268,0.05777914822101593,-0.08082661777734756,0.04308958724141121,0.1926502287387848,0.05812101811170578,-0.027190566062927246,0.22203750908374786,0.007298477925360203,0.03004242479801178,-0.00033593864645808935,0.06317015737295151,-0.1278049349784851,0.017826426774263382,-0.055422939360141754,-0.03920233994722366,0.002529954770579934,-0.014635349623858929,0.0010601913090795279,0.0880887433886528,-0.14459586143493652,0.18401293456554413,0.033358264714479446,-0.003968135919421911,-0.007541567087173462,0.08073914796113968,-0.12656071782112122,-0.05792298913002014,0.11317114531993866,-0.24638235569000244,0.19433100521564484,0.14627866446971893,0.12138139456510544,0.1396196484565735,0.04951925948262215,0.07159482687711716,0.030355632305145264,-0.014440356753766537,-0.16516324877738953,-0.056076303124427795,0.024895641952753067,-0.09350527822971344,0.06647394597530365,-0.0220353826880455]', 0, 1, '2025-10-31 18:55:57', '2025-10-31 18:55:57'),
(9, 1, 'rostros/1/41ouHCL8BdCqgKBhH0vwf9W34d7zAYqKeHiSLuya.jpg', '[-0.09172006696462631,0.09468583762645721,0.03149653226137161,-0.023014238104224205,-0.05383121222257614,0.016610264778137207,-0.08774370700120926,-0.024080390110611916,0.13244961202144623,-0.04826626554131508,0.20295056700706482,0.03511745482683182,-0.13284489512443542,-0.12223934382200241,-0.05308663845062256,0.10683663189411163,-0.16355177760124207,-0.1829579919576645,-0.01772077940404415,-0.03903299942612648,0.03635470196604729,0.08028851449489594,0.01765044778585434,0.08397550880908966,-0.13133585453033447,-0.3122268319129944,-0.04539212957024574,-0.169878751039505,0.043085042387247086,-0.06659670174121857,-0.06834787875413895,-0.008358296938240528,-0.14505349099636078,-0.045503947883844376,0.1066071093082428,0.12331906706094742,0.010316719301044941,-0.02756892330944538,0.13104385137557983,0.07134877145290375,-0.16189199686050415,0.011638309806585312,0.03898046910762787,0.2954549193382263,0.15395589172840118,0.12257499247789383,-0.003067139070481062,-0.06497901678085327,0.12704423069953918,-0.20761419832706451,0.09337586909532547,0.15218770503997803,0.13762438297271729,0.0634164959192276,0.13011609017848969,-0.1711447387933731,0.05345427617430687,0.0621299147605896,-0.15659455955028534,0.055371012538671494,-0.052731968462467194,0.02872474305331707,0.03510121628642082,-0.07239900529384613,0.16609463095664978,0.05869760364294052,-0.09233849495649338,-0.14073462784290314,0.09957700222730637,-0.16308559477329254,-0.1020648255944252,0.19035601615905762,-0.08180999755859375,-0.17174383997917175,-0.22305555641651154,0.006889985874295235,0.4334641396999359,0.21400770545005798,-0.18366892635822296,-0.027645498514175415,0.011095098219811916,-0.06626930832862854,0.05807185545563698,0.08283339440822601,-0.09564321488142014,0.04386698454618454,-0.10914057493209839,-0.03350948542356491,0.18787330389022827,0.0556822307407856,-0.05990186333656311,0.16303250193595886,-0.03362410515546799,0.07506381720304489,0.030238479375839233,0.0440673753619194,-0.08094486594200134,0.04644675552845001,-0.08953869342803955,-0.09731706231832504,0.023527542129158974,-0.023979241028428078,-0.02641974948346615,0.08917135000228882,-0.18746115267276764,0.08097092807292938,-0.04282528534531593,-0.041567426174879074,-0.05803057551383972,0.06072264537215233,-0.07725191116333008,0.02958035282790661,0.14079783856868744,-0.25920459628105164,0.18056702613830566,0.20186085999011993,0.061900779604911804,0.12417242676019669,0.05939745903015137,-0.011135631240904331,-0.030412470921874046,-0.11161532998085022,-0.14957453310489655,-0.1284584105014801,0.00893305242061615,-0.09179023653268814,0.07954185456037521,-0.026266708970069885]', 0, 1, '2025-10-31 18:55:57', '2025-10-31 18:55:57'),
(10, 1, 'rostros/1/50TMCLp1Dwj4qiynhrGcTZGauh3HV55JzkRSxYxi.jpg', '[-0.09661367535591125,0.11030500382184982,0.08685783296823502,-0.0031149927526712418,-0.07881958037614822,-0.10384617745876312,0.0084127988666296,-0.11260951310396194,0.11158664524555206,-0.05611748993396759,0.25292566418647766,-0.050543058663606644,-0.20179055631160736,-0.11821626871824265,0.024678628891706467,0.08463408797979355,-0.12985093891620636,-0.11641860008239746,-0.030371857807040215,-0.0804067850112915,0.0425419881939888,-0.012118526734411716,0.03794403746724129,0.0773836225271225,-0.02548346109688282,-0.2926415801048279,-0.10371069610118866,-0.12530703842639923,0.12335845828056335,-0.07072252035140991,-0.05577661097049713,0.037262558937072754,-0.18261075019836426,-0.06201809644699097,-0.03397050127387047,0.027396613731980324,-0.06390702724456787,-0.0799546018242836,0.1766178160905838,-0.030597660690546036,-0.09456796199083328,-0.07972019165754318,0.007690697442740202,0.2075835019350052,0.16792185604572296,0.006371716968715191,0.005013827700167894,0.015786638483405113,0.00976525992155075,-0.19152124226093292,0.022944439202547073,0.18434737622737885,0.18979144096374512,0.06672179698944092,0.053573086857795715,-0.1750851422548294,0.013872678391635418,0.04778878390789032,-0.16261231899261475,0.06354471296072006,0.013723100535571575,-0.027023566886782646,-0.05793599411845207,-0.04319232702255249,0.2642183303833008,0.11701872199773788,-0.09171196818351746,-0.13288633525371552,0.1352708637714386,-0.1647275984287262,-0.05304611474275589,0.08759709447622299,-0.13285012543201447,-0.1626526564359665,-0.14238642156124115,0.05821119621396065,0.31621411442756653,0.12061066180467606,-0.19446823000907898,0.02749335579574108,-0.1389249861240387,-0.056384675204753876,0.02392587810754776,-0.004751055501401424,-0.0850442424416542,-0.002405298873782158,-0.13726620376110077,-0.030254922807216644,0.1252921223640442,-0.05749090760946274,-0.013302360661327839,0.2280781865119934,-0.03448301553726196,0.04968968406319618,0.014852222986519337,-0.07727513462305069,-0.011441685259342194,0.051768530160188675,-0.06798131763935089,-0.010337027721107006,0.04219129681587219,-0.16194094717502594,-0.049271419644355774,0.042569246143102646,-0.17930762469768524,0.07161621749401093,0.030840661376714706,0.029199417680501938,-0.006971810944378376,-0.005862788762897253,-0.18278717994689941,-0.04617670178413391,0.17658580839633942,-0.25294700264930725,0.2547718584537506,0.17704583704471588,0.023636555299162865,0.12011430412530899,0.06504739075899124,0.07939182966947556,0.03289751708507538,-0.08465329557657242,-0.10414739698171616,-0.033333439379930496,0.07414116710424423,-0.0952766090631485,-0.03547465428709984,0.02595696598291397]', 0, 1, '2025-10-31 18:56:16', '2025-10-31 18:56:16'),
(11, 1, 'rostros/1/3IgGrDfAgx3ptftPgGJ8HVrLD2gMMXe0pCHKjH0k.jpg', '[-0.1289859265089035,0.09886826574802399,0.006218143738806248,-0.014609542675316334,-0.10071726888418198,-0.01154725719243288,-0.11300758272409439,-0.02687341719865799,0.2070833295583725,-0.1163870170712471,0.16271930932998657,-0.007978780195116997,-0.21458818018436432,-0.046754322946071625,-0.06243249028921127,0.07446572929620743,-0.12499503791332245,-0.12588582932949066,0.053467895835638046,-0.07070501893758774,0.10060792416334152,0.03888748586177826,-0.005484493914991617,0.10915499925613403,-0.10779768973588943,-0.3695243299007416,-0.0672881007194519,-0.10977295786142349,0.04460490122437477,-0.0731421560049057,-0.032054923474788666,0.01934843324124813,-0.13937345147132874,-0.009453600272536278,0.025412725284695625,0.15940408408641815,-0.029555315151810646,0.0122561389580369,0.1727658063173294,0.07456889748573303,-0.10680414736270905,-0.028344053775072098,-0.02922695502638817,0.3152881860733032,0.12067051231861115,0.0916350707411766,0.012089825235307217,-0.05774034932255745,0.12528303265571594,-0.22912010550498962,0.0904017984867096,0.21492724120616913,0.13934001326560974,0.077982597053051,0.10802178829908371,-0.157090961933136,0.020021844655275345,0.13955818116664886,-0.21384549140930176,0.07933442294597626,0.022199248895049095,-0.0015263287350535393,0.0005683907656930387,-0.0700528621673584,0.2822487950325012,0.1331349015235901,-0.14070063829421997,-0.09136322140693665,0.11842099577188492,-0.1687443107366562,-0.04860490560531616,0.08866659551858902,-0.08440237492322922,-0.18945570290088654,-0.17584030330181122,0.11064405739307404,0.4383890628814697,0.2163930982351303,-0.12775929272174835,0.012602802366018295,-0.05420048162341118,-0.06253983825445175,0.06908456981182098,0.037470635026693344,-0.11755602806806564,-0.018068889155983925,-0.05846734344959259,0.00994938239455223,0.12496361881494522,0.05696185678243637,-0.02466508001089096,0.16308103501796722,-0.01009997259825468,0.10393001139163971,0.015536673367023468,-0.01433737762272358,-0.1299111396074295,0.024331847205758095,-0.08257711678743362,-0.04189130663871765,-0.04854056239128113,-0.11245866119861603,0.02559182606637478,0.027870897203683853,-0.18333016335964203,0.12803426384925842,-0.002246170537546277,-0.052764784544706345,-0.0334339439868927,0.09752386808395386,-0.17076100409030914,-0.00855096336454153,0.14408805966377258,-0.3206068277359009,0.2442169040441513,0.12178272753953934,0.09757284820079803,0.2267141491174698,0.06571249663829803,0.07316788285970688,0.011690330691635609,-0.08865238726139069,-0.07734838128089905,-0.07495784014463425,0.029458947479724884,-0.04696280509233475,0.059609584510326385,-0.015381040051579475]', 0, 1, '2025-10-31 18:56:16', '2025-10-31 18:56:16'),
(12, 1, 'rostros/1/Wk1TvgAXS5fRDHnXVRAOf7XNQ7j2xcJD1GKTng84.jpg', '[-0.08345658332109451,0.13080951571464539,0.030065586790442467,-0.06974241882562637,-0.15289653837680817,0.030467264354228973,-0.059530019760131836,0.002981863683089614,0.12842261791229248,-0.06666288524866104,0.12667082250118256,-0.06307528167963028,-0.20466452836990356,-0.03233027085661888,-0.04361167177557945,0.1404922753572464,-0.17347992956638336,-0.1409664899110794,-0.030414119362831116,-0.07216154038906097,0.11050265282392502,0.06816503405570984,-0.05706775560975075,0.11158158630132675,-0.14416085183620453,-0.30262863636016846,-0.09088417142629623,-0.1351945698261261,0.05825870856642723,-0.09881632775068283,-0.0647892951965332,-0.12604190409183502,-0.15907850861549377,-0.046372853219509125,0.03203440457582474,0.08901659399271011,-0.038362499326467514,-0.09675705432891846,0.12319139391183853,0.06248168647289276,-0.15044976770877838,0.021655386313796043,-0.0026895063929259777,0.3050544559955597,0.10764401406049728,0.09333828091621399,0.009190197102725506,-0.011264034546911716,0.10959315299987793,-0.24789531528949738,0.08933094143867493,0.1928132176399231,0.09195002168416977,0.10940762609243393,0.025427233427762985,-0.11537545919418335,0.08657955378293991,0.15728649497032166,-0.23100794851779938,0.07489048689603806,0.05855686962604523,-0.024088315665721893,0.02773190662264824,-0.016962429508566856,0.21601493656635284,0.10066552460193634,-0.09974804520606995,-0.15128718316555023,0.06595972925424576,-0.2092505246400833,-0.07839168608188629,0.025439638644456863,-0.10033763945102692,-0.1557956039905548,-0.2661474347114563,0.06670064479112625,0.47200679779052734,0.2592061758041382,-0.19452516734600067,-0.016072126105427742,-0.09183425456285477,0.03863558918237686,0.1505158692598343,0.04063321277499199,-0.07884366065263748,0.043770141899585724,-0.14221985638141632,0.032323628664016724,0.1673756241798401,-0.04408033564686775,-0.023051150143146515,0.2185744047164917,0.061091240495443344,0.05012926459312439,0.043488677591085434,0.013900031335651875,-0.10532736778259277,-0.021633505821228027,-0.027337977662682533,-0.02371032163500786,0.03733212128281593,-0.06030276417732239,0.012759856879711151,0.09969751536846161,-0.2001183182001114,0.1631816327571869,0.00786703359335661,-0.05413155257701874,-0.0795380026102066,0.07799587398767471,-0.1571951061487198,-0.05904008448123932,0.17597049474716187,-0.2227936089038849,0.15400977432727814,0.23451228439807892,0.029928479343652725,0.15385539829730988,0.08828011155128479,0.04526183381676674,-0.035466231405735016,-0.08565058559179306,-0.10424374043941498,-0.0895896703004837,0.04212810471653938,-0.014183302409946918,0.088018499314785,0.009739451110363007]', 0, 1, '2025-10-31 18:56:16', '2025-10-31 18:56:16'),
(13, 4813, 'rostros/4813/4OSZEcT8vMErNUSMVauiGjDPGIcVF1VI7Cn8P6cX.jpg', '[-0.09739372879266739,0.1164042204618454,0.08227023482322693,-0.11085129529237747,-0.11077656596899033,-0.010601462796330452,-0.08366714417934418,-0.15548096597194672,0.2579931914806366,-0.25296130776405334,0.18241123855113983,-0.06541941314935684,-0.2357204109430313,0.08406049013137817,-0.08153446763753891,0.20860962569713593,-0.1390925496816635,-0.20879043638706207,-0.08422830700874329,-0.09297360479831696,-0.0461626872420311,0.0035725263878703117,0.006100332364439964,0.06177349016070366,-0.09219133853912354,-0.31106239557266235,-0.08153681457042694,-0.05748474597930908,-0.005799985956400633,-0.053553469479084015,0.034116778522729874,0.06637957692146301,-0.1668856292963028,0.019659006968140602,0.0142217380926013,0.16156631708145142,-0.06036306917667389,-0.1288859248161316,0.1831509917974472,-0.039790015667676926,-0.24740734696388245,-0.12236906588077545,0.003673107596114278,0.24208694696426392,0.11578910797834396,-0.047875963151454926,0.0517202652990818,-0.14326509833335876,0.09889256954193115,-0.21412314474582672,0.03961668908596039,0.17515362799167633,0.05122395604848862,0.11131250858306885,0.031015411019325256,-0.126760333776474,0.06522408127784729,0.11140436679124832,-0.12949466705322266,0.0003464207402430475,0.1134311780333519,-0.030571119859814644,-0.02729203552007675,-0.07607308030128479,0.32183489203453064,0.16263914108276367,-0.1753896176815033,-0.16260120272636414,0.22309374809265137,-0.1449872851371765,-0.0858968049287796,0.05038923770189285,-0.16048568487167358,-0.19099310040473938,-0.2514873743057251,-0.029389889910817146,0.45268985629081726,0.11985641717910767,-0.10482075810432434,0.0674438551068306,-0.08399327844381332,-0.03995514288544655,0.0006340520340017974,0.22892996668815613,-0.03911731392145157,0.0743812844157219,0.009012038819491863,0.06944087147712708,0.24849021434783936,-0.056044094264507294,-0.10424342006444931,0.18308773636817932,-0.04297101870179176,0.0027971842791885138,-0.013532095588743687,0.07263211160898209,-0.06779458373785019,0.003987771924585104,-0.13035015761852264,-0.022917013615369797,0.03588315472006798,0.019711440429091454,-0.03921058028936386,0.11936157941818237,-0.142385795712471,0.20878304541110992,-0.0015606081578880548,0.02784629724919796,0.029286958277225494,0.07163731008768082,-0.09025739878416061,-0.1026354432106018,0.2051784247159958,-0.2188681811094284,0.17749281227588654,0.14909450709819794,0.059639278799295425,0.14615891873836517,0.09777237474918365,0.11866776645183563,0.09181606769561768,-0.0358952097594738,-0.17093302309513092,-0.07635100930929184,0.026013845577836037,-0.012904627248644829,0.03980039805173874,0.0629022866487503]', 0, 4813, '2025-11-01 01:57:33', '2025-11-01 01:57:33'),
(15, 4813, 'rostros/4813/A7vTrKgxQ8tfPTtaLKFdAEU6Tq274SQ62NXQhm8f.jpg', '[-0.07891317456960678,0.1137346625328064,-0.010560338385403156,-0.10361131280660629,-0.06326261907815933,-0.0551600381731987,-0.0916571170091629,-0.0892125740647316,0.25130540132522583,-0.14893126487731934,0.16031183302402496,-0.016487879678606987,-0.18582656979560852,0.0038974625058472157,-0.09128165245056152,0.1406351774930954,-0.18322117626667023,-0.1201692447066307,-0.028879914432764053,-0.07563497871160507,0.03660885989665985,-0.034918464720249176,0.08296319842338562,0.14161692559719086,-0.0906941145658493,-0.3042897582054138,-0.058703262358903885,-0.1804303079843521,-0.008037389256060123,-0.10389310866594315,0.06293583661317825,0.06957896798849106,-0.17231525480747223,0.023382671177387238,-0.02205679379403591,0.05147814005613327,-0.03471512719988823,-0.053088124841451645,0.19621481001377106,-0.06845925748348236,-0.23223072290420532,-0.08923407644033432,0.00987884122878313,0.25007137656211853,0.17413167655467987,-0.0494743175804615,0.05984562635421753,-0.13221436738967896,0.09127519279718399,-0.23008398711681366,0.0525989830493927,0.15496942400932312,0.02714594639837742,0.05684811621904373,0.02152993157505989,-0.16297267377376556,0.05474642664194107,0.08985511213541031,-0.12873513996601105,0.030587663874030113,0.0651828721165657,-0.046528160572052,-0.08162813633680344,-0.023502934724092484,0.30481377243995667,0.16420738399028778,-0.16831836104393005,-0.1480543464422226,0.17780767381191254,-0.1901315599679947,0.010548308491706848,0.14086993038654327,-0.10863568633794785,-0.19548816978931427,-0.18146982789039612,-0.0696077048778534,0.41061338782310486,0.11302400380373001,-0.12033277004957199,0.08541863411664963,-0.22405844926834106,-0.009584253653883934,0.0004971866146661341,0.169034942984581,-0.0487193837761879,0.03675171732902527,-0.037578925490379333,0.050314754247665405,0.17752429842948914,-0.05314506217837334,-0.0337691605091095,0.21060633659362793,-0.005952625069767237,-0.023660758510231972,-0.012025131843984127,0.04968003183603287,-0.110144704580307,-0.007312507834285498,-0.10021218657493591,-0.03803364932537079,-0.017544442787766457,-0.0443597175180912,-0.06488115340471268,0.05950436741113663,-0.24335110187530518,0.1845415085554123,0.027242999523878098,0.0021855542436242104,0.056682609021663666,0.04606354236602783,-0.02441556192934513,-0.08979973196983337,0.18063543736934662,-0.25620028376579285,0.18295589089393616,0.12091989815235138,0.0980849415063858,0.21122004091739655,0.02535000443458557,0.13286550343036652,0.007491317577660084,-0.11303405463695526,-0.16737395524978638,0.02209317870438099,0.011335480026900768,-0.024783043190836906,-0.0030222060158848763,-0.009737741202116013]', 0, 4813, '2025-11-01 01:57:45', '2025-11-01 01:57:45'),
(16, 4813, 'rostros/4813/5GA0ZNjBKbwy5rHje0LCD57uaFxHhgNUgmR6v5C5.jpg', '[-0.0622909814119339,0.11046238988637924,0.07808911055326462,-0.16247065365314484,-0.07325008511543274,0.03562624752521515,-0.012001322582364082,-0.1144368052482605,0.252933144569397,-0.26924261450767517,0.17905135452747345,-0.02193249762058258,-0.21447110176086426,0.03467360511422157,-0.042992908507585526,0.18702052533626556,-0.17644700407981873,-0.2506522238254547,-0.09581583738327026,-0.08025617897510529,-0.02766967937350273,-0.009299258701503277,0.017658328637480736,0.05526987090706825,-0.16714678704738617,-0.3194589614868164,-0.09786369651556015,-0.11774914711713791,0.01744205877184868,-0.048104796558618546,0.025052431970834732,-0.014349313452839851,-0.1824057549238205,0.04688471928238869,-0.03884037956595421,0.10434833914041519,-0.08541395515203476,-0.1432746797800064,0.23310235142707825,0.010652979835867882,-0.2729438245296478,-0.0905304104089737,0.021587077528238297,0.24087125062942505,0.2035890370607376,-0.036079008132219315,0.01776881329715252,-0.11645618826150894,0.13839149475097656,-0.19741789996623993,0.019609933719038963,0.17720766365528107,0.07555210590362549,0.128291055560112,0.03828515484929085,-0.08236920833587646,0.1035333201289177,0.09228876233100891,-0.18865817785263062,-0.0757012814283371,0.059161003679037094,-0.026618532836437225,-0.003851530607789755,-0.07587634027004242,0.32035040855407715,0.11393938213586807,-0.1655370593070984,-0.1288888305425644,0.2264057844877243,-0.16743095219135284,-0.09589418023824692,0.024787597358226776,-0.17657914757728577,-0.14891886711120605,-0.2644074857234955,-0.046347036957740784,0.4023160934448242,0.15290027856826782,-0.07025128602981567,0.10247547179460526,-0.10614752024412155,-0.03325245901942253,0.01641230098903179,0.17925916612148285,-0.0925237163901329,0.07099007815122604,0.013913624919950962,0.06300585716962814,0.22093266248703003,-0.051922816783189774,-0.08169528096914291,0.1302916705608368,-0.06288845837116241,0.005269159097224474,0.017352504655718803,0.03932729735970497,-0.11983116716146469,0.031337615102529526,-0.13811062276363373,-0.001339628011919558,0.0075989458709955215,0.008810851722955704,-0.01315501518547535,0.12144165486097336,-0.18914510309696198,0.21910816431045532,0.0095538180321455,-0.01918954774737358,0.007388069294393063,0.04657229781150818,-0.12084003537893295,-0.06580142676830292,0.1800043284893036,-0.22542008757591248,0.17635348439216614,0.1619335412979126,0.007764188107103109,0.1305663287639618,0.15317708253860474,0.07978764176368713,-0.020671702921390533,-0.010293377563357353,-0.23997768759727478,-0.059738028794527054,0.08078687638044357,-0.030835656449198723,0.14788712561130524,0.03977736085653305]', 0, 4813, '2025-11-01 01:58:12', '2025-11-01 01:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `E_tipos_participante`
--

CREATE TABLE `E_tipos_participante` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `id_user_create` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_pila` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo_invitado` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_user` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_perfil` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_documento` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1: DNI\r\n2: CE\r\n3: PST\r\n4: RUC\r\n\r\n09: RG(brazil)',
  `nro_documento` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `institucion_publica_privada` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profesion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institucion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(1, 'Enrique', 'Enrique', 'enrique@tinq.pe', 'alfredoenriquericciale@gmail.com', NULL, '$2y$12$TjYYiSttc9n4lWt2rMO.LeS1pNOMiuvSdIU1njae0F0retudFNFju', 1, NULL, NULL, 'RICCI ALE', NULL, NULL, NULL, '1', '48333702', 'M', NULL, NULL, NULL, NULL, NULL, '2023-11-06 08:59:59', '2023-11-06 08:59:59'),
(2, 'Jeannelly Paola Cabrera Espezua', NULL, 'paola.cabrera @uwiener.edu.pe', NULL, NULL, '$2y$12$/UDcM9i6lCgJd1Vf5x7dGOju.gVdzdiQo1e6gWjpM/H9r5CBVweHG', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-07 19:17:16', '2023-11-07 19:17:16'),
(3, 'Lourdes Guerra', NULL, 'lougueca @gmail.com', NULL, NULL, '$2y$12$qApwgdUMOh1plQiLEXrMSe73S9WETgicTjjATDZJEVZ.FQXT./KOi', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-07 21:44:47', '2023-11-07 21:44:47'),
(4, 'Lisbeth.bustamante@gmail.com', NULL, 'lisbeth.bustamante @gmail.com', NULL, NULL, '$2y$12$EVbA43D9bx9n7cT.HskdUeN1q6BY6OUdIxqpwtY.9WSngofEJsAkq', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-08 06:22:06', '2023-11-08 06:22:06'),
(5, 'CARMEN BATALLANOS UGARTE', NULL, 'carbaug60 @gmail.com', NULL, NULL, '$2y$12$0taPdAiYxmBc0u30Ss8YIu2L23VznBIpccqQF6T79jdYzFri0HdZK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-08 19:02:26', '2023-11-08 19:02:26'),
(6, 'Miguel Augusto Palacios ramirez', NULL, 'mipalacios365 @gmail.comzw', NULL, NULL, '$2y$12$TZZt4PYtpn.EY68I0uXL9OoOX9aRgD5PIHkBQ3cnIZA2WN67cEXfC', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-09 00:08:05', '2023-11-09 00:08:05'),
(7, 'Cristina Flores Neri', NULL, 'cristinafloresneri1975 @gmail.com', NULL, NULL, '$2y$12$Vsrf1rn4P38jhbWzgcvCT.xQhrUbVSv6P2VKsajF9qksZ5QJ3s/zC', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-10 20:37:39', '2023-11-10 20:37:39'),
(129, 'KATY', NULL, NULL, 'katypampamamani@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAMPA MAMANI', 'PERÚ', 'PUNO', NULL, '1', '75744135', NULL, '973285762', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Lucio Aldazabal Pauca Huancane ', NULL, NULL),
(130, 'CLEMENTINA LUZ LILIANA', NULL, NULL, 'obstaliliannagarcia@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARCIA RIVERA', 'PERÚ', 'CALLAO', NULL, '1', '40844244', NULL, '975054412', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Diresa Callao ', NULL, NULL),
(131, 'ARASELY ABIGAIL', NULL, NULL, 'araselysilva@gmail.com', NULL, NULL, 0, NULL, NULL, 'SILVA CAMPUSANO', 'PERÚ', 'HUANCAVELICA', NULL, '1', '47220849', NULL, '943625975', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL DEPARTAMENTAL DE HUANCAVELICA', NULL, NULL),
(132, 'MAGALY', NULL, NULL, 'mcusilazaro@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUSI LAZARO', 'PERÚ', 'HUANCAVELICA', NULL, '1', '72780723', NULL, '929934066', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL DEPARTAMENTAL DE HUANCAVELICA ', NULL, NULL),
(133, 'MARIA ISABELA', NULL, NULL, 'isabelvela@upeu.edu.pe', NULL, NULL, 0, NULL, NULL, 'VELA TELLO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '71021280', NULL, '915050992', NULL, 'PRIVADA', 'OTRA', 'Universidad Peruana Unión ', NULL, NULL),
(134, 'DINA MARINA', NULL, NULL, 'dcordova1920@gmail.com', NULL, NULL, 0, NULL, NULL, 'CORDOVA GOMEZ', 'PERÚ', 'PUNO', NULL, '1', '30833341', NULL, '951921027', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Carlos Cornejo Rosello Vizcardo', NULL, NULL),
(135, 'WILLIAMS HUGO', NULL, NULL, 'whcch2015@gmail.com', NULL, NULL, 0, NULL, NULL, 'CRUZ CHAMBILLA', 'PERÚ', 'TACNA', NULL, '1', '80417578', NULL, '990990709', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'ESSALUD ', NULL, NULL),
(136, 'DELIA OLINDA', NULL, NULL, 'dogawhed@gmail.com', NULL, NULL, 0, NULL, NULL, 'POCOHUANCA TURPO', 'PERÚ', 'TACNA', NULL, '1', '40775747', NULL, '990990715', NULL, 'AMBOS', 'LIC. ENFERMERÍA', 'ESSALUD ', NULL, NULL),
(137, 'HELEN', NULL, NULL, 'cd.helen4@gmail.com', NULL, NULL, 0, NULL, NULL, 'HANCCO JIMENEZ', 'PERÚ', 'PUNO', NULL, '1', '44916562', NULL, '997192249', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'MINSA', NULL, NULL),
(138, 'FLOR MARIA', NULL, NULL, 'florsenosaint@outlook.com', NULL, NULL, 0, NULL, NULL, 'SENOSAIN TORRES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44197086', NULL, '992164305', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital San Juan de lurigancho ', NULL, NULL),
(139, 'OLENKA MIREYA', NULL, NULL, 'olenkaguerra23@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUERRA IPARRAGUIRRE', 'PERÚ', 'LA LIBERTAD', NULL, '1', '76141276', NULL, '979971070', NULL, 'PRIVADA', 'TÉCNICO EN ENFERMERÍA', 'Clínica Peruano Americana ', NULL, NULL),
(140, 'GLORIA MARIA', NULL, NULL, 'gds_enf@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DIAZ SALAZAR', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07188043', NULL, '972740093', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRECCIÓN DE SALUD DEL EJÉRCITO ', NULL, NULL),
(141, 'ALICIA MAGALI', NULL, NULL, 'aliciamagalimirandaasmat@gmail.com', NULL, NULL, 0, NULL, NULL, 'MIRANDA ASMAT', 'PERÚ', 'LA LIBERTAD', NULL, '1', '18145227', NULL, '954868087', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Hospital distrital Jerusalén ', NULL, NULL),
(142, 'DARIO', NULL, NULL, 'daco_29@hotmail.com', NULL, NULL, 0, NULL, NULL, 'URRUTIA CUARESMA', 'PERÚ', 'CUSCO', NULL, '1', '23966000', NULL, '984118338', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'GERESA CUSCO ', NULL, NULL),
(143, 'GREGORIA BETZABE', NULL, NULL, 'betzabejimenez@hotmail.com', NULL, NULL, 0, NULL, NULL, 'JIMENEZ GARAVITO', 'PERÚ', 'ICA', NULL, '1', '21413953', NULL, '956661099', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA', NULL, NULL),
(144, 'MARÍA SOLEDAD', NULL, NULL, 'marsoval4.29@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOTO VALDIVIA', 'PERÚ', 'TACNA', NULL, '1', '29433871', NULL, '952516579', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Cs La Rsperanza', NULL, NULL),
(145, 'LUCY ESTHER', NULL, NULL, 'luarlu31281@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARCE LUZA', 'PERÚ', 'AREQUIPA', NULL, '1', '41155657', NULL, '959330744', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud Buenos Aires de cayma ', NULL, NULL),
(146, 'MIGUEL ANGEL', NULL, NULL, 'miguelmonierr@gmail.com', NULL, NULL, 0, NULL, NULL, 'MONIER ROCA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '06728783', NULL, '986497846', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Regional de Huacho', NULL, NULL),
(147, 'YESENIA SOLEDAD', NULL, NULL, 'Yesime_21@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MESCUA MENDOZA', 'PERÚ', 'APURÍMAC', NULL, '1', '45668238', NULL, '920031702', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Red de salud abancay', NULL, NULL),
(148, 'ZULEMA DEL ROSARIO', NULL, NULL, 'zulemalombardi@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOMBARDI GOMEZ', 'PERÚ', 'MOQUEGUA', NULL, '1', '00793342', NULL, '988339685', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Ejército del Perú', NULL, NULL),
(149, 'PAOLA', NULL, NULL, 'paopradonunez@gmail.com', NULL, NULL, 0, NULL, NULL, 'PRADO NUÑEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42775358', NULL, '996666024', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL ULDARICO ROCCA FERNANDEZ - ESS', NULL, NULL),
(150, 'MELISSA', NULL, NULL, 'Delacruz-10-23@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DE LA CRUZ VENTURA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '75522276', NULL, '995868506', NULL, 'PRIVADA', 'OTRA', 'Universidad Peruana Cayetano Heredia ', NULL, NULL),
(151, 'YSABEL', NULL, NULL, 'ysacardio@yahoo.com', NULL, NULL, 0, NULL, NULL, 'COSIO OBLITAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07684233', NULL, '998490980', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Nacional PNP Luus N. Saenz', NULL, NULL),
(152, 'MARUJA', NULL, NULL, 'Marpalf@gmail.com', NULL, NULL, 0, NULL, NULL, 'PALACIN FRAGA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '04069642', NULL, '965624544', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Huaycan ', NULL, NULL),
(153, 'VICTOR HUGO', NULL, NULL, 'hugomedina1967.07.23@gmail.com', NULL, NULL, 0, NULL, NULL, 'MEDINA CALLA', 'PERÚ', 'AREQUIPA', NULL, '1', '29407917', NULL, '958316545', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Ministerio de salud gobierno regional de Arequipa ', NULL, NULL),
(154, 'GONZALO HERNAN', NULL, NULL, 'gringowar79@gmail.com', NULL, NULL, 0, NULL, NULL, 'HORNA CAHUANA', 'PERÚ', 'PUNO', NULL, '1', '80310459', NULL, '906496810', NULL, 'PÚBLICA', 'INGENIERÍA', 'Hospital regional Manuel Nuñez butrón puno', NULL, NULL),
(155, 'GRACIELA MIRIAM', NULL, NULL, 'Gracielam_1703@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SARAVIA DIAZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09902065', NULL, '940413169', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital San jose', NULL, NULL),
(156, 'CLAUDIA DORIS', NULL, NULL, 'josetageu@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LA ROSA CASTRO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '09835509', NULL, '990994600', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital 2 Mayo', NULL, NULL),
(157, 'MIRIAM MARGOT', NULL, NULL, 'mgc2204@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GARCIA DE LA CRUZ', 'PERÚ', 'ANCASH', NULL, '1', '07071707', NULL, '994534651', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Centro de Salud Yugoslavia', NULL, NULL),
(158, 'REYNER ALEIN', NULL, NULL, 'rey.setember@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROSADO LUJAN', 'PERÚ', 'ANCASH', NULL, '1', '71408719', NULL, '953191869', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Hospital la Caleta ', NULL, NULL),
(159, 'CINTHIA CATHERINE', NULL, NULL, 'cinthiacatherine_84@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CABRERA MARTINEZ', 'PERÚ', 'LA LIBERTAD', NULL, '1', '42329194', NULL, '945619477', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Hospital II Chocope - Essalud ', NULL, NULL),
(160, 'ROGER FREDY', NULL, NULL, 'rogerfredyaguilarmd@gmail.com', NULL, NULL, 0, NULL, NULL, 'AGUILAR SONCCO', 'PERÚ', 'PUNO', NULL, '1', '40574164', NULL, '973248200', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'centro de salud caminaca', NULL, NULL),
(161, 'MARIA DEL PILAR', NULL, NULL, 'sandovalzapatamariadelpilar2@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANDOVAL ZAPATA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45219105', NULL, '933385516', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Centro de salud medalla milagrosa ', NULL, NULL),
(162, 'KATIA NOEMI', NULL, NULL, 'minoemi27@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROBLES SAMAN', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '45678083', NULL, '991784819', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital María Auxiliadora ', NULL, NULL),
(163, 'LISETT GABRIELA', NULL, NULL, 'Lgcossioo@gmail.com', NULL, NULL, 0, NULL, NULL, 'COSSIO ORTIZ', 'PERÚ', 'CAJAMARCA', NULL, '1', '42176274', NULL, '969614707', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Ris cajamarca ', NULL, NULL),
(164, 'URELIO BENJAMIN', NULL, NULL, 'ure.vilca@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILCA ARHUATA', 'PERÚ', 'PUNO', NULL, '1', '43511981', NULL, '917686427', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'C.S. Metropolitano ', NULL, NULL),
(165, 'DANYA MELINA', NULL, NULL, 'dayrondan31@gmail.com', NULL, NULL, 0, NULL, NULL, 'ACUÑA ORBEZO', 'PERÚ', 'HUÁNUCO', NULL, '1', '42726243', NULL, '924815705', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Red de salud Pachitea ', NULL, NULL),
(166, 'CUSY ELIZABETH', NULL, NULL, 'Cusyeli@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RUMICHE FIESTAS', 'PERÚ', 'PIURA', NULL, '1', '46298586', NULL, '969108171', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital José Cayetano Heredia III - Piura ', NULL, NULL),
(167, 'SHEILA YOSELIN', NULL, NULL, 'shei_luli@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LULIMACHE VELASQUEZ', 'PERÚ', 'ANCASH', NULL, '1', '76855556', NULL, '950562121', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Consorcio vial loreto', NULL, NULL),
(168, 'LUIS ENRIQUE', NULL, NULL, 'decanato.medicina@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'PODESTA GAVILANO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08250651', NULL, '999839616', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'FACULTAD DE MEDICINA - UNMSM', NULL, NULL),
(169, 'FANNY MIRYAM', NULL, NULL, 'fanny-mi@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ VIVANCO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '08639644', NULL, '980123887', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Policlinico Militar de Chorrillos ', NULL, NULL),
(170, 'ELKA NATALY', NULL, NULL, 'enqaped@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE ALEJO', 'PERÚ', 'LA LIBERTAD', NULL, '1', '42755667', NULL, '983985607', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital regional docente de trujillo', NULL, NULL),
(171, 'FLOR IRENE', NULL, NULL, 'camacoflor@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAMACO FRANCIA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '16169737', NULL, '938627191', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Hospital San Juan de Matucana ', NULL, NULL),
(172, 'TANIA MELBA', NULL, NULL, 'therrera@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'HERRERA DIONISIO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40657323', NULL, '964791869', NULL, 'PÚBLICA', 'OTRA', 'MINSA', NULL, NULL),
(173, 'ANDRES ANIBAL', NULL, NULL, 'a.marquez88@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARQUEZ MUÑOZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44914248', NULL, '989481381', NULL, 'PÚBLICA', 'INGENIERÍA', 'DITEL', NULL, NULL),
(175, 'MARJORIE JULIANA', NULL, NULL, 'marjorie2020c@gmail.com', NULL, NULL, 0, NULL, NULL, 'CALDERON GARCIA', 'PERÚ', 'OTRO', NULL, '1', '41939124', NULL, '986089341', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINISTERIO DE SALUD', NULL, NULL),
(176, 'RAQUEL', NULL, NULL, 'rordonez@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'ORDOÑEZ BULLON DE CASTILLO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '70063784', NULL, '940334859', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'MINISTERIO DE SALUD', NULL, NULL),
(177, 'KARINA ELIZABETH', NULL, NULL, 'karieliz@gmail.com', NULL, NULL, 0, NULL, NULL, 'DIEZ QUEVEDO', 'PERÚ', 'OTRO', NULL, '1', '43356723', NULL, '959181595', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Minsa', NULL, NULL),
(178, 'GIANNINA SANDRA', NULL, NULL, 'giannicitasandra2@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMANQUISPE CABANA', 'PERÚ', 'OTRO', NULL, '1', '40238481', NULL, '959733237', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA', NULL, NULL),
(179, 'CECILIA', NULL, NULL, 'medicelacla@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ ARTICA', 'PERÚ', 'CALLAO', NULL, '1', '20050509', NULL, '964731946', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Telemedicina ', NULL, NULL),
(180, 'NOEMI BERTILA', NULL, NULL, 'Noemi.linaresm97@gmail.com', NULL, NULL, 0, NULL, NULL, 'LINARES MOSQUERA', 'PERÚ', 'OTRO', NULL, '1', '41999808', NULL, '983727134', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Ministerio de Salud', NULL, NULL),
(181, 'MIRELLA DE JESUS', NULL, NULL, 'mirella.asistente@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARADIEGUE MONTAÑO', 'PERÚ', 'OTRO', NULL, '1', '45492279', NULL, '957568235', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'MINSA', NULL, NULL),
(182, 'NELLA TRINIDAD', NULL, NULL, 'NCALDERON@MINSA.GOB.PE', NULL, NULL, 0, NULL, NULL, 'CALDERON MITMA', 'PERÚ', 'OTRO', NULL, '1', '09834997', NULL, '991293216', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'DIRECCION DE TELEMEDICINA', NULL, NULL),
(183, 'FIORELLA VANESSA', NULL, NULL, 'vanezzafc@gmail.com', NULL, NULL, 0, NULL, NULL, 'FERRARI CALVO', 'PERÚ', 'CALLAO', NULL, '1', '72562312', NULL, '987897961', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'DIRECCIÓN DE TELEMEDICINA ', NULL, NULL),
(184, 'CLAUDIA ALEJANDRA', NULL, NULL, 'claudia.llanos.c289@gmail.com', NULL, NULL, 0, NULL, NULL, 'LLANOS CORDOVA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45560788', NULL, '988417039', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DITEL / MINSA', NULL, NULL),
(185, 'MADELAINE YANINA', NULL, NULL, 'madelaine.oy@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ORTIZ YENQUE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41294782', NULL, '987933273', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'MINSA DIGTEL ', NULL, NULL),
(186, 'MIGUEL FERNANDO', NULL, NULL, 'mcastroseminario@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASTRO SEMINARIO', 'PERÚ', 'CALLAO', NULL, '1', '31682717', NULL, '996415515', NULL, 'PÚBLICA', 'INGENIERÍA', 'MINISTERIO DE SALUD', NULL, NULL),
(187, 'ROY MICHAEL', NULL, NULL, 'royjaraolivera@gmail.com', NULL, NULL, 0, NULL, NULL, 'JARA OLIVERA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43826122', NULL, '944437517', NULL, 'PÚBLICA', 'INGENIERÍA', 'DIRECCIÓN DE TELEMEDICINA - DITEL - MINSA', NULL, NULL),
(188, 'JUNIOR MIGUEL', NULL, NULL, 'Jmiguelmesia@gmail.com', NULL, NULL, 0, NULL, NULL, 'MESIA ARAUJO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72411014', NULL, '982781539', NULL, 'PÚBLICA', 'INGENIERÍA', 'Minsa', NULL, NULL),
(189, 'HENRY', NULL, NULL, 'henoli30@gmail.com', NULL, NULL, 0, NULL, NULL, 'OLIVERA CHANGRA', 'PERÚ', 'JUNÍN', NULL, '1', '43461195', NULL, '958064534', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Minsa', NULL, NULL),
(190, 'MONICA LEONOR', NULL, NULL, 'mromeroa@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'ROMERO ARZAPALO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40840678', NULL, '969611158', NULL, 'PÚBLICA', 'INGENIERÍA', 'MINSA', NULL, NULL),
(191, 'ROBERTO CARLOS', NULL, NULL, 'rcurich@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'CURI CHAVEZ', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '40366233', NULL, '963921111', NULL, 'PÚBLICA', 'INGENIERÍA', 'MINSA', NULL, NULL),
(192, 'FLOR DE MARIA', NULL, NULL, 'fmedinaditel@gmail.com', NULL, NULL, 0, NULL, NULL, 'MEDINA DELGADO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '10315659', NULL, '975119034', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'MINISTERIO DE SALUD', NULL, NULL),
(193, 'PEDRO', NULL, NULL, 'pedroroh22@gmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ HUAMANI', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '76240698', NULL, '980717017', NULL, 'PÚBLICA', 'INGENIERÍA', 'DITEL', NULL, NULL),
(194, 'DULCINEA EDITH', NULL, NULL, 'dzunigaa@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'ZUÑIGA ABREGU', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '32927695', NULL, '923824613', NULL, 'PÚBLICA', 'INGENIERÍA', 'MINISTERIO DE SALUD', NULL, NULL),
(195, 'DANIEL ALEX', NULL, NULL, 'dvallejos@ino.gob.pe', NULL, NULL, 0, NULL, NULL, 'VALLEJOS PAREDES', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72788951', NULL, '919517283', NULL, 'PÚBLICA', 'TÉCNICO EN INGENIERÍA', 'INSTITUTO NACIONAL DE OFTALMOLOGÍA', NULL, NULL),
(196, 'MARITA ANALI', NULL, NULL, 'marita9019@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BALDERA FANANTE', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '46931982', NULL, '948482344', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de salud monsefu ', NULL, NULL),
(197, 'MIRZA CARMELA', NULL, NULL, 'Mirzac1807@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAQUERA JAHUIRA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '29459715', NULL, '987540955', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'PNP', NULL, NULL),
(198, 'KHARLINNA MASSIEL', NULL, NULL, 'klarinnhatavara@gmail.com', NULL, NULL, 0, NULL, NULL, 'TAVARA ROSILLO', 'PERÚ', 'CALLAO', NULL, '1', '00245870', NULL, '996004185', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'ALBERTO BARTON ', NULL, NULL),
(199, 'JENIFER FERNANDA', NULL, NULL, 'fer992121@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIOS HUAYTA', 'PERÚ', 'TACNA', NULL, '1', '73004404', NULL, '940740435', NULL, 'PÚBLICA', 'OTRA', 'C.S La Esperanza', NULL, NULL),
(200, 'FLOR LIZETH', NULL, NULL, 'Lizethchavezmarin@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHAVEZ MARIN', 'PERÚ', 'CAJAMARCA', NULL, '1', '47059221', NULL, '929118374', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Clínica cirugía plástica y estática', NULL, NULL),
(201, 'JUAN PABLO', NULL, NULL, 'juanpablomendozacruz@gmail.com', NULL, NULL, 0, NULL, NULL, 'MENDOZA CRUZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43339814', NULL, '986413985', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'DIGEMID ', NULL, NULL),
(202, 'FRANCISCO JAVIER', NULL, NULL, 'fcobravoa@yahoo.es', NULL, NULL, 0, NULL, NULL, 'BRAVO ALVA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07402184', NULL, '999657181', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Universidad San Marcos ', NULL, NULL),
(203, 'JOSE ARTURO', NULL, NULL, 'c.s.sangenarodevilla@gmail.com', NULL, NULL, 0, NULL, NULL, 'TRUJILLO HUACCHO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '06990452', NULL, '999923313', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI San Genaro de Villa Chorrillos ', NULL, NULL),
(204, 'CECILIA IVON', NULL, NULL, 'winndibel@gmail.com', NULL, NULL, 0, NULL, NULL, 'BRINGAS LEON', 'PERÚ', 'PUNO', NULL, '1', '42876401', NULL, '928803061', NULL, 'PÚBLICA', 'INGENIERÍA', 'Hospital San Martin de Porres', NULL, NULL),
(205, 'CESAR ADOLFO', NULL, NULL, 'cesararpasi1980@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARPASI CHURA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40945141', NULL, '951022306', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Insn', NULL, NULL),
(206, 'ROGERS GUILLERMO', NULL, NULL, 'corsanr@gmail.com', NULL, NULL, 0, NULL, NULL, 'CORTEZ SANCHEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '15860310', NULL, '935776386', NULL, 'PÚBLICA', 'OTRA', 'Hospital Laura Esther Rodríguez Dulanto', NULL, NULL),
(207, 'SARAY', NULL, NULL, 'Saray_tafur@outlook.com', NULL, NULL, 0, NULL, NULL, 'TAFUR NAUPARI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45345835', NULL, '956617959', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital de supe', NULL, NULL),
(208, 'MAGALY ANGELICA', NULL, NULL, 'depazdolores2502@gmail.com', NULL, NULL, 0, NULL, NULL, 'DEPAZ DOLORES', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '42301383', NULL, '959055850', NULL, 'PÚBLICA', 'OTRA', 'Hospital de Supe Laura Esther Rodríguez Dulanto', NULL, NULL),
(209, 'DIONISIO WILFREDO', NULL, NULL, 'artes.whillydario@gmail.com', NULL, NULL, 0, NULL, NULL, 'COTACALLAPA ALVAREZ', 'PERÚ', 'AREQUIPA', NULL, '1', '41985363', NULL, '951519027', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'P.S. NAZARENO y MDCC.', NULL, NULL),
(210, 'JOHN POUL', NULL, NULL, 'johnchanveg@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHANCASANAMPA VEGA', 'PERÚ', 'JUNÍN', NULL, '1', '42051150', NULL, '957602785', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'CRTJ Huancayo ', NULL, NULL),
(211, 'JORGE MARINO', NULL, NULL, 'jorgebrena11@gmail.com', NULL, NULL, 0, NULL, NULL, 'BREÑA PAREDES', 'PERÚ', 'PASCO', NULL, '1', '41100137', NULL, '931000864', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'DIRESA PASCO', NULL, NULL),
(212, 'FANNY MARISSA', NULL, NULL, 'marissa2695@gmail.com', NULL, NULL, 0, NULL, NULL, 'MONIER LOMPARTE', 'PERÚ', 'TUMBES', NULL, '1', '72443321', NULL, '960424800', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S. Pampas de Hospital ', NULL, NULL),
(213, 'VERONICA MEDALITT', NULL, NULL, 'vcloayza@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASTAÑEDA LOAYZA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '16801600', NULL, '971121466', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro Nacional de Salud Renal ', NULL, NULL),
(214, 'JULY MARIELA', NULL, NULL, 'juma_1287@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MORALES ALFARO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '44053795', NULL, '966273310', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Centro ginecologico Provida', NULL, NULL),
(215, 'ELIZABETH MELISSA', NULL, NULL, 'elizabeth.zevallos05@gmail.com', NULL, NULL, 0, NULL, NULL, 'ZEVALLOS LAUZAN', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '46303835', NULL, '976165056', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'MINISTERIO DE SALUD', NULL, NULL),
(216, 'FANNY YASMIN', NULL, NULL, 'fanny-21-94@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CASAS CAPUÑAY', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '73338194', NULL, '989305876', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Gerencia regional de salud Lambayeque ', NULL, NULL),
(217, 'GABRIELLA CECILIA', NULL, NULL, 'gaviotagaviota1010@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHAMBI CHAVEZ', 'PERÚ', 'JUNÍN', NULL, '1', '41084484', NULL, '991366093', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'HRDMIEC ', NULL, NULL),
(218, 'GERBER YULIAN', NULL, NULL, 'ccoillarriosg@gmail.com', NULL, NULL, 0, NULL, NULL, 'CCOILLAR RIOS', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '46098354', NULL, '935985095', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro Materno Infantil Daniel Alcides Carrion - VMT', NULL, NULL),
(219, 'MADELYN MADDGYE THALIA', NULL, NULL, 'madelynmaddgyethali@gmail.com', NULL, NULL, 0, NULL, NULL, 'ONCEBAY CARDENAS', 'PERÚ', 'JUNÍN', NULL, '1', '70120031', NULL, '972088955', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'HOSPITAL REGIONAL DOCENTE MATERNO INFANTIL EL CARMEN ', NULL, NULL),
(220, 'ROXANA YAJAIRA', NULL, NULL, 'roxana_28rquezada@outlook.es', NULL, NULL, 0, NULL, NULL, 'RAMOS QUEZADA', 'PERÚ', 'ANCASH', NULL, '1', '70525541', NULL, '918716764', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital La Caleta', NULL, NULL),
(221, 'VIRGINIA GICELLA', NULL, NULL, 'gicellatipianigtipz@gmail.com', NULL, NULL, 0, NULL, NULL, 'TIPIANI ZEGARRA', 'PERÚ', 'CALLAO', NULL, '1', '22258835', NULL, '942729829', NULL, 'PÚBLICA', 'OTRA', 'Hospital de Rehabilitación del Callao ', NULL, NULL),
(222, 'GIULIANA', NULL, NULL, 'sabrinagme@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHOQUE TEVES', 'PERÚ', 'APURÍMAC', NULL, '1', '42485551', NULL, '983840206', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Puma Asociados S.R.l.', NULL, NULL),
(223, 'GUADALUPE DENISE', NULL, NULL, 'denisegdcp@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CRUZ PAZOS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09855430', NULL, '942965991', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Hospital Naval ', NULL, NULL),
(224, 'YOYFFY JAKELINA', NULL, NULL, 'Yoyffy78@gmail.com', NULL, NULL, 0, NULL, NULL, 'JAVIER INGA', 'PERÚ', 'JUNÍN', NULL, '1', '42037915', NULL, '970171304', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'HRDMI EL CARMEN ', NULL, NULL),
(225, 'LUISA ELISA', NULL, NULL, 'allisa82@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ALBINO VILLANUEVA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41443348', NULL, '924965047', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Superintendencia Nacional de Salud', NULL, NULL),
(226, 'ROCIO MARISOL', NULL, NULL, 'rocioevanan2595@gmail.com', NULL, NULL, 0, NULL, NULL, 'EVANAN RIVERA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '73124955', NULL, '933680960', NULL, 'PÚBLICA', 'OTRA', 'CERITSS Raul Patrucco puig', NULL, NULL),
(227, 'VLADIMIR EDILBERTO', NULL, NULL, 'chrono1702@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARRIOS BEJARANO', 'PERÚ', 'AREQUIPA', NULL, '1', '43184640', NULL, '971971809', NULL, 'PÚBLICA', 'INGENIERÍA', 'Red de Salud Arequipa Caylloma', NULL, NULL),
(228, 'ROCIO LIZBETH', NULL, NULL, 'Rocioblas697@gmail.com', NULL, NULL, 0, NULL, NULL, 'BLAS FLORES', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '43321926', NULL, '977183941', NULL, 'PRIVADA', 'OTRA', 'Cuido pacientes a domicilio ', NULL, NULL),
(229, 'SANTOS GERMAN', NULL, NULL, 'gersam11@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CRUZ COCHACHIN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40649885', NULL, '992552800', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Essalud', NULL, NULL),
(230, 'LOURDES EDITH', NULL, NULL, 'villafuertelourdes4@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLAFUERTE MOGOLLON', 'PERÚ', 'CALLAO', NULL, '1', '72780005', NULL, '999840204', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Hospital de ventanilla ', NULL, NULL),
(231, 'NYNA ESTEFANIA', NULL, NULL, 'ninalavado22@gmail.com', NULL, NULL, 0, NULL, NULL, 'LAVADO PALACIOS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '75221932', NULL, '902029289', NULL, 'PRIVADA', 'OTRA', 'Carrión ', NULL, NULL),
(232, 'WALQUER REMI', NULL, NULL, 'wremit@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORRES ARQQUE', 'PERÚ', 'PUNO', NULL, '1', '41851049', NULL, '951535546', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Centro Salud Cono Norte ', NULL, NULL),
(233, 'NOELIA DEL ROCIO', NULL, NULL, 'noelia1304@outlook.com', NULL, NULL, 0, NULL, NULL, 'ARTEAGA ALVARADO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '72288818', NULL, '922872740', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'ESTUDIANTE DE MEDICINA DE LA UCSUR', NULL, NULL),
(234, 'SIMON ERNESTO', NULL, NULL, 'estrategaore2013@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ORE LAURA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '47882997', NULL, '965614368', NULL, 'PRIVADA', 'INGENIERÍA', 'UPT', NULL, NULL),
(235, 'Antonia Thayzla  Marcelino  Soares', NULL, NULL, 'thayzlasoares94@hotmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'LIMA REGIÓN', NULL, '2', '002246924', NULL, '965614369', NULL, 'PRIVADA', 'OTRA', 'Independiente', NULL, NULL),
(236, 'MABEL VALERIA', NULL, NULL, 'mabel.valeria15@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAMPOS SONCO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '75938900', NULL, '994289572', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Upc', NULL, NULL),
(237, 'LIZ', NULL, NULL, 'lizrengifo58@gmail.com', NULL, NULL, 0, NULL, NULL, 'RENGIFO RUIZ', 'PERÚ', 'CALLAO', NULL, '1', '41955377', NULL, '924805648', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRESA CALLAO', NULL, NULL),
(238, 'CLAUDIA MARIA TERESA', NULL, NULL, 'cugartet@continental.edu.pe', NULL, NULL, 0, NULL, NULL, 'UGARTE TABOADA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '07792555', NULL, '948903385', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Universidad Continental', NULL, NULL),
(239, 'PATRICIA RAQUEL', NULL, NULL, 'patry_481@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SALAZAR CHERO', 'PERÚ', 'CAJAMARCA', NULL, '1', '42303143', NULL, '976128005', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Consultorio privado ', NULL, NULL),
(240, 'YESSENIA NATALI', NULL, NULL, 'natali3890@gmail.com', NULL, NULL, 0, NULL, NULL, 'ORDAYA HUAMAN', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '46567512', NULL, '953522318', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'CENTRO DE SALUD CRUZ DE MOTUPE ', NULL, NULL),
(241, 'MARIA JUSTINA', NULL, NULL, 'majucharunp@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHARUN PAREDES DE BALVIN', 'PERÚ', 'CALLAO', NULL, '1', '25610894', NULL, '940397141', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Essalud', NULL, NULL),
(242, 'WILMER OSWALDO', NULL, NULL, 'wcordova@insn.gob.pe', NULL, NULL, 0, NULL, NULL, 'CORDOVA CALDERON', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40404027', NULL, '972688220', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Institución nacional de salud del niño Breña ', NULL, NULL),
(243, 'ANTONIO MARTY', NULL, NULL, 'antonio.quispe@expertta.com.pe', NULL, NULL, 0, NULL, NULL, 'QUISPE GUTIERREZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10774189', NULL, '962169519', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Expertta Salud', NULL, NULL),
(244, 'ROSA AMANDA', NULL, NULL, 'rosa_aguilar@hotmail.com', NULL, NULL, 0, NULL, NULL, 'AGUILAR PALOMINO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09627419', NULL, '999939040', NULL, 'AMBOS', 'LIC. OBSTETRICIA', 'Colegio de obstetras', NULL, NULL),
(245, 'KETTY ISABEL', NULL, NULL, 'Kettymurrugarra738@gmail.com', NULL, NULL, 0, NULL, NULL, 'MURRUGARRA GUTIERREZ', 'PERÚ', 'ANCASH', NULL, '1', '32980918', NULL, '990276109', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Santa ana costA', NULL, NULL),
(246, 'LITBER POOL', NULL, NULL, 'Poolrivera_28_96@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERA DURAND', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '75135283', NULL, '957262408', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'INSMHDHN', NULL, NULL),
(247, 'MOISES SAUL', NULL, NULL, 'moisesfvm@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHOQUEHUANCA CHOQUEHUANCA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '40701589', NULL, '997731961', NULL, 'AMBOS', 'CIRUJANO DENTISTA', 'Hospital Maria Auxiliadora ', NULL, NULL),
(248, 'MARCOS ERVETH', NULL, NULL, 'cos_24@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HERRERA CARDENAS', 'PERÚ', 'AREQUIPA', NULL, '1', '29677873', NULL, '947470916', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'C.S. Tiabaya Arequipa ', NULL, NULL),
(249, 'KEILA ALEJANDRA', NULL, NULL, 'moisesfvm@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MEZA ZELA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '45169293', NULL, '959352071', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Hospital Maria Auxiliadora ', NULL, NULL),
(250, 'LOURDES CAROLINA', NULL, NULL, 'carolinacelisalva2016@gmail.com', NULL, NULL, 0, NULL, NULL, 'CELIS ALVA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '74712233', NULL, '933197166', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Sm', NULL, NULL),
(251, 'DEIVI LAURO', NULL, NULL, 'ddiosramir@gmail.com', NULL, NULL, 0, NULL, NULL, 'DIOS RAMIREZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46364963', NULL, '964789279', NULL, 'PRIVADA', 'INGENIERÍA', 'Telefónica del peru', NULL, NULL),
(252, 'PATRICIA ISABEL', NULL, NULL, 'patty_piscis2@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ESCOBAR PAIRAZAMAN', 'PERÚ', 'LA LIBERTAD', NULL, '1', '45610357', NULL, '966595488', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro Materno Santa Catalina ', NULL, NULL),
(253, 'XENIA PAOLA', NULL, NULL, 'xenipaozavalablanco@gmail.com', NULL, NULL, 0, NULL, NULL, 'ZAVALA BLANCO', 'PERÚ', 'AREQUIPA', NULL, '1', '71922584', NULL, '935973335', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Essalud ', NULL, NULL),
(254, 'VIANCA ASTRID CAROLINA', NULL, NULL, 'cgamarrar@outlook.com', NULL, NULL, 0, NULL, NULL, 'GAMARRA RUIZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '71328739', NULL, '950970070', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'ESSALUD', NULL, NULL),
(255, 'JOSE LUIS', NULL, NULL, 'Sullontmo@gmail.com', NULL, NULL, 0, NULL, NULL, 'SULLON CUCHUPOMA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41148079', NULL, '997736946', NULL, 'PÚBLICA', 'OTRA', 'Instituto Nacional de Oftalmología', NULL, NULL),
(256, 'ANDREA MILAGROS', NULL, NULL, 'Andremicamog@gmail.com', NULL, NULL, 0, NULL, NULL, 'CABRERA MOGGARTOFF', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '71502590', NULL, '984148951', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Universidad Privada del norte ', NULL, NULL),
(257, 'ANALI VANESA', NULL, NULL, 'analivanemucha@gmail.com', NULL, NULL, 0, NULL, NULL, 'MUCHA URCO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '47699156', NULL, '915354874', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Gencopharmaceutica ', NULL, NULL),
(258, 'CHRISTOPHER', NULL, NULL, 'tkmuxo.love@gmail.com', NULL, NULL, 0, NULL, NULL, 'ORTIZ SANCHEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '74433810', NULL, '997831509', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional Huacho', NULL, NULL),
(259, 'MARIELA CAROLINA', NULL, NULL, 'marielavillanes.com@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLANES VEGA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46486294', NULL, '965754401', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional de Huacho', NULL, NULL),
(260, 'CARLOS EDUARDO', NULL, NULL, 'carlos_2615@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RAMIREZ SOTELO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45987297', NULL, '956370180', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional Huacho', NULL, NULL),
(261, 'NILDA LOURDES', NULL, NULL, 'nildita4@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHAVEZ RARAZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42615270', NULL, '990258758', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL NACIONAL DOS DE MAYO ', NULL, NULL),
(262, 'AARON', NULL, NULL, 'aataromd@gmail.com', NULL, NULL, 0, NULL, NULL, 'TARCO ROMERO', 'PERÚ', 'CUSCO', NULL, '1', '74698002', NULL, '984632300', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Otros', NULL, NULL),
(263, 'TOMY DUPUY', NULL, NULL, 'tomyva75@yahoo.com', NULL, NULL, 0, NULL, NULL, 'VILLANUEVA AREQUIPEÑO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10199677', NULL, '940314269', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de Emergencias Pediátricas', NULL, NULL),
(264, 'ZULY MILUSKA', NULL, NULL, 'zulymedic@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHAVEZ URBANO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '09616407', NULL, '940314273', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL DE EMERGENCIAS PEDIÁTRICAS', NULL, NULL),
(265, 'LUCIA YSABEL', NULL, NULL, 'luysabel95@gmail.com', NULL, NULL, 0, NULL, NULL, 'BELLIDO AGUIRRE', 'PERÚ', 'CUSCO', NULL, '1', '71417201', NULL, '991781708', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Otros', NULL, NULL),
(266, 'PIA GIMENA', NULL, NULL, 'gimena1097@gmail.com', NULL, NULL, 0, NULL, NULL, 'NUÑEZ DIAZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '70458482', NULL, '996694649', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Essalud', NULL, NULL),
(267, 'ALEX IVAN', NULL, NULL, 'amayasullon@gmail.com', NULL, NULL, 0, NULL, NULL, 'AMAYA SULLON', 'PERÚ', 'PIURA', NULL, '1', '45822967', NULL, '977397762', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'CONSULTORIO PRIVADO', NULL, NULL),
(268, 'FERNANDO LUIS', NULL, NULL, 'dr.fernandoalayob@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALAYO BOCANEGRA', 'PERÚ', 'ANCASH', NULL, '1', '46793930', NULL, '943100127', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Victor Ramos Guardia', NULL, NULL),
(269, 'CLIMTON', NULL, NULL, 'climtonlimabane@gmail.com', NULL, NULL, 0, NULL, NULL, 'LIMACHE BANEGAS', 'PERÚ', 'PUNO', NULL, '1', '70236899', NULL, '935345595', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Instituto de educación superior Pedro vilcapaza azangaro ', NULL, NULL),
(270, 'GEOVANA ISABEL', NULL, NULL, 'giovanaheredia78@gmail.com', NULL, NULL, 0, NULL, NULL, 'HEREDIA MORALES', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '15764681', NULL, '937602404', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CSMC QUILLAY', NULL, NULL),
(271, 'LILI HAYDEE', NULL, NULL, 'lilihamendoza@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MENDOZA ABREGU', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '10550567', NULL, '990386616', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diris Lima SurRis Bco ChoSco', NULL, NULL),
(272, 'MERY LUZ', NULL, NULL, 'merygonzales3@gmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALES JIMENEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '06665298', NULL, '954000424', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Ministerio de  defensa', NULL, NULL),
(273, 'MARIA PILAR', NULL, NULL, 'pilarmarchena@yahoo.com', NULL, NULL, 0, NULL, NULL, 'MARCHENA TORRES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '09295696', NULL, '956305930', NULL, 'PÚBLICA', 'OTRA', 'Centro de Salud Surco ', NULL, NULL),
(274, 'ELIZABETH FLOR', NULL, NULL, 'Dra.elybringas.c9@gmail.com', NULL, NULL, 0, NULL, NULL, 'BRINGAS VILLALBA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46329339', NULL, '928220529', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Puesto salud el valle', NULL, NULL),
(275, 'JOHANA PAOLA', NULL, NULL, 'jvilchezurbina@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILCHEZ URBINA', 'PERÚ', 'CALLAO', NULL, '1', '75505563', NULL, '987074202', NULL, 'PRIVADA', 'OTRA', 'CAPS', NULL, NULL),
(276, 'ALICIA ESTHER', NULL, NULL, 'agarios2806@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARNIQUE RIOS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40882070', NULL, '949298076', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Dirección General de Gestión del Riesgo de Desastres y Defensa Nacional en Salud/ MINSA', NULL, NULL),
(277, 'JHONEL TECHAEL', NULL, NULL, 'jhonelhuancahuari92@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUANCAHUARI NUÑEZ', 'PERÚ', 'AYACUCHO', NULL, '1', '70199264', NULL, '925959699', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Puesto de Salud Samaniato', NULL, NULL),
(278, 'JEANNE NADIA', NULL, NULL, 'jramosal@continental.edu.pe', NULL, NULL, 0, NULL, NULL, 'RAMOS ALARCON', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '10764739', NULL, '987469546', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Universidad Continental ', NULL, NULL),
(279, 'VERONICA MAGALY', NULL, NULL, 'vallejosbravo2@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALLEJOS BRAVO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42269092', NULL, '978062515', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA DIGTEL disamu ', NULL, NULL),
(280, 'RICARDO', NULL, NULL, 'Carnan1_1@hotmail.com', NULL, NULL, 0, NULL, NULL, 'FERNANDEZ RETO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '41835230', NULL, '980800424', NULL, 'PRIVADA', 'INGENIERÍA', 'Stefanini ', NULL, NULL),
(281, 'ROSA LILI', NULL, NULL, 'rosivere@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VELA REYES', 'PERÚ', 'AMAZONAS', NULL, '1', '33589436', NULL, '943688045', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL GUSTAVO LANATTA LUJAN ', NULL, NULL),
(282, 'MARIA ROXANA', NULL, NULL, 'roxanatrejo@gmail.com', NULL, NULL, 0, NULL, NULL, 'TREJO LOARTE', 'PERÚ', 'ANCASH', NULL, '1', '42837686', NULL, '991296592', NULL, 'PRIVADA', 'TÉCNICO ADMINISTRADOR', 'Clínica San Pablo', NULL, NULL),
(283, 'CARLOS ALBERTO', NULL, NULL, 'carlos.orellano@upch.pe', NULL, NULL, 0, NULL, NULL, 'ORELLANO TUESTA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42791670', NULL, '998053400', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Universidad Peruana Cayetano Heredia', NULL, NULL),
(284, 'MARCO ANTONIO', NULL, NULL, 'mgamarragia@gmail.com', NULL, NULL, 0, NULL, NULL, 'GAMARRA LA BARRERA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09426169', NULL, '999617179', NULL, 'AMBOS', 'ECONOMISTA', 'Universidad Nacional Federico Villarreal ', NULL, NULL),
(285, 'HOMERO IVAN', NULL, NULL, 'hichm1415@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHAVEZ MIÑANO', 'PERÚ', 'CALLAO', NULL, '1', '18211149', NULL, '950414917', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS Colasay', NULL, NULL),
(286, 'RUT ELENA', NULL, NULL, 'rutestelajauregui@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESTELA JAUREGUI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '71733335', NULL, '951207312', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Siga salud ', NULL, NULL),
(287, 'CEFERINA', NULL, NULL, 'cefecc26@gmail.com', NULL, NULL, 0, NULL, NULL, 'CCAHUANA SERRANO', 'PERÚ', 'CALLAO', NULL, '1', '25414832', NULL, '980316109', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Dirección regional de salud del callao', NULL, NULL),
(288, 'LEONOR LUCILA', NULL, NULL, 'doc_leo2502@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GRADOS GARCIA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '21412090', NULL, '946164726', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Centro de Salud Tahuantinsuyo Alto ', NULL, NULL),
(289, 'SANDRA ESTEFANI', NULL, NULL, '2021311020@unh.edu.pe', NULL, NULL, 0, NULL, NULL, 'ESPLANA CCORA', 'PERÚ', 'HUANCAVELICA', NULL, '1', '72368423', NULL, '966906295', NULL, 'PÚBLICA', 'OTRA', 'Universidad Nacional de Huancavelica ', NULL, NULL),
(290, 'JUAN MANUEL', NULL, NULL, 'jumalaru_1@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LAZARO RUFASTO', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16786334', NULL, '996479350', NULL, 'PÚBLICA', 'OTRA', 'C.S CHONGOYAPE ', NULL, NULL),
(291, 'LYZZETH BEATRIZ', NULL, NULL, 'lyzzeth2016@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALVARADO OCROSPOMA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '44446909', NULL, '922642570', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'APSSES', NULL, NULL),
(292, 'ROSA MARIA', NULL, NULL, 'rose270590@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALVATIERRA MENDOZA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '46501361', NULL, '936335884', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Meson de Sante ', NULL, NULL),
(293, 'VICTOR ROY', NULL, NULL, 'victor.caceres.h@uni.pe', NULL, NULL, 0, NULL, NULL, 'CACERES HUAMAN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41868098', NULL, '947142603', NULL, 'PÚBLICA', 'INGENIERÍA', 'UNI', NULL, NULL),
(294, 'ROSA MARIA', NULL, NULL, '1967rmmp@gmail.com', NULL, NULL, 0, NULL, NULL, 'MUÑOZ PIZARRO', 'PERÚ', 'AYACUCHO', NULL, '1', '28273016', NULL, '998707450', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Universidad Norbert Wiener ', NULL, NULL),
(295, 'ZAIDA RUTH', NULL, NULL, 'zailit213@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VALENCIA PARDO', 'PERÚ', 'CALLAO', NULL, '1', '09211626', NULL, '943647557', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital San José ', NULL, NULL),
(296, 'JULISSA OBDULIA', NULL, NULL, 'julissaloayzal@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOAYZA LOAYZA', 'PERÚ', 'ICA', NULL, '1', '43406671', NULL, '955636454', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CSMC JAVIER MARIATEGUI CHIAPPE', NULL, NULL),
(297, 'CARLA LIZ', NULL, NULL, 'calik_81@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HUAYHUA CABEZAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41149009', NULL, '998833133', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Independiente ', NULL, NULL),
(298, 'Tamara May  Baltodano  López ', NULL, NULL, 'tbaltodano@eslibertad.org', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'LIMA REGIÓN', NULL, '2', '001905825', NULL, '997666262', NULL, 'PRIVADA', 'OTRA', 'Student for the liberty Perú ', NULL, NULL),
(299, 'KETTY ERICA', NULL, NULL, 'kettytobali@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MIRANDA VIGIL DE AVILA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '21574225', NULL, '992901198', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'INFOSALUD ', NULL, NULL),
(300, 'UDAMAR NEY', NULL, NULL, 'neysscc.32.1986@gmail.com', NULL, NULL, 0, NULL, NULL, 'ORIHUELA TERAN', 'PERÚ', 'AREQUIPA', NULL, '1', '43645380', NULL, '966641121', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Centro de salud edificadores misti', NULL, NULL),
(301, 'CLAUDIA', NULL, NULL, 'claudia0403sul@gmail.com', NULL, NULL, 0, NULL, NULL, 'SULCARAY CHAICO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '47371121', NULL, '922985485', NULL, 'PRIVADA', 'OTRA', 'Laboratorio privado ', NULL, NULL),
(302, 'ALEXIS', NULL, NULL, 'alex48924437@gmail.com', NULL, NULL, 0, NULL, NULL, 'AVILA BERMUDEZ', 'PERÚ', 'ICA', NULL, '1', '48924437', NULL, '986094780', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud Jose Paseta Bar. CLAS MARCONA', NULL, NULL),
(303, 'SAID MAO WALTER', NULL, NULL, 'said.castilla.l@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASTILLA LLACTA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '73613053', NULL, '956051686', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'DIRIS LIMA NORTE', NULL, NULL),
(304, 'GIOVANA FELICITA', NULL, NULL, 'giovana.venturoc@gmail.com', NULL, NULL, 0, NULL, NULL, 'VENTURO CASTRO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '09050990', NULL, '983941122', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Centro de salud Tahuantinsuyo alto ', NULL, NULL),
(305, 'MARIA LUZBINDA', NULL, NULL, 'kristhye20@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DELGADO VASQUEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44005591', NULL, '948551171', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'MEDCOR', NULL, NULL),
(306, 'MARGARETH', NULL, NULL, 'Maggy.psicologia@gmail.com', NULL, NULL, 0, NULL, NULL, 'POMA FELIX', 'PERÚ', 'HUANCAVELICA', NULL, '1', '42555898', NULL, '982755298', NULL, 'PÚBLICA', 'OTRA', 'Minsa', NULL, NULL),
(307, 'LILIANA MONICA', NULL, NULL, 'nurseperu77@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORRES ARANA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '08776910', NULL, '952026035', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CENTRO DE SALUD SANTIAGO DE SURCO', NULL, NULL),
(308, 'GUILLERMO DEYBER', NULL, NULL, 'deyberapp@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALEMAN HUACO', 'PERÚ', 'TACNA', NULL, '1', '70600607', NULL, '910580094', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Puesto de Salud Pachía', NULL, NULL),
(309, 'Reymi Dianela  Martinez Balza', NULL, NULL, 'martinezreymi@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'COLOMBIA', 'OTRO', NULL, '2', '00834727', NULL, '997059777', NULL, 'PÚBLICA', 'OTRA', 'Ministerio de Salud', NULL, NULL),
(310, 'MARILU PAULITA', NULL, NULL, 'marilunoriegag@gmail.com', NULL, NULL, 0, NULL, NULL, 'NORIEGA GUEVARA', 'PERÚ', 'LA LIBERTAD', NULL, '1', '80258233', NULL, '957414413', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital El Esfuerzo Red Trujillo ', NULL, NULL),
(311, 'ROSA DEL MILAGRO KATHERINNE', NULL, NULL, 'rosehv24@gmail.com', NULL, NULL, 0, NULL, NULL, 'HURTADO VIDARTE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72949055', NULL, '961765546', NULL, 'PRIVADA', 'NUTRICIONISTA', 'Clínica Peruano Japonesa', NULL, NULL),
(312, 'FANNY GREIS', NULL, NULL, 'fannygreiscarlessorodas@gmail.com', NULL, NULL, 0, NULL, NULL, 'CARLESSO RODAS', 'PERÚ', 'CAJAMARCA', NULL, '1', '70557913', NULL, '929760222', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Cap  I hualgayoc essalud', NULL, NULL),
(313, 'MAIRA EUGENIA', NULL, NULL, 'eugeniatori@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORI LERZUNDI', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '48068247', NULL, '982316194', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Urogyn', NULL, NULL),
(314, 'ANA CRISTINA', NULL, NULL, 'cristina.aldana@pucp.edu.pe', NULL, NULL, 0, NULL, NULL, 'ALDANA PALOMINO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '71452507', NULL, '979148338', NULL, 'PRIVADA', 'INGENIERÍA', 'Clínica Medica Cayetano Heredia', NULL, NULL),
(315, 'LUIS HEINRICH', NULL, NULL, 'luishpb555@gmail.com', NULL, NULL, 0, NULL, NULL, 'POMA BARRUETA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '43718966', NULL, '986632006', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Kenko salud sa', NULL, NULL),
(316, 'JIM JAIRO', NULL, NULL, 'elianarchch@hotnail.com', NULL, NULL, 0, NULL, NULL, 'MEZA MELQUIADES', 'PERÚ', 'LA LIBERTAD', NULL, '1', '71466363', NULL, '965719887', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Belem de Trujillo', NULL, NULL),
(317, 'ANGELA MARCELA', NULL, NULL, 'marcelavillanuevadelbusto@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLANUEVA DEL BUSTO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72760387', NULL, '987758961', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Centro Nacional de Telemedicina Essalud ', NULL, NULL),
(318, 'WILLIAM MARTIN', NULL, NULL, 'eros_798@outlook.com', NULL, NULL, 0, NULL, NULL, 'RONCEROS RAMOS', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '70444210', NULL, '961905078', NULL, 'AMBOS', 'LIC. ENFERMERÍA', 'Hospital Guillermo Kaelin de la fuente ', NULL, NULL),
(319, 'NERSYS ESTEFANI', NULL, NULL, 'nersysfe@gmail.com', NULL, NULL, 0, NULL, NULL, 'FRANCO ECHEVARRIA', 'PERÚ', 'AYACUCHO', NULL, '1', '42467032', NULL, '944470228', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Centro médico paz y bien ', NULL, NULL),
(320, 'NADIA YESSENIA', NULL, NULL, 'nadia.yessenia@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ZAPATEL RAMIREZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46058835', NULL, '955942561', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Proyecto Especial Legado - PCM', NULL, NULL),
(321, 'MARÍA TERESA', NULL, NULL, 'm.t.p.r451@gmail.com', NULL, NULL, 0, NULL, NULL, 'PERDOMO REBAZA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '72526738', NULL, '999946107', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'PS MILAGRO DE JESÚS ', NULL, NULL),
(322, 'EVA JULIA', NULL, NULL, 'evajra01@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS APAZA', 'PERÚ', 'TACNA', NULL, '1', '41428677', NULL, '971534808', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud la esperanza ', NULL, NULL),
(323, 'FIORELLA LUISA', NULL, NULL, 'fiorelita18bb@gmail.com', NULL, NULL, 0, NULL, NULL, 'BOHORQUEZ BARBA', 'PERÚ', 'TACNA', NULL, '1', '44176573', NULL, '977956610', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'RED DE SALUD TACNA ', NULL, NULL),
(324, 'John Edward Medina Camelo', NULL, NULL, 'edward.medina@axessnet.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'LIMA REGIÓN', NULL, '2', '001619634', NULL, '973745540', NULL, 'PRIVADA', 'INGENIERÍA', 'Axess Perú SAC', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(325, 'YENNY ELIZABETH', NULL, NULL, 'yenely82@gmail.com', NULL, NULL, 0, NULL, NULL, 'COARITA HUANCA', 'PERÚ', 'TACNA', NULL, '1', '41354483', NULL, '922523462', NULL, 'AMBOS', 'OTRA', 'Centro de salud Leguia ', NULL, NULL),
(326, 'GARY CRISTIAN', NULL, NULL, 'gchuacasix95@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUACASI MAMANI', 'PERÚ', 'TACNA', NULL, '1', '76370066', NULL, '925979118', NULL, 'PÚBLICA', 'OTRA', 'P. S. Los palos', NULL, NULL),
(327, 'ANTHONY LUIS', NULL, NULL, 'AGUIOPS@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'GUIOP SANTILLAN', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '45742057', NULL, '993457489', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HEVES', NULL, NULL),
(328, 'BOOZ OBED', NULL, NULL, 'booz_4124@outlook.com', NULL, NULL, 0, NULL, NULL, 'CHOQUE APAZA', 'PERÚ', 'TACNA', NULL, '1', '41913092', NULL, '952291844', NULL, 'PÚBLICA', 'OTRA', 'Essalud', NULL, NULL),
(329, 'SONIA GABRIELA', NULL, NULL, 'soniaapaza08@gmail.com', NULL, NULL, 0, NULL, NULL, 'APAZA RAMOS', 'PERÚ', 'LORETO', NULL, '1', '47286723', NULL, '985297306', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Hospital Santa Gema de Yurimaguas', NULL, NULL),
(330, 'XIMENA ROCIO', NULL, NULL, 'ximenarojasvaldivia@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS VALDIVIA', 'PERÚ', 'TACNA', NULL, '1', '29590582', NULL, '992554833', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud Metropolitano ', NULL, NULL),
(331, 'PAOLA RUTH', NULL, NULL, 'Paoladelcarpiomedina@gmail.com', NULL, NULL, 0, NULL, NULL, 'DEL CARPIO MEDINA', 'PERÚ', 'TACNA', NULL, '1', '41667724', NULL, '952621462', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'PUESTO SALUD JESUS MARIA', NULL, NULL),
(332, 'LUIS FERNANDO', NULL, NULL, 'luis.gonzalesn@usil.pe', NULL, NULL, 0, NULL, NULL, 'GONZALES NUÑEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '70304829', NULL, '987245569', NULL, 'PRIVADA', 'NUTRICIONISTA', 'USIL', NULL, NULL),
(333, 'ALFONSO HERVER', NULL, NULL, 'aerazo@susalud.gob.pe', NULL, NULL, 0, NULL, NULL, 'ERAZO PAZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '80126587', NULL, '988536680', NULL, 'PÚBLICA', 'INGENIERÍA', 'SUSALUD', NULL, NULL),
(334, 'AIDA ROSANA', NULL, NULL, 'arhuamaniv@susalud.gob.pe', NULL, NULL, 0, NULL, NULL, 'HUAMANI VILLAGOMEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42077263', NULL, '956676537', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'SUPERINTENDENCIA NACIONAL DE SALUD', NULL, NULL),
(335, 'GLORIA JUANA', NULL, NULL, 'gchacond18@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHACON DIAZ', 'PERÚ', 'TACNA', NULL, '1', '00401905', NULL, '952395387', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'MINSA C.S. METROPOLITANO ', NULL, NULL),
(336, 'JESUS JAVIER', NULL, NULL, 'jjzr05@gmail.com', NULL, NULL, 0, NULL, NULL, 'ZEVALLOS RIVERA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '70267169', NULL, '971180832', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'RIS CHILCA MALA', NULL, NULL),
(337, 'MILAGROS DEL PILAR', NULL, NULL, 'milosha.b@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHACON BULNES', 'PERÚ', 'ANCASH', NULL, '1', '44659019', NULL, '920143402', NULL, 'AMBOS', 'OTRA', 'Fisionorte', NULL, NULL),
(338, 'MARIA ANGELICA', NULL, NULL, 'mariaangelicagallegosj@gmail.com', NULL, NULL, 0, NULL, NULL, 'GALLEGOS JAIME', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '45474617', NULL, '925401685', NULL, 'PRIVADA', 'OTRA', 'SEPI SAC', NULL, NULL),
(339, 'CHRISTIAN', NULL, NULL, 'christiansoriano92@gmail.com', NULL, NULL, 0, NULL, NULL, 'SORIANO SALVADOR', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '47161271', NULL, '980511751', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Instituto Nacional de Rehabilitación ', NULL, NULL),
(340, 'EUGENIO EDUARDO', NULL, NULL, 'eanton@midagri.gob.pe', NULL, NULL, 0, NULL, NULL, 'ANTON COVEÑAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '25743368', NULL, '952698264', NULL, 'PÚBLICA', 'INGENIERÍA', 'Ministerio de desarrollo agrario y riego', NULL, NULL),
(341, 'MARILU', NULL, NULL, 'maluam1806@gmail.com', NULL, NULL, 0, NULL, NULL, 'ACABANA MAMANI', 'PERÚ', 'AREQUIPA', NULL, '1', '29632295', NULL, '954425973', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'MARISCAL CASTILLA', NULL, NULL),
(342, 'YULIANA EMPERATRIZ', NULL, NULL, 'mayumi560@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SALVADOR ARIAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42458461', NULL, '952054053', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL HUACHO ', NULL, NULL),
(343, 'VICTOR MANUEL', NULL, NULL, 'drvicman@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS POLO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '15728894', NULL, '956626698', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital General de Huacho ', NULL, NULL),
(344, 'MARIELA PAOLA', NULL, NULL, 'mariela_bazalar@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BAZALAR ROQUE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40394731', NULL, '924106210', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional de HUACHO ', NULL, NULL),
(345, 'ANTHONY PAUL', NULL, NULL, 'anthonybautistapariona@gmail.com', NULL, NULL, 0, NULL, NULL, 'BAUTISTA PARIONA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '71395270', NULL, '936302584', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Cayetano Heredia', NULL, NULL),
(346, 'LEYLA LUMIERE', NULL, NULL, 'alegreleyla@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ALEGRE PANDURO', 'PERÚ', 'LA LIBERTAD', NULL, '1', '70689165', NULL, '970005927', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro De Salud Materno Infantil El Bosque', NULL, NULL),
(347, 'LADY VICTORINA', NULL, NULL, 'garciafloreslady4@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARCIA FLORES', 'PERÚ', 'UCAYALI', NULL, '1', '73112196', NULL, '936375839', NULL, 'PÚBLICA', 'INGENIERÍA', 'DIRESA UCAYALI', NULL, NULL),
(348, 'LUIS ANTONIO', NULL, NULL, 'luisentomologo@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ DAVILA', 'PERÚ', 'UCAYALI', NULL, '1', '17937170', NULL, '961546675', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'IPRESS NUEVO PARAISO - DIRESA UCAYALI', NULL, NULL),
(349, 'JUDITH MIRTHA', NULL, NULL, 'jmyv03292@gmai.com', NULL, NULL, 0, NULL, NULL, 'YCOCHEA VALDEZ', 'PERÚ', 'UCAYALI', NULL, '1', '09739518', NULL, '994456896', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'IPRESS NUEVO PARAISO - DIRESA UCAYALI', NULL, NULL),
(350, 'GIULLIANA MILAGROS', NULL, NULL, 'giulliana_cap@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CAUNA PARIA', 'PERÚ', 'TACNA', NULL, '1', '41431876', NULL, '973604841', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'P.S.INTIORKO', NULL, NULL),
(351, 'JULIA RAQUEL', NULL, NULL, 'jmartinezh16@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MARTINEZ HUAMAN', 'PERÚ', 'UCAYALI', NULL, '1', '09429863', NULL, '961612389', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'IPRESS NUEVO PARAISO - DIRESA UCAYALI', NULL, NULL),
(352, 'HUMBERTO', NULL, NULL, 'hucarsor@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARDENAS SORIA', 'PERÚ', 'UCAYALI', NULL, '1', '00013333', NULL, '947679507', NULL, 'PÚBLICA', 'OTRA', 'IPRESS NUEVO PARAISO - DIRESA UCAYALI', NULL, NULL),
(353, 'RICHARD MARTIN', NULL, NULL, 'marescb.rlopez@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ PEÑA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '08681798', NULL, '991613452', NULL, 'PRIVADA', 'INGENIERÍA', 'Mares consulting business sac', NULL, NULL),
(354, 'GADI HAVILA', NULL, NULL, 'gadihpb@gmail.com', NULL, NULL, 0, NULL, NULL, 'PINTO BACILIO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41976880', NULL, '987828842', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Instituto Nacional de Oftalmología ', NULL, NULL),
(355, 'ROSELHY JULIANA', NULL, NULL, 'roselhyjuliana.ql@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE LIZARBE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46666194', NULL, '974214049', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'SUSALUD', NULL, NULL),
(356, 'JOSE ANTONIO', NULL, NULL, 'jass_eco@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SAMAME SAAVEDRA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '42117888', NULL, '943639866', NULL, 'PRIVADA', 'ECONOMISTA', 'AIPERU CONSULTORES ', NULL, NULL),
(357, 'BIANCA SHARON', NULL, NULL, 'Biancaaceroromero@gmail.com', NULL, NULL, 0, NULL, NULL, 'ACERO ROMERO', 'PERÚ', 'TACNA', NULL, '1', '47446341', NULL, '994735074', NULL, 'PÚBLICA', 'OTRA', 'Ministerio de la Salud', NULL, NULL),
(358, 'VICTOR', NULL, NULL, 'p.slm@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE HUILLCAMASCCO', 'PERÚ', 'UCAYALI', NULL, '1', '47294074', NULL, '962157084', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'DIRESA UCAYALI', NULL, NULL),
(359, 'MILAGROS DEL PILAR', NULL, NULL, 'orehuertabrisa@gmail.com', NULL, NULL, 0, NULL, NULL, 'ORE HUERTA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42134045', NULL, '931706782', NULL, 'PRIVADA', 'OTRA', 'Farmacia rosfarma ', NULL, NULL),
(360, 'ZAIDA ELIZABETH', NULL, NULL, 'zaivilla987@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VILLA CLEMENTE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08432952', NULL, '995257191', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'SUSALUD ', NULL, NULL),
(361, 'TANIA MARIVEL', NULL, NULL, 'candyjoal10@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASO LUCAS', 'PERÚ', 'UCAYALI', NULL, '1', '41627636', NULL, '995594256', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'DIRESA UCAYALI', NULL, NULL),
(362, 'ALVARO JESUS', NULL, NULL, 'cije89@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUTIERREZ ROSA', 'PERÚ', 'CUSCO', NULL, '1', '44171651', NULL, '932837578', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Ejército del Perú', NULL, NULL),
(363, 'ELSA KARINA', NULL, NULL, 'dulcemiakaryto@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAURI ESTEBAN', 'PERÚ', 'CALLAO', NULL, '1', '44427971', NULL, '972252284', NULL, 'PRIVADA', 'TÉCNICO EN ENFERMERÍA', 'clinica internacional', NULL, NULL),
(364, 'BRENDA MELISSA', NULL, NULL, 'brenda.bejarano02@gmail.com', NULL, NULL, 0, NULL, NULL, 'BEJARANO GOMEZ', 'PERÚ', 'AREQUIPA', NULL, '1', '70318153', NULL, '900633496', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de Salud Cotahuasi ', NULL, NULL),
(365, 'YONATHAN JHAMMERS', NULL, NULL, 'yojham88@gmail.com', NULL, NULL, 0, NULL, NULL, 'DÍAZ ZAPATA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '44846142', NULL, '938198579', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'giz', NULL, NULL),
(366, 'CECILIA ELIZABETH', NULL, NULL, 'Cece_tauro@hotmail.com.pe', NULL, NULL, 0, NULL, NULL, 'REYES ALFARO', 'PERÚ', 'LA LIBERTAD', NULL, '1', '41850487', NULL, '968223063', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HRDT', NULL, NULL),
(367, 'EDWAR PEDRO', NULL, NULL, 'pedrusmp18@gmail.com', NULL, NULL, 0, NULL, NULL, 'PACO BERNAOLA', 'PERÚ', 'CALLAO', NULL, '1', '42898413', NULL, '992841675', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diresa callao', NULL, NULL),
(368, 'JANETH ROCIO', NULL, NULL, 'rocio2710v@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLAR CABANA', 'PERÚ', 'TACNA', NULL, '1', '44143876', NULL, '967735466', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'RED DE SALUD TACNA', NULL, NULL),
(369, 'CARLOS', NULL, NULL, 'cjesus@provisionestecnologicas.pe', NULL, NULL, 0, NULL, NULL, 'JESUS HUAYNATES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40500612', NULL, '989405746', NULL, 'PRIVADA', 'INGENIERÍA', 'Provisiones Tecnológicas ', NULL, NULL),
(370, 'CECILIA MAGALI', NULL, NULL, 'leo790817@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALAYO CANALES', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '40237547', NULL, '976334473', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Universidad Nacional Federico Villarreal', NULL, NULL),
(371, 'DANNIA GABRIELA', NULL, NULL, 'gaby061135@gmail.com', NULL, NULL, 0, NULL, NULL, 'CABALLERO GOMEZ', 'PERÚ', 'APURÍMAC', NULL, '1', '46809056', NULL, '950170870', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S Pacucha', NULL, NULL),
(372, 'JULIA DE LOS ANGELES', NULL, NULL, 'Juliadelosangelestelloruiz2021@gmail.com', NULL, NULL, 0, NULL, NULL, 'TELLO RUIZ', 'PERÚ', 'UCAYALI', NULL, '1', '75531358', NULL, '925066672', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Oriental Tv', NULL, NULL),
(373, 'MARLIT', NULL, NULL, 'rivasplatamarlit472@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVASPLATA MAICELO', 'PERÚ', 'PIURA', NULL, '1', '03370514', NULL, '949606741', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Subregión de Salud Morropón Huancabambaa', NULL, NULL),
(374, 'CARLOS LUIGGI', NULL, NULL, 'luiggi00fg@gmail.com', NULL, NULL, 0, NULL, NULL, 'FALCON GONZALES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42336883', NULL, '994977379', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Hospital San Juan de Lurigancho ', NULL, NULL),
(375, 'BRENDA AURORA DOLORES', NULL, NULL, 'omg-aura@outlook.com', NULL, NULL, 0, NULL, NULL, 'TAFUR HOYOS', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '71415022', NULL, '945115106', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL REGIONAL DE LAMBAYEQUE', NULL, NULL),
(376, 'HAYDEE JANET', NULL, NULL, 'milojimenez73@gmail.com', NULL, NULL, 0, NULL, NULL, 'JIMENEZ MAYS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08153639', NULL, '996502483', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'INMP', NULL, NULL),
(377, 'ALBINO ROGGER', NULL, NULL, 'roggeryanac@gmail.com', NULL, NULL, 0, NULL, NULL, 'YANAC SALCEDO', 'PERÚ', 'LA LIBERTAD', NULL, '1', '42345288', NULL, '999156377', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'CQFLL', NULL, NULL),
(378, 'ROSITA', NULL, NULL, '28rosita@gmail.com', NULL, NULL, 0, NULL, NULL, 'IZQUIERDO GUTIERREZ', 'PERÚ', 'SAN MARTÍN', NULL, '1', '40669426', NULL, '942610685', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'HOSPITAL II E BELLAVISTA ', NULL, NULL),
(379, 'BRAULIO', NULL, NULL, 'BSANCHEZ@GILATLA.COM', NULL, NULL, 0, NULL, NULL, 'SANCHEZ LLERENA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '09314986', NULL, '997500764', NULL, 'PRIVADA', 'INGENIERÍA', 'GILAT NETWORKS PERU S.A.', NULL, NULL),
(380, 'CARLA KARINA', NULL, NULL, 'Carlak.sant77@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANTIAGO VELASQUEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44608228', NULL, '958987190', NULL, 'AMBOS', 'LIC. ENFERMERÍA', 'UNIVERSIDAD NACIONAL FEDERICO VILLARREAL ', NULL, NULL),
(381, 'FREDY ALEXANDER', NULL, NULL, 'fmanosalva@gamel.com.pe', NULL, NULL, 0, NULL, NULL, 'MANOSALVA CASTRO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10621832', NULL, '990350744', NULL, 'PRIVADA', 'OTRA', 'GAMEL SRL', NULL, NULL),
(382, 'ISRAEL IVAN', NULL, NULL, 'iarroyo@unitru.edu.pe', NULL, NULL, 0, NULL, NULL, 'ARROYO NINA', 'PERÚ', 'LA LIBERTAD', NULL, '1', '44256582', NULL, '992028646', NULL, 'PRIVADA', 'INGENIERÍA', 'Clinica Peruana Americana', NULL, NULL),
(383, 'PAVEL RICARDO', NULL, NULL, 'pmerlinc@gmail.com', NULL, NULL, 0, NULL, NULL, 'MERLIN CONTRERAS', 'PERÚ', 'CALLAO', NULL, '1', '46645619', NULL, '998997480', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL SAN JOSÉ ', NULL, NULL),
(384, 'EVELYN STEPHANIA', NULL, NULL, 'evelyn.silva.willis@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SILVA WILLISS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '47422723', NULL, '987381946', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Dirección de redes integradas lima centro', NULL, NULL),
(385, 'JEHOSHUA RAFAEL MICHELANGELO', NULL, NULL, 'lopezlop@outlook.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ LOPEZ', 'PERÚ', 'LORETO', NULL, '1', '05394839', NULL, '949542444', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Seguro Social de Salud', NULL, NULL),
(386, 'MARIANELLA YEHULA', NULL, NULL, 'yehulay@hotmail.com', NULL, NULL, 0, NULL, NULL, 'YEPEZ VASQUEZ', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '23893824', NULL, '999913026', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Centro médico Huampaní ', NULL, NULL),
(387, 'CELMIRA YADIRA', NULL, NULL, 'azul105_9@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LAZARO LOYOLA', 'PERÚ', 'ANCASH', NULL, '1', '42042034', NULL, '927882603', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Red de salud pacifico norte', NULL, NULL),
(388, 'JOICE UNIX', NULL, NULL, 'joiseunix4@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVAS PACHECO', 'PERÚ', 'JUNÍN', NULL, '1', '76261592', NULL, '941632813', NULL, 'PÚBLICA', 'OTRA', 'Carlos Alberto Seguin Escobedo ', NULL, NULL),
(389, 'ARTURO SHEN', NULL, NULL, 'Acuba@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'CUBA TOLEDO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45119024', NULL, '987073822', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Minsa', NULL, NULL),
(390, 'LUIS JONATHAN', NULL, NULL, 'L.ESTRADA.MD@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'ESTRADA FLORES', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43982366', NULL, '942061283', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIGTEL - INFOSALUD ', NULL, NULL),
(391, 'PILAR', NULL, NULL, 'pivive2015@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLACORTA VELÁSQUEZ', 'PERÚ', 'SAN MARTÍN', NULL, '1', '18131522', NULL, '951507372', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'OGESS BAJO MAYO', NULL, NULL),
(392, 'PILAR ROSSANA', NULL, NULL, 'rossana.rivas@upch.pe', NULL, NULL, 0, NULL, NULL, 'RIVAS TARAZONA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '25628175', NULL, '995657587', NULL, 'PRIVADA', 'INGENIERÍA', 'Univ. Peruana Cayetano Heredia', NULL, NULL),
(393, 'EDUARDO SMITH', NULL, NULL, 'Javierlecca19kindle@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUZMAN MARIÑOS', 'PERÚ', 'LA LIBERTAD', NULL, '1', '46953176', NULL, '932294054', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Innovación LEES', NULL, NULL),
(394, 'CINDY', NULL, NULL, 'cndasch@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARIAS SCHREIBER LAZO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40902745', NULL, '949566954', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Expertta Salus', NULL, NULL),
(395, 'CARLOS', NULL, NULL, 'cnestaress@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'NESTARES SILVA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41558737', NULL, '992074260', NULL, 'PÚBLICA', 'TÉCNICO EN INGENIERÍA', 'FACULTAD DE MEDICINA - UNMSM', NULL, NULL),
(396, 'YTALO ERICK', NULL, NULL, 'ytalolino2012@gmail.com', NULL, NULL, 0, NULL, NULL, 'LINO GONZALEZ', 'PERÚ', 'LA LIBERTAD', NULL, '1', '17919048', NULL, '949603371', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Belén de Trujillo ', NULL, NULL),
(397, 'CENDER UDAI', NULL, NULL, 'cender.quispe@upch.pe', NULL, NULL, 0, NULL, NULL, 'QUISPE JULI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72451423', NULL, '950853190', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'INO', NULL, NULL),
(398, 'JUAN ALBERTO', NULL, NULL, 'Jacs2003@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAMPOS SILVA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '43132504', NULL, '968993500', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional HIPOLITO Unanue ', NULL, NULL),
(399, 'YOE HERBERT', NULL, NULL, 'yoearroyo@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARROYO PEÑA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43582249', NULL, '950270932', NULL, 'PRIVADA', 'INGENIERÍA', 'Grupo Vital', NULL, NULL),
(400, 'JUAN CARLOS', NULL, NULL, 'juan_pc7@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PAITAN CAJACURI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43536505', NULL, '993650810', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Fissal. Clínica internacional ', NULL, NULL),
(401, 'CESAR ADRIAN', NULL, NULL, 'instalacioneslees.ti@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALLADARES GAGO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '74648938', NULL, '957153149', NULL, 'PRIVADA', 'INGENIERÍA', 'Innovación lees ', NULL, NULL),
(402, 'JORGE ALBERTO', NULL, NULL, 'Jpuntriano@plopstudio.com', NULL, NULL, 0, NULL, NULL, 'PUNTRIANO DURAN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09384834', NULL, '946574129', NULL, 'PRIVADA', 'OTRA', 'Plop Studio', NULL, NULL),
(403, 'CESAR SILVANO', NULL, NULL, 'recuperacionescrediticias@gmail.com', NULL, NULL, 0, NULL, NULL, 'LAZO GONZALES', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '07161548', NULL, '992018317', NULL, 'PRIVADA', 'OTRA', 'CIAM', NULL, NULL),
(404, 'JESUS ALEXANDER', NULL, NULL, 'jcoz13198@gmail.com', NULL, NULL, 0, NULL, NULL, 'COZ CALUMANI', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '70272665', NULL, '994345776', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'OSH Consulting ', NULL, NULL),
(405, 'ALINA', NULL, NULL, 'alina.torres310@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORRES MATEO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '46695455', NULL, '991581666', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Arzobispo Loayza ', NULL, NULL),
(406, 'ROSMERY LISETTE', NULL, NULL, 'Rosmery1189@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARDENAS PALOMINO', 'PERÚ', 'ICA', NULL, '1', '45813524', NULL, '961669501', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Puesto salud Bambamarca ', NULL, NULL),
(407, 'DIANA ARACELY', NULL, NULL, 'diana.rsandoval@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RAMIREZ SANDOVAL', 'PERÚ', 'LA LIBERTAD', NULL, '1', '70468350', NULL, '980088852', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Innovación LEES', NULL, NULL),
(408, 'RAUL HIPOLITO', NULL, NULL, 'raul.pen23@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEÑA RAMOS', 'PERÚ', 'CALLAO', NULL, '1', '45837976', NULL, '949813917', NULL, 'PÚBLICA', 'INGENIERÍA', 'MARINA DE GUERRA DEL PERU', NULL, NULL),
(409, 'THANERY ZARINA', NULL, NULL, 'jassmin9@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHIRI ZEGARRA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46822319', NULL, '987180153', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Peval Group ', NULL, NULL),
(410, 'ANGELA CECILIA', NULL, NULL, 'angelacarpio@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARPIO CARBAJO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '44434269', NULL, '963156202', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'Infosalud ', NULL, NULL),
(411, 'ANA CARMELA', NULL, NULL, 'anacarmelav@gmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ QUISPE GONZALES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07538227', NULL, '999363698', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'GIZ', NULL, NULL),
(412, 'LIZBETH JACKELIN', NULL, NULL, 'belizmey41@gmail.com', NULL, NULL, 0, NULL, NULL, 'BELLIDO ZARATE', 'PERÚ', 'AREQUIPA', NULL, '1', '70174477', NULL, '914209496', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.S. Cotahuasi', NULL, NULL),
(413, 'GEISSEN LEOPOLDO', NULL, NULL, 'Doctorgeissen@gmail.com', NULL, NULL, 0, NULL, NULL, 'LUNA ORDOÑEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42515494', NULL, '987136312', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Cenate ', NULL, NULL),
(414, 'REYNALDO REYNOSO PAZ', NULL, NULL, 'rreynoso@c-b.com.pe', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'LIMA REGIÓN', NULL, '1', '28422946', NULL, '980050623', NULL, 'PRIVADA', 'INGENIERÍA', 'grupovital', NULL, NULL),
(415, 'LINDA', NULL, NULL, 'lnavarro0206@gmail.com', NULL, NULL, 0, NULL, NULL, 'NAVARRO SOLSOL', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40916654', NULL, '915075330', NULL, 'PRIVADA', 'INGENIERÍA', 'JCB Tech ', NULL, NULL),
(416, 'JOHANN ADRIAN', NULL, NULL, 'johannalfaros@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALFARO SOTOMAYOR', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '71246420', NULL, '969183133', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HNERM', NULL, NULL),
(417, 'NADIA GABRIELA', NULL, NULL, 'nadiaxpc@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEÑA CORDERO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '46296589', NULL, '986818484', NULL, 'PÚBLICA', 'OTRA', 'CSMC', NULL, NULL),
(418, 'FERNANDA FRANCIA', NULL, NULL, 'qfernandafrancia1924@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE TTITO', 'PERÚ', 'CUSCO', NULL, '1', '75168739', NULL, '969112634', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Unsaac ', NULL, NULL),
(419, 'GIOVE EDUARDO', NULL, NULL, 'Giovedu@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALCALDE CASTAÑEDA', 'PERÚ', 'CAJAMARCA', NULL, '1', '46410797', NULL, '992206429', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'PCRIS', NULL, NULL),
(420, 'MARIELENA', NULL, NULL, 'marhyt@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GUTIERREZ LUYO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '41740326', NULL, '975539541', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Rebagliati ', NULL, NULL),
(421, 'RICHARD ALEXANDER', NULL, NULL, 'rialrovi1@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROBLES VIERA', 'PERÚ', 'SAN MARTÍN', NULL, '1', '48231749', NULL, '957804826', NULL, 'PÚBLICA', 'OTRA', 'MINSA', NULL, NULL),
(422, 'CARLOS ANDRES', NULL, NULL, 'candres.carrascof@gmail.com', NULL, NULL, 0, NULL, NULL, 'CARRASCO FARFAN', 'PERÚ', 'ICA', NULL, '1', '71519824', NULL, '969409456', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'MQ Medic', NULL, NULL),
(423, 'GLADYS BERTA', NULL, NULL, 'gcruzatti@gmail.com', NULL, NULL, 0, NULL, NULL, 'CRUZATTI BAQUERIZO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07743979', NULL, '948482174', NULL, 'PRIVADA', 'INGENIERÍA', 'C&M Consulting SRL', NULL, NULL),
(424, 'MARIA DE LOS ANGELES', NULL, NULL, 'Mnavarrosevilla288@gmail.com', NULL, NULL, 0, NULL, NULL, 'NAVARRO SEVILLA', 'PERÚ', 'LA LIBERTAD', NULL, '1', '73901816', NULL, '918100620', NULL, 'PRIVADA', 'OTRA', 'UPC ', NULL, NULL),
(425, 'LOURDES', NULL, NULL, 'lougueca@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUERRA CABRERA', 'PERÚ', 'PUNO', NULL, '1', '29266587', NULL, '951650830', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA PUO', NULL, NULL),
(426, 'YOHANA MARIA', NULL, NULL, 'Jhuaripataaltuna@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUARIPATA ALTUNA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '70905740', NULL, '943575846', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Instituto Nacional de Enfermedades Neoplasicas', NULL, NULL),
(427, 'YUDY CLEY', NULL, NULL, 'Yudycley@gmail.com', NULL, NULL, 0, NULL, NULL, 'CONDOR ROJAS', 'PERÚ', 'OTRO', NULL, '1', '09685821', NULL, '980475483', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CDC', NULL, NULL),
(428, 'XENIA YSABEL', NULL, NULL, 'Xsanchez.th@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ TIRADO HUATAY', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '42162394', NULL, '958923763', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Auna', NULL, NULL),
(429, 'LIDIA SALOME', NULL, NULL, 'lidiacarpio48@gmail.com', NULL, NULL, 0, NULL, NULL, 'CARPIO CASTILLO', 'PERÚ', 'TACNA', NULL, '1', '00483053', NULL, '948653367', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Ministerio de salud', NULL, NULL),
(430, 'ANA DEL ROSARIO', NULL, NULL, 'aaanicha@gmail.com', NULL, NULL, 0, NULL, NULL, 'CEDILLO CRISOSTO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '42428921', NULL, '924866862', NULL, 'PÚBLICA', 'OTRA', 'Hospital ', NULL, NULL),
(431, 'OSCAR AUGUSTO', NULL, NULL, 'oscarlk17@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ DE LA CRUZ', 'PERÚ', 'CALLAO', NULL, '1', '08135006', NULL, '913835322', NULL, 'PÚBLICA', 'OTRA', 'Marina de Guerra del Perú', NULL, NULL),
(432, 'MARIA ANGELICA', NULL, NULL, 'joanlevisalfaro@gmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ ESPINOZA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '47527356', NULL, '950270328', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'EsSalud ', NULL, NULL),
(433, 'CHRISTIAN', NULL, NULL, 'cguerreros@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'GUERRERO SOTO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43698930', NULL, '938519504', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'MINISTERIO DE SALUD - DIRECCION GENERAL DE OPERACIONES EN SALUD', NULL, NULL),
(434, 'VERONICA HAYDEE', NULL, NULL, 'cancer14770@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ALMERCO ANTICONA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '25575842', NULL, '990395286', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Marina de Guerra del Perú', NULL, NULL),
(435, 'LUIS MIGUEL', NULL, NULL, 'monter25@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MONTERO MONTEZA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '45611107', NULL, '993492276', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S BETHANIA', NULL, NULL),
(436, 'ANGELA PAOLA', NULL, NULL, 'angy.infantes@gmail.com', NULL, NULL, 0, NULL, NULL, 'INFANTES MENDOZA', 'PERÚ', 'ANCASH', NULL, '1', '43220572', NULL, '945107624', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'RED DE SALUD HUAYLAS NORTE', NULL, NULL),
(437, 'ADA GABRIELA', NULL, NULL, 'agaf_8@outlook.com', NULL, NULL, 0, NULL, NULL, 'ARREDONDO FRANCIA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '08830865', NULL, '940401830', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'MINSA', NULL, NULL),
(438, 'ROSA LOURDES', NULL, NULL, 'rolivares.robles.01@gmail.com', NULL, NULL, 0, NULL, NULL, 'OLIVARES ROBLES', 'PERÚ', 'SAN MARTÍN', NULL, '1', '41377030', NULL, '945212921', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'HOSPITAL II-2 TARAPOTO ', NULL, NULL),
(439, 'MARIA CELIA', NULL, NULL, 'mariacelia.alejo@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALEJO SEVILLA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42477643', NULL, '959758640', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Clínica de Especialidades Médicas ', NULL, NULL),
(440, 'GIANNINA SARAI', NULL, NULL, 'sarai.chambi17@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHAMBI VILCAPE', 'PERÚ', 'AREQUIPA', NULL, '1', '45395708', NULL, '956289861', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'San pablo', NULL, NULL),
(441, 'JESSICA CARINA', NULL, NULL, 'yessica.contrerasy@gmail.com', NULL, NULL, 0, NULL, NULL, 'CONTRERAS YEREN', 'PERÚ', 'ICA', NULL, '1', '21533771', NULL, '999111385', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'CL Pharma Group & Associates S.A.C.', NULL, NULL),
(442, 'HUMBERTO', NULL, NULL, 'humberto0799@gmail.com', NULL, NULL, 0, NULL, NULL, 'MERINO ARICOCHE', 'PERÚ', 'AMAZONAS', NULL, '1', '72217972', NULL, '952202139', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Mifarma', NULL, NULL),
(443, 'MIRIAM JANET', NULL, NULL, 'yanetsalvadorortega@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALVADOR ORTEGA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72090192', NULL, '959017425', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'INMP ', NULL, NULL),
(444, 'DEISY', NULL, NULL, 'Deysi_5566@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ACUÑA VASQUEZ', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '71448004', NULL, '968531272', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Boticas Perú ', NULL, NULL),
(445, 'NELY', NULL, NULL, 'ngaramendiquispe@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARAMENDI QUISPE', 'PERÚ', 'AYACUCHO', NULL, '1', '73210052', NULL, '900887690', NULL, 'PÚBLICA', 'OTRA', 'RED DE SALUD SAN FRANCISCO', NULL, NULL),
(446, 'KAREN VANESSA', NULL, NULL, 'karenqf09@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORRES COAGUILA', 'PERÚ', 'PUNO', NULL, '1', '46339407', NULL, '989682977', NULL, 'AMBOS', 'QUÍMICO FARMACÉUTICO', 'Universidad andina Néstor Cáceres velasques ', NULL, NULL),
(447, 'YÚLIAN LOMBARDY', NULL, NULL, 'yulianlombardy@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOYOLA FLORES', 'PERÚ', 'ANCASH', NULL, '1', '70308139', NULL, '931923344', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud progreso', NULL, NULL),
(448, 'RUTH ANGELICA', NULL, NULL, 'rth727@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DUEÑAS PERALTA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10756476', NULL, '974350463', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', '-', NULL, NULL),
(449, 'LIZETH MILAGROS', NULL, NULL, 'milagros.smile.94@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESPINO SOSA', 'PERÚ', 'MOQUEGUA', NULL, '1', '72005813', NULL, '936594556', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Cs San Antonio', NULL, NULL),
(450, 'JILMER YVAN', NULL, NULL, 'jitecy_08@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ CIEZA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '10194208', NULL, '999319404', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de salud Jose Leonardo Ortiz', NULL, NULL),
(451, 'PAMELA JULISSA', NULL, NULL, 'julipamelasuclupe2001@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANDOVAL SUCLUPE', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '75554294', NULL, '953014991', NULL, 'PÚBLICA', 'OTRA', 'Hospital Belén', NULL, NULL),
(452, 'BLANCA LUZ', NULL, NULL, 'lucecita230206@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PAZ CHISCUL', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16749442', NULL, '945586738', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'MINSA', NULL, NULL),
(453, 'JACKELINE ROSARIO', NULL, NULL, 'rous20_19@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE QUISPE', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '43806952', NULL, '944927149', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'C. M. I buenos aires de villa', NULL, NULL),
(454, 'ELVIRA', NULL, NULL, 'elviminey@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANTOS GUERRERO', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '43536026', NULL, '986476004', NULL, 'PRIVADA', 'OTRA', 'No hay nombre', NULL, NULL),
(455, 'FLOR DE MARIA DOLORES', NULL, NULL, 'fuentesflorm@gmail.com', NULL, NULL, 0, NULL, NULL, 'FUENTES PAREDES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '08310731', NULL, '999775106', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Instituto Nacional de Salud ', NULL, NULL),
(456, 'NICOLASA', NULL, NULL, 'nicomuro25@gmail.com', NULL, NULL, 0, NULL, NULL, 'MURO FLORES DE GONZALES', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16628313', NULL, '961699563', NULL, 'PÚBLICA', 'OTRA', 'MINSA', NULL, NULL),
(457, 'NANCY EDITH', NULL, NULL, 'nancy.chacon@yahoo.com', NULL, NULL, 0, NULL, NULL, 'CHACON GONZALES', 'PERÚ', 'ANCASH', NULL, '1', '07244939', NULL, '981290399', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'PHARMA SENSUM SAC', NULL, NULL),
(458, 'CARMEN CONSUELO', NULL, NULL, 'capelu16@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ LUJAN', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '40833795', NULL, '984540746', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Boticas Issafarma ', NULL, NULL),
(459, 'JANETT MILAGROS', NULL, NULL, 'jroblesconde@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROBLES CONDE', 'PERÚ', 'OTRO', NULL, '1', '10813263', NULL, '958421068', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'DROGUERIA', NULL, NULL),
(460, 'EDESMIT', NULL, NULL, 'edesmit_mostacero@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MOSTACERO LEON', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16565062', NULL, '987593610', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'CENTRO SALUD OYOTÚN ', NULL, NULL),
(461, 'HUGO EUSEBIO', NULL, NULL, 'nepocenoparedeshugo@gmail.com', NULL, NULL, 0, NULL, NULL, 'NEPONUCENO PAREDES', 'PERÚ', 'ANCASH', NULL, '1', '41165853', NULL, '976459958', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'HOSPITAL DE APOYO YUNGAY', NULL, NULL),
(462, 'MILAGROS', NULL, NULL, 'Milaf4@hotmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES BULLON', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10132825', NULL, '953955150', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Hospital', NULL, NULL),
(463, 'JAIME ADOLFO', NULL, NULL, 'castrosanchezjaime@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASTRO SANCHEZ', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '75847893', NULL, '943804363', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'CIUDAD ETEN', NULL, NULL),
(464, 'Fabiola  Lugo  Campos', NULL, NULL, 'Fabiola.lugo@axessnet.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'LIMA REGIÓN', NULL, '2', '002168868', NULL, '945426985', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Axess networks ', NULL, NULL),
(465, 'CRISLEY  KARMINIA ALFARO  VASQUEZ', NULL, NULL, 'karminiaalfaro22@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'BOLIVIA', 'LIMA REGIÓN', NULL, '1', '37194370', NULL, '973087201', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'AGEMED', NULL, NULL),
(466, 'LILIAN ROSA', NULL, NULL, 'lruc3008@gmail.com', NULL, NULL, 0, NULL, NULL, 'CARRANZA ULLOA', 'PERÚ', 'ANCASH', NULL, '1', '73337059', NULL, '939642397', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Policlínico ', NULL, NULL),
(467, 'FABIOLA GINA', NULL, NULL, 'fabiolagdac@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARCÍA DACCARETT', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10802072', NULL, '998866558', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'INFOSALUD - MINSA', NULL, NULL),
(468, 'RUTH YAHIRA', NULL, NULL, 'emiruyahiamoy@gmail.com', NULL, NULL, 0, NULL, NULL, 'VELASQUEZ TORRES', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '47673436', NULL, '939331150', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Centro médico militar Divino Niño del Milagro de Eten', NULL, NULL),
(469, 'JUAN DE DIOS', NULL, NULL, 'docjrojas@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS LA TORRE', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '08873560', NULL, '999633700', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de Emergencia Ate Vitarte', NULL, NULL),
(470, 'ELIOT JOSIAS', NULL, NULL, 'eliotmartinez.aa@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARTINEZ ACUÑA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '49005375', NULL, '957272596', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'UPCH ', NULL, NULL),
(471, 'DIANA', NULL, NULL, 'wasitA_15@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MEDINA CASTRO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '44322319', NULL, '924398279', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Hospital de Emergencia Ate Vitarte', NULL, NULL),
(472, 'WILFREDO', NULL, NULL, 'wilcarrasco62@gmeil.com', NULL, NULL, 0, NULL, NULL, 'AZAÑERO CARRASCO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '17619594', NULL, '901632490', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital de Emergencia Ate Vitarte', NULL, NULL),
(473, 'ERIKA KAREM', NULL, NULL, 'ekarika84@gmail.com', NULL, NULL, 0, NULL, NULL, 'JAIME GUTARRA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '42333584', NULL, '969668613', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'Hospital de Emergencia Ate Vitarte', NULL, NULL),
(474, 'JEAN CARLOS', NULL, NULL, 'JC23_5_@OUTLOOK.COM', NULL, NULL, 0, NULL, NULL, 'ALVA ESCOBAR', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '44259755', NULL, '968167309', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CENTRO DE SALUD JESUS PODEROSO', NULL, NULL),
(475, 'MARIA ANGELICA', NULL, NULL, 'angela22987@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CASANCA RODAS', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '09821825', NULL, '999031398', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CMI JUAN ABLO II - VES', NULL, NULL),
(476, 'RAQUEL CIRILA', NULL, NULL, 'kelly150477@gmail.com', NULL, NULL, 0, NULL, NULL, 'JERI DE LA CRUZ', 'PERÚ', 'CALLAO', NULL, '1', '25852136', NULL, '927177367', NULL, 'PRIVADA', 'TÉCNICO EN ENFERMERÍA', 'POLICLINICO ENACE', NULL, NULL),
(477, 'ANTHONY', NULL, NULL, 'triganstg@gmail.com', NULL, NULL, 0, NULL, NULL, 'TRIGOSO GRANDEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '70385981', NULL, '942954874', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Doctoc Health', NULL, NULL),
(478, 'ANGELA MARIA', NULL, NULL, 'acabrejos40@gmail.com', NULL, NULL, 0, NULL, NULL, 'CABREJOS DIAZ', 'PERÚ', 'LA LIBERTAD', NULL, '1', '18167915', NULL, '967153793', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'ciabu centro salud ocupacional', NULL, NULL),
(479, 'MIRIA YENY', NULL, NULL, 'yenymiria@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOTO CORONEL', 'PERÚ', 'AREQUIPA', NULL, '1', '30586153', NULL, '940533264', NULL, 'PÚBLICA', 'TÉCNICO EN INGENIERÍA', 'Instituto público Castilla', NULL, NULL),
(480, 'LEONARDO FERNANDO', NULL, NULL, 'leonardoquesadam@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUESADA MAMANI', 'PERÚ', 'CUSCO', NULL, '1', '70795511', NULL, '927146754', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'P.S. Huanoquite ', NULL, NULL),
(481, 'DAISY ALINA', NULL, NULL, 'alinmavila@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAVILA TORRES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42633714', NULL, '950053846', NULL, 'PÚBLICA', 'OTRA', 'MINSA-DIGTEL-INFOSALUD', NULL, NULL),
(482, 'MIGUEL ANGEL', NULL, NULL, 'mangelm_84@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MUÑOZ TELLO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42446374', NULL, '999901886', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Clínica Centenario Peruano Japonesa', NULL, NULL),
(483, 'SUANI ANGELICA', NULL, NULL, 'suaniasg.ss@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOTO GIRON', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40391272', NULL, '995995154', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diris lima centro ', NULL, NULL),
(484, 'DARLITH', NULL, NULL, 'Darlithnoblemacedo57@gmail.com', NULL, NULL, 0, NULL, NULL, 'NOBLE MACEDO', 'PERÚ', 'UCAYALI', NULL, '1', '77794611', NULL, '906398504', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Ashaninka', NULL, NULL),
(485, 'VICTOR RAUL', NULL, NULL, 'vyktorahul@gmail.com', NULL, NULL, 0, NULL, NULL, 'RAMOS REYES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44244053', NULL, '939134385', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRIS LIMA CENTRO', NULL, NULL),
(486, 'NADIA JANET', NULL, NULL, 'naia_37@hotmail.com', NULL, NULL, 0, NULL, NULL, 'AVELINO VILLON', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '48046062', NULL, '997837815', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Arzobispo Loayza', NULL, NULL),
(487, 'YNGRID', NULL, NULL, 'yngrid.bustamante.a@gmail.com', NULL, NULL, 0, NULL, NULL, 'BUSTAMANTE AQUINO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42572242', NULL, '978132188', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'salud', NULL, NULL),
(488, 'ROSARIO ALICIA', NULL, NULL, 'charito_h@hotmail.es', NULL, NULL, 0, NULL, NULL, 'HUAMAN TARAZONA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45155311', NULL, '947242431', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diris Lima Centro', NULL, NULL),
(489, 'KATHERINE LIZETH', NULL, NULL, 'Katy2591@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAJUSOL SIADEN', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '48107243', NULL, '993934323', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CSMC Juan Pardo y Miguel Patapo ', NULL, NULL),
(490, 'ANDRE MARTIN', NULL, NULL, 'a.barahona0792@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARAHONA SIFUENTES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '46656751', NULL, '941387921', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diris lima centro', NULL, NULL),
(491, 'CESIBEL', NULL, NULL, 'cesibel32@gmail.com', NULL, NULL, 0, NULL, NULL, 'TRUJILLO RODRIGUEZ', 'PERÚ', 'CUSCO', NULL, '1', '72420855', NULL, '945755252', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CENTRO DE SALUD CHALLABAMBA', NULL, NULL),
(492, 'EDITH', NULL, NULL, 'Edithchm.24@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHOQUE MEDRANO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '73112144', NULL, '940052043', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CS Unidad Vecinal n 3', NULL, NULL),
(493, 'GISELLA ESTHER', NULL, NULL, 'telesaludhvlh@gmail.com', NULL, NULL, 0, NULL, NULL, 'VARGAS CAJAHUANCA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '08809747', NULL, '998577948', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Víctor Larco Herrera', NULL, NULL),
(494, 'YANALI', NULL, NULL, 'yanali06@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ LOPEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45343524', NULL, '951179806', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Víctor Larco Herrera', NULL, NULL),
(495, 'KARINA ELIANA', NULL, NULL, 'telesaludhvlh@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHAMOLI SULCA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41551826', NULL, '987858854', NULL, 'PÚBLICA', 'INGENIERÍA', 'Hospital Víctor Larco Herrera', NULL, NULL),
(496, 'PABLO', NULL, NULL, 'eyusly@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESCAJADILLO BARRERA', 'PERÚ', 'CALLAO', NULL, '1', '48165926', NULL, '986764609', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Paciente particular', NULL, NULL),
(497, 'JESSICA ALICE', NULL, NULL, 'jessicz06@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASTAÑEDA ZAMBRANO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '47341920', NULL, '996069936', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Cardiomovil', NULL, NULL),
(498, 'MARIO ANDREE', NULL, NULL, 'mariocecmp@gmail.com', NULL, NULL, 0, NULL, NULL, 'CARPIO ELIAS', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '43781408', NULL, '940294542', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diris Lima Este', NULL, NULL),
(499, 'ANTHONY ERNESTO', NULL, NULL, 'anthony_14_159@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LOVERA PELAEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '46138855', NULL, '959126861', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CENTRO SE SALUD MAX ARIAS ', NULL, NULL),
(500, 'JUAN MANUEL', NULL, NULL, 'judithtorresflores@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROMAN DAVILA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '09272637', NULL, '996237686', NULL, 'PÚBLICA', 'OTRA', 'MINSA', NULL, NULL),
(501, 'EDWIN MARTÍN', NULL, NULL, 'emescuaespinoza@gmail.com', NULL, NULL, 0, NULL, NULL, 'MESCUA ESPINOZA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '73073169', NULL, '918511883', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL DE LA SOLIDARIDAD VILLA EL SALVADOR', NULL, NULL),
(502, 'ROSARIO', NULL, NULL, 'rgamarra@unamad.edu.pe', NULL, NULL, 0, NULL, NULL, 'GAMARRA SOTO', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '30855618', NULL, '987250505', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'hospital Santa Rosa', NULL, NULL),
(503, 'MONICA', NULL, NULL, 'monifashe@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAMASCA CORDOVA', 'PERÚ', 'CUSCO', NULL, '1', '42843841', NULL, '951357557', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'PUESTO DE SALUD DE HUAROCONDO', NULL, NULL),
(504, 'SONIA', NULL, NULL, 'soani.nain.02@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAMANI QUISPE', 'PERÚ', 'CUSCO', NULL, '1', '46887568', NULL, '931632250', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional del Cusco', NULL, NULL),
(505, 'EDITH', NULL, NULL, 'edithordonezvasquez@gmail.com', NULL, NULL, 0, NULL, NULL, 'ORDOÑEZ VASQUEZ', 'PERÚ', 'CUSCO', NULL, '1', '42928274', NULL, '974504789', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', '_', NULL, NULL),
(506, 'JEANETTE', NULL, NULL, 'aracely_Jea@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHINO PACUALA', 'PERÚ', 'CUSCO', NULL, '1', '46092749', NULL, '920133306', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.S EL DESCANSO', NULL, NULL),
(507, 'MARIANELA', NULL, NULL, 'nelaqg41@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE GUTIERREZ', 'PERÚ', 'CUSCO', NULL, '1', '23987741', NULL, '944267332', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Colegio Montessori del Cusco ', NULL, NULL),
(508, 'SARA', NULL, NULL, 'lic.sasaco@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALAS CONDORI', 'PERÚ', 'CUSCO', NULL, '1', '41407877', NULL, '978622297', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Policlínico Parroquial Belén ', NULL, NULL),
(509, 'FRANCINETH LOURDES', NULL, NULL, 'francineth.rivero.rojas@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERO ROJAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45499462', NULL, '991704789', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRIS LIMA CENTRO ', NULL, NULL),
(510, 'YENI', NULL, NULL, 'Mezahuamanyeni@gmail.com', NULL, NULL, 0, NULL, NULL, 'MEZA HUAMAN', 'PERÚ', 'CUSCO', NULL, '1', '41837271', NULL, '984331682', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Centro de salud y diagnóstico ERGONOMIC', NULL, NULL),
(511, 'ROCIO YADIRA', NULL, NULL, 'rociohuamancusco95@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMAN CHOQUE', 'PERÚ', 'CUSCO', NULL, '1', '72239185', NULL, '971549563', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'SAMUE CHUMBIVILCAS', NULL, NULL),
(512, 'VICTORIA SOLEDAD', NULL, NULL, 'vsvasquez@gmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ ANGULO DE ZULOETA', 'PERÚ', 'LA LIBERTAD', NULL, '1', '43011733', NULL, '989593649', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'IREN NORTE', NULL, NULL),
(513, 'YESENIA', NULL, NULL, 'yemidaxi26@gmail.cpom', NULL, NULL, 0, NULL, NULL, 'BARRETO MORILLOS', 'PERÚ', 'AMAZONAS', NULL, '1', '17614381', NULL, '942306567', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'red de salud utcubamba', NULL, NULL),
(514, 'MIRIAM CYNTHIA', NULL, NULL, 'miriamvillafuerte88@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLAFUERTE TOLEDO', 'PERÚ', 'CUSCO', NULL, '1', '44902665', NULL, '966444334', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Csjdd', NULL, NULL),
(515, 'LLAQUELINA', NULL, NULL, 'llaquelinapm64@gmail.com', NULL, NULL, 0, NULL, NULL, 'PIZARRO MENDOZA', 'PERÚ', 'AMAZONAS', NULL, '1', '33408298', NULL, '930229421', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Hospital Regional Virgen de Fátima Chachapoyas ', NULL, NULL),
(516, 'MARIA MAGDALENA', NULL, NULL, 'mariapalomino2612@gmail.com', NULL, NULL, 0, NULL, NULL, 'PALOMINO SALVATIERRA', 'PERÚ', 'CALLAO', NULL, '1', '25807882', NULL, '969062863', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Puesto de salud palmeras de oquendo', NULL, NULL),
(517, 'ELVIA HILDA JULIA', NULL, NULL, 'elvitabm@gmail.com', NULL, NULL, 0, NULL, NULL, 'BERNAOLA MIRANDA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '44108174', NULL, '970058459', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'INSTITUTO NACIONAL DE REHABILITACIÓN', NULL, NULL),
(518, 'DAIRA NAYELI', NULL, NULL, 'ileyan.16.2002@gmail.com', NULL, NULL, 0, NULL, NULL, 'DAVID TACCA', 'PERÚ', 'PUNO', NULL, '1', '73465918', NULL, '973097811', NULL, 'PRIVADA', 'OTRA', 'Norbert Wiener ', NULL, NULL),
(519, 'TABATA MARIA DEL SOCORRO', NULL, NULL, 'tabatavega@gmail.com', NULL, NULL, 0, NULL, NULL, 'VEGA ESCOBAR', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41054162', NULL, '984126875', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'ESSALUD', NULL, NULL),
(520, 'INOCENCIA ANTONIA', NULL, NULL, 'SO.paulino2021@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAULINO CHUCLE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '16137362', NULL, '977371673', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CS Max Arias Schreiber ', NULL, NULL),
(521, 'LIZBETH', NULL, NULL, 'Lizbethnr1720@gmail.com', NULL, NULL, 0, NULL, NULL, 'NIEVES RAMOS', 'PERÚ', 'CUSCO', NULL, '1', '43167655', NULL, '991657847', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional Cusco', NULL, NULL),
(522, 'GLORIA', NULL, NULL, 'gratesis.enfer@outlook.es', NULL, NULL, 0, NULL, NULL, 'RENDON ANAYA', 'PERÚ', 'CUSCO', NULL, '1', '47522639', NULL, '973500681', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'MINSA', NULL, NULL),
(523, 'LAURA', NULL, NULL, 'lauservar@gmail.com', NULL, NULL, 0, NULL, NULL, 'SERRANO VARGAS', 'PERÚ', 'CUSCO', NULL, '1', '42513910', NULL, '984613240', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'ESSALUD', NULL, NULL),
(524, 'JULIA BEATRIZ', NULL, NULL, 'jlopezpuicon@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ PUICON', 'PERÚ', 'AMAZONAS', NULL, '1', '44378077', NULL, '992871323', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRECCION REGIONAL DE SALUD AMAZONAS', NULL, NULL),
(525, 'INGRID GERALDINE', NULL, NULL, 'ihidalgo@dirislimaeste.gob.pe', NULL, NULL, 0, NULL, NULL, 'HIDALGO CORRO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '75325357', NULL, '977182190', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRIS LIMA ESTE', NULL, NULL),
(526, 'SHARON JANETH', NULL, NULL, 'Sharoncv.95@gmail.com', NULL, NULL, 0, NULL, NULL, 'CABANILLAS VARGAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '74499624', NULL, '942092539', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro médico sanidad - Bellavista', NULL, NULL),
(527, 'ROSARIO MARLENE', NULL, NULL, 'm_2064@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CANCINO ROLDAN', 'PERÚ', 'CALLAO', NULL, '1', '25643994', NULL, '989969833', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'Diresa Callao - C.S. Álamo ', NULL, NULL),
(528, 'FELIPE', NULL, NULL, 'felipe.gonza.053@gmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALES CARDENAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46133038', NULL, '949398526', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Independiente ', NULL, NULL),
(529, 'DIANA BETTY', NULL, NULL, 'Diana_25_12@hotmail.com', NULL, NULL, 0, NULL, NULL, 'JULCA MELGAREJO', 'PERÚ', 'CALLAO', NULL, '1', '41748891', NULL, '978617005', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'DIRESA CALLAO', NULL, NULL),
(530, 'ELGA MARIELA', NULL, NULL, 'elga1308@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MORI SANCHEZ', 'PERÚ', 'ANCASH', NULL, '1', '08881503', NULL, '990320211', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Víctor Ramos Guardia - Huaraz', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(531, 'HANIA NORMA', NULL, NULL, 'hania2211n@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUSIHUAMAN REYES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44132801', NULL, '945285457', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', '\"Consultorio Médico \"\"San Marcos\"\" \"', NULL, NULL),
(532, 'ANA GLORIA', NULL, NULL, 'anagonzalesaguado@gmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALES AGUADO', 'PERÚ', 'HUANCAVELICA', NULL, '1', '28229593', NULL, '964699957', NULL, 'PÚBLICA', 'OTRA', 'DIRECCION REGIONAL DE SALUD HUANCAVELICA', NULL, NULL),
(533, 'MARIA DEL CARMEN', NULL, NULL, 'mcrobleszum@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROBLES ZUMARAN', 'PERÚ', 'PIURA', NULL, '1', '02833648', NULL, '906224276', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'E.S. I-3 Cura Mori', NULL, NULL),
(534, 'FELIX WIGBERTO', NULL, NULL, 'felixmechato@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MECHATO RAMIREZ', 'PERÚ', 'PIURA', NULL, '1', '07312483', NULL, '968719454', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DISA - PIURA', NULL, NULL),
(535, 'SEBASTIAN ALONSO', NULL, NULL, 'sebastianabanto22@gmail.com', NULL, NULL, 0, NULL, NULL, 'ABANTO URBANO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '73048597', NULL, '943735015', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Montefiori ', NULL, NULL),
(536, 'DALIA MATILDE', NULL, NULL, 'daliavalless2019@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALLES SIFUENTES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '18072968', NULL, '955950938', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Diris Lima Sur ', NULL, NULL),
(537, 'EDUARDO JUAN', NULL, NULL, 'Eduardo_ponce_8421@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PONCE TARMA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42766649', NULL, '999018469', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'CAM TAYTA WASI', NULL, NULL),
(538, 'CARMEN ROSA', NULL, NULL, 'carore26@gmail.com', NULL, NULL, 0, NULL, NULL, 'ORE ROJAS', 'PERÚ', 'CUSCO', NULL, '1', '23933855', NULL, '991378880', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL ANTONIO LORENA', NULL, NULL),
(539, 'DAYSSY MARITZA', NULL, NULL, 'deymar20024@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CCARHUAS MEDINA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42662555', NULL, '990603228', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CENTRO DE SALUD LEONOR SAAVEDRA ', NULL, NULL),
(540, 'SILVIA ELIZABETH', NULL, NULL, 'martelcalixto1982@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARTEL CALIXTO', 'PERÚ', 'PASCO', NULL, '1', '41373568', NULL, '943019528', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'DIRESA PASCO  - CS ULIACHIN', NULL, NULL),
(541, 'KAREN ESTEFANIA', NULL, NULL, 'Kv90857@gmail.com', NULL, NULL, 0, NULL, NULL, 'MENDOZA VARGAS MACHUCA', 'PERÚ', 'PIURA', NULL, '1', '43855871', NULL, '981649456', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'E. S. MICAELA BASTIDAS', NULL, NULL),
(542, 'JUAN PABLO SEGUNDO', NULL, NULL, 'juan.falcon@dedalus.eu', NULL, NULL, 0, NULL, NULL, 'FALCON VASQUEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '80687867', NULL, '995982715', NULL, 'PRIVADA', 'INGENIERÍA', 'Dedalus Global Services', NULL, NULL),
(543, 'GLADYS ENEDINA', NULL, NULL, 'gladys_dpm@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DE PAZ MATIAS DE POMIANO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '15665627', NULL, '992204990', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'C.S Paramonga', NULL, NULL),
(544, 'NERYBELLEE', NULL, NULL, 'nerybelja@tahoo.es', NULL, NULL, 0, NULL, NULL, 'JANAMPA AÑAÑOS', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '21404617', NULL, '998080565', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital María Auxiliadora  ', NULL, NULL),
(545, 'JUDI EMIDA', NULL, NULL, 'Emidaloarte15@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOARTE RAYMUNDEZ', 'PERÚ', 'CALLAO', NULL, '1', '09862977', NULL, '998833694', NULL, 'PÚBLICA', 'OTRA', 'DIRESACALLAO', NULL, NULL),
(546, 'SEAN IAN', NULL, NULL, 'reseanian@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERA SIGIL', 'PERÚ', 'CALLAO', NULL, '1', '70096438', NULL, '998881171', NULL, 'PÚBLICA', 'INGENIERÍA', 'DIRESA CALLAO /RED DE SALUD BONILLA - LA PUNTA', NULL, NULL),
(547, 'YNGRID', NULL, NULL, 'yngridhuapa@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMAN PALACIOS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07968666', NULL, '957273715', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'INFOSALUD', NULL, NULL),
(548, 'CAROL RAQUEL', NULL, NULL, 'serranaindia@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ARELLANO URRELO', 'PERÚ', 'PIURA', NULL, '1', '05395131', NULL, '969494896', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'I - 3 CURA MORI', NULL, NULL),
(549, 'CINDY ELSA', NULL, NULL, 'Ciel1787@gmail.com', NULL, NULL, 0, NULL, NULL, 'GAMBOA CARMEN', 'PERÚ', 'ANCASH', NULL, '1', '44336964', NULL, '981552964', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional Eleazar Guzmán Barron ', NULL, NULL),
(550, 'MAGALY OLIVIA', NULL, NULL, 'oliviaac18@gmail.com', NULL, NULL, 0, NULL, NULL, 'ATAPAUCAR CALDERON', 'PERÚ', 'CUSCO', NULL, '1', '40432658', NULL, '988872564', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional del Cusco', NULL, NULL),
(551, 'CLORINDA', NULL, NULL, 'Clovaldez20@yahoo.es', NULL, NULL, 0, NULL, NULL, 'VALDEZ CHACÓN', 'PERÚ', 'CUSCO', NULL, '1', '41158099', NULL, '984388351', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.S Belempampa', NULL, NULL),
(552, 'DENIS VIVIANA', NULL, NULL, 'denisordinolatarrillo3@gmail.com', NULL, NULL, 0, NULL, NULL, 'ORDINOLA TARRILLO', 'PERÚ', 'AMAZONAS', NULL, '1', '44787683', NULL, '974647555', NULL, 'PRIVADA', 'OTRA', 'Máster sistem ', NULL, NULL),
(553, 'CATHERINE', NULL, NULL, 'cathyvs28@gmail.com', NULL, NULL, 0, NULL, NULL, 'VIZCARRA SANTA CRUZ', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '04803653', NULL, '982726585', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL SANTA ROSA DE PUERTO MALDONADO ', NULL, NULL),
(554, 'NORMA ELENA', NULL, NULL, 'normaelena66@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ALVARADO CORONADO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08645623', NULL, '971154747', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Red Barranca', NULL, NULL),
(555, 'DINA LUCIA', NULL, NULL, 'didima_294@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DIAZ MALDONADO', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '46771173', NULL, '956742381', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Ps. Virgenes del sol ', NULL, NULL),
(556, 'JAVIER', NULL, NULL, 'cmhsolar@gmail.com', NULL, NULL, 0, NULL, NULL, 'HAQUEHUA VILLALBA', 'PERÚ', 'CUSCO', NULL, '1', '23961274', NULL, '984755208', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Belempampa', NULL, NULL),
(557, 'LILIBETH MARIA', NULL, NULL, 'Bethriazc@gmail.com', NULL, NULL, 0, NULL, NULL, 'ZEGARRA CORIMANYA', 'PERÚ', 'CUSCO', NULL, '1', '71463080', NULL, '953461267', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Essalud', NULL, NULL),
(558, 'ARNALDO MARTIN', NULL, NULL, 'atito@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'TITO PAUCAR', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07761320', NULL, '906672908', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIGERD- MINSA', NULL, NULL),
(559, 'MAXI MIRELLA', NULL, NULL, 'mc_leo05@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CANELO CHIPANA', 'PERÚ', 'HUANCAVELICA', NULL, '1', '71484288', NULL, '957941610', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Red de Salud Angaraes', NULL, NULL),
(560, 'ARLETH', NULL, NULL, '1723xata@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAUCCAR FLOREZ', 'PERÚ', 'CUSCO', NULL, '1', '70101590', NULL, '998609470', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Red Norte Cusco ', NULL, NULL),
(561, 'WILLIAN ANTOM', NULL, NULL, 'wilpeare@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ OVIEDO', 'PERÚ', 'CUSCO', NULL, '1', '41703499', NULL, '984304956', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud Limatambo', NULL, NULL),
(562, 'ROCIO PILAR', NULL, NULL, 'rocio13021986@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERA OCHOA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43421450', NULL, '974602203', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diris Lima Sur', NULL, NULL),
(563, 'JUAN PABLO', NULL, NULL, 'fisiomeche@gmail.com', NULL, NULL, 0, NULL, NULL, 'MECHE CCOLQQUE', 'PERÚ', 'CUSCO', NULL, '1', '48210278', NULL, '923331122', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud Urubamba ', NULL, NULL),
(564, 'JUDITH REYNA', NULL, NULL, 'jbautistac@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'BAUTISTA CHICASACA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43617430', NULL, '973249889', NULL, 'PÚBLICA', 'OTRA', 'DIGERD- MINSA', NULL, NULL),
(565, 'CAROLA KATTERINE', NULL, NULL, 'caro@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SALDARRIAGA MORENO', 'PERÚ', 'CALLAO', NULL, '1', '41903084', NULL, '992870175', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diresa callao', NULL, NULL),
(566, 'WILLIAN OSWALDO', NULL, NULL, 'wilygoncas@gmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALEZ CASTILLO', 'PERÚ', 'TUMBES', NULL, '1', '00251026', NULL, '942680634', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'DIRESA TUMBES', NULL, NULL),
(567, 'ROCIO', NULL, NULL, 'rocycarpio@yahoo.com', NULL, NULL, 0, NULL, NULL, 'CARPIO ORTIZ DE ZEVALLOS', 'PERÚ', 'CUSCO', NULL, '1', '23963875', NULL, '984614191', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Red de Servicios de Salud Cusco Norte', NULL, NULL),
(568, 'EVELYN VICTORIA', NULL, NULL, 'evelynracchumicavero@gmail.com', NULL, NULL, 0, NULL, NULL, 'RACCHUMI CAVERO', 'PERÚ', 'AMAZONAS', NULL, '1', '71889310', NULL, '968799394', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS NARANJITOS', NULL, NULL),
(569, 'DANNY FABIOLA', NULL, NULL, 'FABY1703@HOTMAIL.COM', NULL, NULL, 0, NULL, NULL, 'MOLINA CORONADO', 'PERÚ', 'CALLAO', NULL, '1', '41209786', NULL, '967905634', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'DIRESA CALLAO', NULL, NULL),
(570, 'RAQUEL MILAGROS', NULL, NULL, 'rashel_13_ml@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MEJIA LOPEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '47216078', NULL, '964838253', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'MINSA-DIGTEL ', NULL, NULL),
(571, 'JACKELINE MELISSA', NULL, NULL, 'jackelissa@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CONCHA CARHUANCHO', 'PERÚ', 'CALLAO', NULL, '1', '42139275', NULL, '931757879', NULL, 'AMBOS', 'LIC. ENFERMERÍA', 'Hospital Alberto Barton', NULL, NULL),
(572, 'PEDRO', NULL, NULL, 'javier92-41656@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PULIDO CARNERO', 'PERÚ', 'AMAZONAS', NULL, '1', '08513923', NULL, '986955218', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud Aramango - RIS Bagua ', NULL, NULL),
(573, 'CIRO', NULL, NULL, 'ariasgonzalesciro@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARIAS GONZALES', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '73033429', NULL, '976259467', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Bioanalisis ', NULL, NULL),
(574, 'YHOSELYN NICOLN', NULL, NULL, 'yhoselyn_123@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HUANCA ALVARADO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '75972529', NULL, '959367124', NULL, 'PRIVADA', 'OTRA', 'Soy estudiante universitaria', NULL, NULL),
(575, 'MARIA ELENA', NULL, NULL, 'mariaelenagastelu@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GASTELU GUZMAN', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '06628941', NULL, '948007297', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMIS VIRGEN DEL CARMEN ', NULL, NULL),
(576, 'LUZ ALICIA', NULL, NULL, 'luz_alic@hotmail.com', NULL, NULL, 0, NULL, NULL, 'FLORIAN GUERRERO DE RUEDA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07897435', NULL, '989398339', NULL, 'PÚBLICA', 'OTRA', 'Centro de salud Pucusana ', NULL, NULL),
(577, 'DARIO NARCISO', NULL, NULL, 'dario-lunadc@outlook.com', NULL, NULL, 0, NULL, NULL, 'LUNA DEL CARPIO', 'PERÚ', 'CALLAO', NULL, '1', '25665890', NULL, '999662808', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CENTRO DE SALUD ACAPULCO - DIRESA CALLAO', NULL, NULL),
(578, 'DANTE ABEL', NULL, NULL, 'DANTS.ESPINOZA.CABALLERO@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'ESPINOZA CABALLERO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46726032', NULL, '901642480', NULL, 'PÚBLICA', 'OTRA', 'RED DE SALUD HUARAL CHANCAY', NULL, NULL),
(579, 'ZORAIDA', NULL, NULL, 'rioszoraida820@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIOS PORRAS', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42755494', NULL, '940253164', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Infosalud ', NULL, NULL),
(580, 'YENNIFFER YANETT', NULL, NULL, 'yenniffer1309@gmail.com', NULL, NULL, 0, NULL, NULL, 'MUÑOZ ORTIZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43155904', NULL, '982269610', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Minsa', NULL, NULL),
(581, 'JENY JUSTINA', NULL, NULL, 'jenymendozag@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MENDOZA GODOY', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '07458163', NULL, '999610596', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI JUAN PABLO II', NULL, NULL),
(582, 'FLOR MARIELA', NULL, NULL, 'fmirabalv@gmail.com', NULL, NULL, 0, NULL, NULL, 'MIRABAL VERAMENDI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46283754', NULL, '945871476', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'FISSAL ', NULL, NULL),
(583, 'HIDELITH', NULL, NULL, 'hide_qb@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUINO BUENO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46181023', NULL, '929722372', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'SAMU', NULL, NULL),
(584, 'RENZO ENRIQUE', NULL, NULL, 'rjaureguir@hotnail.com', NULL, NULL, 0, NULL, NULL, 'JAUREGUI REYNOSO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41523434', NULL, '977545501', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'EsSalud', NULL, NULL),
(585, 'ENRIQUE GLOBER', NULL, NULL, 'enriqg_37@hotmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES FLORES', 'PERÚ', 'ANCASH', NULL, '1', '32905660', NULL, '996722435', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'RED DE SALUD PACÍFICO SUR ', NULL, NULL),
(586, 'MIRIA', NULL, NULL, 'miriapalacios9184@gmail.com', NULL, NULL, 0, NULL, NULL, 'PALACIOS AGUILAR', 'PERÚ', 'AMAZONAS', NULL, '1', '42192650', NULL, '940453599', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'P.S EL BALCON', NULL, NULL),
(587, 'MARIA DEL PILAR', NULL, NULL, 'mapi2320@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MEDINA SIESQUEN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '15761304', NULL, '940216374', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Gustavo Lanatta Lujan ', NULL, NULL),
(588, 'TEIDY IVAN', NULL, NULL, 'tpalacios1991@gmail.com', NULL, NULL, 0, NULL, NULL, 'PALACIOS AGUILAR', 'PERÚ', 'AMAZONAS', NULL, '1', '46856801', NULL, '945795184', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL DE APOYO BAGUA GUSTAVO LANATTA LUJAN', NULL, NULL),
(589, 'LISBETH MELANY', NULL, NULL, 'melanycuripacoquintol@gmail.com', NULL, NULL, 0, NULL, NULL, 'CURIPACO QUINTO', 'PERÚ', 'HUANCAVELICA', NULL, '1', '46036738', NULL, '945594632', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital departamental de huancavelica', NULL, NULL),
(590, 'Sandra Inés  Flores Rivera', NULL, NULL, 'sfloresrivera351@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'DIRIS LIMA NORTE', NULL, '2', '000246568', NULL, '999327992', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Si da vida', NULL, NULL),
(591, 'MARITZA', NULL, NULL, 'maritza.saccsara@gmail.com', NULL, NULL, 0, NULL, NULL, 'SACCSARA MEZA', 'PERÚ', 'AYACUCHO', NULL, '1', '28297317', NULL, '994406048', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'UNIVERSIDAD NACIONAL SAN CRISTOBAL DE HUAMANGA', NULL, NULL),
(592, 'OSCAR ANTONIO', NULL, NULL, 'OAntonioPS@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAREDES SEPULVEDA', 'PERÚ', 'ANCASH', NULL, '1', '73131743', NULL, '944440105', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CENTRO DE SALUD  I-3 LLAMELLIN', NULL, NULL),
(593, 'CECILIA', NULL, NULL, 'Ceciliaclaros27@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CLAROS CLAROS', 'PERÚ', 'OTRO', NULL, '1', '44648391', NULL, '990995932', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital de Emergencias Villa el Salvador', NULL, NULL),
(594, 'DENYSSE', NULL, NULL, 'bedenysami@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHACMANI VELASQUE', 'PERÚ', 'AREQUIPA', NULL, '1', '48035509', NULL, '995798966', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Empresa Estudios Técnicos ', NULL, NULL),
(595, 'ROSA GRACIELA', NULL, NULL, 'rosagracielamamani01@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAMANI CHUQUIHUACCHA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '09729692', NULL, '991737676', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Ministerio de Salud', NULL, NULL),
(596, 'MIGUEL ANIBAL', NULL, NULL, 'miguelarm2109@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERA MAGUIÑA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '15738811', NULL, '974898514', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Rimac Seguros', NULL, NULL),
(597, 'MARILUZ', NULL, NULL, 'Luzmaria_181@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHAVEZ MEJIA', 'PERÚ', 'CUSCO', NULL, '1', '42274448', NULL, '955415519', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Red norte ', NULL, NULL),
(598, 'PATRICIA DEL PILAR', NULL, NULL, 'pilarcallelopez42@gmail.com', NULL, NULL, 0, NULL, NULL, 'CALLE LOPEZ', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '17640287', NULL, '953610349', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI JCMARIATEGUI ', NULL, NULL),
(599, 'ROBERTO', NULL, NULL, 'rob.zegarra@gmail.com', NULL, NULL, 0, NULL, NULL, 'ZEGARRA CHAPOÑAN', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '40970938', NULL, '945684519', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Ministerio de Salud', NULL, NULL),
(600, 'MIRTHA', NULL, NULL, 'maj10041208@gmail.com', NULL, NULL, 0, NULL, NULL, 'ADRIANO JIMENEZ', 'PERÚ', 'PIURA', NULL, '1', '16729129', NULL, '957198896', NULL, 'PÚBLICA', 'OTRA', 'E.S.I-4 Huancabamba ', NULL, NULL),
(601, 'YONI SAUL', NULL, NULL, 'lic_enf_yoni@outlook.com', NULL, NULL, 0, NULL, NULL, 'LUNA REYNOSO', 'PERÚ', 'HUÁNUCO', NULL, '1', '43702690', NULL, '931240892', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'hospital materno infantil carlos showing ferrari', NULL, NULL),
(602, 'MARGOT', NULL, NULL, 'Margot.osorio@gmail.com', NULL, NULL, 0, NULL, NULL, 'OSORIO CHIPANA', 'PERÚ', 'CALLAO', NULL, '1', '43020453', NULL, '922245811', NULL, 'PÚBLICA', 'OTRA', 'Hospital San José ', NULL, NULL),
(603, 'LIDIA JUDITH', NULL, NULL, 'lidia.salca@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALVADOR CAQUI', 'PERÚ', 'HUÁNUCO', NULL, '1', '41172884', NULL, '986994915', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Materno Infantil Carlos showing Ferrari ', NULL, NULL),
(604, 'JOSE CARLOS', NULL, NULL, 'josemezacipriano@gmail.com', NULL, NULL, 0, NULL, NULL, 'MEZA CIPRIANO', 'PERÚ', 'HUÁNUCO', NULL, '1', '22890233', NULL, '962654024', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Minsa ', NULL, NULL),
(605, 'HERNAN LUIS', NULL, NULL, 'hernan_28_12@outlook.com', NULL, NULL, 0, NULL, NULL, 'ZAMBRANO CASTRO', 'PERÚ', 'HUÁNUCO', NULL, '1', '72450631', NULL, '927177008', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional Hermilio Valdizan', NULL, NULL),
(606, 'NOHELY', NULL, NULL, 'nohelyhinojosa@gmail.com', NULL, NULL, 0, NULL, NULL, 'HINOJOSA TTITO', 'PERÚ', 'CUSCO', NULL, '1', '47557561', NULL, '901424754', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de Salud Mental Comunitario Huaro ', NULL, NULL),
(607, 'RUBEN DARIO', NULL, NULL, 'rubenalsegura@yahoo.es', NULL, NULL, 0, NULL, NULL, 'SEGURA SIMON', 'PERÚ', 'CALLAO', NULL, '1', '09671660', NULL, '984838110', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'DIRESA CALLAO', NULL, NULL),
(608, 'ALEXANDER MAXIMO', NULL, NULL, 'alexanderrt1992@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROBLES TORIBIO', 'PERÚ', 'CALLAO', NULL, '1', '72669347', NULL, '937393494', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'C S Juan Pablo II', NULL, NULL),
(609, 'IRINA VITALIEVNA', NULL, NULL, 'Doctorairina1ru@gmail.com', NULL, NULL, 0, NULL, NULL, 'KABLOVA DE GAMARRA', 'PERÚ', 'CALLAO', NULL, '1', '41222994', NULL, '943925867', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diresa Callao', NULL, NULL),
(610, 'YOLI VANESSA', NULL, NULL, 'yoly_18_6@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ SANCHEZ', 'PERÚ', 'CALLAO', NULL, '1', '47415279', NULL, '925805955', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'P.S. SANTA FE', NULL, NULL),
(611, 'DHAYANA XIOMARA', NULL, NULL, 'dhavalverdem@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALVERDE MACCAPA', 'PERÚ', 'CUSCO', NULL, '1', '70495307', NULL, '994515105', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S. Paucartambo ', NULL, NULL),
(612, 'NADIA CECILIA', NULL, NULL, 'nadiaraiser@gmail.com', NULL, NULL, 0, NULL, NULL, 'RAISER VELARDE', 'PERÚ', 'CALLAO', NULL, '1', '42254089', NULL, '985473103', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Diresa Callao', NULL, NULL),
(613, 'LUIS', NULL, NULL, 'Siltevelo@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ILLATOPA RODRIGUEZ', 'PERÚ', 'HUÁNUCO', NULL, '1', '22424911', NULL, '962673921', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Universidad Nacional Hermilio Valdizan de Huánuco ', NULL, NULL),
(614, 'MAYRA', NULL, NULL, 'mayramez30@gmail.com', NULL, NULL, 0, NULL, NULL, 'MEZONES PARRA', 'PERÚ', 'PIURA', NULL, '1', '42545257', NULL, '935983182', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Minsa ', NULL, NULL),
(615, 'MARIO ANIBAL', NULL, NULL, 'mariorocab@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ROCA BENDEZU', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '21534071', NULL, '923767522', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS Benjamin Doig', NULL, NULL),
(616, 'SINIBALDO', NULL, NULL, 'yovana24dta1@gmail.com', NULL, NULL, 0, NULL, NULL, 'GASPAR GASPAR', 'PERÚ', 'CUSCO', NULL, '1', '44595273', NULL, '941264639', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital regional del Cusco ', NULL, NULL),
(617, 'CESAR ALFREDO', NULL, NULL, 'cesaralfredorodriguezrodriguez@gmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ RODRIGUEZ', 'PERÚ', 'CALLAO', NULL, '1', '18139818', NULL, '969135341', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Defensores de la Patria ', NULL, NULL),
(618, 'JESUS ORESTES', NULL, NULL, 'drjramosm@gmail.com', NULL, NULL, 0, NULL, NULL, 'RAMOS MERCADO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42557817', NULL, '988917107', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Clinica Internacional ', NULL, NULL),
(619, 'LUIS ALBERTO', NULL, NULL, 'lalarconl@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'ALARCON LOAYZA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '00456684', NULL, '959900060', NULL, 'AMBOS', 'INGENIERÍA', 'Universidad Nacional Mayor de San Marcos', NULL, NULL),
(620, 'MARISOL', NULL, NULL, 'mari6335@gmail.com', NULL, NULL, 0, NULL, NULL, 'YATACO MUCHOTRIGO', 'PERÚ', 'CALLAO', NULL, '1', '06877778', NULL, '980981014', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.S.Juan Pablo ll ', NULL, NULL),
(621, 'MAGALY ENMA', NULL, NULL, 'Magalyenmaf@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES MATOS', 'PERÚ', 'JUNÍN', NULL, '1', '41777288', NULL, '956000959', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA JUNIN', NULL, NULL),
(622, 'ROSAMARIE PATRICIA', NULL, NULL, 'rose_rodriguezc@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ CUEVA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '10473576', NULL, '962639780', NULL, 'PÚBLICA', 'OTRA', 'Centro de Salud Militar - Cuartel General del Ejercito', NULL, NULL),
(623, 'NOLBERTO', NULL, NULL, 'nobby.illanes@gmail.com', NULL, NULL, 0, NULL, NULL, 'ILLANES GUTIERREZ', 'PERÚ', 'AREQUIPA', NULL, '1', '46430218', NULL, '964766718', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'GERENCIA REGIONAL DE SALUD AREQUIPA ', NULL, NULL),
(624, 'EDILBERTO', NULL, NULL, 'etemoche@gmail.com', NULL, NULL, 0, NULL, NULL, 'TEMOCHE ESPINOZA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07927387', NULL, '999388726', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'POLICÍA NACIONAL DEL PERÚ ', NULL, NULL),
(625, 'FRANKLIN YONEL', NULL, NULL, 'falbarosales@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALBA ROSALES', 'PERÚ', 'ANCASH', NULL, '1', '44461400', NULL, '985782267', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRESA ÁNCASH ', NULL, NULL),
(626, 'HANDROBE ANDRES', NULL, NULL, 'mra.ofitic@gmail.com', NULL, NULL, 0, NULL, NULL, 'HINOSTROZA ESCRIBA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46142906', NULL, '980121370', NULL, 'PÚBLICA', 'INGENIERÍA', 'Hospital Nacional PNP Luis N Saenz', NULL, NULL),
(627, 'DEMISE JANETH', NULL, NULL, 'demise.nime@gmail.com', NULL, NULL, 0, NULL, NULL, 'NICOLAS MEJIA', 'PERÚ', 'HUÁNUCO', NULL, '1', '72257749', NULL, '901552592', NULL, 'PÚBLICA', 'OTRA', 'CENTRO DE SALUD AMARILIS', NULL, NULL),
(628, 'FLOR DE MARIA', NULL, NULL, 'floppycg2@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CEDRON GUTIERREZ', 'PERÚ', 'CALLAO', NULL, '1', '16791116', NULL, '993899058', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA CALLAO ', NULL, NULL),
(629, 'JESSICA IVONNE', NULL, NULL, 'jaramburup@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARAMBURU PALOMINO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '43510747', NULL, '951607163', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'INEN', NULL, NULL),
(630, 'EMMA PILAR', NULL, NULL, 'pily236@yahoo.com', NULL, NULL, 0, NULL, NULL, 'SILVESTRE RODRIGUEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '32786022', NULL, '930287830', NULL, 'PRIVADA', 'TÉCNICO ADMINISTRADOR', 'INFORMATIVO NACIONAL', NULL, NULL),
(631, 'KATERINE SHUJHEY', NULL, NULL, 'katerineshujhey@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALINAS BETETA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '46177811', NULL, '991151656', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Independiente ', NULL, NULL),
(632, 'ROSARIO INES', NULL, NULL, 'chariscuya@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUYA LA ROSA', 'PERÚ', 'CALLAO', NULL, '1', '08882578', NULL, '953695415', NULL, 'PÚBLICA', 'OTRA', 'Hospital San José del Callao ', NULL, NULL),
(633, 'KARLA ELIZABETH', NULL, NULL, 'karla.flores@upch.pe', NULL, NULL, 0, NULL, NULL, 'FLORES MORI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '71994309', NULL, '954081419', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL NACIONAL CAYETANO HEREDIA ', NULL, NULL),
(634, 'JULISSA KATERYNE', NULL, NULL, 'kateryne.ocupacional@gmail.com', NULL, NULL, 0, NULL, NULL, 'FRISANCHO PERALTA', 'PERÚ', 'AREQUIPA', NULL, '1', '29717596', NULL, '941992040', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Instituto de Medicina Legal y Ciencias Forenses ', NULL, NULL),
(635, 'PAOLA MERCEDES', NULL, NULL, 'paompg17@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAREDES GRANADOS', 'PERÚ', 'AREQUIPA', NULL, '1', '45366142', NULL, '958262802', NULL, 'PRIVADA', 'OTRA', 'EAP LATINA', NULL, NULL),
(636, 'ARMANDO', NULL, NULL, 'arpesko@yahoo.es', NULL, NULL, 0, NULL, NULL, 'PESCORAN PRIETO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '25448449', NULL, '992765066', NULL, 'PRIVADA', 'INGENIERÍA', 'Consultoria', NULL, NULL),
(637, 'CECILIA DEL PILAR', NULL, NULL, 'ceciliacornejoclemente2525@gmail.com', NULL, NULL, 0, NULL, NULL, 'CORNEJO CLEMENTE', 'PERÚ', 'HUÁNUCO', NULL, '1', '06804335', NULL, '995531547', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL MATERNO INFANTIL CARLOS SHOWINF FERRARI', NULL, NULL),
(638, 'ANA MARIA', NULL, NULL, 'cscatalinahuancadirisle@gmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ SAMANIEGO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '43404456', NULL, '978253392', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS CATALINA HUANCA', NULL, NULL),
(639, 'LYZZET', NULL, NULL, 'marinayjosee@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DEL CARPIO CAMONES', 'PERÚ', 'HUÁNUCO', NULL, '1', '41231899', NULL, '990044624', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Regional Hermilio Valdizan ', NULL, NULL),
(640, 'JOSIAS JAVIER', NULL, NULL, 'josias.loayza@upch.pe', NULL, NULL, 0, NULL, NULL, 'LOAYZA CRISOSTOMO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '73898185', NULL, '950406890', NULL, 'PRIVADA', 'OTRA', 'Universidad Peruana Cayetano Heredia ', NULL, NULL),
(641, 'KARIN', NULL, NULL, 'karin23huertspozo@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUERTA POZO', 'PERÚ', 'HUÁNUCO', NULL, '1', '72736328', NULL, '966577178', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HMI CARLOS SHOWING FERRARI', NULL, NULL),
(642, 'JOSEFINA ROSALMERY', NULL, NULL, 'rosalmery20mt@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MENDEZ TOLEDO', 'PERÚ', 'CAJAMARCA', NULL, '1', '42540018', NULL, '948403134', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Santa María de Cutervo', NULL, NULL),
(643, 'JUANA RENE', NULL, NULL, 'juanachocna@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHOCÑA LLALLICO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43889670', NULL, '982639919', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital de Emergencias Pediátricas ', NULL, NULL),
(644, 'VICTOR MANUEL', NULL, NULL, 'victor.chavez@upch.pe', NULL, NULL, 0, NULL, NULL, 'CHAVEZ ORIHUELA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '70857417', NULL, '929423643', NULL, 'PRIVADA', 'OTRA', 'Universidad Peruana Cayetano Heredia', NULL, NULL),
(645, 'EBER TOMAS', NULL, NULL, 'telesaludhhut@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUIÑE SANCHEZ', 'PERÚ', 'TACNA', NULL, '1', '19334159', NULL, '984464696', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'HOSPITAL HIPÓLITO UNANUE DE TACNA ', NULL, NULL),
(646, 'LIZZIE KATIA', NULL, NULL, 'lizziealva1@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALVA GOMERO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '46744357', NULL, '997721687', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'CS. LOS OLIVOS DE PRO ', NULL, NULL),
(647, 'KATIA ADELA', NULL, NULL, 'medico.ocupacional.kamf@gmail.com', NULL, NULL, 0, NULL, NULL, 'MUÑOZ FARFAN', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40214566', NULL, '992072186', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Clinica Javier Prado ', NULL, NULL),
(648, 'MELISSA ANDREA', NULL, NULL, 'melitabomar@gmail.com', NULL, NULL, 0, NULL, NULL, 'TABOADA MARQUEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '74209477', NULL, '973439933', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Hima', NULL, NULL),
(649, 'ANALI YRENE', NULL, NULL, 'Analiyrenevasquezrios@gmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ RIOS', 'PERÚ', 'ANCASH', NULL, '1', '42793479', NULL, '961405905', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital la caleta chimbote', NULL, NULL),
(650, 'ROCIO', NULL, NULL, 'rociooc@hotmail.com', NULL, NULL, 0, NULL, NULL, 'OLIVARES CONTRERAS', 'PERÚ', 'CALLAO', NULL, '1', '10830007', NULL, '997208298', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Pefarer Peru', NULL, NULL),
(651, 'CARMEN ROSA', NULL, NULL, 'rossmega@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GARCIA TURPO', 'PERÚ', 'CUSCO', NULL, '1', '23848823', NULL, '963358629', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'U. E. 401 RSCCE', NULL, NULL),
(652, 'JUDITH DAYSI', NULL, NULL, 'jgarciacajaleon@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARCIA CAJALEON', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '22486408', NULL, '977537613', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro Materno Infantil Villa María del Triunfo', NULL, NULL),
(653, 'VICTORIA ALELLY', NULL, NULL, 'alellymon25@gmail.com', NULL, NULL, 0, NULL, NULL, 'LLAUCE MONTOYA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '73581875', NULL, '987484969', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Dirección Ejecutiva de salud ambiental ', NULL, NULL),
(654, 'KARIM KELY', NULL, NULL, 'Voluntariado.6677@gmail.com', NULL, NULL, 0, NULL, NULL, 'MENDOZA BARRETO', 'PERÚ', 'TUMBES', NULL, '1', '00254744', NULL, '950352574', NULL, 'PRIVADA', 'TÉCNICO EN ENFERMERÍA', 'Radioimagen', NULL, NULL),
(655, 'YOSSELIT CARINA', NULL, NULL, 'yosselit.novoa@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'NOVOA JACOBO', 'PERÚ', 'LA LIBERTAD', NULL, '1', '43888102', NULL, '924226017', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Santa Isabel', NULL, NULL),
(656, 'LIVIA ISABEL', NULL, NULL, 'liviaisabel@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BARRIENTOS RUIZ', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '10635308', NULL, '997213700', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Profesional', NULL, NULL),
(657, 'FRIDA NANCY', NULL, NULL, 'psfrivera@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERA ARCANA', 'PERÚ', 'AREQUIPA', NULL, '1', '29711405', NULL, '991301494', NULL, 'PÚBLICA', 'OTRA', 'C.S. Edificadores Misti', NULL, NULL),
(658, 'MARTHA FELICIA', NULL, NULL, 'mdongoh@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'DONGO HUGO', 'PERÚ', 'CALLAO', NULL, '1', '08596300', NULL, '958964369', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'UNMSM -CEPUSM', NULL, NULL),
(659, 'ROSARIO AURORA', NULL, NULL, 'optrosario3105@gmail.com', NULL, NULL, 0, NULL, NULL, 'DE LA TORRE RIVERA', 'PERÚ', 'CALLAO', NULL, '1', '09619906', NULL, '999926805', NULL, 'PÚBLICA', 'OTRA', 'Diresa Callao ', NULL, NULL),
(660, 'CRISTINA DEL CARMEN', NULL, NULL, 'crisminho1997@gmail.com', NULL, NULL, 0, NULL, NULL, 'ECHEVARRIA ULLOA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72663162', NULL, '991593627', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Ong Tani', NULL, NULL),
(661, 'WILDER FELIX', NULL, NULL, 'wgchachi16@gmail.com', NULL, NULL, 0, NULL, NULL, 'GOMEZ BUENO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '10055744', NULL, '977585548', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.s Gustavo Lanatta Lujan ', NULL, NULL),
(662, 'VICTOR SALOMON', NULL, NULL, 'victorsalrr@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS RIVADENEIRA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16621839', NULL, '964053475', NULL, 'PRIVADA', 'OTRA', 'EsSalud ', NULL, NULL),
(663, 'FERNANDO MARTÍN', NULL, NULL, 'opatariyuq.runan@gmail.com', NULL, NULL, 0, NULL, NULL, 'FERNÁNDEZ QUISPE', 'PERÚ', 'SAN MARTÍN', NULL, '1', '09030530', NULL, '983056228', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL II-E BELLAVISTA ', NULL, NULL),
(664, 'MARTHA ANGELICA', NULL, NULL, 'martha.solar@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOLAR MAGNO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '21454164', NULL, '999063754', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'DIRIS Lima Norte ', NULL, NULL),
(665, 'ADRIAN', NULL, NULL, 'Camasi29@gmail.com', NULL, NULL, 0, NULL, NULL, 'NAVARRO CAMASI', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42318001', NULL, '971273525', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Hospital Maria Auxiliadora ', NULL, NULL),
(666, 'KENY JOSEPH', NULL, NULL, 'kenjozaba@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ZAGACETA BAZAN', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '43415980', NULL, '999091696', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'ESSALUD', NULL, NULL),
(667, 'CIRIA IVONNE', NULL, NULL, 'Ctrigos@unap.edu.pe', NULL, NULL, 0, NULL, NULL, 'TRIGOS RONDON', 'PERÚ', 'PUNO', NULL, '1', '01318960', NULL, '951818983', NULL, 'PÚBLICA', 'OTRA', 'Universidad Nacional del Altiplano de Puno', NULL, NULL),
(668, 'NIELS PERCY', NULL, NULL, 'nielspercyrupayaguilar@gmail.com', NULL, NULL, 0, NULL, NULL, 'RUPAY AGUILAR', 'PERÚ', 'JUNÍN', NULL, '1', '20108340', NULL, '954869369', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'IPRESS SAN AGUSTIN DE CAJAS', NULL, NULL),
(669, 'MANUEL EDUARDO', NULL, NULL, 'megirons@gmail.com', NULL, NULL, 0, NULL, NULL, 'GIRON SILVA', 'PERÚ', 'PIURA', NULL, '1', '02771330', NULL, '969753136', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de la amistad Perú - Corea Santa Rosa II.2', NULL, NULL),
(670, 'RUFINA AUREA', NULL, NULL, 'aurea.robles@gmail.com', NULL, NULL, 0, NULL, NULL, 'VIRHUEZ ROBLES', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '08585667', NULL, '961989971', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI STA Anita ', NULL, NULL),
(671, 'BORIS LUCIO', NULL, NULL, 'Borisatencio@yahoo.com', NULL, NULL, 0, NULL, NULL, 'ATENCIO MORALES', 'PERÚ', 'PASCO', NULL, '1', '04078170', NULL, '956022147', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Essalud', NULL, NULL),
(672, 'ROSA ELVIRA', NULL, NULL, 'rosatrujillo-03@hotmail.com', NULL, NULL, 0, NULL, NULL, 'TRUJILLO AVENDAÑO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '15596512', NULL, '993569285', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Essalud', NULL, NULL),
(673, 'ANA MARITZA', NULL, NULL, 'calidadhcfap@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANTOS FLORES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08466856', NULL, '998677116', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL CENTRAL FAP ', NULL, NULL),
(674, 'MARIBEL CELIA', NULL, NULL, 'maribel.mosquera.ju@gmail.com', NULL, NULL, 0, NULL, NULL, 'MOSQUERA JUAREZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41348093', NULL, '958564580', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'SAMU MINSA ', NULL, NULL),
(675, 'Eduardo Falconí Rosadio', NULL, NULL, 'edufar13@hotmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'LORETO', NULL, '1', '07430331', NULL, '999984083', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Sta Gema de Yurimaguas ', NULL, NULL),
(676, 'CHRISTIAN', NULL, NULL, 'xtianjc@hotmail.com', NULL, NULL, 0, NULL, NULL, 'JARA CAMPOS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40052334', NULL, '997683446', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Seguro Social de Salud ', NULL, NULL),
(677, 'EDIL BENITO', NULL, NULL, 'dentherencia@gmail.com', NULL, NULL, 0, NULL, NULL, 'HERENCIA ALLAUCA', 'PERÚ', 'APURÍMAC', NULL, '1', '40312275', NULL, '984174064', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'PS TOTORA MICRORED CHALHUANCA', NULL, NULL),
(678, 'CARMEN AMANDA', NULL, NULL, 'rofabi414@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS MENDOZA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07228360', NULL, '935151368', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'C. S. HUASCAR II ', NULL, NULL),
(679, 'KELLY', NULL, NULL, 'Kellybardalez@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BARDALES CARRANZA', 'PERÚ', 'LORETO', NULL, '1', '70658905', NULL, '953877755', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital II-Santa Gema ', NULL, NULL),
(680, 'AHISSA ASTRIT', NULL, NULL, 'ahissa01@gmail.com', NULL, NULL, 0, NULL, NULL, 'CALLE RAMIREZ', 'PERÚ', 'TUMBES', NULL, '1', '71776356', NULL, '959944242', NULL, 'PÚBLICA', 'OTRA', 'Hospital regional de Tumbes', NULL, NULL),
(681, 'DIVANY NIKOL', NULL, NULL, 'Divany_03@outlook.com', NULL, NULL, 0, NULL, NULL, 'ANTICONA CHOMBA', 'PERÚ', 'ANCASH', NULL, '1', '74151522', NULL, '977325669', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Santa Gema de Yurimaguas ', NULL, NULL),
(682, 'JANETH TERESA', NULL, NULL, 'janeth.hnch@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANA MIRAMIRA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42140536', NULL, '963735308', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Nacional Cayetano Heredia ', NULL, NULL),
(683, 'ROBERT DANIEL', NULL, NULL, 'roman.ayre@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROMAN AYRE', 'PERÚ', 'LORETO', NULL, '1', '42052774', NULL, '954445584', NULL, 'PÚBLICA', 'INGENIERÍA', 'Hospital II-2 Santa Gema de Yurimaguas ', NULL, NULL),
(684, 'MAURO', NULL, NULL, 'percymauro@gmail.com', NULL, NULL, 0, NULL, NULL, 'VARGAS LEON', 'PERÚ', 'CUSCO', NULL, '1', '24705645', NULL, '984620833', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Gerencia Regional de Salud Cusco ', NULL, NULL),
(685, 'DORIS GUMERCINDA', NULL, NULL, 'dorisportal040272@gmail.com', NULL, NULL, 0, NULL, NULL, 'PORTAL ALVAREZ', 'PERÚ', 'CAJAMARCA', NULL, '1', '26683452', NULL, '976895240', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Dirección Regional de Salud Cajamarca ', NULL, NULL),
(686, 'SARITA GUADALUPE', NULL, NULL, 'telesalud@hospitaltarapoto.gob.pe', NULL, NULL, 0, NULL, NULL, 'SAAVEDRA GRANDEZ', 'PERÚ', 'SAN MARTÍN', NULL, '1', '00092213', NULL, '945897310', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Tarapoto', NULL, NULL),
(687, 'FERNANDO', NULL, NULL, 'rojasruizfernando5@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS RUIZ', 'PERÚ', 'LORETO', NULL, '1', '08174877', NULL, '928566694', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospotal Santa Gema Yurimaguas', NULL, NULL),
(688, 'ROSSANA AMPARO', NULL, NULL, 'rbaldeonmartinez@gmail.com', NULL, NULL, 0, NULL, NULL, 'BALDEON MARTINEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08589325', NULL, '993247921', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'INEN ', NULL, NULL),
(689, 'MARYLIN BERENICE', NULL, NULL, 'marylin.barragan@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARRAGAN PACHECO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40744797', NULL, '964903040', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Saludpol', NULL, NULL),
(690, 'ROCIO FABIOLA', NULL, NULL, 'fabicervantesg@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CERVANTES GARNICA DE SANCHEZ', 'PERÚ', 'LORETO', NULL, '1', '10727208', NULL, '965898237', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Santa Gema de Yurimaguas ', NULL, NULL),
(691, 'JUDITH', NULL, NULL, 'judith.solis@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SOLIS BUSTAMANTE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10696870', NULL, '940171842', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Huaycan ', NULL, NULL),
(692, 'ANGEL PORFIRIO', NULL, NULL, 'Apadillas2705@gmail.com', NULL, NULL, 0, NULL, NULL, 'PADILLA SARRIA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '15736414', NULL, '947087009', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'Essalud ', NULL, NULL),
(693, 'FABIOLA SHIRLEY SOLEDAD', NULL, NULL, 'fappi231723@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROSALES GURMENDI', 'PERÚ', 'JUNÍN', NULL, '1', '73063768', NULL, '956561935', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'C.S CAJAS / CLINICA REBAGLIATI', NULL, NULL),
(694, 'FIORELLA SOLANGE', NULL, NULL, 'iepmafiorella1996@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUEZADA ALARCÓN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '74310557', NULL, '997587388', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Centro de salud lagunas', NULL, NULL),
(695, 'FLORENTINO', NULL, NULL, 'ftinomeru@gmail.com', NULL, NULL, 0, NULL, NULL, 'MEDINA RUESTA', 'PERÚ', 'PIURA', NULL, '1', '02686938', NULL, '955338732', NULL, 'PÚBLICA', 'INGENIERÍA', 'ESTABLECIMIENTO DE SALUD I-4 LOS ALGARROBOS', NULL, NULL),
(696, 'GIANCARLA', NULL, NULL, 'giany_bo@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BAYONA OLIVERA', 'PERÚ', 'CUSCO', NULL, '1', '42354080', NULL, '984339442', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Regional del Cusco ', NULL, NULL),
(697, 'MARIA ANGELICA', NULL, NULL, 'marmendozar@uch.pe', NULL, NULL, 0, NULL, NULL, 'MENDOZA RODRIGUEZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '47724871', NULL, '981293107', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Solidario de Comas ', NULL, NULL),
(698, 'KELY JANET', NULL, NULL, 'kjmperea@gmail.com', NULL, NULL, 0, NULL, NULL, 'MALPARTIDA PEREA', 'PERÚ', 'SAN MARTÍN', NULL, '1', '45446661', NULL, '949657593', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'SUPERINTENDENCIA NACIONAL DE SALUD ', NULL, NULL),
(699, 'JANH PIERR', NULL, NULL, 'Janh.bernabe.s@gmail.com', NULL, NULL, 0, NULL, NULL, 'BERNABE SILVANO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '72115549', NULL, '919633609', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Hospital Sergio Bernales', NULL, NULL),
(700, 'LIBERTAD', NULL, NULL, 'libertad.caballero.medico@gmail.com', NULL, NULL, 0, NULL, NULL, 'CABALLERO HUALLPA', 'PERÚ', 'CUSCO', NULL, '1', '42404984', NULL, '984435422', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Regional del Cusco ', NULL, NULL),
(701, 'JIMMY HANS', NULL, NULL, 'jimmyhansgarciavela@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARCIA VELA', 'PERÚ', 'SAN MARTÍN', NULL, '1', '71743630', NULL, '990622291', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'Hospital II-E Banda de Shilcayo ', NULL, NULL),
(702, 'ANA NOELIA', NULL, NULL, 'anitanbj@gmail.com', NULL, NULL, 0, NULL, NULL, 'BAUTISTA JULCA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41209834', NULL, '987813768', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Recursos TIC', NULL, NULL),
(703, 'YECIKA DEICY', NULL, NULL, 'yecikatrujillo_2008@hotmail.com', NULL, NULL, 0, NULL, NULL, 'IBAÑEZ TRUJILLO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '09604724', NULL, '956101115', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital San Bartolome', NULL, NULL),
(704, 'ANA MARIA', NULL, NULL, 'amvalverde1000@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALVERDE BEJAR', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08858777', NULL, '996239171', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Instituto nacional de salud del niño san borja ', NULL, NULL),
(705, 'RUTH LIZETH', NULL, NULL, 'rpacherrezr@gmail.com', NULL, NULL, 0, NULL, NULL, 'PACHERREZ REBOLLEDO', 'PERÚ', 'PIURA', NULL, '1', '70054796', NULL, '954292793', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Ps I. 4 salitral', NULL, NULL),
(706, 'EVELIN SIDNEY', NULL, NULL, 'evelin_1463@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ROMERO TROCIOS', 'PERÚ', 'JUNÍN', NULL, '1', '46005711', NULL, '983374824', NULL, 'PÚBLICA', 'OTRA', 'Centro de salud de cajas', NULL, NULL),
(707, 'ABEL EDGARDO', NULL, NULL, 'abel.monteza@gmail.com', NULL, NULL, 0, NULL, NULL, 'MONTEZA GARCIA', 'PERÚ', 'CAJAMARCA', NULL, '1', '16617564', NULL, '968029001', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'SEGURO INTEGRAL DE SALUD', NULL, NULL),
(708, 'CARLA MARIA', NULL, NULL, 'dra.cgarcia@yahoo.com', NULL, NULL, 0, NULL, NULL, 'GARCIA AVENDAÑO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '25758577', NULL, '999658102', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'EsSalud', NULL, NULL),
(709, 'HILDA AMERICA', NULL, NULL, 'hvaldez@susalud.gob.pe', NULL, NULL, 0, NULL, NULL, 'VALDEZ ROBLEDO', 'PERÚ', 'JUNÍN', NULL, '1', '08610249', NULL, '975489048', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'SUSALUD', NULL, NULL),
(710, 'ALICIA DEL SOCORRO', NULL, NULL, 'adsmorales88@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORALES COVARRUBIAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44971684', NULL, '957470117', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'UNIVERSIDAD SAN MARTÍN DE PORRES', NULL, NULL),
(711, 'GUISSELL CRISTINA', NULL, NULL, 'Guissell.pazruiz15@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAZ RUIZ', 'PERÚ', 'SAN MARTÍN', NULL, '1', '76168893', NULL, '958628325', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Hospital II-2 Tarapoto ', NULL, NULL),
(712, 'LUIS ALBERTO', NULL, NULL, 'lhuamani61@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMANI PALOMINO', 'PERÚ', 'JUNÍN', NULL, '1', '20082748', NULL, '964473788', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRECCION REGIONAL DE SALUD JUNIN', NULL, NULL),
(713, 'LUIS FERNANDO', NULL, NULL, 'luis.nina.rojas@gmail.com', NULL, NULL, 0, NULL, NULL, 'NINA ROJAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '46429761', NULL, '992472889', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Hospital Nacional Cayetano Heredia', NULL, NULL),
(714, 'GERARDO MANUEL', NULL, NULL, 'gerardosstperu@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAM PIMENTEL', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10000344', NULL, '986297633', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'csmc santa rosa', NULL, NULL),
(715, 'SAMUEL FERNANDO', NULL, NULL, 'samuelftm@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORRES MIRANDA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07917648', NULL, '978596775', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'SID', NULL, NULL),
(716, 'ROBIN ALFREDO', NULL, NULL, 'dr.robinpereziquira2022@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ IQUIRA', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '42017392', NULL, '993104673', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'SAMU MADRE DE DIOS', NULL, NULL),
(717, 'ANDREI UBALDO', NULL, NULL, 'Andreycayllahua@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAYLLAHUA CORAHUA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '44058137', NULL, '924180646', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CSMC ILLARIMUN', NULL, NULL),
(718, 'ROSA EMMA', NULL, NULL, 'remmassimoni@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALAZAR SIMONI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07213190', NULL, '935098441', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Consulta privada', NULL, NULL),
(719, 'ROSEMARY LILIA', NULL, NULL, 'rosemarymoscoso7@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MOSCOSO CHIRINOS DE ROCA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '07461951', NULL, '974609774', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMIS VIRGEN DEL CARMEN ', NULL, NULL),
(720, 'MARIA ISABEL', NULL, NULL, 'mairove_86@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ VEGA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '43468234', NULL, '987202314', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Cayetano Heredia ', NULL, NULL),
(721, 'ALFONSO EDGARDO', NULL, NULL, 'alfonso.nino@upch.pe', NULL, NULL, 0, NULL, NULL, 'NINO GUERRERO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '10494745', NULL, '999683672', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Unversidad Peruana Cayetano Heredia', NULL, NULL),
(722, 'SADIT', NULL, NULL, 'guardiasadit@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUARDIA FERNANDEZ', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42596538', NULL, '944659510', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Csmc barranco', NULL, NULL),
(723, 'LIZBET KATERIN', NULL, NULL, 'lizbetaraucano@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ARAUCANO BONIFAZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '70427810', NULL, '970974493', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Obstetra homecare Lizbet Araucano ', NULL, NULL),
(724, 'CARMEN EDITH', NULL, NULL, 'carmeli167@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SOSA CASTILLO', 'PERÚ', 'PIURA', NULL, '1', '45149130', NULL, '920395929', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital III José Cayetano Heredia EsSalud Piura ', NULL, NULL),
(725, 'ARACELI', NULL, NULL, 'qf.alvarez@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALVAREZ VIVAS', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '10495633', NULL, '943780628', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'CSMC SANTA ROSA DE MANCHAY ', NULL, NULL),
(726, 'FIORELLA NATALY', NULL, NULL, 'fiorellaricapa@gmail.com', NULL, NULL, 0, NULL, NULL, 'RICAPA ANTAY', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44245470', NULL, '943667492', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRIS LIMA CENTRO', NULL, NULL),
(727, 'JOSE LAZARO', NULL, NULL, 'lazero.pt@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PACHAMANGO TERRONES', 'PERÚ', 'CAJAMARCA', NULL, '1', '40809657', NULL, '952577760', NULL, 'PRIVADA', 'ADMINISTRADOR', 'J.lamedic eirl', NULL, NULL),
(728, 'ALBERTO', NULL, NULL, 'anculle90@gmail.com', NULL, NULL, 0, NULL, NULL, 'VELASQUEZ ANCULLE', 'PERÚ', 'TUMBES', NULL, '1', '46543629', NULL, '931496772', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CS pampa Grande', NULL, NULL),
(729, 'KARIM ULDA', NULL, NULL, 'drakual@hotmaio.com', NULL, NULL, 0, NULL, NULL, 'ALARCON LOAYZA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '06804442', NULL, '951070297', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI Cesar López Silva', NULL, NULL),
(730, 'STEPHANIE', NULL, NULL, 'Stephaniefer1987@gmail.com', NULL, NULL, 0, NULL, NULL, 'FERNANDEZ LI', 'PERÚ', 'ICA', NULL, '1', '44195987', NULL, '978003650', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'RED DE SALUD ICA', NULL, NULL),
(731, 'KAREN', NULL, NULL, 'karentorresmiranda14@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORRES MIRANDA', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '45518499', NULL, '921352203', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Samu', NULL, NULL),
(732, 'NARCISO EDWIN', NULL, NULL, 'egovident@gmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALES VILCA', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '41415312', NULL, '932127822', NULL, 'PRIVADA', 'CIRUJANO DENTISTA', 'Egovident', NULL, NULL),
(733, 'LIDIA AMANDA', NULL, NULL, 'Lidia.jara@hotmail.com', NULL, NULL, 0, NULL, NULL, 'JARA ROSADO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '09121461', NULL, '977244400', NULL, 'PÚBLICA', 'OTRA', 'CSMC SANTA ROSA DE MANCHAY ', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(735, 'SANDRA MILAGROS', NULL, NULL, 'smgutierrezchavez@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUTIERREZ CHAVEZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '70435050', NULL, '982002011', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de Salud Mental Comunitario Illarimun ', NULL, NULL),
(736, 'Rosario Dominguez  Rodriguez', NULL, NULL, 'rosario.dominguez.1972@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'ICA', NULL, '2', '003072555', NULL, '927877280', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Hospital San Juan de Dios', NULL, NULL),
(737, 'JULIO CESAR', NULL, NULL, 'telesalud@hospitaltarapoto.gob.pe', NULL, NULL, 0, NULL, NULL, 'MEGO SARMIENTO', 'PERÚ', 'SAN MARTÍN', NULL, '1', '41927223', NULL, '990028503', NULL, 'PÚBLICA', 'INGENIERÍA', 'HOSPITAL II-2 TARAPOTO', NULL, NULL),
(738, 'ROSANA', NULL, NULL, 'r8899797@gmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALEZ OLIVARES', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '21555450', NULL, '992992744', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI Juan Pablo II DIRIS Lima Sur ', NULL, NULL),
(739, 'PABLO ALBERTO  PEREZ  AGUILA ', NULL, NULL, 'pablito52perez.aguila@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'ICA', NULL, '2', '002663428', NULL, '926936880', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'PS SAN JOSE DE CO DOR INDEPENDENCIA PISCO', NULL, NULL),
(740, 'DANNY JULIÁN', NULL, NULL, 'djdc2000@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DÍAZ CARRASCO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42876311', NULL, '999040719', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'INSN BREÑA', NULL, NULL),
(741, 'OSCAR ELIAS', NULL, NULL, 'oscarbueno2008@gmail.com', NULL, NULL, 0, NULL, NULL, 'BUENO VALENZUELA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '07958497', NULL, '955668815', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Universidad Peruana Cayetano Heredia ', NULL, NULL),
(742, 'NISORINA AMPARO', NULL, NULL, 'amparo.saravia@unica.edu.pe', NULL, NULL, 0, NULL, NULL, 'SARAVIA CABEZUDO', 'PERÚ', 'ICA', NULL, '1', '21437719', NULL, '963656575', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Universidad Nacional San Luis Gonzaga ', NULL, NULL),
(743, 'VIDAL RAUL', NULL, NULL, 'vidalricapa2@gmail.com', NULL, NULL, 0, NULL, NULL, 'RICAPA CASTILLO', 'PERÚ', 'CAJAMARCA', NULL, '1', '25703773', NULL, '944790138', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Ministerio Público ', NULL, NULL),
(744, 'MILAGROS MAGALI', NULL, NULL, 'milabril2006@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MARTINEZ SIMBALA', 'PERÚ', 'PIURA', NULL, '1', '02849054', NULL, '961102417', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL DE LA AMISTAD PERU COREA II 2 SANTA ROSA', NULL, NULL),
(745, 'ARLET ANGELITA', NULL, NULL, 'agilbarreda@gmail.com', NULL, NULL, 0, NULL, NULL, 'GIL BARREDA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72030391', NULL, '957769005', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'MINSA', NULL, NULL),
(746, 'JAMES', NULL, NULL, 'jamsyens@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VILLANUEVA ORUE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '09411099', NULL, '995772288', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Dos de mayo ', NULL, NULL),
(747, 'CARMEN ROSA', NULL, NULL, 'carmen.vargas@limatambo.com.pe', NULL, NULL, 0, NULL, NULL, 'VARGAS CHAVEZ', 'PERÚ', 'CAJAMARCA', NULL, '1', '26673973', NULL, '976386818', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Clínica Limatambo Cajamarca SAC', NULL, NULL),
(748, 'MILY NOHEMI', NULL, NULL, 'Nahomilyph@gmail.com', NULL, NULL, 0, NULL, NULL, 'PULLA HUILLCA', 'PERÚ', 'CUSCO', NULL, '1', '46185848', NULL, '927476477', NULL, 'PRIVADA', 'CIRUJANO DENTISTA', 'Salud', NULL, NULL),
(749, 'MANUEL JESUS', NULL, NULL, 'mjveirl@live.com', NULL, NULL, 0, NULL, NULL, 'CORTEZ PORTAL', 'PERÚ', 'CAJAMARCA', NULL, '1', '26635207', NULL, '990029698', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'EsSalud', NULL, NULL),
(750, 'CAHUIDE SANTIAGO', NULL, NULL, 'MD.Mejiavictorio@gmail.com', NULL, NULL, 0, NULL, NULL, 'MEJIA VICTORIO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44375014', NULL, '952870190', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Santa Rosa', NULL, NULL),
(751, 'Yurisbel Tomás Solenzal  Alvarez', NULL, NULL, 'ysolenzalalvarez@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '2', '002702541', NULL, '928331210', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Universidad Privada San Juan Bautista ', NULL, NULL),
(752, 'ADA JANETT DEL CARMEN', NULL, NULL, 'janejulve@gmail.com', NULL, NULL, 0, NULL, NULL, 'JULVE CABALLERO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '07936594', NULL, '997362499', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI César Lopez Silva de Villa el Salvador', NULL, NULL),
(753, 'JANETTE TERESA', NULL, NULL, 'janettere@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORALES ARIAS', 'PERÚ', 'TACNA', NULL, '1', '00475956', NULL, '999111749', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Minsa', NULL, NULL),
(754, 'MANUEL FRANCISCO', NULL, NULL, 'manuelmanayayyangua@gmail.com', NULL, NULL, 0, NULL, NULL, 'MANAYAY YANGUA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '70615930', NULL, '999526723', NULL, 'PRIVADA', 'OTRA', 'Universidad Católica Santo Toribio de Mogrovejo', NULL, NULL),
(755, 'LIN KRISTHINA', NULL, NULL, 'dc.lin.2108@gmail.com', NULL, NULL, 0, NULL, NULL, 'DIAZ CASTRO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72626086', NULL, '942488165', NULL, 'PÚBLICA', 'OTRA', 'ILLARIMUN ', NULL, NULL),
(756, 'ROSITA PERPETUA', NULL, NULL, 'tarrillorosita1996@gmail.com', NULL, NULL, 0, NULL, NULL, 'TARRILLO NUÑEZ', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '74873912', NULL, '980600744', NULL, 'PÚBLICA', 'OTRA', 'Centro de Salud Micaela Bastidas', NULL, NULL),
(757, 'ISIS JACQUELINE', NULL, NULL, 'isisdent21@gmail.com', NULL, NULL, 0, NULL, NULL, 'PORTILLA RAMIREZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09542680', NULL, '945857236', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Essalud ', NULL, NULL),
(758, 'WERNER', NULL, NULL, 'whurtadob@gmail.com', NULL, NULL, 0, NULL, NULL, 'HURTADO BASUALDO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09459957', NULL, '990188315', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Laboratorios Medrock Corporation SAC ', NULL, NULL),
(759, 'GLORIA SOLEDAD', NULL, NULL, 'gloriarojaspadilla443@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS PADILLA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08554970', NULL, '991911265', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Cs San Luis ', NULL, NULL),
(760, 'GIANCARLO OMAR', NULL, NULL, 'giancarlo.rivera.calderon@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERA CALDERON', 'PERÚ', 'AREQUIPA', NULL, '1', '41380901', NULL, '987339849', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'EsSalud', NULL, NULL),
(761, 'CARMEN MAGALI', NULL, NULL, 'marife_04_02_28@yahoo.es', NULL, NULL, 0, NULL, NULL, 'CACHO CARBAJAL', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '29685696', NULL, '956981563', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS QUILMANA', NULL, NULL),
(762, 'KAROL MITZI', NULL, NULL, 'Pretty_butterfly733@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMANI QUIQUINLLA', 'PERÚ', 'HUANCAVELICA', NULL, '1', '73968766', NULL, '966842117', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.s Colcabamba', NULL, NULL),
(763, 'EDUARDO EDSON', NULL, NULL, 'Eduardo.mayuntupa@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MAYUNTUPA INOCENTE', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '41993780', NULL, '980470943', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Mapfre', NULL, NULL),
(764, 'GLORIA EVELYN', NULL, NULL, 'mykanl@gmail.com', NULL, NULL, 0, NULL, NULL, 'AVILA ASCURRA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42970615', NULL, '943027049', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Instituto nacional materno perinatal', NULL, NULL),
(765, 'BRIGGITTE YAMILE', NULL, NULL, 'suarezbriggitte8@gmail.com', NULL, NULL, 0, NULL, NULL, 'SUAREZ ESTEBAN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '73028517', NULL, '913377772', NULL, 'PRIVADA', 'OTRA', 'UNIVERSIDAD DE SAN MARTIN DE PORRES', NULL, NULL),
(766, 'JULIO ERNESTO', NULL, NULL, 'juliogutarra0603@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUTARRA MENDEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72939793', NULL, '966588411', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'detecta', NULL, NULL),
(767, 'ZULEIKA DEL CARMEN', NULL, NULL, 'zuleikapontesotelo@gmail.com', NULL, NULL, 0, NULL, NULL, 'PONTE SOTELO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46598700', NULL, '993273679', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Clinica Aviva', NULL, NULL),
(768, 'CHRISTIAN FABIO', NULL, NULL, 'christiangarcia.gestion@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARCIA TALLEDO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41992679', NULL, '913369366', NULL, 'PRIVADA', 'OTRA', 'BKS', NULL, NULL),
(769, 'YARLIM INGRID', NULL, NULL, 'yarlim-ingrid@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LIMA YARMA', 'PERÚ', 'UCAYALI', NULL, '1', '41921598', NULL, '930119273', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'P.S BELLAVISTA DE YARINACOCHA ', NULL, NULL),
(770, 'MARIA YSABEL', NULL, NULL, 'mariaysabel789@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CASANOVA RUBIO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43086349', NULL, '947489058', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Essalud / UNMSM ', NULL, NULL),
(771, 'JESUS ISAI', NULL, NULL, 'jcardenasgodinez515@gmail.com', NULL, NULL, 0, NULL, NULL, 'CARDENAS GODINEZ', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '77564841', NULL, '935418649', NULL, 'PRIVADA', 'OTRA', 'Universidad Nacional Mayor de San Marcos', NULL, NULL),
(772, 'RUTH ESTHER', NULL, NULL, 'Vargasesther116@gmail.com', NULL, NULL, 0, NULL, NULL, 'VARGAS CARRASCO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72856574', NULL, '981356135', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Arturo sabroso montoya ', NULL, NULL),
(773, 'NORMA JULIA', NULL, NULL, 'normajgg67@hotmai.com', NULL, NULL, 0, NULL, NULL, 'GARRO GIRALDO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '09254557', NULL, '962371066', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'CMI CÉSAR LOPEZ SILVA ', NULL, NULL),
(774, 'BRIGGITTE PAOLA', NULL, NULL, 'britpaes@gmail.com', NULL, NULL, 0, NULL, NULL, 'AYASTA ESQUECHE', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '48037757', NULL, '933304830', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Clínica Millenium', NULL, NULL),
(775, 'NILDA EDITH', NULL, NULL, 'nildaosorio@hotmail.com', NULL, NULL, 0, NULL, NULL, 'OSORIO MOSQUERA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06593863', NULL, '999389899', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA DIRIS LIMA CENTRO. RIS 3.CSVVP', NULL, NULL),
(776, 'DIEGO LUIS', NULL, NULL, 'Diegoalvarez5819@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALVAREZ ASTOCAZA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '47547798', NULL, '939372343', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.s villa victoria porvenir', NULL, NULL),
(777, 'WALDO', NULL, NULL, 'doctorwaldo@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARDENAS BERROCAL', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07171006', NULL, '999412225', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'ESSALUD', NULL, NULL),
(778, 'EDDIE YSAAC', NULL, NULL, 'esalomon8@yahoo.com', NULL, NULL, 0, NULL, NULL, 'SALOMON BARRIOS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08212586', NULL, '969688910', NULL, 'PRIVADA', 'OTRA', 'Grupo Panorama ', NULL, NULL),
(779, 'ANNIE CAROLINA', NULL, NULL, 'annie.solise@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOLIS ESCALANTE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42436656', NULL, '959709176', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'Marina de Guerra del Perú', NULL, NULL),
(780, 'CINTHYA', NULL, NULL, 'Cinthya776@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ QUINTANILLA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '43046840', NULL, '999364020', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Cmi san fernando ', NULL, NULL),
(781, 'LUIS ALBERTO', NULL, NULL, 'Lquintanaa@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUINTANA ALFARO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08135723', NULL, '996728104', NULL, 'PÚBLICA', 'OTRA', 'Centro de Salud Villa Victoria Porvenir ', NULL, NULL),
(782, 'Brigitte  Colombo De Villanueva ', NULL, NULL, 'brigicolombo87@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'SAN MARTÍN', NULL, '2', '003223071', NULL, '981645939', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Puesto de Salud Nuevo Sacanche', NULL, NULL),
(783, 'JAVIER', NULL, NULL, 'javierhuancollo@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HUANCOLLO ROJAS', 'PERÚ', 'AREQUIPA', NULL, '1', '41850701', NULL, '986087792', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Policlinico Santísima cruz de romero ', NULL, NULL),
(784, 'JULIO CESAR', NULL, NULL, 'Jmedinav@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'MEDINA VERASTEGUI', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '07516661', NULL, '999040229', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'EsSalud', NULL, NULL),
(785, 'ROBERTO CARLOS', NULL, NULL, 'rocavecri@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VELASQUEZ CRISANTO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40866462', NULL, '967669468', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Essalud retablo comas ', NULL, NULL),
(786, 'JENI KARIN', NULL, NULL, 'jkmlyhm@gmail.com', NULL, NULL, 0, NULL, NULL, 'MALDONADO LOPEZ', 'PERÚ', 'JUNÍN', NULL, '1', '20025090', NULL, '931519160', NULL, 'PÚBLICA', 'OTRA', 'C.S. CLAS Santa Rosa de Sacco ', NULL, NULL),
(787, 'ALBERTO', NULL, NULL, 'galfhord@gmail.com', NULL, NULL, 0, NULL, NULL, 'MONTENEGRO FLORES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40345649', NULL, '936778180', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRIS LIMA CENTRO', NULL, NULL),
(788, 'JOSE DARIO', NULL, NULL, 'josedariofs@gmail.com', NULL, NULL, 0, NULL, NULL, 'FRIAS SALAZAR', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '44782662', NULL, '951976170', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'RED CHICLAYO ', NULL, NULL),
(789, 'PALMIR', NULL, NULL, 'savialima_2000@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BUTRON LOAYZA', 'PERÚ', 'CUSCO', NULL, '1', '46386530', NULL, '957436784', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Regional del Cusco', NULL, NULL),
(790, 'ENRIQUE OMAR', NULL, NULL, 'perezunzueta@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ UNZUETA', 'PERÚ', 'OTRO', NULL, '1', '07502846', NULL, '995741260', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Ministerio de Salud - sede central ', NULL, NULL),
(791, 'JENNY', NULL, NULL, 'jennyhuamaninina@gmail.com', NULL, NULL, 0, NULL, NULL, 'NINAHUAMAN HUAMANI', 'PERÚ', 'ICA', NULL, '1', '43534774', NULL, '930807884', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Federico González Cabezudo', NULL, NULL),
(792, 'VIOLETA ELIZABETH', NULL, NULL, 'Violetaelizabeth18@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARPIO ESTUPIÑAN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42176182', NULL, '944653286', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Direda', NULL, NULL),
(793, 'Joelbis Alberto Maneiro Guevara', NULL, NULL, 'joelbis.a.maneiro.g@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'DIRIS LIMA NORTE', NULL, '2', '002277406', NULL, '935267904', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud Ermitaño Alto', NULL, NULL),
(794, 'CARMEN ROSA', NULL, NULL, 'camucharay16@hoilmail.com', NULL, NULL, 0, NULL, NULL, 'RAYMUNDO CORNEJO', 'PERÚ', 'ICA', NULL, '1', '21525344', NULL, '988665595', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'minsa', NULL, NULL),
(795, 'GIOVANA KATHERENE', NULL, NULL, 'katherene12@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MALDONADO RODRIGUEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44102863', NULL, '997032873', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Centro De Salud Villa Victoria ', NULL, NULL),
(796, 'ALDO WINSTON', NULL, NULL, 'aldito.afa@gmail.com', NULL, NULL, 0, NULL, NULL, 'FREYRE AREVALO', 'PERÚ', 'SAN MARTÍN', NULL, '1', '45132278', NULL, '998110461', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'HOSPITAL II-E BANDA DE SHILCAYO', NULL, NULL),
(797, 'FERNANDO', NULL, NULL, 'Sajami_122_music@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SAJAMI HUAYCAMA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '47507154', NULL, '962808281', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Instituto arzobispo loayza', NULL, NULL),
(798, 'VICTOR RAUL', NULL, NULL, 'victorsanz08@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ TORRES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43083629', NULL, '950316969', NULL, 'PÚBLICA', 'OTRA', 'CS Villa Victoria Porvenir ', NULL, NULL),
(799, 'CARLA ALEXANDRA', NULL, NULL, 'DRA.CARLALOPEZ77@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'LOPEZ MARTINEZ', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '70432027', NULL, '991604975', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CENTRO DE SALUD MENTAL COMUNITARIO VILLA EL SALVADOR', NULL, NULL),
(800, 'MARTHA HERMELINDA', NULL, NULL, 'hmarthasanti86@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANTILLAN NOLASCO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '43520834', NULL, '972035370', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Centro Materno Infantil Tahuantinsuyo Bajo', NULL, NULL),
(801, 'JOSELIN PAOLA', NULL, NULL, 'joselinfls_9@hotmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES VERA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46170009', NULL, '949082363', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Clínica aviva ', NULL, NULL),
(802, 'LISBETH NELLY', NULL, NULL, 'liz642@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MALASQUEZ ASTO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42811535', NULL, '989401999', NULL, 'PRIVADA', 'CIRUJANO DENTISTA', 'BRUMLAB', NULL, NULL),
(803, 'CHELSY ANN MARLENE', NULL, NULL, 'chelsy.leon.cornejo@gmail.com', NULL, NULL, 0, NULL, NULL, 'LEON CORNEJO', 'PERÚ', 'CALLAO', NULL, '1', '70432014', NULL, '981530196', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Diresa Callao', NULL, NULL),
(804, 'JENY JUANA', NULL, NULL, 'florjen72@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES CABALLERO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '09742472', NULL, '995888901', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Empresa ', NULL, NULL),
(805, 'HUGO ALBERTO', NULL, NULL, 'Hahs.hugo82@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMAN SANCHEZ', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42107765', NULL, '926113141', NULL, 'PRIVADA', 'OTRA', 'Particular', NULL, NULL),
(806, 'JENNY MARIBEL', NULL, NULL, 'Jennyroma23@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RICSE OSORIO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '21533322', NULL, '943365493', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Cayetano Heredia', NULL, NULL),
(807, 'JONATHAN ARTURO', NULL, NULL, 'Jonathan.Barraza.d@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARRAZA DURAND', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '40351425', NULL, '991880180', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Clínica Good Hope ', NULL, NULL),
(808, 'SARA', NULL, NULL, 'sarab77alz@gmail.com', NULL, NULL, 0, NULL, NULL, 'BECERRA ALVAREZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '19104276', NULL, '997629330', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Gran Teatro Nacional ', NULL, NULL),
(809, 'MARIBEL ELENA', NULL, NULL, 'elena24241212@gmail.com', NULL, NULL, 0, NULL, NULL, 'ORE ECHEVARRIA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '21134559', NULL, '984024593', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Essalud', NULL, NULL),
(810, 'ESPERANZA CELINA', NULL, NULL, 'esperanzacelina.robles@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROBLES VELARDE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08633927', NULL, '964336118', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'ESSALUD', NULL, NULL),
(811, 'JORGE LUIS', NULL, NULL, 'jorgehurtadoh@gmail.com', NULL, NULL, 0, NULL, NULL, 'HURTADO HERENCIA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '00406130', NULL, '969428226', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI SAN JOSE', NULL, NULL),
(812, 'ASTRID ALEJANDRA', NULL, NULL, 'Alejandra_r18@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PILCO ROJAS', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '45977583', NULL, '950536136', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Carlos Lan Franco Lahoz', NULL, NULL),
(813, 'EVELYN MILAGROS', NULL, NULL, 'eandradea5@gmail.com', NULL, NULL, 0, NULL, NULL, 'ANDRADE AVILA', 'PERÚ', 'LA LIBERTAD', NULL, '1', '47693885', NULL, '949750324', NULL, 'PÚBLICA', 'OTRA', 'Csmc señor de Gualamita ', NULL, NULL),
(814, 'EDGAR', NULL, NULL, 'Xiomaramerma@gmail.com', NULL, NULL, 0, NULL, NULL, 'PACORI QUISPE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45895594', NULL, '941776052', NULL, 'AMBOS', 'LIC. ENFERMERÍA', 'Minsa', NULL, NULL),
(815, 'MARIA AURORA', NULL, NULL, 'marisa2083@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANTUR CAMPOVERDE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '32979021', NULL, '995575813', NULL, 'PRIVADA', 'TÉCNICO EN ENFERMERÍA', 'Hospital Barthon ', NULL, NULL),
(816, 'NEISER ENZO', NULL, NULL, 'Neiserquinteros@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUINTEROS CASTILLO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45965954', NULL, '928987843', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital de Emergencias José Casimiro Ulloa', NULL, NULL),
(817, 'RUBEN RICARDO', NULL, NULL, 'ruben.lafose@gmail.com', NULL, NULL, 0, NULL, NULL, 'LAFOSE CALDERON', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06804617', NULL, '980293625', NULL, 'PÚBLICA', 'OTRA', 'DREC', NULL, NULL),
(818, 'EMMA', NULL, NULL, 'emma.beteta@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'BETETA JUSTO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41815730', NULL, '970515702', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Guillermo Almenara Irigoyen', NULL, NULL),
(819, 'PATRICIA IVONNE', NULL, NULL, 'patisa5@hotmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES PALOMINO', 'PERÚ', 'CUSCO', NULL, '1', '40416053', NULL, '997436105', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL ANTONIO LORENA ', NULL, NULL),
(820, 'ROSA MILAGROS', NULL, NULL, 'Mily194@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MONTALVO CASTRO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09671593', NULL, '930672118', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Santa maria ', NULL, NULL),
(821, 'ROCIO TERESA', NULL, NULL, 'RMENDOZAJ@HOTMAIL.COM', NULL, NULL, 0, NULL, NULL, 'MENDOZA JUGO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06801090', NULL, '993553126', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'FARMACIA LUCERO ', NULL, NULL),
(822, 'VICTOR HUGO RICARDO', NULL, NULL, 'vialso82@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALONZO SOLORZANO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '41602096', NULL, '971904866', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Lider Salud SAC', NULL, NULL),
(823, 'JOSE LUIS', NULL, NULL, 'jvillegasignacio@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLEGAS IGNACIO', 'PERÚ', 'CALLAO', NULL, '1', '07642548', NULL, '959948876', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Daniel Alcides Carrion', NULL, NULL),
(824, 'WAGNER ARMANDO', NULL, NULL, 'wagnerxcs@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAMACHO SALAS', 'PERÚ', 'MOQUEGUA', NULL, '1', '70016129', NULL, '964178412', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Samegua', NULL, NULL),
(825, 'LILIANA MARILIT', NULL, NULL, 'ldavilacoronel@gmail.com', NULL, NULL, 0, NULL, NULL, 'DAVILA CORONEL', 'PERÚ', 'AMAZONAS', NULL, '1', '43864334', NULL, '935696126', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'puesto de salud vista hermosa', NULL, NULL),
(826, 'ELITA', NULL, NULL, 'elitaruizcarhuajulca69@gmail.com', NULL, NULL, 0, NULL, NULL, 'RUIZ CARHUAJULCA', 'PERÚ', 'AMAZONAS', NULL, '1', '43514907', NULL, '932089165', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'puesto de salud santa clara', NULL, NULL),
(827, 'CESAR ARCANGEL', NULL, NULL, 'maydanavilcacesararcangel@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAYDANA VILCA', 'PERÚ', 'MOQUEGUA', NULL, '1', '70780863', NULL, '910316172', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS Puquina 2843', NULL, NULL),
(828, 'AYMEE JULIETA', NULL, NULL, 'huertasaymee4@gmail.co', NULL, NULL, 0, NULL, NULL, 'HUERTAS FLORES', 'PERÚ', 'MOQUEGUA', NULL, '1', '40141221', NULL, '959216455', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'P. S. Pacocha - Ilo ', NULL, NULL),
(829, 'DANIELA GINNA', NULL, NULL, 'dgalfarocampos@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALFARO CAMPOS', 'PERÚ', 'MOQUEGUA', NULL, '1', '70434208', NULL, '956288552', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS Mercado Central ', NULL, NULL),
(830, 'GIOVANNA', NULL, NULL, 'giovannamoranmontalvochyo@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORAN MONTANO DE CRISTOBAL', 'PERÚ', 'JUNÍN', NULL, '1', '10113727', NULL, '986617808', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Farmacia Nazarenas ', NULL, NULL),
(831, 'FANNY ANGELA', NULL, NULL, 'angelaaguilar813@gmail.com', NULL, NULL, 0, NULL, NULL, 'AGUILAR PAREDES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42169756', NULL, '952000946', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Instituto Nacional de Enfermedades Neoplasicas', NULL, NULL),
(832, 'CARLOS JORGE', NULL, NULL, 'mccjra@gmail.com', NULL, NULL, 0, NULL, NULL, 'REVILLA ARENAS', 'PERÚ', 'MOQUEGUA', NULL, '1', '29610009', NULL, '984350133', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud San Antonio ', NULL, NULL),
(833, 'WALTER MANUEL', NULL, NULL, 'alma_genesis2005@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARRILLO DELGADO', 'PERÚ', 'CALLAO', NULL, '1', '44444788', NULL, '994445675', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Callao Salud', NULL, NULL),
(834, 'VILMA YSABEL', NULL, NULL, 'yyatacop@gmail.com', NULL, NULL, 0, NULL, NULL, 'YATACO PEÑA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '41503613', NULL, '987729522', NULL, 'PÚBLICA', 'OTRA', 'Hospital Hermilio Valdizán ', NULL, NULL),
(835, 'HECTOR VICENTE', NULL, NULL, 'hectorvicentecollantes@gmail.com', NULL, NULL, 0, NULL, NULL, 'COLLANTES LAZO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '05374379', NULL, '996579788', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'INS', NULL, NULL),
(836, 'IDEL JESUS', NULL, NULL, 'eideljesus@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESPINOZA OBREGON', 'PERÚ', 'ANCASH', NULL, '1', '73245062', NULL, '954602016', NULL, 'PÚBLICA', 'OTRA', '86906', NULL, NULL),
(837, 'AMADO NICOLAS', NULL, NULL, 'Amado.jaranina18@gmail.com', NULL, NULL, 0, NULL, NULL, 'JARA NINA', 'PERÚ', 'AREQUIPA', NULL, '1', '40591580', NULL, '958671221', NULL, 'PRIVADA', 'INGENIERÍA', 'Corporación Axion', NULL, NULL),
(838, 'MARIA ELENA', NULL, NULL, 'mariedoctora1@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARDALES ANDRADE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07908596', NULL, '984312069', NULL, 'PÚBLICA', 'OTRA', 'Hospital Víctor Larco Herrera ', NULL, NULL),
(839, 'FANNY LINDA', NULL, NULL, 'fannyvr@outlook.com', NULL, NULL, 0, NULL, NULL, 'SIERRA RAMIREZ', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '08657619', NULL, '980520491', NULL, 'PÚBLICA', 'OTRA', '7226', NULL, NULL),
(840, 'SARA ELIZABETH', NULL, NULL, 'SHALANOCCA@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'HALANOCCA MORENO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41761288', NULL, '961813390', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'INSNSB', NULL, NULL),
(841, 'GLADYS SONIA', NULL, NULL, 'nlaly110575@gmail.com', NULL, NULL, 0, NULL, NULL, 'NEYRA ALEGRE', 'PERÚ', 'CALLAO', NULL, '1', '31672747', NULL, '942009600', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CS ENRIQUE MILLA OCHOA DIRIS LIMA NORTE', NULL, NULL),
(842, 'ALFREDO', NULL, NULL, 'alfredo2891@yahoo.es', NULL, NULL, 0, NULL, NULL, 'TUMI FIGUEROA', 'PERÚ', 'PUNO', NULL, '1', '41454635', NULL, '987231786', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Universidad Nacional del Altiplano ', NULL, NULL),
(843, 'MARIA ELENA', NULL, NULL, 'Elena_meza61@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MEZA LOPEZ DE PALACIOS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10474748', NULL, '999497719', NULL, 'PÚBLICA', 'OTRA', 'Instituto Nacional de Salud', NULL, NULL),
(844, 'WALTHER YOSEPPY', NULL, NULL, 'medicinadmyp@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CUBAS AYASTA', 'PERÚ', 'CAJAMARCA', NULL, '1', '10430949', NULL, '964519350', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital José Soto cadenillas ', NULL, NULL),
(845, 'EDITH JACINTA', NULL, NULL, 'emoralesr2981@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORALES RIOS', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '40865361', NULL, '944666876', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'Instituto Nacional de Salud ', NULL, NULL),
(846, 'ILA LORENZA', NULL, NULL, 'ila.chirinos@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'CHIRINOS ROJAS', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '47300295', NULL, '939543956', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Privado', NULL, NULL),
(847, 'PATRICIA SANDRA', NULL, NULL, 'Sandra_3519@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PACHECO ARIAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09760028', NULL, '996005071', NULL, 'PÚBLICA', 'OTRA', 'EP ', NULL, NULL),
(848, 'GÉNESIS LESLIE', NULL, NULL, 'takima_07@hotmail.com', NULL, NULL, 0, NULL, NULL, 'IZQUIERDO LOARTE', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '70461790', NULL, '994600665', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Barranca Cajatambo ', NULL, NULL),
(849, 'CHRISTIAN CESAR', NULL, NULL, 'pekina2002888@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARPIO LLERENA', 'PERÚ', 'ICA', NULL, '1', '41111208', NULL, '941544672', NULL, 'PRIVADA', 'CIRUJANO DENTISTA', 'Consultorio dental', NULL, NULL),
(850, 'NORMA EDITH', NULL, NULL, 'normae1810@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MOQUILLAZA PACCO', 'PERÚ', 'ICA', NULL, '1', '21496671', NULL, '970077735', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S. CASTROVIRREYNA ', NULL, NULL),
(851, 'JOSE LUIS', NULL, NULL, 'jdonayre225@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES CHUQUITAYPE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41604890', NULL, '989676298', NULL, 'PÚBLICA', 'OTRA', 'HOSPITAL NACIONAL DOCENTE MADRE NIÑO SAN BARTOLOME', NULL, NULL),
(852, 'FANNY MARIBEL', NULL, NULL, 'fcampos@hvlh.gob.pe', NULL, NULL, 0, NULL, NULL, 'CAMPOS CAHUA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40125656', NULL, '991635937', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'HOSPITAL VICTOR LARCO HERRERA', NULL, NULL),
(853, 'JANETH CINTHIA', NULL, NULL, 'jeanet_78_49@hotmail.com', NULL, NULL, 0, NULL, NULL, 'INGA ESCOBAR', 'PERÚ', 'HUANCAVELICA', NULL, '1', '46040881', NULL, '947451241', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Castrovirreyna', NULL, NULL),
(854, 'MARIA ELENA', NULL, NULL, 'mmunozz1@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'MUÑOZ ZAMBRANO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06592866', NULL, '945455887', NULL, 'PÚBLICA', 'OTRA', 'Instituto Nacional de Salud', NULL, NULL),
(855, 'EVANGELINA RITA', NULL, NULL, 'EVARITARAMOS9@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'RAMOS CALLATA', 'PERÚ', 'MOQUEGUA', NULL, '1', '00453967', NULL, '957816164', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'MINSA/ CENTRO DE SALUD SAN ANTONIO', NULL, NULL),
(856, 'KATERINY MARGOT', NULL, NULL, 'katyreg28@gmail.com', NULL, NULL, 0, NULL, NULL, 'REGALADO RODRIGUEZ', 'PERÚ', 'AMAZONAS', NULL, '1', '76974372', NULL, '901961532', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S. Cumba', NULL, NULL),
(857, 'YULIANA DUJAMEL', NULL, NULL, 'lilianadujamelhanccochacon@gmail.com', NULL, NULL, 0, NULL, NULL, 'HANCCO CHACON', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '73577573', NULL, '931861070', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Asilo', NULL, NULL),
(858, 'WILDER YOSSIPH', NULL, NULL, 'yossiph.macahuachi@gmail.com', NULL, NULL, 0, NULL, NULL, 'MACAHUACHI CARDENAS', 'PERÚ', 'UCAYALI', NULL, '1', '70747254', NULL, '912224734', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'Red de Salud Federico Basadre', NULL, NULL),
(859, 'RITA MARIBEL', NULL, NULL, 'ritasalas@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SALAS ZEGARRA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '09935666', NULL, '999676893', NULL, 'AMBOS', 'LIC. OBSTETRICIA', 'CENTRO MATERNO INFANTIL SANTA LUZMILA II ', NULL, NULL),
(860, 'NEVENKA', NULL, NULL, 'mosca_139@hotmail.com', NULL, NULL, 0, NULL, NULL, 'FERNANDEZ CHAMBI', 'PERÚ', 'APURÍMAC', NULL, '1', '42259851', NULL, '960742472', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'C.s.bellavista', NULL, NULL),
(861, 'CRISTIAN PAOLO', NULL, NULL, 'crpao710@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES APARCO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '74999530', NULL, '934370555', NULL, 'PÚBLICA', 'OTRA', 'DIRIS LIMA ESTE', NULL, NULL),
(862, 'MERY MARGOT', NULL, NULL, 'merymargot@hotmail.com', NULL, NULL, 0, NULL, NULL, 'JOACHIN DEL CARPIO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40916720', NULL, '998844787', NULL, 'PÚBLICA', 'OTRA', 'HOSPITAL SAN JUAN DE LURIGANCHO ', NULL, NULL),
(863, 'ANGIE KIARA', NULL, NULL, 'AK.PARRAGA@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'PARRAGA CONTRERAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '47261561', NULL, '993347280', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA', NULL, NULL),
(864, 'CELSO MANUEL', NULL, NULL, 'chuamanc@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'HUAMAN CORREA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '06922375', NULL, '989099389', NULL, 'PÚBLICA', 'OTRA', 'ESSALUD - UNMSM', NULL, NULL),
(865, 'GINA', NULL, NULL, 'ginam120@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MEJIA HUACAC', 'PERÚ', 'CUSCO', NULL, '1', '40426394', NULL, '942386815', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'RED DE SERVICIOS DE SALUD LA CONVENCION', NULL, NULL),
(866, 'GREASE GIANNINA', NULL, NULL, 'greizla@hotmail.com', NULL, NULL, 0, NULL, NULL, 'IZQUIERDO LARICO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42734494', NULL, '992605402', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'CMI Daniel Alcides Carrión ', NULL, NULL),
(867, 'JESUS DEL PILAR', NULL, NULL, 'pilarcasac@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASAHUAMAN CORDOVA', 'PERÚ', 'ANCASH', NULL, '1', '07595592', NULL, '943066410', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'HOSPITAL REGIONAL ELEAZAR GUZMÁN BARRÓN ', NULL, NULL),
(868, 'MARKO ANTONIO', NULL, NULL, 'marko.correa.b@gmail.com', NULL, NULL, 0, NULL, NULL, 'CORREA AGUILAR', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45225923', NULL, '949219866', NULL, 'PÚBLICA', 'OTRA', 'DIRIS LIMA CENTRO', NULL, NULL),
(869, 'GILMER MANUEL', NULL, NULL, 'gilmer.asencio.92@gmail.com', NULL, NULL, 0, NULL, NULL, 'ASENCIO ORTIZ', 'PERÚ', 'LORETO', NULL, '1', '70520696', NULL, '950933778', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'HOSPITAL II-2 SANTA GEMA DE YURIMAGUAS', NULL, NULL),
(870, 'ROXANA', NULL, NULL, 'vargasmejiaroxana5@gmail.com', NULL, NULL, 0, NULL, NULL, 'VARGAS MEJIA', 'PERÚ', 'CUSCO', NULL, '1', '40645116', NULL, '974584712', NULL, 'PÚBLICA', 'OTRA', 'Hospital santo tomás', NULL, NULL),
(871, 'THANIA FLOR', NULL, NULL, 'Thanianet7@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUEVA LOPEZ', 'PERÚ', 'ANCASH', NULL, '1', '42533256', NULL, '957850886', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Red de Salud Conchucos Norte', NULL, NULL),
(872, 'JESSICA LIZETH', NULL, NULL, 'Jessica@growthMindset.pe', NULL, NULL, 0, NULL, NULL, 'LIÑAN RIVERA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42222219', NULL, '977482330', NULL, 'PRIVADA', 'OTRA', 'Growth Mindeset', NULL, NULL),
(873, 'SANDRA BEATRIZ', NULL, NULL, 'Sandra24_60@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PUENTE PATILONGO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43075625', NULL, '990104852', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Inntraser ', NULL, NULL),
(874, 'SUCETH CAREEN', NULL, NULL, 'careen17@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SUMA MEJIA', 'PERÚ', 'CUSCO', NULL, '1', '46979304', NULL, '969776752', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CENTRO DE SALUD MENTAL COMUNITARIO SICUANI', NULL, NULL),
(875, 'GLENY ROSARIO', NULL, NULL, 'Glenyshita@gmail.com', NULL, NULL, 0, NULL, NULL, 'OLIVERA DELGADO', 'PERÚ', 'CALLAO', NULL, '1', '07398722', NULL, '994319768', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital de Ventanilla', NULL, NULL),
(876, 'ALEX YVÁN', NULL, NULL, 'alex_escobedo@usmp.pe', NULL, NULL, 0, NULL, NULL, 'ESCOBEDO HINOSTROZA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '47407675', NULL, '943184317', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL NACIONAL HIPOLITO UNANUE', NULL, NULL),
(877, 'FRANCISCO', NULL, NULL, 'francisco.valdes@softtek.com', NULL, NULL, 0, NULL, NULL, 'VALDES MONGES', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43579485', NULL, '952097664', NULL, 'PRIVADA', 'INGENIERÍA', 'Softtek', NULL, NULL),
(878, 'MASSIEL TERESA', NULL, NULL, 'massyhm.11@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUANCA MACHON', 'PERÚ', 'AREQUIPA', NULL, '1', '72851382', NULL, '969717243', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Cd Conduriri ', NULL, NULL),
(879, 'HANS WILLIANS', NULL, NULL, 'hanswillians38@gmail.com', NULL, NULL, 0, NULL, NULL, 'SEAS NOLAZCO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '72526686', NULL, '991786183', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'centro de salud López silva', NULL, NULL),
(880, 'AMELIA DEL ROSARIO', NULL, NULL, 'amegeri@gmail.com', NULL, NULL, 0, NULL, NULL, 'OLORTEGUI MONCADA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08659985', NULL, '999457170', NULL, 'PRIVADA', 'OTRA', 'Hospital  Fuerza Aérea Peruana', NULL, NULL),
(881, 'MIRIAM ELIZABETH', NULL, NULL, 'mikipineda0709@gmail.com', NULL, NULL, 0, NULL, NULL, 'PINEDA GONZALES', 'PERÚ', 'PUNO', NULL, '1', '01309334', NULL, '995646420', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'hospital carlos cornejo rosello', NULL, NULL),
(882, 'ESTEBAN DIOMEDES', NULL, NULL, 'estebanriveracarrera@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERA CARRERA', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '15217146', NULL, '992135465', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRECCION REGIONAL DE SALUD DE MADRE DE DIOS', NULL, NULL),
(883, 'CHARLIE OMAR', NULL, NULL, 'charlieomar0101@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SAAVEDRA CAREY', 'PERÚ', 'LORETO', NULL, '1', '45708256', NULL, '948866332', NULL, 'PÚBLICA', 'OTRA', 'GERESA LORETO', NULL, NULL),
(884, 'JUAN ENRIQUE', NULL, NULL, 'Juan.zegarra@hkperu.com', NULL, NULL, 0, NULL, NULL, 'ZEGARRA PALACIOS', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '43710795', NULL, '963400563', NULL, 'PRIVADA', 'ADMINISTRADOR', 'HK PERÚ ', NULL, NULL),
(885, 'FREDDY WILLIAM', NULL, NULL, 'fredcob@hotmail.com', NULL, NULL, 0, NULL, NULL, 'COCA BORJA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '15739342', NULL, '964578406', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Victor Larco Herrera ', NULL, NULL),
(886, 'ANDREA KATHERINE', NULL, NULL, 'andrea_kvg_18@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GUILLEN VARGAS', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '46825763', NULL, '993491416', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'CENTRO DE SALUD AGUSTINO', NULL, NULL),
(887, 'FRED GUSTAVO', NULL, NULL, 'fredpinillos@gmail.com', NULL, NULL, 0, NULL, NULL, 'PINILLOS LLANOS', 'PERÚ', 'CALLAO', NULL, '1', '25706466', NULL, '918500559', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'DIRESA CALLAO', NULL, NULL),
(888, 'ERIKA LILIANA', NULL, NULL, 'Erikainga87@gamil.com', NULL, NULL, 0, NULL, NULL, 'INGA PALOMINO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44263622', NULL, '937189747', NULL, 'PÚBLICA', 'OTRA', 'Hospital Victor Larco Herrera', NULL, NULL),
(889, 'LIZETH', NULL, NULL, 'lizethgc369@gmail.com', NULL, NULL, 0, NULL, NULL, 'GOMEZ CARLIN', 'PERÚ', 'CUSCO', NULL, '1', '72079422', NULL, '983123737', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Consultorio privado', NULL, NULL),
(890, 'ALISON MARGARITA', NULL, NULL, 'alisoncuyutupa@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUYUTUPA FUENTES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '43378817', NULL, '922466845', NULL, 'PRIVADA', 'OTRA', 'Autónoma del Perú', NULL, NULL),
(891, 'OMAR JOSUE', NULL, NULL, 'omar.lozanodaza@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOZANO DAZA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '06806046', NULL, '989453893', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'SENASA', NULL, NULL),
(892, 'FANY', NULL, NULL, 'telemedicinageresacusco@gmail.com', NULL, NULL, 0, NULL, NULL, 'CONDORI PINTO', 'PERÚ', 'CUSCO', NULL, '1', '42406944', NULL, '962217098', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'GERESA CUSCO', NULL, NULL),
(893, 'JESSICA', NULL, NULL, 'naje_na@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SEAS NOLAZCO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '10601834', NULL, '914977350', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'P.S ALTO HUAMPANI', NULL, NULL),
(894, 'VICTOR CLAUDIO', NULL, NULL, 'dr.arenasocampov@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARENAS OCAMPO', 'PERÚ', 'CUSCO', NULL, '1', '46696855', NULL, '983873853', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA', NULL, NULL),
(895, 'JEANNELLY PAOLA', NULL, NULL, 'paola.cabrera@uwiener.edu.pe', NULL, NULL, 0, NULL, NULL, 'CABRERA ESPEZUA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '48832154', NULL, '935021894', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Universidad Norbert Wiener ', NULL, NULL),
(896, 'MARITZA', NULL, NULL, 'eany1410@gmail.com', NULL, NULL, 0, NULL, NULL, 'DUEÑAS ALAGON', 'PERÚ', 'CUSCO', NULL, '1', '46288080', NULL, '996206054', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'hospital quillabamba ', NULL, NULL),
(897, 'GABRIELA LUCIANA MERCEDES', NULL, NULL, 'glmvz2804@gmail.com', NULL, NULL, 0, NULL, NULL, 'VELASQUEZ ZAPATA', 'PERÚ', 'APURÍMAC', NULL, '1', '70925627', NULL, '969821007', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'PS. PARIABAMBA ', NULL, NULL),
(898, 'SHEILA MADELEINE', NULL, NULL, 'sheilaandia2@gmail.com', NULL, NULL, 0, NULL, NULL, 'ANDIA GOMEZ', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '47608813', NULL, '997978597', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'INSTITUTO NACIONAL DE REHABILITACION', NULL, NULL),
(899, 'GLADYS OFELIA', NULL, NULL, 'gladysth20@gmail.com', NULL, NULL, 0, NULL, NULL, 'TUNCO HUAMANI', 'PERÚ', 'AREQUIPA', NULL, '1', '42033352', NULL, '958715129', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'INABIF ', NULL, NULL),
(900, 'ANA ROSMERY', NULL, NULL, 'anitarsc92@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOTO CARRION', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '15865459', NULL, '939285480', NULL, 'PÚBLICA', 'INGENIERÍA', 'Hospital de Emergencias Pediatricas', NULL, NULL),
(901, 'LORENZO', NULL, NULL, 'lorenzo.rolandi@uwiener.edu.pe', NULL, NULL, 0, NULL, NULL, 'ROLANDI CAVALLERO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '06624098', NULL, '977506649', NULL, 'PRIVADA', 'OTRA', 'UNIVERSIDAD NORBERT WIENER', NULL, NULL),
(902, 'NELLY', NULL, NULL, 'nellypancca@gmail.com', NULL, NULL, 0, NULL, NULL, 'RUIZ PANCCA', 'PERÚ', 'MOQUEGUA', NULL, '1', '40199774', NULL, '978633581', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Centro de salud pampa Inalambrica Ilo- Moquegua ', NULL, NULL),
(903, 'XAVIER EDUARDO', NULL, NULL, 'xavier43097282@gmail.com', NULL, NULL, 0, NULL, NULL, 'GALVEZ COELLO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '43097282', NULL, '993647349', NULL, 'PÚBLICA', 'OTRA', 'Instituto Nacional de Rehabilitación Dra adriana Rebaza Flores ', NULL, NULL),
(904, 'BERTHA', NULL, NULL, 'alanya.bq@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE ALANYA', 'PERÚ', 'APURÍMAC', NULL, '1', '46139347', NULL, '966722389', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.S ANDARAPA', NULL, NULL),
(905, 'LEYLA LISETT', NULL, NULL, 'leyla.ruiz@axessnet.com', NULL, NULL, 0, NULL, NULL, 'RUIZ BARRIOS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42722118', NULL, '957040060', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Axess Networks', NULL, NULL),
(906, 'CARLOS ALFREDO', NULL, NULL, 'caralmuru10@gmail.com', NULL, NULL, 0, NULL, NULL, 'MUNIVE RUBIO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41572850', NULL, '902758867', NULL, 'PÚBLICA', 'OTRA', 'Hospital Victor Larco Herrera ', NULL, NULL),
(907, 'MARIA NIDIA', NULL, NULL, 'marianidiatt@gmail.com', NULL, NULL, 0, NULL, NULL, 'TICONA TICONA', 'PERÚ', 'PUNO', NULL, '1', '76912224', NULL, '951668760', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'UANCV', NULL, NULL),
(908, 'EMILIO ALEJANDRO', NULL, NULL, 'Digtel212@minsa.gob.pe', NULL, NULL, 0, NULL, NULL, 'APARCANA ESPINO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '70199768', NULL, '999999999', NULL, 'PÚBLICA', 'INGENIERÍA', 'Minsa', NULL, NULL),
(909, 'JACKILYN EDITH', NULL, NULL, 'jackelyn_2@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MANGO GUZMAN DE CARACELA', 'PERÚ', 'AREQUIPA', NULL, '1', '41845193', NULL, '989033201', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'CS EL CARMEN', NULL, NULL),
(910, 'DEYSI BETSY', NULL, NULL, 'deysisitabetsy@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARAPA QUISOCALA', 'PERÚ', 'AREQUIPA', NULL, '1', '72228278', NULL, '952473090', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S San Gregorio ', NULL, NULL),
(911, 'DANIEL ANGEL', NULL, NULL, 'daniel.angulo@uwiener.edu.pe', NULL, NULL, 0, NULL, NULL, 'ANGULO POBLETE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10196314', NULL, '999287752', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Universidad Norbert Wiener ', NULL, NULL),
(912, 'EFRAIN', NULL, NULL, 'salas1357@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALAS SALAS', 'PERÚ', 'MOQUEGUA', NULL, '1', '01338115', NULL, '931935671', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'cs carumas', NULL, NULL),
(913, 'JUAN VICTOR', NULL, NULL, 'juanrivbar@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVERA BARZOLA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '43662803', NULL, '988128521', NULL, 'PÚBLICA', 'INGENIERÍA', 'CENTRO DE SALUD CLAS JUAN PABLO II - MANCHAY - PACHACAMAC', NULL, NULL),
(914, 'EILEEN VANESSA', NULL, NULL, 'evsa75@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SARMIENTO ARBOLEDA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '16729834', NULL, '999416151', NULL, 'PÚBLICA', 'OTRA', 'ESSALUD', NULL, NULL),
(915, 'ALVARO LAZARO', NULL, NULL, 'alvarova2000@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VELASQUEZ ACOSTA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06891945', NULL, '926057519', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Victor larco Herrera ', NULL, NULL),
(916, 'CARMEN EUFEMIA', NULL, NULL, 'eufe1994@hotmail.com', NULL, NULL, 0, NULL, NULL, 'TAPIA GARRIDO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '71245413', NULL, '929557372', NULL, 'PRIVADA', 'INGENIERÍA', 'VICKY', NULL, NULL),
(917, 'ELISBAN ISAAC', NULL, NULL, 'dr_evz@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VERA ZEBALLOS', 'PERÚ', 'AREQUIPA', NULL, '1', '04437780', NULL, '942551939', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'IREN SUR ', NULL, NULL),
(918, 'DIANA', NULL, NULL, 'dianaalegria.obst@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALEGRIA DELGADO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '42897382', NULL, '951537087', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'HOSPITAL DE EMERGENCIAS VILLA EL SALVADOR', NULL, NULL),
(919, 'JESUS SAMUEL', NULL, NULL, 'jesam25@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARRIOS ROJAS', 'PERÚ', 'JUNÍN', NULL, '1', '41662278', NULL, '949001818', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Gobierno Regional de Junín', NULL, NULL),
(920, 'KATHERINE JANNETTE', NULL, NULL, 'kprendice@gmail.com', NULL, NULL, 0, NULL, NULL, 'PRENDICE YOUNG', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40693924', NULL, '937641832', NULL, 'PRIVADA', 'INGENIERÍA', 'SOFTTEK', NULL, NULL),
(921, 'SANTIAGO JOSE', NULL, NULL, 'smoquillaza18@gmail.com', NULL, NULL, 0, NULL, NULL, 'MOQUILLAZA CACERES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72190619', NULL, '987780125', NULL, 'PÚBLICA', 'OTRA', 'CDC MINSA', NULL, NULL),
(922, 'LUZ TERESA', NULL, NULL, 'luzchambilla@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHAMBILLA CUSICANQUI', 'PERÚ', 'TACNA', NULL, '1', '00410856', NULL, '966698325', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRESA TACNA', NULL, NULL),
(923, 'ALEJANDRO', NULL, NULL, 'asanchezp@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'SANCHEZ PORTILLO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06973298', NULL, '959139482', NULL, 'PÚBLICA', 'OTRA', 'Universidad Nacional Mayor de San Marcos', NULL, NULL),
(924, 'LAURA ISABEL', NULL, NULL, 'laura.ramirez@softtek.com', NULL, NULL, 0, NULL, NULL, 'RAMIREZ MALDONADO DE TIPIANI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45391498', NULL, '978469574', NULL, 'PRIVADA', 'INGENIERÍA', 'Softtek', NULL, NULL),
(925, 'CYNTHIA KATHERINE', NULL, NULL, 'poma.ckps@gmail.com', NULL, NULL, 0, NULL, NULL, 'POMA SALINAS', 'PERÚ', 'CALLAO', NULL, '1', '73314957', NULL, '922277809', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'INSTITUTO NACIONAL DEL NIÑO', NULL, NULL),
(926, 'CRISTHIAN JOSE LUIS', NULL, NULL, 'cristhian.arias.venturo@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARIAS VENTURO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '44457359', NULL, '931873807', NULL, 'PRIVADA', 'ADMINISTRADOR', 'SOFTTEK', NULL, NULL),
(927, 'ROY RONALD', NULL, NULL, 'comercial@cytperu.com', NULL, NULL, 0, NULL, NULL, 'DAGA SOLIS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41485778', NULL, '915193898', NULL, 'PRIVADA', 'OTRA', 'Ciencia y Tecnología Perú S.R.L', NULL, NULL),
(928, 'ESTEFANIA ASTRID', NULL, NULL, 'astrid.2208@gmail.com', NULL, NULL, 0, NULL, NULL, 'APAZA PALOMINO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '44775273', NULL, '993372030', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital de emergencias villa el salvador ', NULL, NULL),
(929, 'GLORIA YSAURA', NULL, NULL, 'glory.rengifo@gmail.com', NULL, NULL, 0, NULL, NULL, 'RENGIFO VILCHEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07970837', NULL, '963353274', NULL, 'PRIVADA', 'OTRA', 'Su casa', NULL, NULL),
(930, 'RAYSA JOHANA', NULL, NULL, 'Raysa.carbajal.heves@gmail.com', NULL, NULL, 0, NULL, NULL, 'CARBAJAL SOMOZA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '74694988', NULL, '981869860', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'HOSPITAL DE EMERGENCIAS VILLA EL SALVADOR ', NULL, NULL),
(931, 'JEAN PHILIPP', NULL, NULL, 'jeanndp3@gmail.com', NULL, NULL, 0, NULL, NULL, 'NUÑEZ DEL PRADO MURILLO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '23995741', NULL, '975415615', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Hermilio Valdizan', NULL, NULL),
(932, 'ZABDIEL MARIO', NULL, NULL, 'zabdiel.cayo@outlook.com', NULL, NULL, 0, NULL, NULL, 'CAYO MAMANI', 'PERÚ', 'TACNA', NULL, '1', '71779532', NULL, '985248182', NULL, 'PÚBLICA', 'OTRA', 'HOSPITAL HIPOLITO UNANUE DE TACNA', NULL, NULL),
(933, 'YENI MAYER', NULL, NULL, 'jenifer_15_93@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PACO RODRIGUEZ', 'PERÚ', 'TACNA', NULL, '1', '72225117', NULL, '988007723', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Hospital Hipólito Unanue de Tacna ', NULL, NULL),
(934, 'JACKELINE PRISCILA', NULL, NULL, 'enarmjackeline@gmail.com', NULL, NULL, 0, NULL, NULL, 'BELLIDO FARFAN', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '48542852', NULL, '940187626', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Puesto de salud Laberinto ', NULL, NULL),
(935, 'JESSICA MARIANELLA', NULL, NULL, 'jmqcarrasco@yahoo.com', NULL, NULL, 0, NULL, NULL, 'QUIROZ CARRASCO', 'PERÚ', 'TACNA', NULL, '1', '00683430', NULL, '999320800', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS metropolitano ', NULL, NULL),
(936, 'EDWIN ARTURO', NULL, NULL, 'arturo.vidal@cytperu.com', NULL, NULL, 0, NULL, NULL, 'VIDAL BENAVIDES', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10782268', NULL, '997286502', NULL, 'PRIVADA', 'ADMINISTRADOR', 'CIENCIA Y TECNOLOGIA PERU SRL', NULL, NULL),
(937, 'OSCAR AUGUSTO', NULL, NULL, 'augusto.lengua@pucp.pe', NULL, NULL, 0, NULL, NULL, 'LENGUA OLIVARES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '47233325', NULL, '970400846', NULL, 'PRIVADA', 'OTRA', 'Expertta', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(938, 'MIRIAN KARINA', NULL, NULL, 'Mikava25@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALLE CASTRO', 'PERÚ', 'TACNA', NULL, '1', '00514623', NULL, '977507781', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Hipólito Unanue ', NULL, NULL),
(939, 'RODIL ARNOLD', NULL, NULL, 'rodilaic1@gmail.com', NULL, NULL, 0, NULL, NULL, 'ILLA CONDEMAYTA', 'PERÚ', 'TACNA', NULL, '1', '45523577', NULL, '996355648', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Cs vista alegre ', NULL, NULL),
(940, 'DENNIS LUIS', NULL, NULL, 'dpaucaraliaga@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAUCAR ALIAGA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41426203', NULL, '994636786', NULL, 'PÚBLICA', 'OTRA', 'CSMC Lima Cercado / CSMCU San Marcos', NULL, NULL),
(941, 'ELIZENDA ORIANA', NULL, NULL, 'orieli2@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LAURA ATENCIO', 'PERÚ', 'TACNA', NULL, '1', '42647393', NULL, '959509131', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'CS Viñani ', NULL, NULL),
(942, 'MARTIN OSWALDO', NULL, NULL, 'imacamera_2000@yahoo.com', NULL, NULL, 0, NULL, NULL, 'PALACIOS FERNANDEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07386102', NULL, '953003607', NULL, 'PRIVADA', 'OTRA', 'San juan Bosco', NULL, NULL),
(943, 'HUMBERTO ALFREDO', NULL, NULL, 'Humbertoalfredo.eusebi@pfizer.com', NULL, NULL, 0, NULL, NULL, 'EUSEBI CHIRINOS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09396429', NULL, '986190513', NULL, 'PRIVADA', 'INGENIERÍA', 'Pfizer SA', NULL, NULL),
(944, 'VALYA  IRENE', NULL, NULL, 'valyaberetta@gmail.com', NULL, NULL, 0, NULL, NULL, 'BERETTA MARTINEZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '70251534', NULL, '991568818', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS AMAKELLA DIRIS LIMA NORTE MINSA', NULL, NULL),
(945, 'TAMMY GEANPEARE', NULL, NULL, 'gmarcosalas@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARCOS SALAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42761246', NULL, '996462708', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Ministerio de Salud', NULL, NULL),
(946, 'BRUCE ERIK', NULL, NULL, 'brucepemar@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEÑA MARTINEZ', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '45667117', NULL, '952525953', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL JOSÉ AGURTO TELLO DE CHOSICA', NULL, NULL),
(947, 'MONICA WENDY', NULL, NULL, 'gargurevichmonica@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARGUREVICH ANTICONA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '09676560', NULL, '997297783', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL JOSE AGURTO TELLO DE CHOSICA', NULL, NULL),
(948, 'BRAHIANG BERNNY', NULL, NULL, 'branufe@hotmail.com', NULL, NULL, 0, NULL, NULL, 'NUÑEZ FERNANDEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41367698', NULL, '975031194', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'ESSALUD', NULL, NULL),
(949, 'Norelki Carolina Coa Barcelo', NULL, NULL, 'Carolinacoa1989@hotmail.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '2', '002165443', NULL, '988522088', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Expertta', NULL, NULL),
(950, 'MARICIELO DE JESUS', NULL, NULL, 'cielovaldivia.0702@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALDIVIA NAVARRO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '70184289', NULL, '904351201', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Expertta Salud', NULL, NULL),
(951, 'YORGELIS GIL SANCHEZ', NULL, NULL, 'YORGELISGABRIELAGIL@GMAIL.COM', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'LIMA REGIÓN', NULL, '2', '005773520', NULL, '949455583', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'EXPERTTA SALUD', NULL, NULL),
(952, 'MARIA JESUS', NULL, NULL, 'majitabossio2016@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMAN BOSSIO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72107527', NULL, '993602167', NULL, 'AMBOS', 'TÉCNICO EN ENFERMERÍA', 'Clinica San Felipe ', NULL, NULL),
(953, 'ROBERTO BASILIO', NULL, NULL, 'rqhispe@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE VILCA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '21449108', NULL, '956738204', NULL, 'PÚBLICA', 'ECONOMISTA', 'Instituto Nacional de Salud - INS- MINSA', NULL, NULL),
(954, 'ANGELA TEODOSIA', NULL, NULL, 'acuary22_01@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHAVEZ PIÑAN', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '43553271', NULL, '999662509', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'HEVES', NULL, NULL),
(955, 'SANDRA JULISSA', NULL, NULL, 'sandrajuly@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ ALBAN', 'PERÚ', 'PIURA', NULL, '1', '02873588', NULL, '998770053', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'E.S. I-4 La Unión ', NULL, NULL),
(956, 'LENER DARWIN', NULL, NULL, 'lener.laurel@gmail.com', NULL, NULL, 0, NULL, NULL, 'LAUREL RUIZ', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '45335157', NULL, '943790630', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital José agurto Tello de chosica ', NULL, NULL),
(957, 'JORGE JEAMPIER', NULL, NULL, 'Jorjeamps@gmail.com', NULL, NULL, 0, NULL, NULL, 'PUQUIO SANTILLAN', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '46421407', NULL, '995484029', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Hospital Nacional Cayetano Heredia ', NULL, NULL),
(958, 'CESAR ALBERTO', NULL, NULL, 'cbert_023@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MECHATO RUIZ', 'PERÚ', 'PIURA', NULL, '1', '44992347', NULL, '983068122', NULL, 'PÚBLICA', 'OTRA', 'E. S. I-4 La Unión ', NULL, NULL),
(959, 'AIDA', NULL, NULL, 'aidavidalgonzalez73@gmail.com', NULL, NULL, 0, NULL, NULL, 'VIDAL GONZÁLEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '49080276', NULL, '915145332', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA', NULL, NULL),
(960, 'KEILA NATALIA', NULL, NULL, 'b2b@revivevirtual.com', NULL, NULL, 0, NULL, NULL, 'GUEVARA PEREZ', 'COLOMBIA', 'OTRO', NULL, '2', '74280731', NULL, '952842623', NULL, 'PRIVADA', 'INGENIERÍA', 'REVIVE Entrenamiento Médico Integral sas.', NULL, NULL),
(961, 'DANNY DANIEL', NULL, NULL, 'dabavtec182@gmail.com', NULL, NULL, 0, NULL, NULL, 'VITE BANCAYAN', 'PERÚ', 'PIURA', NULL, '1', '40033950', NULL, '903219208', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'ESI3 TACALA', NULL, NULL),
(962, 'BEATRIZ NELLY', NULL, NULL, 'beatrizcch364@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASAS CHARAJA', 'PERÚ', 'TACNA', NULL, '1', '42111464', NULL, '968818373', NULL, 'PÚBLICA', 'OTRA', 'CENTRO DE SALUD AUGUSTO B . LEGUIA- TACNA', NULL, NULL),
(963, 'Daniel  Aguilar  Morales ', NULL, NULL, 'daguilarm@softtek.com', NULL, NULL, 0, NULL, NULL, NULL, 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '2', '001441551', NULL, '941102526', NULL, 'PRIVADA', 'OTRA', 'Softtek ', NULL, NULL),
(964, 'LUISA CONSUELO', NULL, NULL, 'luchi.rs10@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS SILVA', 'PERÚ', 'TACNA', NULL, '1', '00431314', NULL, '952921418', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'C.S. LEGUIA ', NULL, NULL),
(965, 'MARISOL DALILA', NULL, NULL, 'ecologica_95@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GOMEZ LUNA', 'PERÚ', 'HUANCAVELICA', NULL, '1', '21128417', NULL, '988820238', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Provincial de Acobamba ', NULL, NULL),
(966, 'PIERINA CECILIA', NULL, NULL, 'Pierina.donayre17@gmail.com', NULL, NULL, 0, NULL, NULL, 'DONAYRE MEDINA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '46474892', NULL, '936959395', NULL, 'PÚBLICA', 'OTRA', 'Hospital Nacional Dos de Mayo', NULL, NULL),
(967, 'DENNIS WILLIAM', NULL, NULL, 'dennis.cabrera96@gmail.com', NULL, NULL, 0, NULL, NULL, 'CABRERA CAMPAÑA', 'PERÚ', 'PIURA', NULL, '1', '72043750', NULL, '906344628', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'I-3 La matanza ', NULL, NULL),
(968, 'LEYLA MICAELA', NULL, NULL, 'leylamicaelajoogarcia@gmail.com', NULL, NULL, 0, NULL, NULL, 'JOO GARCIA', 'PERÚ', 'TACNA', NULL, '1', '04742425', NULL, '952647937', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de Salud Ciudad Nueva ', NULL, NULL),
(969, 'JOAN MANUEL', NULL, NULL, 'manuel.sebaz@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALENZUELA SEBASTIAN', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '75504362', NULL, '907526012', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Medcorp ', NULL, NULL),
(970, 'JHONALY JESUS', NULL, NULL, 'Jhon_rt@outlook.es', NULL, NULL, 0, NULL, NULL, 'RAMOS TAFUR', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72656605', NULL, '942840423', NULL, 'PRIVADA', 'OTRA', 'Universidad Tecnológica del Perú', NULL, NULL),
(971, 'ELMER NOE', NULL, NULL, 'fhencirujano@gmail.com', NULL, NULL, 0, NULL, NULL, 'FALCON HUAMAN', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '09449206', NULL, '997327045', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Ris Santa Anita ', NULL, NULL),
(972, 'ZENOBIA HERLINDA', NULL, NULL, 'herlida_villanueva25@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VILLANUEVA ZAVALETA', 'PERÚ', 'ANCASH', NULL, '1', '32607499', NULL, '959843667', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Centro de Salud Parobamba', NULL, NULL),
(973, 'ROSA MARIA', NULL, NULL, 'rosamariamave@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAMANI VELASQUEZ', 'PERÚ', 'TACNA', NULL, '1', '00498194', NULL, '952965181', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'HOSPITAL HIPOLITO UNANUE DE TACNA', NULL, NULL),
(974, 'GLORIA', NULL, NULL, 'gcngirl2015@gmail.com', NULL, NULL, 0, NULL, NULL, 'CEVALLOS NIETO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '10698721', NULL, '920757743', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Puestode Salud Viña San Francisco', NULL, NULL),
(975, 'MIGUEL ARTURO', NULL, NULL, 'mivasmen@gmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ MENDOZA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10049097', NULL, '997930807', NULL, 'PÚBLICA', 'OTRA', 'Instituto nacional materno perinatal ', NULL, NULL),
(976, 'ANDY ALONSO', NULL, NULL, 'achuque@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHUQUE GONZALES', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45714646', NULL, '999979464', NULL, 'PÚBLICA', 'INGENIERÍA', 'CHUGOING SAC', NULL, NULL),
(977, 'KAREN IVETTE', NULL, NULL, 'kae195@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MEJIA MORALES', 'PERÚ', 'PIURA', NULL, '1', '45862560', NULL, '956767426', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de la Amistad Perú Corea Santa Rosa II-2', NULL, NULL),
(978, 'MOISES ANTONIO', NULL, NULL, 'moises.cornetero@gmail.com', NULL, NULL, 0, NULL, NULL, 'CORNETERO MENDOZA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '72498448', NULL, '955966104', NULL, 'PÚBLICA', 'INGENIERÍA', 'GERESA LAMBAYEQUE', NULL, NULL),
(979, 'EDWIN FRANCISCO', NULL, NULL, 'franciscomorales989@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORALES CARBONE', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '72379557', NULL, '999945978', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'EXPERTTA', NULL, NULL),
(980, 'PATY', NULL, NULL, 'PATY_MEJIA_2311@HOTMAIL.COM', NULL, NULL, 0, NULL, NULL, 'MEJIA FLORES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '47626157', NULL, '921789050', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Diris lima sur', NULL, NULL),
(981, 'ANGHY MERY', NULL, NULL, 'ghyta32@gmail.com', NULL, NULL, 0, NULL, NULL, 'TAPIA TELLO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '44969280', NULL, '996525420', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Universidad Wiener', NULL, NULL),
(983, 'JORGE EMILIO MIGUEL', NULL, NULL, 'jemvm10@gmail.com', NULL, NULL, 0, NULL, NULL, 'VELIZ MEDINA', 'PERÚ', 'PIURA', NULL, '1', '73091515', NULL, '944894838', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'I-4 La Unión', NULL, NULL),
(984, 'NEREYDA LIZBETH', NULL, NULL, 'lizbethg_23@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMANI GUEVARA', 'PERÚ', 'AREQUIPA', NULL, '1', '41982405', NULL, '912435748', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.s. characato ', NULL, NULL),
(985, 'LUIS CARLOS', NULL, NULL, 'lcabanillasg84@gmail.com', NULL, NULL, 0, NULL, NULL, 'CABANILLAS GONZALES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42330168', NULL, '954097671', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINISTERIO DE SALUD - DIRECCION GENERAL DE OPERACIONES EN SALUD', NULL, NULL),
(986, 'JANET JACKELINE', NULL, NULL, 'jpicoysalgado@gmail.com', NULL, NULL, 0, NULL, NULL, 'PICOY SALGADO', 'PERÚ', 'CALLAO', NULL, '1', '40436719', NULL, '983400458', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA CALLAO', NULL, NULL),
(987, 'GLORIA HUMBERTINA', NULL, NULL, 'ghsa131091@gmail.com', NULL, NULL, 0, NULL, NULL, 'SIGUAS ANTON', 'PERÚ', 'ICA', NULL, '1', '46801371', NULL, '971242984', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital San José de chincha ', NULL, NULL),
(988, 'ROSA MARIA', NULL, NULL, 'chukurumucu44@gmail.com', NULL, NULL, 0, NULL, NULL, 'CRUZ HUAROTO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '22290955', NULL, '989087707', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S.SAN GENARO DE VILLA- CHORRILLOS.', NULL, NULL),
(989, 'JUAN ALEJANDRO', NULL, NULL, 'medicoshoy@yahoo.es', NULL, NULL, 0, NULL, NULL, 'RAMIREZ FLORES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '08517408', NULL, '996333111', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI Manuel Barreto', NULL, NULL),
(990, 'YULISSA ROSARIO', NULL, NULL, 'Yulissahm29@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMANI MUNARRIZ', 'PERÚ', 'ICA', NULL, '1', '45561141', NULL, '942353439', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Hospital Ricardo Cruzado Rivarola', NULL, NULL),
(991, 'KATHERINE ESTEFANIA', NULL, NULL, 'Kadem00@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ARIAS GUTIERREZ', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '44870579', NULL, '980482979', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital José Agurto Tello De Chosica ', NULL, NULL),
(992, 'GLADYS ELCIDA', NULL, NULL, 'juana_mendez2014@outlook.es', NULL, NULL, 0, NULL, NULL, 'ARCOS CAYO', 'PERÚ', 'ICA', NULL, '1', '21513728', NULL, '933419405', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'U.E404 Hospital San Juan de Dios de Pisco ', NULL, NULL),
(993, 'ELSA CECILIA', NULL, NULL, 'ceciliadiaz.arroyo@gmail.com', NULL, NULL, 0, NULL, NULL, 'DIAZ ARROYO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '19323128', NULL, '989219128', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Colegio de Obstetras del Perú', NULL, NULL),
(994, 'ROBERTH', NULL, NULL, 'maslucanr@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHUQUIMBALQUI MASLUCAN', 'PERÚ', 'AMAZONAS', NULL, '1', '06782372', NULL, '922635548', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'CLINICA PULSO SALUD', NULL, NULL),
(995, 'YESENIA KARINA', NULL, NULL, 'yesyeche7@gmail.com', NULL, NULL, 0, NULL, NULL, 'ECHE DURAN', 'PERÚ', 'CALLAO', NULL, '1', '70751716', NULL, '923608753', NULL, 'PRIVADA', 'OTRA', 'Sanae', NULL, NULL),
(996, 'ELIZABETH MAGDALENA', NULL, NULL, 'eriverach@hvlh.gob.pe', NULL, NULL, 0, NULL, NULL, 'RIVERA CHAVEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06298750', NULL, '999665330', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Víctor Larco Herrera', NULL, NULL),
(997, 'FATIMA DEL PILAR', NULL, NULL, 'stefanibiologia@gmail.com', NULL, NULL, 0, NULL, NULL, 'OROZCO ERIQUE', 'PERÚ', 'PIURA', NULL, '1', '02856362', NULL, '978725011', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Diresa ', NULL, NULL),
(998, 'DAVID', NULL, NULL, 'davidtitodiaz1975@gmail.com', NULL, NULL, 0, NULL, NULL, 'TITO DIAZ', 'PERÚ', 'PUNO', NULL, '1', '42116165', NULL, '916923086', NULL, 'PÚBLICA', 'ECONOMISTA', 'Red de Salud San Roman', NULL, NULL),
(999, 'MARGOT GLADYS', NULL, NULL, 'Margotfiga10@gmail.com', NULL, NULL, 0, NULL, NULL, 'FIGUEROA GAMARRA', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '15710268', NULL, '922311035', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Dos de Mayo', NULL, NULL),
(1000, 'MARITZA MARLENY', NULL, NULL, 'maritzaravelo@yahoo.com', NULL, NULL, 0, NULL, NULL, 'RAVELO CHAVEZ', 'PERÚ', 'HUANCAVELICA', NULL, '1', '41718340', NULL, '984983388', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Gobierno regional de huancavelica ', NULL, NULL),
(1001, 'ANA CATERIN MILAGROS', NULL, NULL, 'hanna.mestas@gmail.com', NULL, NULL, 0, NULL, NULL, 'MESTAS CALLATA', 'PERÚ', 'PUNO', NULL, '1', '47829466', NULL, '934555953', NULL, 'PÚBLICA', 'INGENIERÍA', 'CENTRO DE SALUD CONO SUR ', NULL, NULL),
(1002, 'JIMMI LEONARDO', NULL, NULL, 'jl.velasquezalegre@gmail.com', NULL, NULL, 0, NULL, NULL, 'VELASQUEZ ALEGRE', 'PERÚ', 'ANCASH', NULL, '1', '75478788', NULL, '931511734', NULL, 'PÚBLICA', 'INGENIERÍA', 'RED DE SALUD HUAYLAS NORTE', NULL, NULL),
(1003, 'DENNIS JOSE', NULL, NULL, 'dennispingo20@gmail.com', NULL, NULL, 0, NULL, NULL, 'PINGO BAYONA', 'PERÚ', 'PIURA', NULL, '1', '40718398', NULL, '969440605', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud I-4 Bernal ', NULL, NULL),
(1004, 'ANA ROSA', NULL, NULL, 'Anarosa1501@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ CORDOVA', 'PERÚ', 'PIURA', NULL, '1', '03692210', NULL, '968083402', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Centro de Salud La Unión', NULL, NULL),
(1005, 'LILIANA MARGOT', NULL, NULL, 'lulamarlove@yahoo.com', NULL, NULL, 0, NULL, NULL, 'CRUZADO GARAY', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '06235645', NULL, '999700727', NULL, 'PRIVADA', 'CIRUJANO DENTISTA', 'Consultorio', NULL, NULL),
(1006, 'LILIANA ESTHER', NULL, NULL, 'lilianaeflores@yape.com.pe', NULL, NULL, 0, NULL, NULL, 'FLORES NINA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43172147', NULL, '987956423', NULL, 'PRIVADA', 'ADMINISTRADOR', 'YAPE', NULL, NULL),
(1007, 'ROSALY DAYHAN', NULL, NULL, 'admdigtel001@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORRES PALOMINO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45963008', NULL, '923700824', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Minsa', NULL, NULL),
(1008, 'MONICA NOHEMI', NULL, NULL, 'monica.rosass@hnhu.gob.pe', NULL, NULL, 0, NULL, NULL, 'ROSAS SANCHEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40195996', NULL, '976360619', NULL, 'PÚBLICA', 'INGENIERÍA', 'HOSPITAL NACIONAL HIPOLITO UNANUE', NULL, NULL),
(1009, 'PEDRO EDILBERTO', NULL, NULL, 'pedroqs@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE SOTOMAYOR', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '20579467', NULL, '995847070', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'HOSPITAL HERMILIO VALDIZAN', NULL, NULL),
(1010, 'JORGE', NULL, NULL, 'Jorge.vera@pfizer.com', NULL, NULL, 0, NULL, NULL, 'VERA VARGAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10799596', NULL, '987649755', NULL, 'PRIVADA', 'OTRA', 'Pfizer SA', NULL, NULL),
(1011, 'LUIS ENRIQUE', NULL, NULL, 'LUISSCONTA@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'LOPEZ QUICO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '70063991', NULL, '967084827', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'HOSPITAL HERMILIO VALDIZAN', NULL, NULL),
(1012, 'OMAYRA PIERINA', NULL, NULL, 'omayra.mendoza.95@gmail.com', NULL, NULL, 0, NULL, NULL, 'MENDOZA QUISPE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '70456922', NULL, '980933996', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HNDM ', NULL, NULL),
(1013, 'SIRLE YANET', NULL, NULL, 'vasquezjanet1989@gmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ OLANO', 'PERÚ', 'CALLAO', NULL, '1', '46574404', NULL, '981523190', NULL, 'PÚBLICA', 'OTRA', 'Diresa Callao', NULL, NULL),
(1014, 'ROSA MILAGROS', NULL, NULL, 'ross.pm.2787@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEÑA MORANTE', 'PERÚ', 'AREQUIPA', NULL, '1', '76939935', NULL, '982532613', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud San José ', NULL, NULL),
(1015, 'MIGUEL AUGUSTO', NULL, NULL, 'mipalacios365@gmail.com', NULL, NULL, 0, NULL, NULL, 'PALACIOS RAMIREZ', 'PERÚ', 'CALLAO', NULL, '1', '06086701', NULL, '998909368', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA-callao', NULL, NULL),
(1016, 'VERONICA GIOVANA', NULL, NULL, 'telesalud@dirislimacentro.gob.pe', NULL, NULL, 0, NULL, NULL, 'BALDOCEDA SOLANO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '21133376', NULL, '954787692', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'DIRIS Lima Centro ', NULL, NULL),
(1017, 'STEFAN ALEXIS', NULL, NULL, 'stefan1090ea@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESCOBAR AGREDA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '46329408', NULL, '989506930', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA', NULL, NULL),
(1018, 'FERNANDO FRANCISCO', NULL, NULL, 'Moransilvaf@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORAN SILVA', 'PERÚ', 'PIURA', NULL, '1', '03687235', NULL, '978199022', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Estudio', NULL, NULL),
(1019, 'MARIA BEATRIZ', NULL, NULL, 'amancay377@gmail.com', NULL, NULL, 0, NULL, NULL, 'PACHECO CABEZAS', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '06056016', NULL, '965768703', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CMI TAHUANTINSUYO BAJO ', NULL, NULL),
(1020, 'JORGE EDUARDO', NULL, NULL, 'centrodesaludbernal@gmail.com', NULL, NULL, 0, NULL, NULL, 'TELLO SULLON', 'PERÚ', 'PIURA', NULL, '1', '43744520', NULL, '902252220', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'Establecimiento de Salud I-4 Bernal', NULL, NULL),
(1021, 'JHOSELINE GEULEISSY', NULL, NULL, 'jsolistoro17@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOLIS TORO', 'PERÚ', 'CUSCO', NULL, '1', '72844977', NULL, '987944694', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'P.S HUAROCONDO', NULL, NULL),
(1022, 'OBDULIA VIOLETA', NULL, NULL, 'Obduliavioletaflores@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES FERNANDEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08030412', NULL, '971144480', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Universidad Norbet Wiener', NULL, NULL),
(1023, 'ADRIANA SOFIA', NULL, NULL, '2213asaf@gmail.com', NULL, NULL, 0, NULL, NULL, 'ABUHADBA FERNANDEZ', 'PERÚ', 'AREQUIPA', NULL, '1', '74528544', NULL, '962980509', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Minsa ', NULL, NULL),
(1024, 'JOSE GUALBERTO', NULL, NULL, 'dennispingo20@gmail.com', NULL, NULL, 0, NULL, NULL, 'AYALA AYALA', 'PERÚ', 'PIURA', NULL, '1', '46410044', NULL, '924030452', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'Establecimiento de Salud I-4 Bernal', NULL, NULL),
(1025, 'JOSELEIN MARIA', NULL, NULL, 'joselein13@gmail.com', NULL, NULL, 0, NULL, NULL, 'SAMAME YOVERA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '75384762', NULL, '986422834', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud cajacay', NULL, NULL),
(1026, 'MARIA DEL CARMEN', NULL, NULL, 'Mp322287@gmail.com', NULL, NULL, 0, NULL, NULL, 'PINEDA APAZA', 'PERÚ', 'PUNO', NULL, '1', '72544465', NULL, '974176577', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud Cono Sur', NULL, NULL),
(1027, 'IRENE', NULL, NULL, 'irene-malban@outlook.com.pe', NULL, NULL, 0, NULL, NULL, 'MAURICIO ALBAN', 'PERÚ', 'PIURA', NULL, '1', '03653370', NULL, '966240302', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'CENTRO DE SALUD SALITRAL ', NULL, NULL),
(1028, 'DIEGO FERNANDO', NULL, NULL, 'dcaverovaldiviezo@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAVERO VALDIVIEZO', 'PERÚ', 'PIURA', NULL, '1', '74297438', NULL, '945263262', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud la unión I-4', NULL, NULL),
(1029, 'FRANKLIN SILVESTRE', NULL, NULL, 'franklincappa@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAPPA TICONA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '45037010', NULL, '996633074', NULL, 'PÚBLICA', 'INGENIERÍA', 'HOSPITAL JOSE AGURTO TELLO DE CHOSICA', NULL, NULL),
(1030, 'EDMAR JOSE', NULL, NULL, 'edmar.romero@softtek.com', NULL, NULL, 0, NULL, NULL, 'ROMERO CONTRERAS', 'PERÚ', 'ANCASH', NULL, '1', '44080668', NULL, '991204487', NULL, 'PRIVADA', 'INGENIERÍA', 'SOFTTEK', NULL, NULL),
(1031, 'CRISTINA', NULL, NULL, 'crystyta85@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUERREROS RODRIGUEZ', 'PERÚ', 'AREQUIPA', NULL, '1', '43398623', NULL, '967007939', NULL, 'PÚBLICA', 'OTRA', 'Centro de Salud Caraveli', NULL, NULL),
(1032, 'DIANA ALEXANDRA', NULL, NULL, 'alexandrafv2014@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES VILLACA', 'PERÚ', 'TACNA', NULL, '1', '72693120', NULL, '963056897', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'P.S. LAS YARAS', NULL, NULL),
(1033, 'CHRISTIAN ANDRE', NULL, NULL, 'chris_ha29@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HUENECE ARANIBAR', 'PERÚ', 'PUNO', NULL, '1', '45429171', NULL, '951900081', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.s. cono sur', NULL, NULL),
(1034, 'LUIS ENRIQUE', NULL, NULL, 'Teleconsulta.cssunampe@gmail.com', NULL, NULL, 0, NULL, NULL, 'SILVA QUISPE', 'PERÚ', 'ICA', NULL, '1', '21519936', NULL, '954935728', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud sunampe - Chincha', NULL, NULL),
(1035, 'ZULMA BETSABE', NULL, NULL, 'betsica_2@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARDENAS LA ROSA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '09868485', NULL, '963909095', NULL, 'PÚBLICA', 'OTRA', 'Instituto nacional de salud ', NULL, NULL),
(1036, 'MIGUEL ANGEL', NULL, NULL, 'mtancun15@hotmail.com', NULL, NULL, 0, NULL, NULL, 'TANCUN VILLAFUERTE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10752461', NULL, '941936675', NULL, 'AMBOS', 'INGENIERÍA', 'MINSA', NULL, NULL),
(1037, 'ADAN VLADIMIR', NULL, NULL, 'adan27096@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAZ FLORES', 'PERÚ', 'PIURA', NULL, '1', '46532707', NULL, '969007733', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'E.S. I-3 Tacalá', NULL, NULL),
(1038, 'XIMENA JULISSA', NULL, NULL, 'ximeyaras07@gmail.com', NULL, NULL, 0, NULL, NULL, 'YARASCA ARROSQUIPA', 'PERÚ', 'AREQUIPA', NULL, '1', '72203926', NULL, '922585727', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Puesto de salud Ayroca', NULL, NULL),
(1039, 'PAULO CESAR', NULL, NULL, 'pauloxin123@gmail.com', NULL, NULL, 0, NULL, NULL, 'MEDINA TOLA', 'PERÚ', 'AREQUIPA', NULL, '1', '45298312', NULL, '944528800', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS caraveli', NULL, NULL),
(1040, 'ANA MARIA', NULL, NULL, 'anamaryan@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ASENCIO NUNURA', 'PERÚ', 'PIURA', NULL, '1', '17627271', NULL, '969854076', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'E.S. I-4 LA UNIÓN', NULL, NULL),
(1041, 'MELISSA YANINA', NULL, NULL, 'MMERA@GAMEL.COM.PE', NULL, NULL, 0, NULL, NULL, 'MERA CASTILLO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45302899', NULL, '991197411', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'GAMEL SRL', NULL, NULL),
(1042, 'JUAN JOSE', NULL, NULL, 'jjcc0801@gmail.com', NULL, NULL, 0, NULL, NULL, 'CACERES COLQUEHUANCA', 'PERÚ', 'AREQUIPA', NULL, '1', '44856109', NULL, '990474816', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud Ocoña ', NULL, NULL),
(1043, 'GABRIELA MAGDALENA', NULL, NULL, 'gabriela.cruz@upch.pe', NULL, NULL, 0, NULL, NULL, 'CRUZ ENCARNACION', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '70558911', NULL, '949514539', NULL, 'PRIVADA', 'OTRA', 'UNIVERSIDAD PERUANA CAYETANO HEREDIA', NULL, NULL),
(1044, 'CARLOS MIGUEL', NULL, NULL, 'carlosmhh94@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUARACA HILARIO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '71227912', NULL, '968210977', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HNERM', NULL, NULL),
(1045, 'HAROLD', NULL, NULL, 'hard941.hp@gmail.com', NULL, NULL, 0, NULL, NULL, 'MOGOLLON PEREYRA', 'PERÚ', 'PIURA', NULL, '1', '44085865', NULL, '969545529', NULL, 'PÚBLICA', 'OTRA', 'Diresa ', NULL, NULL),
(1046, 'JANET PAOLA', NULL, NULL, 'janetcore@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CORRALES REYES', 'PERÚ', 'LA LIBERTAD', NULL, '1', '41532707', NULL, '949400257', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'IREN NORTE', NULL, NULL),
(1047, 'CINTHYA STEFANNY', NULL, NULL, 'stefannyrosas42@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROSAS PEÑA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '48478993', NULL, '977717346', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital de Emergencia Jose Casimiro Ulloa', NULL, NULL),
(1048, 'TIANA VALERIA', NULL, NULL, 't.valeria.q@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUEVEDO PINTADO', 'PERÚ', 'CALLAO', NULL, '1', '74871294', NULL, '926894183', NULL, 'PRIVADA', 'OTRA', 'Universidad Peruana Cayetano Heredia', NULL, NULL),
(1049, 'VERONICA JACKELINY', NULL, NULL, 'yaesquen@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESQUEN RAMOS', 'PERÚ', 'PIURA', NULL, '1', '46578988', NULL, '974471723', NULL, 'PÚBLICA', 'OTRA', 'EE.SS I-3 VICTOR RAUL HAYA DE LA TORRE ', NULL, NULL),
(1050, 'CARLOS CECILIO', NULL, NULL, 'carlos.arosquipa@gmail.com', NULL, NULL, 0, NULL, NULL, 'AROSQUIPA RODRIGUEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06661447', NULL, '987568553', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'OPS/OMS', NULL, NULL),
(1051, 'RUTH YSABEL', NULL, NULL, 'rysabel74@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CASTRO TORRES', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '09894124', NULL, '999765628', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Hospital Nacional Daniel Alcides Carrion -Callao ', NULL, NULL),
(1052, 'ARIO ARCADIO', NULL, NULL, 'tribuno94@hotmail.com', NULL, NULL, 0, NULL, NULL, 'AÑORGA TREBEJO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '06041477', NULL, '987041871', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'hospital de huaral y SBS', NULL, NULL),
(1053, 'VICTORIA', NULL, NULL, 'ferasspiura@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREYRA SANCHEZ', 'PERÚ', 'PIURA', NULL, '1', '02659769', NULL, '971728708', NULL, 'PÚBLICA', 'OTRA', 'DIRESA PIURA', NULL, NULL),
(1054, 'HEMILIANA', NULL, NULL, 'fiorellaviera@gmail.com', NULL, NULL, 0, NULL, NULL, 'DIAZ CESPEDES', 'PERÚ', 'PIURA', NULL, '1', '44444444', NULL, '948400278', NULL, 'PÚBLICA', 'INGENIERÍA', 'DIRESA PIURA', NULL, NULL),
(1055, 'DERLLY MYRIAM', NULL, NULL, 'derllybc@gmail.com', NULL, NULL, 0, NULL, NULL, 'BALDERA CESPEDES', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16775070', NULL, '990485957', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Minsa ', NULL, NULL),
(1056, 'DIANA ISABEL', NULL, NULL, 'DIANA.ARAUJOT98@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'ARAUJO TUESTA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '70545421', NULL, '943566601', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Clínica privada', NULL, NULL),
(1057, 'OSVER', NULL, NULL, 'osver.ocg@gmail.com', NULL, NULL, 0, NULL, NULL, 'CONDORI GUTIERREZ', 'PERÚ', 'AREQUIPA', NULL, '1', '70163161', NULL, '947350716', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'CENTRO DE SALUD MATEO PUMACAHUA ', NULL, NULL),
(1058, 'JOSE LUIS', NULL, NULL, 'jlolivavasquez@gmail.com', NULL, NULL, 0, NULL, NULL, 'OLIVA VASQUEZ', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '41139462', NULL, '955685997', NULL, 'PÚBLICA', 'INGENIERÍA', 'MINSA', NULL, NULL),
(1059, 'SANDRA LOURDES', NULL, NULL, 'sandritagch17@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARCIA CHAPA', 'PERÚ', 'PIURA', NULL, '1', '73021080', NULL, '927863219', NULL, 'PRIVADA', 'OTRA', 'Universidad César Vallejo ', NULL, NULL),
(1060, 'MARICARMEN SCARLY', NULL, NULL, 'Fairus_208@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MIRANDA GARCIA', 'PERÚ', 'AREQUIPA', NULL, '1', '46400109', NULL, '958865736', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.S Ampliación Paucarpata ', NULL, NULL),
(1061, 'EDUARDO', NULL, NULL, 'evillarsanchez2014@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLAR SANCHEZ', 'PERÚ', 'LA LIBERTAD', NULL, '1', '18859893', NULL, '959075647', NULL, 'PÚBLICA', 'OTRA', 'Hospital Victor Lazarte Echegaray ', NULL, NULL),
(1062, 'IVAN WILLIAM', NULL, NULL, 'parmani20@hotmail.com.ar', NULL, NULL, 0, NULL, NULL, 'PARI MAMANI', 'PERÚ', 'AREQUIPA', NULL, '1', '43240974', NULL, '989384047', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud la Pampa ', NULL, NULL),
(1063, 'LIZBETH', NULL, NULL, 'licita99@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANTISTEBAN VILCARROMERO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45377554', NULL, '961807757', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital', NULL, NULL),
(1064, 'LUCY', NULL, NULL, 'lucy.cordova@upch.pe', NULL, NULL, 0, NULL, NULL, 'CORDOVA ASCONA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '47539584', NULL, '956249104', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'UPCH', NULL, NULL),
(1065, 'YOHAN ABEL', NULL, NULL, 'yalg159@gmail.com', NULL, NULL, 0, NULL, NULL, 'LIMA GRAJEDA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72613682', NULL, '951909855', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud Jesús Maria ', NULL, NULL),
(1066, 'LIZETH MILAGROS', NULL, NULL, 'Lizethsana03@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANA AYTA', 'PERÚ', 'AREQUIPA', NULL, '1', '77166452', NULL, '966656304', NULL, 'PRIVADA', 'OTRA', 'Ucsm ', NULL, NULL),
(1067, 'LEANDRO SANTIAGO', NULL, NULL, 'bernalsaavedraleandro@gmail.com', NULL, NULL, 0, NULL, NULL, 'BERNAL SAAVEDRA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '71738299', NULL, '967971932', NULL, 'PRIVADA', 'OTRA', 'THE MED UNIVERSE SACS', NULL, NULL),
(1068, 'KATIA CANDY', NULL, NULL, 'katia.arias1@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'ARIAS ESPINOZA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '74046225', NULL, '924202172', NULL, 'PÚBLICA', 'OTRA', 'UNMSM', NULL, NULL),
(1069, 'ESTEICY ESTEFANY', NULL, NULL, 'esteicy_1993@outlook.es', NULL, NULL, 0, NULL, NULL, 'EGOAVIL CELIZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '47809965', NULL, '960101157', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Consultorio Ecografias Bolivar ', NULL, NULL),
(1070, 'WILFREDO ALEX', NULL, NULL, 'PS.ALEXORELAZARO@HOTMAIL.COM', NULL, NULL, 0, NULL, NULL, 'ORE LAZARO', 'PERÚ', 'JUNÍN', NULL, '1', '44138286', NULL, '968134164', NULL, 'PÚBLICA', 'OTRA', 'CEM COMISARIA LA OROYA ', NULL, NULL),
(1071, 'MARICARMEN EYLEEN', NULL, NULL, 'Marixuii_47@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LEYVA HURTADO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '47849926', NULL, '924051744', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Medicis ', NULL, NULL),
(1072, 'ROOSVEL ANTONY', NULL, NULL, 'Intramed.rahq@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMANI QUISPE', 'PERÚ', 'JUNÍN', NULL, '1', '47881981', NULL, '990042824', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Minsa', NULL, NULL),
(1073, 'MIRIAM ELIZABETH', NULL, NULL, 'miriamdelacruzgalindo@gmail.com', NULL, NULL, 0, NULL, NULL, 'DE LA CRUZ GALINDO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '76303023', NULL, '980090236', NULL, 'PÚBLICA', 'OTRA', 'Minsa', NULL, NULL),
(1074, 'ARACELI', NULL, NULL, 'g.alvarez.araceli@gmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALES ALVAREZ', 'PERÚ', 'JUNÍN', NULL, '1', '76851389', NULL, '990600101', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Minsa', NULL, NULL),
(1075, 'LAURA VALENTINA', NULL, NULL, 'lvrodriguezo@unac.edu.pe', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ ORE', 'PERÚ', 'CALLAO', NULL, '1', '74823337', NULL, '927016123', NULL, 'PÚBLICA', 'INGENIERÍA', 'Unac', NULL, NULL),
(1076, 'MAGDA', NULL, NULL, 'magnolia.2611@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE MAMANI', 'PERÚ', 'PUNO', NULL, '1', '02425984', NULL, '951695663', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'RED DE SALUD COLLAO ', NULL, NULL),
(1077, 'JUDITH KARINA', NULL, NULL, 'karifeloayza@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOAYZA CARDENAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09763277', NULL, '987153275', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Red de salud Huarochiri ', NULL, NULL),
(1078, 'JUAN VICTOR', NULL, NULL, 'victorllaja456@gmail.com', NULL, NULL, 0, NULL, NULL, 'LLAJA REAÑO', 'PERÚ', 'LA LIBERTAD', NULL, '1', '73526558', NULL, '900627156', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Ninguna ', NULL, NULL),
(1079, 'JORGE SEBASTIAN', NULL, NULL, 'jorgeviz1919@gmail.com', NULL, NULL, 0, NULL, NULL, 'VIZCARDO IBARRA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72783757', NULL, '991402247', NULL, 'AMBOS', 'OTRA', 'Sin centro laboral actual ', NULL, NULL),
(1080, 'JHENIFER LUZBETH', NULL, NULL, 'jlvasquezsaldivar99@gmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ SALDIVAR', 'PERÚ', 'SAN MARTÍN', NULL, '1', '73597363', NULL, '913530706', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital II-1 Rioja', NULL, NULL),
(1081, 'ARYANA LEONOR', NULL, NULL, 'aryalva25@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLANUEVA ALVARADO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72904661', NULL, '971641173', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'SANNA', NULL, NULL),
(1082, 'YOVEL IVAN', NULL, NULL, 'Yovelbc@gmail.com', NULL, NULL, 0, NULL, NULL, 'BUSTAMANTE CUADROS', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '43572256', NULL, '992546015', NULL, 'PÚBLICA', 'OTRA', 'Hospital Central fuerza aerea ', NULL, NULL),
(1083, 'FLOR LILIANA', NULL, NULL, 'fliana.nut@gmail.com', NULL, NULL, 0, NULL, NULL, 'PALACIOS RIVERA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '44484847', NULL, '987713925', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'P.S PROFAM', NULL, NULL),
(1084, 'PAMELA JANET', NULL, NULL, 'pame_quevedo@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUEVEDO JUAREZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '03671204', NULL, '995486893', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital de Chancay', NULL, NULL),
(1085, 'ELVER', NULL, NULL, 'elversantoscueva@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANTOS CUEVA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72531413', NULL, '969527881', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Minuto ', NULL, NULL),
(1086, 'CINTHYA ARACELLY', NULL, NULL, 'cinthya040217@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUIMAN CHASQUIBOL', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72640424', NULL, '939698927', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Essalud', NULL, NULL),
(1087, 'SONIA MERCEDES', NULL, NULL, 'sotomayormercedes10@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOTOMAYOR RAMIREZ', 'PERÚ', 'CALLAO', NULL, '1', '73103441', NULL, '991558136', NULL, 'AMBOS', 'OTRA', 'Capsi', NULL, NULL),
(1088, 'JASULY PAMELA', NULL, NULL, 'jasuly2000@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RIOS VARGAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '73254379', NULL, '941050967', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'PPST', NULL, NULL),
(1089, 'YESSICA', NULL, NULL, 'kasandra0020@hotmail.com', NULL, NULL, 0, NULL, NULL, 'NEYRA RODRIGUEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45123206', NULL, '944749649', NULL, 'PRIVADA', 'OTRA', 'JNR SERVICIOS GENERALES ', NULL, NULL),
(1090, 'SARILA', NULL, NULL, 'sarilaciezam@gmail.com', NULL, NULL, 0, NULL, NULL, 'CIEZA MENDOZA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '42224479', NULL, '990341494', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Minsa', NULL, NULL),
(1091, 'BLANCA JAKELINE', NULL, NULL, 'blanca.scorza2711@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESCORZA VILLEGAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '47611537', NULL, '994556827', NULL, 'PRIVADA', 'CIRUJANO DENTISTA', 'Instituto Carrión ', NULL, NULL),
(1092, 'CAROLINE YSABELHA', NULL, NULL, 'ysadc1996@gmail.com', NULL, NULL, 0, NULL, NULL, 'DELGADO CARDENAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '74033973', NULL, '960128519', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', '-', NULL, NULL),
(1093, 'ANGIE BENEDICTA', NULL, NULL, 'angiemoroco29@gmail.com', NULL, NULL, 0, NULL, NULL, 'MOROCO WONG', 'PERÚ', 'AREQUIPA', NULL, '1', '71282564', NULL, '970470805', NULL, 'PRIVADA', 'OTRA', 'Universidad católica de santa Maria', NULL, NULL),
(1094, 'ALISSON JEANETTE', NULL, NULL, 'alissonalvarado002@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALVARADO CHONTA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '74644126', NULL, '930545043', NULL, 'PÚBLICA', 'OTRA', 'Internado', NULL, NULL),
(1095, 'GODY MANUEL', NULL, NULL, 'godymed38@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ESPINOZA ESPINOZA', 'PERÚ', 'CALLAO', NULL, '1', '41299131', NULL, '990659847', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'SIS', NULL, NULL),
(1096, 'JESUS MARLENE', NULL, NULL, 'qfmmanriquep@gmail.com', NULL, NULL, 0, NULL, NULL, 'MANRIQUE PALZA', 'PERÚ', 'AREQUIPA', NULL, '1', '29446625', NULL, '993307119', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Centro de Salud Ampliación Paucarpata ', NULL, NULL),
(1097, 'SALOME', NULL, NULL, 'salito-73@hotmail.com', NULL, NULL, 0, NULL, NULL, 'YGREDA PACHECO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '09934007', NULL, '987823787', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Nacional Arzobispo Loayza ', NULL, NULL),
(1098, 'CARMEN ALBINA', NULL, NULL, 'carmenreyesv30@gmail.com', NULL, NULL, 0, NULL, NULL, 'REYES VARGAS DE ZAPATA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07764937', NULL, '954477891', NULL, 'PÚBLICA', 'INGENIERÍA', 'Municipalidad de San Miguel', NULL, NULL),
(1099, 'ROGELIA DILMA', NULL, NULL, 'asenciosbravorogelia0@gmail.com', NULL, NULL, 0, NULL, NULL, 'ASENCIOS BRAVO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40159789', NULL, '989281096', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Infosalud ', NULL, NULL),
(1100, 'JOSE LUIS', NULL, NULL, 'Josemillones84@gmail.com', NULL, NULL, 0, NULL, NULL, 'MILLONES GOMEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42618288', NULL, '992744826', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'UCSM', NULL, NULL),
(1101, 'LISSET FIORELLA', NULL, NULL, 'Fiorella_5_27@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SICCHA DEL CAMPO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72673310', NULL, '933604046', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Global supply', NULL, NULL),
(1102, 'PAOLA MARTINA', NULL, NULL, 'paola7573@yahoo.com', NULL, NULL, 0, NULL, NULL, 'FIGUEROA FERNANDEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08153759', NULL, '999847461', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'ESSALUD ', NULL, NULL),
(1103, 'PAOLA MARTHA', NULL, NULL, 'paola_zamora@yahoo.com', NULL, NULL, 0, NULL, NULL, 'ZAMORA OLIVARI', 'PERÚ', 'CALLAO', NULL, '1', '10736029', NULL, '943938723', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de Rehabilitacion del Callao', NULL, NULL),
(1104, 'CLAUDIA', NULL, NULL, 'claudiadcm2609@gmail.com', NULL, NULL, 0, NULL, NULL, 'DEL CASTILLO MENDOZA', 'PERÚ', 'UCAYALI', NULL, '1', '41117079', NULL, '961612219', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'DIRESA Ucayali ', NULL, NULL),
(1105, 'ZOILA CARLA', NULL, NULL, 'carlacotosflores@gmail.com', NULL, NULL, 0, NULL, NULL, 'COTOS FLORES', 'PERÚ', 'CALLAO', NULL, '1', '46038515', NULL, '999596227', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Ginemed', NULL, NULL),
(1106, 'LEYDI MILAGROS', NULL, NULL, 'leydirodriguezr95@gmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ RONDON', 'PERÚ', 'UCAYALI', NULL, '1', '70261324', NULL, '932906350', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Dirección regional de salud Ucayali ', NULL, NULL),
(1107, 'ERIKA VIVIANA', NULL, NULL, 'erikanyaipoma2611@gmail.com', NULL, NULL, 0, NULL, NULL, 'ANYAIPOMA UNOCC', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10249133', NULL, '991403648', NULL, 'AMBOS', 'OTRA', 'EsSalud Hospital Jorge Voto Bernales ', NULL, NULL),
(1108, 'JENNIFER', NULL, NULL, 'jennifer.atoche@utec.edu.pe', NULL, NULL, 0, NULL, NULL, 'ATOCHE SEMINARIO', 'PERÚ', 'CALLAO', NULL, '1', '75690274', NULL, '918760583', NULL, 'PRIVADA', 'INGENIERÍA', 'UTEC', NULL, NULL),
(1109, 'SUGEITH DAYANARA', NULL, NULL, 'Sugeithestradazambrano@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESTRADA ZAMBRANO', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '40406524', NULL, '952889993', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C s san Antonio  minsa', NULL, NULL),
(1110, 'MELANIA YASMINA', NULL, NULL, 'melania7823@gmail.com', NULL, NULL, 0, NULL, NULL, 'MENDOZA SUCLUPE', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '41013212', NULL, '986545412', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'C.S. Pedro pablo atusparia', NULL, NULL),
(1111, 'NORLA PAMELA', NULL, NULL, 'pamelaupch@gmail.com', NULL, NULL, 0, NULL, NULL, 'HONORES DÍAZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43892075', NULL, '988648855', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Dos de Mayo', NULL, NULL),
(1112, 'GIULIANA DEL PILAR', NULL, NULL, 'giulianasanchez1@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ HANAMPA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '09383521', NULL, '986042308', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Universidad Cesar Vallejo', NULL, NULL),
(1113, 'AMALIA', NULL, NULL, 'Eduardo.pa.19@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARAUJO FASANANDO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '47472566', NULL, '997294756', NULL, 'PRIVADA', 'OTRA', 'Clinica chacarilla', NULL, NULL),
(1114, 'MARIA RAQUEL', NULL, NULL, 'maruaraqueldiaz@gmail.com', NULL, NULL, 0, NULL, NULL, 'DIAZ MIRES', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '42249940', NULL, '943865476', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Csm juan pardo miguel patapo', NULL, NULL),
(1115, 'GERALDINE ARACELI', NULL, NULL, 'geraldine.guzman.castillo@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUZMAN CASTILLO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '43115322', NULL, '990953460', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'UNIVERSIDAD PRIVADA DEL NORTE', NULL, NULL),
(1116, 'ROXANA JENNY', NULL, NULL, 'roxana.postigoc@gmail.com', NULL, NULL, 0, NULL, NULL, 'POSTIGO CORNEJO', 'PERÚ', 'AREQUIPA', NULL, '1', '29244732', NULL, '993150747', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINISTERIO DE SALUD', NULL, NULL),
(1117, 'ROCIO ELIANA', NULL, NULL, 'rochipc@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PANTOJA COLLAZOS', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '07972255', NULL, '979668886', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CSMC CONEXION INTEGRAL', NULL, NULL),
(1118, 'JOSEFINA CARIDAD', NULL, NULL, 'Karyef@hotmail.com', NULL, NULL, 0, NULL, NULL, 'EYZAGUIRRE FLORES', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '20014970', NULL, '961781248', NULL, 'PRIVADA', 'TÉCNICO EN ENFERMERÍA', 'Essalud ', NULL, NULL),
(1119, 'DEYSI ADELINA', NULL, NULL, 'adelina20nina@gmail.com', NULL, NULL, 0, NULL, NULL, 'NINA YANAPA', 'PERÚ', 'PUNO', NULL, '1', '70330612', NULL, '953856609', NULL, 'PÚBLICA', 'OTRA', 'Centro de salud ', NULL, NULL),
(1120, 'LILIANA YANINA', NULL, NULL, 'liliyarleque@hotmail.com', NULL, NULL, 0, NULL, NULL, 'YARLEQUE PIZANGO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '10633306', NULL, '987256896', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'Universidad Científica del Sur ', NULL, NULL),
(1121, 'CYNTHIA AZUCENA', NULL, NULL, 'ncynthia.aca@gmail.com', NULL, NULL, 0, NULL, NULL, 'CANCHIS ACHA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43753697', NULL, '947203956', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'Hospital Santa Rosa ', NULL, NULL),
(1122, 'VILMA STEFANY', NULL, NULL, 'vstefy511@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIVAS GARCIA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72624244', NULL, '954767645', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Arzobispo Loayza', NULL, NULL),
(1123, 'LAURA AMPARO', NULL, NULL, 'lauramercadoy@gmail.com', NULL, NULL, 0, NULL, NULL, 'MERCADO YUPANQUI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42747686', NULL, '943086207', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital II Ramón Castilla ', NULL, NULL),
(1124, 'ANGEL EMITERIO', NULL, NULL, 'anlohuerta@yahoo.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ HUERTAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '25652848', NULL, '999581051', NULL, 'PRIVADA', 'ECONOMISTA', 'Cenca', NULL, NULL),
(1125, 'CARLOS', NULL, NULL, 'jocelynchac2930@gmail.com', NULL, NULL, 0, NULL, NULL, 'TENAZOA PAREDES', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '71579216', NULL, '987274097', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA', NULL, NULL),
(1126, 'LIZBETH MIRELLA', NULL, NULL, 'lizzavaleta@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ZAVALETA BUSTAMANTE', 'PERÚ', 'CAJAMARCA', NULL, '1', '18212215', NULL, '976983344', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'DIRESA CAJAMARCA ', NULL, NULL),
(1127, 'YENNY LUZ', NULL, NULL, 'yenn9903@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES FLOREZ', 'PERÚ', 'CUSCO', NULL, '1', '72228591', NULL, '989470278', NULL, 'PRIVADA', 'INGENIERÍA', 'Obrasco', NULL, NULL),
(1128, 'ROBERTO CARLOS', NULL, NULL, 'rbruce3pe@gmail.com', NULL, NULL, 0, NULL, NULL, 'BRUNO CERRO', 'PERÚ', 'CAJAMARCA', NULL, '1', '10600851', NULL, '960916857', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Posta Medica Contumazá ', NULL, NULL),
(1129, 'ALEXANDER NILTON', NULL, NULL, 'riosalexander@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIOS RIOS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10664175', NULL, '975344008', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'CS Su Santidad Juan Pablo II', NULL, NULL),
(1130, 'EVELYN HAYDI', NULL, NULL, 'haydhih852@gmail.com', NULL, NULL, 0, NULL, NULL, 'PUMACAJIA COAQUIRA', 'PERÚ', 'AREQUIPA', NULL, '1', '75716541', NULL, '944453206', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'MINSA', NULL, NULL),
(1131, 'LISBET MARGOT', NULL, NULL, 'lisbetmargotlozanosoto13@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOZANO SOTO', 'PERÚ', 'CAJAMARCA', NULL, '1', '73620925', NULL, '943930254', NULL, 'PRIVADA', 'OTRA', 'Municipalidad provincial hualgayoc bambamarca ', NULL, NULL),
(1132, 'JORGE LUIS', NULL, NULL, 'jorgeluis1006@gmail.com', NULL, NULL, 0, NULL, NULL, 'HURTADO RUBIO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10587415', NULL, '992462277', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS CONDE DE LA VEGA ', NULL, NULL),
(1133, 'WAGNER ROGGER', NULL, NULL, 'wagner16rg@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIOS GARCIA', 'PERÚ', 'ICA', NULL, '1', '72529841', NULL, '910111778', NULL, 'PÚBLICA', 'OTRA', 'UNIVERSIDAD NACIONAL SAN LUIS GONZAGA ', NULL, NULL),
(1134, 'KAREN MERCEDES', NULL, NULL, 'Kmss_ss@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANTISTEBAN SALCEDO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45513604', NULL, '944413783', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Juan Masias ', NULL, NULL),
(1135, 'STEVE CHRISTIAN', NULL, NULL, 'steve.quispeaguirre@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE AGUIRRE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42433248', NULL, '980770558', NULL, 'PRIVADA', 'INGENIERÍA', 'Instituto médico quirúrgico arequipa', NULL, NULL),
(1136, 'MARISELA ROSARIO', NULL, NULL, 'Mariselagb85@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUARDIA BARRIOS', 'PERÚ', 'AYACUCHO', NULL, '1', '70472620', NULL, '944459030', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'P.s tonsulla occo', NULL, NULL),
(1137, 'DANIELA ROCIO', NULL, NULL, 'daniloayza.1997@gmai.com', NULL, NULL, 0, NULL, NULL, 'LOAYZA CIEZA', 'PERÚ', 'CAJAMARCA', NULL, '1', '77353092', NULL, '964831895', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'PM ESSALUD CONTUMAZÁ', NULL, NULL),
(1138, 'MARIA VERONICA', NULL, NULL, 'veronicarazuricamargo@gmail.com', NULL, NULL, 0, NULL, NULL, 'RAZURI CAMARGO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '43659565', NULL, '950831494', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Tagumedica S.A.', NULL, NULL),
(1139, 'JILL MILAGROS', NULL, NULL, 'jmilahs@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HEREDIA SANCHEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40160702', NULL, '987418360', NULL, 'PRIVADA', 'LIC. OBSTETRICIA', 'cs SAN José ', NULL, NULL),
(1140, 'SANDRA', NULL, NULL, 'smirva@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MIRANDA VARGAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10735473', NULL, '945875225', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Particular ', NULL, NULL),
(1141, 'MIRYAN GLADYS', NULL, NULL, 'vargaslazom@yahoo.com', NULL, NULL, 0, NULL, NULL, 'VARGAS LAZO DE MIRANDA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07904642', NULL, '995094771', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Particular ', NULL, NULL),
(1142, 'ARMANDO YOFRE', NULL, NULL, 'yofrearevalo1@gmail.con', NULL, NULL, 0, NULL, NULL, 'AREVALO HUAMANI', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '76601829', NULL, '932018950', NULL, 'PÚBLICA', 'OTRA', 'UNMSM', NULL, NULL),
(1143, 'CHRISTELL GIANELLA', NULL, NULL, 'christellcalvo@gmail.com', NULL, NULL, 0, NULL, NULL, 'CALVO JARA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '77177011', NULL, '957270698', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital dos Mayo', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(1144, 'LIZ CARIN', NULL, NULL, 'carimenreb@gmail.com', NULL, NULL, 0, NULL, NULL, 'MENDOZA REBAZA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '32988799', NULL, '987247222', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Instituto Nacional de Rehabilitación ', NULL, NULL),
(1145, 'LIZBETH GABRIELA', NULL, NULL, 'galiz__19@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ GOMEZ', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '72719236', NULL, '994364011', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL DE EMERGENCIA ATE VITARTE', NULL, NULL),
(1146, 'NILDA YOVANY', NULL, NULL, 'ntafurn15_3@unc.edu.pe', NULL, NULL, 0, NULL, NULL, 'TAFUR NARRO', 'PERÚ', 'CAJAMARCA', NULL, '1', '76863913', NULL, '966110384', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de salud Pulan ', NULL, NULL),
(1147, 'LUZ SIXTINA', NULL, NULL, 'luz151805@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARTICORENA ALVARADO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '42763511', NULL, '948434539', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.S.Los Libertadores', NULL, NULL),
(1148, 'VIVIANA', NULL, NULL, 'Vivianajf_2013@hotmail.com', NULL, NULL, 0, NULL, NULL, 'JIMENEZ FLORES', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '42458985', NULL, '923023650', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Diris Lima Norte', NULL, NULL),
(1149, 'YSIS JUDITH', NULL, NULL, 'ysis.roa@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROA MEGGO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40174394', NULL, '940295985', NULL, 'PRIVADA', 'OTRA', 'Universidad de San Martín de Porres ', NULL, NULL),
(1150, 'ANNY MILET', NULL, NULL, 'annyquio1997@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUIO RUBINA', 'PERÚ', 'UCAYALI', NULL, '1', '78550184', NULL, '932988291', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'P.s Antonio raymondi ', NULL, NULL),
(1151, 'ALLISSON MARGOTH', NULL, NULL, 'allissonrould@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROULD TORRES', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '70849948', NULL, '942897020', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Hospital de la Solidaridad Villa María del Triunfo ', NULL, NULL),
(1152, 'CHRISTIAN ALEXANDER', NULL, NULL, 'christian.yataco.15@gmail.com', NULL, NULL, 0, NULL, NULL, 'YATACO WILCAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72877008', NULL, '960426685', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud de Cumba', NULL, NULL),
(1153, 'YASMIN', NULL, NULL, 'Yasminorihuela@outlook.com', NULL, NULL, 0, NULL, NULL, 'ORIHUELA QUISPE', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '75234152', NULL, '954903153', NULL, 'PÚBLICA', 'OTRA', 'Centro de salud Ricardo palma ', NULL, NULL),
(1154, 'VALERIA ESTELA', NULL, NULL, 'VCORDOVAP0617@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'CÓRDOVA PORRAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '42376670', NULL, '969843492', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'C.S.MIRAFLORES', NULL, NULL),
(1155, 'SHIRLEY PRISCILA', NULL, NULL, 'primayhuay1292@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAYHUAY HERRERA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '47645589', NULL, '926316318', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Universidad Privada San Juan Bautista ', NULL, NULL),
(1156, 'FLOR MARISELLA', NULL, NULL, 'Fcampos@ins.gob.pe', NULL, NULL, 0, NULL, NULL, 'CAMPOS LEON', 'PERÚ', 'CALLAO', NULL, '1', '10547159', NULL, '968500200', NULL, 'PÚBLICA', 'OTRA', 'Instituto Nacional de Salud', NULL, NULL),
(1157, 'JOHN DAVID', NULL, NULL, 'oteromed@gmail.com', NULL, NULL, 0, NULL, NULL, 'OTERO MORE', 'PERÚ', 'PIURA', NULL, '1', '40681734', NULL, '966295566', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'SEGURO INTEGRAL DE SALUD', NULL, NULL),
(1158, 'HENRY EDUARDO', NULL, NULL, 'chinoguanilo@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GUANILO CHE', 'PERÚ', 'LA LIBERTAD', NULL, '1', '19320401', NULL, '948663608', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Red de Salud Julcan', NULL, NULL),
(1159, 'MIRELLA KAREM', NULL, NULL, 'Mirella.vasquez@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VÁSQUEZ CARHUALLANQUI', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44767202', NULL, '940123417', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diris lima centro ', NULL, NULL),
(1160, 'VANESSA', NULL, NULL, 'vanessahm1007@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMAN MEJIA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '45901128', NULL, '923703356', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Csmc santa Rosa de manchay ', NULL, NULL),
(1161, 'MILAGROS EDELMIRA', NULL, NULL, 'edelmic20@gmail.com', NULL, NULL, 0, NULL, NULL, 'DIAZ CASTILLO', 'PERÚ', 'ANCASH', NULL, '1', '45103918', NULL, '930104896', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de Marini', NULL, NULL),
(1162, 'YESENIA', NULL, NULL, 'yesiplusyes@yahoo.es', NULL, NULL, 0, NULL, NULL, 'ROMERO CABEZAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '28294919', NULL, '959842216', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'EsSalud', NULL, NULL),
(1163, 'MIREILLA ANDRADDE', NULL, NULL, 'mirella.23.12.1988@gmail.com', NULL, NULL, 0, NULL, NULL, 'FERNANDEZ MEDINA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '45480743', NULL, '974867831', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL SAN JUAN DE LURIGANCHO', NULL, NULL),
(1164, 'MARIA DEL PILAR', NULL, NULL, 'pilivs84@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ SUAREZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42480908', NULL, '991842444', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Ejército del Perú ', NULL, NULL),
(1165, 'JANETT ROXANA', NULL, NULL, 'janettromeroc@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ROMERO CABEZAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '28243051', NULL, '990864575', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'ESSALUD ', NULL, NULL),
(1166, 'MARCELO VLADIMIR', NULL, NULL, 'marcelocm1307@gmail.com', NULL, NULL, 0, NULL, NULL, 'CRUZ MARTINEZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '47871516', NULL, '937319457', NULL, 'PRIVADA', 'OTRA', 'ANACAB', NULL, NULL),
(1167, 'ROSSE MARIA', NULL, NULL, 'rossevillanueva_@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VILLANUEVA JAPA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41219104', NULL, '948983722', NULL, 'AMBOS', 'LIC. ENFERMERÍA', 'ESSALUD', NULL, NULL),
(1168, 'YESSICA IRIS', NULL, NULL, 'yessicasalazar@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALAZAR QUIROZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '09632751', NULL, '999171160', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL NACIONAL SERGIO BERNALES', NULL, NULL),
(1169, 'PAULINA', NULL, NULL, 'pvictorioehe@gmail.com', NULL, NULL, 0, NULL, NULL, 'VICTORIO ECHEVARRIA', 'PERÚ', 'JUNÍN', NULL, '1', '43194650', NULL, '950812857', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'HRRPP Huancayo', NULL, NULL),
(1170, 'GLORIA LUZ', NULL, NULL, 'gloriaal8@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ALIAGA ALIAGA', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '40500147', NULL, '956627370', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Minsa', NULL, NULL),
(1171, 'LISSET DEL CARMEN', NULL, NULL, 'lpassiurin@gmail.com', NULL, NULL, 0, NULL, NULL, 'PASSIURI NORIEGA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40721991', NULL, '938871490', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Dirección de Infosalud -MINSA', NULL, NULL),
(1172, 'CESAR HUGO', NULL, NULL, 'Cesarhugovillegasbautista@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLEGAS BAUTISTA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '09629544', NULL, '959876518', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL DE EMERGENCIAS PEDIATRICAS', NULL, NULL),
(1173, 'LOURDES MARIA', NULL, NULL, 'lourdessandovalb@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANDOVAL BELLING', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '07876651', NULL, '992496551', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Maria Auxiliadora ', NULL, NULL),
(1174, 'BETBIARY MARIEL', NULL, NULL, 'betdiazcoral@gmail.com', NULL, NULL, 0, NULL, NULL, 'DIAZ CORAL', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43278868', NULL, '947687414', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'PCRIS ', NULL, NULL),
(1175, 'GIANINA LIZETH', NULL, NULL, 'gjaviervilchez@gmail.com', NULL, NULL, 0, NULL, NULL, 'JAVIER VILCHEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '47796656', NULL, '941159113', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Diris lima centro ', NULL, NULL),
(1176, 'JOAN JENNYFER', NULL, NULL, 'joanlevisalfaro@gmail.com', NULL, NULL, 0, NULL, NULL, 'LEVIS ALFARO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '47527456', NULL, '950270328', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'EsSalud ', NULL, NULL),
(1177, 'LEONOR ELIZABETH', NULL, NULL, 'leonorcastrat@gmail.com', NULL, NULL, 0, NULL, NULL, 'CASTRAT CHAPILLIQUEN', 'PERÚ', 'LA LIBERTAD', NULL, '1', '71513420', NULL, '948391242', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Minsa Gran chimu ', NULL, NULL),
(1178, 'FRANK RONALD', NULL, NULL, 'Frank_649@hotmail.com', NULL, NULL, 0, NULL, NULL, 'JUAREZ LOPEZ', 'PERÚ', 'PIURA', NULL, '1', '44671489', NULL, '918397601', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Ministerio de salud - Micro Red de Salud Huarmaca ', NULL, NULL),
(1179, 'KAROL', NULL, NULL, 'karolperezch@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ CHUQUIHUANCA', 'PERÚ', 'PIURA', NULL, '1', '44996614', NULL, '912154949', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'I-4 HUARMACA', NULL, NULL),
(1180, 'KAREN DEL ROCIO', NULL, NULL, 'karendelrocioz@gmail.com', NULL, NULL, 0, NULL, NULL, 'ZUTA MENDOZA', 'PERÚ', 'AMAZONAS', NULL, '1', '70864365', NULL, '973216381', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital regional Virgen de fatima', NULL, NULL),
(1181, 'EDMUNDO MAK GREGOR', NULL, NULL, 'gsuarez@ugelhuaytara.gob.pe', NULL, NULL, 0, NULL, NULL, 'SUAREZ ÑACARI', 'PERÚ', 'HUANCAVELICA', NULL, '1', '40667883', NULL, '956431235', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'HUAYTARÁ', NULL, NULL),
(1182, 'PERCY OLIMPIO', NULL, NULL, 'pms20102935@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORALES SERRANO', 'PERÚ', 'JUNÍN', NULL, '1', '20102935', NULL, '980036025', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'MINSA', NULL, NULL),
(1183, 'KATYCSA YULIANNA', NULL, NULL, 'Yul_0212@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LUYO CANDELA', 'PERÚ', 'OTRO', NULL, '1', '70059952', NULL, '993772158', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Centro Médico Nuestra Señora Virgen del Carmen ', NULL, NULL),
(1184, 'LILIANA RUTH', NULL, NULL, 'Lilianaruthvegaguillenamor@gmail.com', NULL, NULL, 0, NULL, NULL, 'VEGA GUILLEN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46711540', NULL, '993719192', NULL, 'PRIVADA', 'NUTRICIONISTA', 'Nutrisan ', NULL, NULL),
(1185, 'ANA MARIA ROSMERY', NULL, NULL, 'anamariardv@outlook.com', NULL, NULL, 0, NULL, NULL, 'DURAND VALLE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08619544', NULL, '967756274', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro Salud San Isidro', NULL, NULL),
(1186, 'CARLOS DAVID', NULL, NULL, 'dvillaltah@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLALTA HERRERA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '70432387', NULL, '987099278', NULL, 'PRIVADA', 'OTRA', 'Clínica Angloamericana ', NULL, NULL),
(1187, 'GUADALUPE', NULL, NULL, 'fernandezchaf26@gmail.com', NULL, NULL, 0, NULL, NULL, 'FERNANDEZ MACALUPU', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40825586', NULL, '937204866', NULL, 'AMBOS', 'TÉCNICO EN ENFERMERÍA', 'Hospital Edgardo Rebagliati Martíns ', NULL, NULL),
(1188, 'ROSA VICTORIA', NULL, NULL, 'vibaromi@gmail.com', NULL, NULL, 0, NULL, NULL, 'MINAYA BARRENECHEA', 'PERÚ', 'ANCASH', NULL, '1', '71652340', NULL, '945089556', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Centro de atención Madre niño', NULL, NULL),
(1189, 'AURIA MIDALI', NULL, NULL, 'amy-24@hotmail.com', NULL, NULL, 0, NULL, NULL, 'JARAMILLO ESPINOZA', 'PERÚ', 'ANCASH', NULL, '1', '41992881', NULL, '990936576', NULL, 'PÚBLICA', 'OTRA', 'Cuna Más ', NULL, NULL),
(1190, 'ALEJANDRA', NULL, NULL, 'abendezuc@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'BENDEZU CHACALTANA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40201084', NULL, '900614705', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'UNMSM', NULL, NULL),
(1191, 'DENNIS ITALO', NULL, NULL, 'italovaler@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VALER UGARTE', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40723149', NULL, '990996950', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'INSTITUTO NACIONAL DE SALUD DEL NIÑO ', NULL, NULL),
(1192, 'FREDY IVAN', NULL, NULL, 'fsucaric@gmail.com', NULL, NULL, 0, NULL, NULL, 'SUCARI CALLOHUANCA', 'PERÚ', 'PUNO', NULL, '1', '70058424', NULL, '951596433', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Consultorio médico privado ', NULL, NULL),
(1193, 'CELIA SUSANA', NULL, NULL, 'celiasus@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MOLERO COCA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08868193', NULL, '998700597', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Essalud', NULL, NULL),
(1194, 'OLGA MARIA MARTHA DEL CARMEN', NULL, NULL, 'olgakatos@hotmail.con', NULL, NULL, 0, NULL, NULL, 'KATO SAENZ', 'PERÚ', 'LA LIBERTAD', NULL, '1', '41144583', NULL, '986778405', NULL, 'AMBOS', 'OTRA', 'EsSalud', NULL, NULL),
(1196, 'LUSMILA AIS', NULL, NULL, 'luescris@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ESPINOZA CRISTOBAL', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '04044882', NULL, '995178936', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital de Huaycan ', NULL, NULL),
(1197, 'ANGIE ZONALY', NULL, NULL, 'angiezonaly.vc@gmail.com', NULL, NULL, 0, NULL, NULL, 'VASQUEZ CHAVESTA', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '74718903', NULL, '940002034', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CENTRO MÉDICO MILITAR DIVINO NIÑO DEL MILAGRO DE ETEN', NULL, NULL),
(1198, 'ROSEMARI LISSBETH', NULL, NULL, 'gabrielalvites@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUIROZ ROMERO', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16714927', NULL, '945419458', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'MINSA/ C.S TUMAN', NULL, NULL),
(1199, 'NICIDA', NULL, NULL, 'nicidacordova18@gmail.com', NULL, NULL, 0, NULL, NULL, 'CORDOVA AREBALO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '44502012', NULL, '989987268', NULL, 'PRIVADA', 'TÉCNICO EN ENFERMERÍA', 'Independiente ', NULL, NULL),
(1200, 'MAGALI', NULL, NULL, 'maggi_mendoza@yahoo.es', NULL, NULL, 0, NULL, NULL, 'MENDOZA QUISPE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '29733742', NULL, '987248484', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'INSN ', NULL, NULL),
(1201, 'YESSENIA ISABEL', NULL, NULL, 'yesisaguabas@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUADALUPE BASTIDAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72126959', NULL, '945166473', NULL, 'PRIVADA', 'NUTRICIONISTA', 'Nutrirecetarios Perú ', NULL, NULL),
(1202, 'EVELYN JANETH', NULL, NULL, 'evelynjjo@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALES CABRERA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42145655', NULL, '956756404', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S Cv', NULL, NULL),
(1203, 'KAREN LISETH', NULL, NULL, 'karen_rz132@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RAMIREZ ZEGARRA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '45123680', NULL, '954749357', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de Salud Delicias de Villa', NULL, NULL),
(1204, 'JOSE LUIS', NULL, NULL, 'mandinext@gmail.com', NULL, NULL, 0, NULL, NULL, 'MANDINO Y MAMANI', 'PERÚ', 'PUNO', NULL, '1', '40774721', NULL, '982463332', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'RED DE SALUD SAN ROMAN', NULL, NULL),
(1205, 'MARIA MILAGROS', NULL, NULL, 'mariamilagrosqh@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE HUAMANI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46555633', NULL, '933019609', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'FAP', NULL, NULL),
(1206, 'ELIDA MIRTHA', NULL, NULL, 'Elida.investiga@gmail.com', NULL, NULL, 0, NULL, NULL, 'BRAVO BENITES', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '09468499', NULL, '943127682', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Fuerza Aérea del Perú ', NULL, NULL),
(1207, 'JULIO ENRIQUE', NULL, NULL, 'patazcadocente@gmail.com', NULL, NULL, 0, NULL, NULL, 'PATAZCA ULFE', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16690429', NULL, '975566299', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S. TORIBIA CASTRO CHIRINOS ', NULL, NULL),
(1208, 'NESTOR ALONSO', NULL, NULL, 'linknestor.95@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAYANI YARE', 'PERÚ', 'MADRE DE DIOS', NULL, '1', '70482516', NULL, '973223493', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS HUEPETUHE ', NULL, NULL),
(1209, 'AMERICA LUCIA', NULL, NULL, 'americachang@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHANG YUI', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06768013', NULL, '996319163', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Arzobispo Loayza', NULL, NULL),
(1210, 'JESSICA ELIANA', NULL, NULL, 'gh.jess@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GUTIERREZ HERNANDEZ', 'PERÚ', 'ANCASH', NULL, '1', '45508857', NULL, '943135648', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud mental comunitario Santa ', NULL, NULL),
(1211, 'CARMEN ROSA DE JESUS', NULL, NULL, 'gueoto@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GUERRERO OTTINIANO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07249994', NULL, '998015894', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS chacra Colorada ', NULL, NULL),
(1212, 'WALID ENGELS', NULL, NULL, 'engels4484@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOLORZANO MACHADO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42344209', NULL, '966968058', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud Manzanares', NULL, NULL),
(1213, 'JOHANA ENCARNACION', NULL, NULL, 'anajoha@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PINTO SILVESTRE', 'PERÚ', 'ANCASH', NULL, '1', '43456372', NULL, '992668859', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Red de salud huaylas sur', NULL, NULL),
(1214, 'JOHANA MELISSA', NULL, NULL, 'jmqs4987@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUINTANA SILVA', 'PERÚ', 'CALLAO', NULL, '1', '44641080', NULL, '987089356', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Diresa Callao ', NULL, NULL),
(1215, 'MARILDA CELIA', NULL, NULL, 'marildacelia@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DURAN TOLEDO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42425253', NULL, '989778093', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA LIMA', NULL, NULL),
(1216, 'KELLY', NULL, NULL, 'ktcsw456@hotmail.com', NULL, NULL, 0, NULL, NULL, 'TACANGA CONTRERAS', 'PERÚ', 'LA LIBERTAD', NULL, '1', '18888703', NULL, '949933067', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'CS Santa Catalina ', NULL, NULL),
(1217, 'CONSUELO ROSA', NULL, NULL, 'rositaobregon26@gmail.com', NULL, NULL, 0, NULL, NULL, 'OBREGON AQUINO', 'PERÚ', 'JUNÍN', NULL, '1', '20072860', NULL, '964809096', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.S. CHILCA', NULL, NULL),
(1218, 'ISAMAR YECENIA', NULL, NULL, 'Zaratesantosisamar@gmail.com', NULL, NULL, 0, NULL, NULL, 'ZARATE SANTOS', 'PERÚ', 'JUNÍN', NULL, '1', '47464391', NULL, '967985930', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'MRS CHILCA-RED VALLE DEL MANTARO', NULL, NULL),
(1219, 'MAURA ROXANA', NULL, NULL, 'm.caroso@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARPIO LLACUACHAQUI', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '16791315', NULL, '992466184', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'MINSA', NULL, NULL),
(1220, 'GLADYS MIRTHA', NULL, NULL, 'mirthacentro@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARTINEZ GUERRA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10126532', NULL, '953943057', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'DIRIS LIMA CENTRO', NULL, NULL),
(1221, 'ROSARIO JENNY', NULL, NULL, 'rosarioalarconj@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ALARCON JUAREZ', 'PERÚ', 'APURÍMAC', NULL, '1', '06811697', NULL, '974207421', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'C.S. Dr. Carlos Ayestas La Torre ', NULL, NULL),
(1222, 'FANY YRLANDA', NULL, NULL, 'fanny_davila01@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PACHECO DAVILA', 'PERÚ', 'TACNA', NULL, '1', '04403017', NULL, '952888185', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CENTRO DE SALUD A. B. LEGUIA - MINSA ', NULL, NULL),
(1223, 'MARIA EUGENIA', NULL, NULL, 'mariaseperakhernandez@gmail.com', NULL, NULL, 0, NULL, NULL, 'SEPERAK HERNANDEZ', 'PERÚ', 'ICA', NULL, '1', '71878393', NULL, '937399255', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'PRIVADA', NULL, NULL),
(1224, 'SACHENKA NAJELLI', NULL, NULL, 'Sache1318@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHAPARRO CUBAS', 'PERÚ', 'AREQUIPA', NULL, '1', '70434505', NULL, '943686172', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud Acari ', NULL, NULL),
(1225, 'JULIO ENRIQUE', NULL, NULL, 'discofree@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CARPIO LLACUACHAQUI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10844629', NULL, '997087954', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Consultorio', NULL, NULL),
(1226, 'LOURDES', NULL, NULL, 'lrodriguezflores2018@gmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ FLORES', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '08105858', NULL, '996137234', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Policlínico Policial Chorrillos PNP', NULL, NULL),
(1227, 'YOCELA ROSMERY', NULL, NULL, 'yocelalt31@gmail.com', NULL, NULL, 0, NULL, NULL, 'LEON TUMIALAN', 'PERÚ', 'HUANCAVELICA', NULL, '1', '45358107', NULL, '986361687', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Hospital II de la Red Asistencial de Huancavelica ', NULL, NULL),
(1228, 'JOSUE LOT', NULL, NULL, 'josuelotrojasorihuela@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS ORIHUELA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '75284734', NULL, '984803353', NULL, 'PÚBLICA', 'OTRA', 'Hospital Nacional Hipólito Unanue ', NULL, NULL),
(1229, 'HEM ANGEL', NULL, NULL, 'hem_12_89@hotmail.com', NULL, NULL, 0, NULL, NULL, 'WONG BORRERO', 'PERÚ', 'PIURA', NULL, '1', '45510676', NULL, '995224305', NULL, 'AMBOS', 'CIRUJANO DENTISTA', 'Hospital de Chulucanas', NULL, NULL),
(1230, 'MELISSA', NULL, NULL, 'melissajimenezp@gmail.com', NULL, NULL, 0, NULL, NULL, 'JIMENEZ PALACIOS', 'PERÚ', 'ICA', NULL, '1', '40021142', NULL, '969096006', NULL, 'PRIVADA', 'QUÍMICO FARMACÉUTICO', 'Privada', NULL, NULL),
(1231, 'ERIKA GIOVANNA', NULL, NULL, 'sierraltaerika@gmail.com', NULL, NULL, 0, NULL, NULL, 'SIERRALTA SOTO', 'PERÚ', 'CALLAO', NULL, '1', '20122823', NULL, '991319924', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'Essalud', NULL, NULL),
(1232, 'ROSSANA MARIA', NULL, NULL, 'rossanalimo@yahoo.com', NULL, NULL, 0, NULL, NULL, 'LIMO TEJADA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '41856721', NULL, '995923732', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'DIRIS Lima Sur ', NULL, NULL),
(1233, 'ELENA LOURDES', NULL, NULL, 'elenafernandez181996@gmail.com', NULL, NULL, 0, NULL, NULL, 'FERNANDEZ COLACHAGUA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08101024', NULL, '988343083', NULL, 'PÚBLICA', 'OTRA', 'HVLH', NULL, NULL),
(1234, 'GERSON FRAY', NULL, NULL, 'frayalejandro1015@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALEJANDRO CHAVEZ', 'PERÚ', 'PASCO', NULL, '1', '44938990', NULL, '931629584', NULL, 'PÚBLICA', 'INGENIERÍA', 'HOSPITAL REGIONAL DR. DANIEL ALCIDES CARRION', NULL, NULL),
(1235, 'YANETH MARIBEL', NULL, NULL, 'netiz2088@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARREDONDO CHAVEZ', 'PERÚ', 'PIURA', NULL, '1', '45474602', NULL, '991596447', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Chulucanas', NULL, NULL),
(1236, 'OMAR', NULL, NULL, 'OMAREYNAGA196@GAMIL.COM', NULL, NULL, 0, NULL, NULL, 'REYNAGA RUPIRE', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '40702570', NULL, '997260521', NULL, 'AMBOS', 'INGENIERÍA', 'HOSPITAL NACIONAL CAYETANO HEREDIA', NULL, NULL),
(1237, 'PILAR ELIZABETH', NULL, NULL, 'Elizabethrh_157@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RAMIREZ HUALLCCA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43958766', NULL, '973878713', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Hospital nacional Edgardo Rebagliati Martins ', NULL, NULL),
(1238, 'MILAGROS MARIA', NULL, NULL, 'milagrosoct10@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARTINEZ CONTRERAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07485031', NULL, '957240215', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'DIGTEL', NULL, NULL),
(1239, 'MARINA', NULL, NULL, 'aynamarina@gmail.com', NULL, NULL, 0, NULL, NULL, 'AYNA CONDORI', 'PERÚ', 'AYACUCHO', NULL, '1', '47626906', NULL, '952686531', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'RED DE SALUD LUCANAS', NULL, NULL),
(1240, 'JOSE', NULL, NULL, 'medicusjose@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MEJIA VILLARREAL', 'PERÚ', 'HUÁNUCO', NULL, '1', '40183602', NULL, '973517428', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'PUESTO DE SALUD PUCAYACU', NULL, NULL),
(1241, 'DONNY ALFONSO', NULL, NULL, 'medicsyd@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS APAZA', 'PERÚ', 'TACNA', NULL, '1', '00504042', NULL, '968544517', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de Salud La Esperanza ', NULL, NULL),
(1242, 'FERNANDA DIUVINA', NULL, NULL, 'fernanda.alvarado@unmsm.edu.pe', NULL, NULL, 0, NULL, NULL, 'ALVARADO BARZOLA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '75331347', NULL, '994884480', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Universidad Nacional Mayor de San Marcos ', NULL, NULL),
(1243, 'CARMEN YANET', NULL, NULL, 'yanetsilvaponce@gmail.com', NULL, NULL, 0, NULL, NULL, 'SILVA PONCE', 'PERÚ', 'TACNA', NULL, '1', '44548529', NULL, '980703033', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'CAP II Luis PALZA Levano ', NULL, NULL),
(1244, 'LEONARDO EDWIN', NULL, NULL, 'Kirantimana@gmail.com', NULL, NULL, 0, NULL, NULL, 'TIMANA VILCHEZ', 'PERÚ', 'PASCO', NULL, '1', '22516877', NULL, '954848414', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Auquimarca ', NULL, NULL),
(1245, 'RICARDO JESUS', NULL, NULL, 'rttgeriatria@hotmail.com', NULL, NULL, 0, NULL, NULL, 'TINOCO TEJADA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '29251405', NULL, '998182551', NULL, 'PÚBLICA', 'OTRA', 'Hospital Policial Geriátrico San Jose ', NULL, NULL),
(1246, 'IVONNE DEL PILAR', NULL, NULL, 'ivoncitasalazar1@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALAZAR VALLEJO', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '42681215', NULL, '953569680', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Particular ', NULL, NULL),
(1247, 'LILE CAROL', NULL, NULL, 'carol_vg76@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VARGAS GONZALES', 'PERÚ', 'LA LIBERTAD', NULL, '1', '18160507', NULL, '978213172', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'HOSPITAL BELEN DE TRUJILLO', NULL, NULL),
(1248, 'AGUSTIN', NULL, NULL, 'agustbad@gmail.com', NULL, NULL, 0, NULL, NULL, 'TAPIA BARBOZA', 'PERÚ', 'CAJAMARCA', NULL, '1', '41298084', NULL, '969913355', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Red Bambamarca', NULL, NULL),
(1249, 'JUDITH ALICIA', NULL, NULL, 'judithalicia18@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHOQUE CALISAYA', 'PERÚ', 'MOQUEGUA', NULL, '1', '07599897', NULL, '993508920', NULL, 'AMBOS', 'TÉCNICO EN ENFERMERÍA', 'CS SAN FRANCISCO ', NULL, NULL),
(1250, 'GABRIELA SOFIA', NULL, NULL, 'sg8501328@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUTIERREZ GUTIERREZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '75832712', NULL, '904824686', NULL, 'AMBOS', 'OTRA', '0', NULL, NULL),
(1251, 'ROMI DANNA', NULL, NULL, 'romerydanna@gmail.com', NULL, NULL, 0, NULL, NULL, 'MECHAN SALAZAR', 'PERÚ', 'CAJAMARCA', NULL, '1', '43083248', NULL, '949038681', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital José Soto cadenillas ', NULL, NULL),
(1252, 'JUAN GUALBERTO', NULL, NULL, 'juangpr@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PEÑA RUIZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '15958873', NULL, '999227970', NULL, 'PÚBLICA', 'INGENIERÍA', 'Hospital Nacional Cayetano Heredia', NULL, NULL),
(1253, 'JOSE SMITH', NULL, NULL, 'jsmithp.189@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ SANCHEZ', 'PERÚ', 'LORETO', NULL, '1', '45665000', NULL, '965792503', NULL, 'PÚBLICA', 'INGENIERÍA', 'RED DE SALUD LORETO - NAUTA', NULL, NULL),
(1254, 'JHOSELY MILAGROS', NULL, NULL, 'jev.vemy@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESTRADA VASQUEZ', 'PERÚ', 'PIURA', NULL, '1', '46091538', NULL, '969616102', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL DE APOYO II-2 SULLANA', NULL, NULL),
(1255, 'ERICK ALEXANDER', NULL, NULL, 'erick.alcc@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CAYO CALSIN', 'PERÚ', 'PUNO', NULL, '1', '45004701', NULL, '997054686', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Red de Salud Yunguyo', NULL, NULL),
(1256, 'LUIS JAVIER', NULL, NULL, 'ljavierescobedo@gmail.com', NULL, NULL, 0, NULL, NULL, 'ESCOBEDO VELASQUEZ', 'PERÚ', 'LA LIBERTAD', NULL, '1', '70392335', NULL, '995566001', NULL, 'PÚBLICA', 'INGENIERÍA', 'GERENCIA REGIONAL DE SALUD LA LIBERTAD', NULL, NULL),
(1257, 'SEYDEL FAVIOLA', NULL, NULL, 'faviola23seydel@gmail.com', NULL, NULL, 0, NULL, NULL, 'RUELAS PAREDES', 'PERÚ', 'PUNO', NULL, '1', '43567172', NULL, '951937708', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital regional Manuel Nuñez BUTRON-Puno ', NULL, NULL),
(1258, 'JUAN GUALBERTO', NULL, NULL, 'juancaya41@gmail.com', NULL, NULL, 0, NULL, NULL, 'CACERES YANQUI', 'PERÚ', 'AREQUIPA', NULL, '1', '29428645', NULL, '959008009', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL REGIONAL HONORIO DELGADO AREQUIPA ', NULL, NULL),
(1259, 'HENNY', NULL, NULL, 'Hesagatpto@yahoo.es', NULL, NULL, 0, NULL, NULL, 'SANCHEZ GARCIA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '08210727', NULL, '954510680', NULL, 'PÚBLICA', 'OTRA', 'Hospital Militar Central', NULL, NULL),
(1260, 'SAYDA', NULL, NULL, 'Kontrerassayh@gmail.com', NULL, NULL, 0, NULL, NULL, 'CONTRERAS HUAMANI', 'PERÚ', 'APURÍMAC', NULL, '1', '46549336', NULL, '980960561', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'CSMC SEÑOR DE ANIMAS', NULL, NULL),
(1261, 'PAOLA ESTEFANY', NULL, NULL, 'pchr_91@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHAVEZ RODRIGUEZ', 'PERÚ', 'ANCASH', NULL, '1', '71597240', NULL, '983549750', NULL, 'PÚBLICA', 'OTRA', 'CENTRO DE SALUD MENTAL COMUNITARIO CARHUAZ', NULL, NULL),
(1262, 'ROSY PAULA', NULL, NULL, 'rosypaula5@gmail.com', NULL, NULL, 0, NULL, NULL, 'JIMENEZ PAREDES', 'PERÚ', 'PUNO', NULL, '1', '40435964', NULL, '948067123', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Puesto de salud tinicachi ', NULL, NULL),
(1263, 'ROXANA MERCEDES', NULL, NULL, 'roxymecani@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAMPOS ÑIQUE', 'PERÚ', 'ANCASH', NULL, '1', '21782243', NULL, '945883788', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Centro salud YUGOSLAVIA ', NULL, NULL),
(1264, 'HILDA OFELIA', NULL, NULL, 'hferrer2023@gmail.com', NULL, NULL, 0, NULL, NULL, 'FERRER RAMIREZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '08443607', NULL, '998903154', NULL, 'PÚBLICA', 'OTRA', 'csmc joseph gerad', NULL, NULL),
(1265, 'NORMA GLORIA', NULL, NULL, 'norma.gloria.mq@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAMANI QUISPE', 'PERÚ', 'PUNO', NULL, '1', '46867764', NULL, '921057902', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL CARLOS MONGE MEDRANO JULIACA', NULL, NULL),
(1266, 'RUCKMINY', NULL, NULL, 'minicusihuaman@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUSIHUAMAN SURCO', 'PERÚ', 'APURÍMAC', NULL, '1', '24003041', NULL, '959188494', NULL, 'PÚBLICA', 'OTRA', 'hospital tambobamba', NULL, NULL),
(1267, 'MARYCELA', NULL, NULL, 'maryriosreyes25@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIOS REYES', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '17435742', NULL, '970808913', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'MICRO RED PITIPO - FERREÑAFE', NULL, NULL),
(1268, 'TANIA LUZ', NULL, NULL, 'tanialube76@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHANCASANAMPA VEGA', 'PERÚ', 'JUNÍN', NULL, '1', '21287789', NULL, '954949406', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'CENTRO DE SALUD LA OROYA', NULL, NULL),
(1269, 'JESUS ABELITO', NULL, NULL, 'jesusllatassempertegui@gmail.com', NULL, NULL, 0, NULL, NULL, 'LLATAS SEMPERTEGUI', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '47727478', NULL, '966632738', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Centro de Salud Pitipo', NULL, NULL),
(1270, 'CARMEN TERESA', NULL, NULL, 'telesalud@irotrujillo.gob.pe', NULL, NULL, 0, NULL, NULL, 'ARCE MERCEDES', 'PERÚ', 'LA LIBERTAD', NULL, '1', '43098358', NULL, '979529560', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'IRO', NULL, NULL),
(1272, 'ROXANA MARIELA', NULL, NULL, 'roxana18_07@hotmail.com', NULL, NULL, 0, NULL, NULL, 'TICONA ROMAN', 'PERÚ', 'PUNO', NULL, '1', '43679046', NULL, '995585955', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL CARLOS MONGE MEDRANO JULIACA', NULL, NULL),
(1273, 'FIORELLA MILAGROS', NULL, NULL, 'fchumpitaz11085cho@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CHUMPITAZ ORTEGA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43308213', NULL, '946236610', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Nacional Edgardo Rebagliati Martins Essalud ', NULL, NULL),
(1274, 'LINDA MARIBEL', NULL, NULL, 'lindamaribelbm@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARRIONUEVO MENDOZA', 'PERÚ', 'LA LIBERTAD', NULL, '1', '42570229', NULL, '964514950', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'GERESA LA LIBERTAD', NULL, NULL),
(1275, 'MELCI RAQUEL DEL ROSARIO', NULL, NULL, 'melciortiz@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ORTIZ FERNANDEZ', 'PERÚ', 'AREQUIPA', NULL, '1', '45930767', NULL, '959171669', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'Red. De. Salud camana caraveli', NULL, NULL),
(1276, 'JOHN KELY', NULL, NULL, 'jmoscoso@insn.gob.pe', NULL, NULL, 0, NULL, NULL, 'MOSCOSO SHUPINGAHUA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '10863208', NULL, '980550036', NULL, 'PÚBLICA', 'OTRA', 'INSN', NULL, NULL),
(1277, 'GABY', NULL, NULL, 'gavita2309@gmail.com', NULL, NULL, 0, NULL, NULL, 'MANCILLA ROJAS', 'PERÚ', 'AYACUCHO', NULL, '1', '43161627', NULL, '990224034', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Puesto de Salud Machente', NULL, NULL),
(1278, 'MANUELA ELIZABETH', NULL, NULL, 'betzabeth04564@gmail.com', NULL, NULL, 0, NULL, NULL, 'RUMAY AYAY', 'PERÚ', 'LA LIBERTAD', NULL, '1', '42830669', NULL, '935253127', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'SUSALUD ', NULL, NULL),
(1279, 'LUZ JHOLY', NULL, NULL, 'jholyluz@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHOQUENAIRA CONDORI', 'PERÚ', 'CUSCO', NULL, '1', '41054007', NULL, '989688104', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'U.E 409 Hospital Alfredo Callo Rodríguez Sicuani ', NULL, NULL),
(1280, 'MARIA CECILIA', NULL, NULL, 'mceciliamachacaq@gmail.com', NULL, NULL, 0, NULL, NULL, 'MACHACA QUISPE', 'PERÚ', 'AREQUIPA', NULL, '1', '40620347', NULL, '966661555', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'CENTRO DE SALUD I-4 JAVIER LLOSA GARCÍA', NULL, NULL),
(1281, 'LOURDES', NULL, NULL, 'lumalej24@gmail.com', NULL, NULL, 0, NULL, NULL, 'MALLAUPOMA LEGUIA', 'PERÚ', 'APURÍMAC', NULL, '1', '31173757', NULL, '956600300', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de salud Pacucha', NULL, NULL),
(1282, 'LUIS MIGUEL', NULL, NULL, 'luchinki@aol.com', NULL, NULL, 0, NULL, NULL, 'RAMOS PARI', 'PERÚ', 'AREQUIPA', NULL, '1', '45906855', NULL, '995582176', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital regional honorio delgado ', NULL, NULL),
(1283, 'ROXANA NOEMI', NULL, NULL, 'chanaqf@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ OCHOA', 'PERÚ', 'PUNO', NULL, '1', '44760417', NULL, '979988788', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Ejército peruano ', NULL, NULL),
(1284, 'ISABEL DEBORA', NULL, NULL, 'isabeltorres565@gmail.com', NULL, NULL, 0, NULL, NULL, 'TORRES DIAZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '46457726', NULL, '944327118', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'DIRIS Lima Norte ', NULL, NULL),
(1285, 'ELIANA', NULL, NULL, 'elianatruji12@gmail.com', NULL, NULL, 0, NULL, NULL, 'TRUJILLO GRANDEZ', 'PERÚ', 'CUSCO', NULL, '1', '43252201', NULL, '950919129', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Cs wanchaq ', NULL, NULL),
(1286, 'EDITH AMELIA', NULL, NULL, 'marrodri0918@gmail.com', NULL, NULL, 0, NULL, NULL, 'PECEROS SOTO', 'PERÚ', 'LORETO', NULL, '1', '21125404', NULL, '973448239', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'RED DE SALUD DATEM DEL MARAÑON', NULL, NULL),
(1287, 'PEGGY', NULL, NULL, 'Peggyqg.enf@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUIÑONES GONZALES', 'PERÚ', 'CUSCO', NULL, '1', '45936317', NULL, '999157600', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Quillabamba ', NULL, NULL),
(1288, 'MARY ELITA', NULL, NULL, 'maryskaleb@gmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ DIAZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '43496421', NULL, '992883890', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'DIRIS LIMA NORTE ', NULL, NULL),
(1289, 'NIEL DENYS', NULL, NULL, 'asemic4@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LUNA ALMANZA', 'PERÚ', 'LA LIBERTAD', NULL, '1', '18141195', NULL, '949721630', NULL, 'PÚBLICA', 'OTRA', 'Red de salud Sánchez Carrión ', NULL, NULL),
(1290, 'ANTONIA ELSA', NULL, NULL, 'antonel_68@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ROLDAN ALVAREZ', 'PERÚ', 'ANCASH', NULL, '1', '18062752', NULL, '960373879', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Minsa', NULL, NULL),
(1291, 'YESSICA ADRIANA', NULL, NULL, 'yessicasolier2312@gmail.com', NULL, NULL, 0, NULL, NULL, 'SOLIER BUSTIOS', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '09905056', NULL, '969626778', NULL, 'PÚBLICA', 'OTRA', 'CSMC Joseph Gerad Ryus', NULL, NULL),
(1292, 'MADELEINE MONICA', NULL, NULL, 'Rocio_mih@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MIÑANO HARO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09713987', NULL, '996705559', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital María auxiliadora ', NULL, NULL),
(1293, 'WILLIAM ARISTOTELES', NULL, NULL, 'unidadtelesaludhnhu@gmail.com', NULL, NULL, 0, NULL, NULL, 'HIDALGO MONTES', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '42432578', NULL, '953958963', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Nacional Hipólito Unanue', NULL, NULL),
(1294, 'GABRIELA MARIBEL', NULL, NULL, 'gmera@gamel.com.pe', NULL, NULL, 0, NULL, NULL, 'MERA CASTILLO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43416845', NULL, '992743083', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Gamel srl', NULL, NULL),
(1295, 'KIMBERLY BONNY', NULL, NULL, 'Kimzita_89@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ALVA ASIAN', 'PERÚ', 'ANCASH', NULL, '1', '46085969', NULL, '946545015', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', '\"P. S. \"\"Cascapara\"\" \"', NULL, NULL),
(1296, 'NORA JOHANA', NULL, NULL, 'norabuenosalcedo@gmail.com', NULL, NULL, 0, NULL, NULL, 'BUENO SALCEDO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '46040319', NULL, '986442144', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'INSTITUTO NACIONAL DE OFTALMOLOGÍA', NULL, NULL),
(1297, 'ANDREA VANESSA', NULL, NULL, 'ASISTENTE@GAMEL.COM.PE', NULL, NULL, 0, NULL, NULL, 'POSSO FRY', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '47785806', NULL, '982374330', NULL, 'PRIVADA', 'ADMINISTRADOR', 'GAMEL SRL', NULL, NULL),
(1298, 'LIZ TATIANA', NULL, NULL, 'lizvalga@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALDIVIA GARCIA', 'PERÚ', 'TACNA', NULL, '1', '29522467', NULL, '952656256', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'RED DE SALUD TACNA C. S. LA ESPERANZA ', NULL, NULL),
(1299, 'YUDITZA', NULL, NULL, 'yuditzasumaq@gmail.com', NULL, NULL, 0, NULL, NULL, 'PEREZ URRUTIA', 'PERÚ', 'CUSCO', NULL, '1', '46034560', NULL, '949280574', NULL, 'PRIVADA', 'LIC. ENFERMERÍA', 'ESSALUD HNAGV CUSCO', NULL, NULL),
(1300, 'YONHMEL LADISLAO', NULL, NULL, 'yonsony@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HINOJOSA GAMARRA', 'PERÚ', 'HUANCAVELICA', NULL, '1', '41240070', NULL, '993160376', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'IPRESS CONGALLA', NULL, NULL),
(1301, 'ALFREDO', NULL, NULL, 'alfredo169333@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALINAS BACA', 'PERÚ', 'CUSCO', NULL, '1', '74159186', NULL, '941756983', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'Red de Servicios de salud cusco sur ', NULL, NULL),
(1302, 'JOSE ENRIQUE', NULL, NULL, 'jvguillermo22@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLALOBOS GUILLERMO', 'PERÚ', 'AREQUIPA', NULL, '1', '45665962', NULL, '977321975', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud san isidro ', NULL, NULL),
(1303, 'LISBETH SHIRLEY', NULL, NULL, 'shirley.chupillon.lopez@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHUPILLON LOPEZ', 'PERÚ', 'ANCASH', NULL, '1', '47420892', NULL, '965729731', NULL, 'PÚBLICA', 'OTRA', 'C.S. Yauya', NULL, NULL),
(1304, 'CESAR AUGUSTO', NULL, NULL, 'cesito@hotmail.com', NULL, NULL, 0, NULL, NULL, 'HUANCA CALCINA', 'PERÚ', 'AREQUIPA', NULL, '1', '70391268', NULL, '959914114', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud tiabaya', NULL, NULL),
(1305, 'LIZBETH ANGELA', NULL, NULL, 'lizqg-1120@hotmail.com', NULL, NULL, 0, NULL, NULL, 'QUINTANILLA GUTIERREZ', 'PERÚ', 'AREQUIPA', NULL, '1', '72519513', NULL, '993631153', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'Centro de salud de tiabaya ', NULL, NULL),
(1306, 'JOSE', NULL, NULL, 'jmachacap@gmail.com', NULL, NULL, 0, NULL, NULL, 'MACHACA PACORI', 'PERÚ', 'AREQUIPA', NULL, '1', '29582703', NULL, '959992010', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'centro de salud sandrita perez el pedregal', NULL, NULL),
(1307, 'MARIELA KARINA', NULL, NULL, 'villarchurampimarielakarina@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLAR CHURAMPI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41355904', NULL, '974036820', NULL, 'AMBOS', 'CIRUJANO DENTISTA', 'Centro Salud San Mateo', NULL, NULL),
(1308, 'MIRIAN ROXANA', NULL, NULL, 'mireili_07@hotmail.com', NULL, NULL, 0, NULL, NULL, 'CORONEL SERNAQUE', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '40627690', NULL, '950031314', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'P.S. Pampa la Victoria ', NULL, NULL),
(1309, 'ROSARIO', NULL, NULL, 'charito1512@hotmail.com', NULL, NULL, 0, NULL, NULL, 'GARAY PEREZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44780817', NULL, '993054913', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Instituto Nacional Salud del Niño San Borja ', NULL, NULL),
(1310, 'YOVANA ELIZABETH', NULL, NULL, 'YOVANACALLE10@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'CALLE HUAMANI', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07881089', NULL, '987725747', NULL, 'PÚBLICA', 'OTRA', 'MINISTERIO DE LA MUJER', NULL, NULL),
(1311, 'GLADYS LINA', NULL, NULL, 'GLADYS166@YAHOO.ES', NULL, NULL, 0, NULL, NULL, 'OCHOA CANAL', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '09701315', NULL, '950550541', NULL, 'PRIVADA', 'OTRA', 'C&F projects sac', NULL, NULL),
(1312, 'VERONICA ELISABETH', NULL, NULL, 'v.elisabeth88@gmail.com', NULL, NULL, 0, NULL, NULL, 'CORONEL SERNAQUE', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '45298604', NULL, '955843527', NULL, 'PÚBLICA', 'TÉCNICO EN ENFERMERÍA', 'P.s pampa la victoria ', NULL, NULL),
(1313, 'CARMEN ROSA', NULL, NULL, 'carmen_enfermeria_cr@hotmail.com', NULL, NULL, 0, NULL, NULL, 'INGA HUAMANI', 'PERÚ', 'APURÍMAC', NULL, '1', '70764882', NULL, '935448859', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Red de salud Abancay ', NULL, NULL),
(1314, 'JUAN CARLOS', NULL, NULL, 'Gruplib@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ORTIZ ARAUJO', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '43647266', NULL, '948771593', NULL, 'PÚBLICA', 'OTRA', 'CENTRO DE SALUD JOSE LEONARDO ORTIZ', NULL, NULL),
(1315, 'GIANELLA DAYANA', NULL, NULL, 'gianellagaray13@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARAY ORIHUELA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '74706942', NULL, '924582317', NULL, 'PRIVADA', 'CIRUJANO DENTISTA', 'Consultorio Odontotuti', NULL, NULL),
(1316, 'MISHEL STEFANY', NULL, NULL, 'shel.my3006@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUYUBAMBA QUISPE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '47767153', NULL, '955601799', NULL, 'PÚBLICA', 'NUTRICIONISTA', 'INSTITUTO NACONAL DE ENFERMEDADES NEOPLASICAS', NULL, NULL),
(1317, 'NARDA ELIZABETH', NULL, NULL, 'nardapsy2@gmail.com', NULL, NULL, 0, NULL, NULL, 'PAZ SOLDAN YATACO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07505988', NULL, '999904621', NULL, 'PÚBLICA', 'OTRA', 'direcion de redes integradas de salud lima este', NULL, NULL),
(1318, 'NOELIA MARILYN', NULL, NULL, 'npisconteguerrero@gmail.com', NULL, NULL, 0, NULL, NULL, 'PISCONTE GUERRERO', 'PERÚ', 'ICA', NULL, '1', '45092139', NULL, '975765841', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Centro de Salud Santa Filomena', NULL, NULL),
(1319, 'MARINA SISY', NULL, NULL, 'sisyrodriguez12@gmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ SISNIEGUES', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '08122819', NULL, '991886385', NULL, 'PÚBLICA', 'OTRA', 'Diris LE', NULL, NULL),
(1320, 'GUISELLA ELAIDE', NULL, NULL, 'guisellaarango2020@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARANGO SANCHEZ', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '40051793', NULL, '999082776', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'DIRIS LIMA ESTE ', NULL, NULL),
(1321, 'BETTY ANGELICA', NULL, NULL, 'angelicab2007@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MARAVI ESCURRA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '20024678', NULL, '993805515', NULL, 'PÚBLICA', 'OTRA', 'Infosalud ', NULL, NULL),
(1322, 'DAVID ILICH', NULL, NULL, 'Davsan82@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SANCHEZ CALLE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41552489', NULL, '973110496', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Aviva', NULL, NULL),
(1323, 'LUIS GILMAR', NULL, NULL, 'Luis.quispe@live.com', NULL, NULL, 0, NULL, NULL, 'QUISPE YSACIGA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '25843376', NULL, '982600334', NULL, 'PRIVADA', 'INGENIERÍA', 'CEM', NULL, NULL),
(1324, 'ZOILA ROSA', NULL, NULL, 'zoilarosam0@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORENO GARRIDO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07033295', NULL, '996890139', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Nacional Dos de mayo ', NULL, NULL),
(1325, 'CESAR ANTONIO', NULL, NULL, 'valdezcesarantonio@gmail.com', NULL, NULL, 0, NULL, NULL, 'VALDEZ RODRIGUEZ', 'PERÚ', 'LORETO', NULL, '1', '05399914', NULL, '917355958', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'IPRESS I-4 BELLAVISTA NANAY', NULL, NULL),
(1326, 'VERONICA EDITH', NULL, NULL, 'veroedith.gt@gmail.com', NULL, NULL, 0, NULL, NULL, 'GONZALES TALLEDO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '41169399', NULL, '986017167', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de Chancay ', NULL, NULL),
(1327, 'CARLOS ESTEBAN', NULL, NULL, 'cmamanihui@unsa.edu.pe', NULL, NULL, 0, NULL, NULL, 'MAMANI HUISA', 'PERÚ', 'AREQUIPA', NULL, '1', '70474411', NULL, '957720316', NULL, 'PRIVADA', 'INGENIERÍA', 'DRAEGER PERU S.A.C', NULL, NULL),
(1328, 'MARISOL MAGALI', NULL, NULL, 'marisolhuamanenciso@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMAN ENCISO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '44860950', NULL, '973984023', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Farmacias Peruanas ', NULL, NULL),
(1329, 'SEGUNDO ALFONSO', NULL, NULL, 'alfonsobazanr@gmail.com', NULL, NULL, 0, NULL, NULL, 'BAZAN RAMIREZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '27413075', NULL, '993482133', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL NACIONAL CAYETANO HEREDIA', NULL, NULL),
(1330, 'PERCY RAFAEL', NULL, NULL, 'drpercydread182@gmail.com', NULL, NULL, 0, NULL, NULL, 'VIGURIA VARA', 'PERÚ', 'CALLAO', NULL, '1', '45782216', NULL, '991535429', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital San José ', NULL, NULL),
(1331, 'GLORIA MELITA', NULL, NULL, 'MelitaVillegas@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLEGAS GUTIERREZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72029013', NULL, '992520380', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Essalud ', NULL, NULL),
(1332, 'FREDY ABEL', NULL, NULL, 'fredyalvarado159@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALVARADO RODRIGUEZ', 'PERÚ', 'CALLAO', NULL, '1', '05377604', NULL, '965822727', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA CALLAO', NULL, NULL),
(1333, 'PATRICIA DEL CARMEN', NULL, NULL, 'patriciab2332@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BUSTAMANTE ALCANTARA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40847968', NULL, '974950205', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'Hospital Nacional Dos de Mayo ', NULL, NULL),
(1334, 'MARÍA DEL CÁRMEN', NULL, NULL, 'marita2515@gmail.com', NULL, NULL, 0, NULL, NULL, 'HERNÁNDEZ BENDEZÚ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41615939', NULL, '996817050', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro Nacional de Telemedicina', NULL, NULL),
(1335, 'EMILY MELINA', NULL, NULL, 'emi.baher@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARRIOS HERNANDEZ', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45814775', NULL, '954829111', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Seguro social de salud', NULL, NULL),
(1336, 'CARMEN ROSA', NULL, NULL, 'VCKRMNROSA@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'VILLALOBOS CORONADO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42323996', NULL, '940597576', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'EESALUD', NULL, NULL),
(1337, 'YULISSA YOMIRA', NULL, NULL, 'yulissanieto12@gmail.com', NULL, NULL, 0, NULL, NULL, 'NIETO ALEJO', 'PERÚ', 'AREQUIPA', NULL, '1', '70550649', NULL, '958179362', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HRHD', NULL, NULL),
(1338, 'NILTON CESAR', NULL, NULL, 'nvilelaa@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILELA APONTE', 'PERÚ', 'HUÁNUCO', NULL, '1', '10445723', NULL, '957382676', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'municipalidad distrital de amarilis', NULL, NULL),
(1339, 'WALTER ALBERTO', NULL, NULL, 'waltertrujillomlm@gmail.com', NULL, NULL, 0, NULL, NULL, 'TRUJILLO ANGELES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '70798469', NULL, '964043116', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'INSN Breña', NULL, NULL),
(1340, 'MOYRA', NULL, NULL, 'moyrazaravia81@gmail.com', NULL, NULL, 0, NULL, NULL, 'ZARAVIA RAMOS', 'PERÚ', 'HUANCAVELICA', NULL, '1', '40649782', NULL, '964500985', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRESA HUANCAVELICA ', NULL, NULL),
(1341, 'DIEGO ALEJANDRO', NULL, NULL, 'arguellesdiego5@gmail.com', NULL, NULL, 0, NULL, NULL, 'ARGÜELLES BETETA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '77155883', NULL, '961992905', NULL, 'PRIVADA', 'INGENIERÍA', 'Farmacias Peruanas ', NULL, NULL),
(1342, 'ARAMIS ESTHEFANIE', NULL, NULL, 'aramis.rafael@hotmail.com', NULL, NULL, 0, NULL, NULL, 'RAFAEL CARRANZA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72773186', NULL, '970959699', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSP NACIONAL DOS DE MAYO', NULL, NULL),
(1343, 'LISSETTE GAYLE', NULL, NULL, 'lissettepinto77@gmail.com', NULL, NULL, 0, NULL, NULL, 'PINTO GONZALES', 'PERÚ', 'AREQUIPA', NULL, '1', '30961445', NULL, '987573716', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Hospital Goyeneche ', NULL, NULL),
(1344, 'LADY VIRGINIA', NULL, NULL, 'ladymurrugarra@prevencionlac.org', NULL, NULL, 0, NULL, NULL, 'MURRUGARRA VELARDE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '07164602', NULL, '993470712', NULL, 'PRIVADA', 'OTRA', 'Si', NULL, NULL),
(1345, 'ANGEL PIERO', NULL, NULL, 'guerreroargoteangel@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUERRERO ARGOTE', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '73030313', NULL, '957426421', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital José Agurto Tello de Chosica', NULL, NULL),
(1346, 'CINTYA JESUS', NULL, NULL, 'cenate.asesor@essalud.gob.pe', NULL, NULL, 0, NULL, NULL, 'BARRON SARMIENTO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43247919', NULL, '990058682', NULL, 'AMBOS', 'LIC. OBSTETRICIA', 'Centro Nacional de Telemedicina-Cenate ', NULL, NULL),
(1347, 'PAMELA STEFANIA', NULL, NULL, 'cenate.servicios@essalud.gob.pe', NULL, NULL, 0, NULL, NULL, 'GONZALES RAMOS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '43590898', NULL, '996518883', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Essalud', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(1348, 'GABRIELA YOHANNA', NULL, NULL, 'gayorama40@gmail.com', NULL, NULL, 0, NULL, NULL, 'RAMOS MAMANI', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '41512269', NULL, '991837941', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'HOSPITAL DE EMERGENCIAS VILLA EL SALVADOR ', NULL, NULL),
(1349, 'ILICH ERNESTO', NULL, NULL, 'ilichvalenciasegovia@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VALENCIA SEGOVIA', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '07879666', NULL, '962389544', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Independiente', NULL, NULL),
(1350, 'JOECE MAGALY', NULL, NULL, 'Jochibutron@gmail.com', NULL, NULL, 0, NULL, NULL, 'BUTRON MANTILLA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '41066761', NULL, '963534448', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de Emergencias Pediatricas', NULL, NULL),
(1351, 'MIRELLA KINBERLY', NULL, NULL, 'mirellars56@gmail.com', NULL, NULL, 0, NULL, NULL, 'RUGEL SOCOLA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '72743239', NULL, '935577386', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital de Emergencias Villa el Salvador', NULL, NULL),
(1352, 'DUNISKA', NULL, NULL, 'dtarco@inen.sld.pe', NULL, NULL, 0, NULL, NULL, 'TARCO VIRTO', 'PERÚ', 'DIRIS LIMA SUR', NULL, '1', '23976056', NULL, '977179644', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Instituto Nacional de Enfermedades Neoplasicas ', NULL, NULL),
(1353, 'ALBERTO RICARDO', NULL, NULL, 'acaceda@latinpro.net', NULL, NULL, 0, NULL, NULL, 'CACEDA FARFAN', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '08264025', NULL, '964734266', NULL, 'PRIVADA', 'INGENIERÍA', 'Plataforma Tecnológica Peruana', NULL, NULL),
(1354, 'ELSA', NULL, NULL, 'elsabardales26@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARDALES CANASAS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06718119', NULL, '948846939', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRES LIMA CENTRO RIS 2 CENTRO SALUD CHACRA COLORADA', NULL, NULL),
(1355, 'MARCIA ESTHER', NULL, NULL, 'MARCIAHV19@GMAIL.COM', NULL, NULL, 0, NULL, NULL, 'HURTADO VILLANUEVA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '45158889', NULL, '966573922', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'ESSALUD', NULL, NULL),
(1356, 'FERNANDO LINO', NULL, NULL, 'fernando.ramirezay@essalud.gob.pe', NULL, NULL, 0, NULL, NULL, 'RAMIREZ AYALA', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '22502887', NULL, '987730929', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'ESSALUD', NULL, NULL),
(1357, 'JOSEF ANTONY EDINSON', NULL, NULL, 'antonymq89@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARTINEZ QUISPE', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46347871', NULL, '994142224', NULL, 'PRIVADA', 'INGENIERÍA', 'DIAGNOSTICO UAL SAC', NULL, NULL),
(1358, 'ANGEL BONNY', NULL, NULL, 'angelvillegasneyra@gmail.com', NULL, NULL, 0, NULL, NULL, 'VILLEGAS NEYRA', 'PERÚ', 'PIURA', NULL, '1', '43589658', NULL, '971460106', NULL, 'PRIVADA', 'INGENIERÍA', 'NEUROBIT ', NULL, NULL),
(1359, 'SILVANA LORENA', NULL, NULL, 'silvana.vidalv@gmail.com', NULL, NULL, 0, NULL, NULL, 'VIDAL VENTURO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '44529002', NULL, '986593324', NULL, 'PÚBLICA', 'OTRA', 'PCM', NULL, NULL),
(1360, 'DANIELA', NULL, NULL, 'dwon@farmaciasperuanas.pe', NULL, NULL, 0, NULL, NULL, 'WON SIU', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '46793201', NULL, '963758145', NULL, 'PRIVADA', 'ADMINISTRADOR', 'Farmacias Peruanas', NULL, NULL),
(1361, 'YESENI PILAR', NULL, NULL, 'yeseni.carrasco@essalud.gob.pe', NULL, NULL, 0, NULL, NULL, 'CARRASCO SALINAS', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40600870', NULL, '939393591', NULL, 'PÚBLICA', 'OTRA', 'Seguro Social de Salud', NULL, NULL),
(1362, 'ALVARO DANIEL', NULL, NULL, 'alvaroquispe@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUISPE CARBONEL', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '72436968', NULL, '993311979', NULL, 'PRIVADA', 'INGENIERÍA', 'Farmacias Peruanas', NULL, NULL),
(1363, 'JUAN CARLOS', NULL, NULL, 'jcbartolok@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARTOLO KATO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40128407', NULL, '999999999', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Essalud', NULL, NULL),
(1364, 'RUTH MARIBEL', NULL, NULL, 'ruthmadiaz@gmail.com', NULL, NULL, 0, NULL, NULL, 'MAMANI DIAZ', 'PERÚ', 'CUSCO', NULL, '1', '45439573', NULL, '959190701', NULL, 'PÚBLICA', 'INGENIERÍA', 'GORE CUSCO ', NULL, NULL),
(1365, 'ALEXANDER JOSUE', NULL, NULL, 'alexanderjosue.1981@gmail.com', NULL, NULL, 0, NULL, NULL, 'RENGIFO BOZA', 'PERÚ', 'LORETO', NULL, '1', '41270715', NULL, '965886244', NULL, 'PÚBLICA', 'CIRUJANO DENTISTA', 'Hospital Regional de Loreto ', NULL, NULL),
(1366, 'ERICK JENS', NULL, NULL, 'erickjens.napuri@alum.upf.edu', NULL, NULL, 0, NULL, NULL, 'NAPURI AGUILAR', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '06441274', NULL, '983988080', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'C.s surquillo', NULL, NULL),
(1367, 'ROSA MARGARITA', NULL, NULL, 'Rosychz2@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VALVAS PALMA', 'PERÚ', 'ANCASH', NULL, '1', '40109138', NULL, '965702677', NULL, 'PÚBLICA', 'OTRA', 'Hospitsl de apoyo NSM Carhuaz', NULL, NULL),
(1368, 'JAVIER EDMUNDO', NULL, NULL, 'edmundojas@gmail.com', NULL, NULL, 0, NULL, NULL, 'ALARCÓN SANTOS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40689878', NULL, '987107872', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Rebagliati', NULL, NULL),
(1369, 'KARINA MARIBEL', NULL, NULL, 'karina.romero.rivero@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROMERO RIVERO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '40745991', NULL, '937721905', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'UPCH', NULL, NULL),
(1370, 'GIOVANNA SANDRA', NULL, NULL, 'gsrioscastell@gmail.com', NULL, NULL, 0, NULL, NULL, 'RIOS CASTELL PRADO', 'PERÚ', 'DIRIS LIMA ESTE', NULL, '1', '10659577', NULL, '986542895', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRIS LIAM ESTE', NULL, NULL),
(1371, 'JORGE GUILLERMO', NULL, NULL, 'Cuadrosjorge79@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUADROS HERRERA', 'PERÚ', 'AREQUIPA', NULL, '1', '73274848', NULL, '914761195', NULL, 'PÚBLICA', 'INGENIERÍA', 'Universidad Nacional de San Agustín', NULL, NULL),
(1372, 'YSABEL MARGARITA', NULL, NULL, 'Ichbtrainingperu@gmail.com', NULL, NULL, 0, NULL, NULL, 'JARA MAGALLANES', 'PERÚ', 'ICA', NULL, '1', '10651226', NULL, '992964772', NULL, 'PRIVADA', 'OTRA', 'Capacitaciones peru', NULL, NULL),
(1373, 'JIMMY ANTHONY', NULL, NULL, 'dr.jimmyosorio@gmail.com', NULL, NULL, 0, NULL, NULL, 'OSORIO VILLANUEVA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '40025387', NULL, '996708542', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Diris lima norte', NULL, NULL),
(1374, 'LILY GIANINA', NULL, NULL, 'lilyreyessoria@yahoo.es', NULL, NULL, 0, NULL, NULL, 'REYES SORIA', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '07297527', NULL, '984701757', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'RIS Comas', NULL, NULL),
(1376, 'MICHAEL STEVEN', NULL, NULL, 'mikes.wharton@gmail.com', NULL, NULL, 0, NULL, NULL, 'WHARTON ALBERTO', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '70440013', NULL, '980938161', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro Materno Infantil Laura Rodríguez Dulanto Duksil', NULL, NULL),
(1377, 'LAURA BENITA', NULL, NULL, 'laurabsanz2001@gmail.com', NULL, NULL, 0, NULL, NULL, 'PONCE SANZ', 'PERÚ', 'AREQUIPA', NULL, '1', '06310038', NULL, '984749633', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINISTERIO DE SALUD', NULL, NULL),
(1378, 'SILVIA MONICA', NULL, NULL, 'silviamonicajimenez@gmail.com', NULL, NULL, 0, NULL, NULL, 'JIMENEZ NOVOA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '16687350', NULL, '958441922', NULL, 'PÚBLICA', 'OTRA', 'Centro de Salud Chacra Colorada', NULL, NULL),
(1379, 'RUBEN', NULL, NULL, 'rmirandae12@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MIRANDA ESPINOZA', 'PERÚ', 'APURÍMAC', NULL, '1', '23963675', NULL, '983646469', NULL, 'PÚBLICA', 'ADMINISTRADOR', 'DIRECCION REGIONAL DE SALUD APURIMAC', NULL, NULL),
(1380, 'ROSA MERCEDES', NULL, NULL, 'rosavalmos@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VALDIVIA MOSTAJO', 'PERÚ', 'APURÍMAC', NULL, '1', '23963672', NULL, '954178383', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'HOSPITAL REGIONAL GUILLERMO DIAZ DE LA VEGA', NULL, NULL),
(1381, 'IREL ELIT', NULL, NULL, 'elit74@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BELTRAN CARPIO', 'PERÚ', 'TACNA', NULL, '1', '29576132', NULL, '978848855', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'MINSA', NULL, NULL),
(1382, 'KARLA GIANNINA', NULL, NULL, 'karlagiannina25@gmail.com', NULL, NULL, 0, NULL, NULL, 'CRUZ CHUA', 'PERÚ', 'AREQUIPA', NULL, '1', '45513077', NULL, '982342670', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Microred Chivay', NULL, NULL),
(1383, 'MEKE ELEODORO', NULL, NULL, 'elmecuve@gmail.com', NULL, NULL, 0, NULL, NULL, 'CUYOTUPAC VELIZ', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '41147677', NULL, '977414587', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRIS LIMA NORTE', NULL, NULL),
(1384, 'STYP BILL ROY', NULL, NULL, 'info@stypcanto.com', NULL, NULL, 0, NULL, NULL, 'CANTO RONDON', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '44914706', NULL, '956194180', NULL, 'AMBOS', 'INGENIERÍA', 'HL7 PERÚ', NULL, NULL),
(1385, 'RODOLFO ALEXANDER', NULL, NULL, 'rodmedicina.11@hotmail.com', NULL, NULL, 0, NULL, NULL, 'MACEDO SANCHEZ', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '40432960', NULL, '991769208', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'SEGURO SOCIAL DE SALUD', NULL, NULL),
(1386, 'JACKELINE GLADYS', NULL, NULL, 'jdba01@gmail.com', NULL, NULL, 0, NULL, NULL, 'ROJAS OVIEDO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '09649645', NULL, '902723710', NULL, 'AMBOS', 'CIRUJANO DENTISTA', 'Essalud ', NULL, NULL),
(1387, 'VICTOR LUCIANO', NULL, NULL, 'vitoco1958@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ALVAREZ COLLANTES', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '06075745', NULL, '945600947', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro materno infantil santa luzmila II', NULL, NULL),
(1388, 'KAREN RAQUEL', NULL, NULL, 'macla16@hotmail.com', NULL, NULL, 0, NULL, NULL, 'VARGAS DOSANTOS', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '43118836', NULL, '933623988', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Instituto Peruano de Oncología & Radioterapia ', NULL, NULL),
(1389, 'MARCELA DE GUADALUPE', NULL, NULL, 'marcela.silvazevallos@gmail.com', NULL, NULL, 0, NULL, NULL, 'SILVA ZEVALLOS', 'PERÚ', 'AREQUIPA', NULL, '1', '29289385', NULL, '991770138', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Policlinico Divino Niño', NULL, NULL),
(1390, 'FANNY DEL ROSARIO', NULL, NULL, 'dra.fannybernuy@gmail.com', NULL, NULL, 0, NULL, NULL, 'BERNUY MEDINA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '00497539', NULL, '952294829', NULL, 'AMBOS', 'MÉDICO CIRUJANO', 'Diris lima centro', NULL, NULL),
(1391, 'MARCELINO', NULL, NULL, 'maflomi10@hotmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES MIRANDA', 'PERÚ', 'APURÍMAC', NULL, '1', '31131319', NULL, '930957930', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'DIRESA APURIMAC', NULL, NULL),
(1392, 'LUIS ENRIQUE', NULL, NULL, 'chicharitox1555@gmail.com', NULL, NULL, 0, NULL, NULL, 'SIFUENTES CASO', 'PERÚ', 'AREQUIPA', NULL, '1', '45496464', NULL, '951319312', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Centro de salud el Carmen ', NULL, NULL),
(1393, 'ELSA', NULL, NULL, 'floreselsa0222@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES HILARIO', 'PERÚ', 'LIMA REGIÓN', NULL, '1', '42660982', NULL, '997553792', NULL, 'PÚBLICA', 'QUÍMICO FARMACÉUTICO', 'Diresa Lima ', NULL, NULL),
(1394, 'NURY DAYSY', NULL, NULL, 'nurydaysyt2@gmail.com', NULL, NULL, 0, NULL, NULL, 'TAPIA ESPINOZA', 'PERÚ', 'AREQUIPA', NULL, '1', '29426366', NULL, '959527840', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'Centro de salud edificadores misti', NULL, NULL),
(1395, 'JAVIER MARIO', NULL, NULL, 'javierbar2000@gmail.com', NULL, NULL, 0, NULL, NULL, 'BARBOZA CASSANE', 'PERÚ', 'DIRIS LIMA NORTE', NULL, '1', '09170004', NULL, '991093509', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Diris lima norte', NULL, NULL),
(1396, 'RITA MIRELLA', NULL, NULL, 'rquinoneslu@yahoo.com', NULL, NULL, 0, NULL, NULL, 'QUIÑONES LUCERO', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '07014263', NULL, '992766829', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DIRIS LC _ CS JUAN PEREZ CARRANZA', NULL, NULL),
(1397, 'MILAGROS', NULL, NULL, 'mjaureguis@yahoo.es', NULL, NULL, 0, NULL, NULL, 'JAUREGUI SALON', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '33407199', NULL, '998988297', NULL, 'PÚBLICA', 'LIC. OBSTETRICIA', 'CS San Isidro - MINSA', NULL, NULL),
(1398, 'LUIS ALFREDO', NULL, NULL, 'luissalazar251059@gmail.com', NULL, NULL, 0, NULL, NULL, 'SALAZAR LAZO', 'PERÚ', 'ICA', NULL, '1', '29453439', NULL, '912085680', NULL, 'PRIVADA', 'MÉDICO CIRUJANO', 'Particular ', NULL, NULL),
(1399, 'JUAN RICARDO', NULL, NULL, 'jr_soberon42@gotmail.com', NULL, NULL, 0, NULL, NULL, 'SOBERON QUISPE', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '17415980', NULL, '933900464', NULL, 'PÚBLICA', 'TÉCNICO ADMINISTRADOR', 'GERENCIA REGIONAL DE SALUD LAMBAYEQUE - RED CHICLAYO', NULL, NULL),
(1400, 'VANESSA MIRIAM', NULL, NULL, 'Vmiriams877@gmail.com', NULL, NULL, 0, NULL, NULL, 'SIAPO GUTIERREZ', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '44338856', NULL, '971013819', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Gerencia regional de salud Lambayeque ', NULL, NULL),
(1401, 'CONSUELO CAROLINA', NULL, NULL, 'consueloenf06@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHAMORRO VALLADARES', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '04072131', NULL, '999485222', NULL, 'PÚBLICA', 'LIC. ENFERMERÍA', 'minsa', NULL, NULL),
(1402, 'SILVANA ROSARIO STEFFANIE', NULL, NULL, 'silvanajara0502@gmail.com', NULL, NULL, 0, NULL, NULL, 'ÑAUPARI JARA', 'PERÚ', 'DIRIS LIMA CENTRO', NULL, '1', '10140694', NULL, '990930448', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'Hospital Santa Rosa', NULL, NULL),
(1403, 'JAIME EDUARDO', NULL, NULL, 'jsaavedrapa@gmail.com', NULL, NULL, 0, NULL, NULL, 'SAAVEDRA PAREDES', 'PERÚ', 'LAMBAYEQUE', NULL, '1', '43751665', NULL, '942680319', NULL, 'PÚBLICA', 'INGENIERÍA', 'Geresa Regional Salud Lambayeque - Red Chiclayo ', NULL, NULL),
(1404, 'ALONSO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TENORIO TRIGOSO', NULL, NULL, NULL, '1', '42213720', NULL, NULL, NULL, NULL, NULL, 'MINSA', NULL, NULL),
(1405, 'Ciro Abel Mestas Valero', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1406, 'WALTER HUMBERTO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CURIOSO VILCHEZ', NULL, NULL, NULL, '1', '10220021', NULL, NULL, NULL, NULL, NULL, 'Univ. Continental', NULL, NULL),
(1407, 'Omidres', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Pérez DE CARVELLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OITT', NULL, NULL),
(1408, 'Frank Guzman', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EsSalud', NULL, NULL),
(1409, 'Benjamín Abelardo', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Marticorena Castillo', NULL, NULL, NULL, '1', '7723322', NULL, NULL, NULL, NULL, NULL, 'CONCYTEC', NULL, NULL),
(1410, 'Sergio ALEJANDRO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MITSUNAGA OGATA', NULL, NULL, NULL, '1', '70439917', NULL, NULL, NULL, NULL, NULL, 'Secretaría de Gobierno y Transformación Digital - PCM', NULL, NULL),
(1411, 'Raimundo Morales Dasso', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'YAPE', NULL, NULL),
(1412, 'Luis', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Lehmann', NULL, NULL, NULL, '3', '28860513', NULL, NULL, NULL, NULL, NULL, 'Koios Medical Inc. EEUU', NULL, NULL),
(1413, 'Guillaume', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Mesguich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Azmed', NULL, NULL),
(1414, 'Guillermo Frías', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCRIS', NULL, NULL),
(1415, 'BERNARDETTE ISABEL', NULL, NULL, 'bernardette.cotrina@essalud.gob.pe', NULL, NULL, 0, NULL, NULL, 'COTRINA URTEAGA', NULL, NULL, NULL, '1', '09931515', NULL, '999102321', NULL, NULL, 'Director CENATE', 'EsSalud', NULL, NULL),
(1416, 'Jesús EDUARDO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PEINADO RODRÍGUEZ', NULL, NULL, NULL, '1', '10309788', NULL, NULL, NULL, NULL, NULL, 'Socios en Salud', NULL, NULL),
(1417, 'Miguel ÁNGEL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUTIÉRREZ REYES', NULL, NULL, NULL, '1', '42275765', NULL, NULL, NULL, NULL, NULL, 'MINSA', NULL, NULL),
(1418, 'César Vásquez Sánchez', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MINSA', NULL, NULL),
(1419, 'Fernando', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Plazzotta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hospital Italiano de Buenos Aires - BID', NULL, NULL),
(1420, 'Leonardo', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ROJAS MEZARINA', NULL, NULL, NULL, '1', '40028376', NULL, NULL, NULL, NULL, NULL, 'MINSA', NULL, NULL),
(1421, 'Benjamín Castañeda', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PUCP', NULL, NULL),
(1422, 'Javier', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHANG FU', NULL, NULL, NULL, '1', '9337793', NULL, NULL, NULL, NULL, NULL, 'DIACSA', NULL, NULL),
(1423, 'Ernesto', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Velarde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CNEURO - Cuba', NULL, NULL),
(1424, 'Blythe', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MURO CRUZADO', NULL, NULL, NULL, '1', '10791807', NULL, NULL, NULL, NULL, NULL, 'Hub de Innovación', NULL, NULL),
(1425, 'William RICHARD ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ASCARZA URRIBARI', NULL, NULL, NULL, '1', '7428228', NULL, NULL, NULL, NULL, NULL, 'SIS', NULL, NULL),
(1426, 'Javier Carnicero', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Cognitio Salud - España', NULL, NULL),
(1427, 'Luis Cordero', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Experto en políticas de salud', NULL, NULL),
(1428, 'Elisa', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Martínez Luaces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BID Uruguay', NULL, NULL),
(1429, 'Representante de la Secretaría de Gobierno y Transformación Digital', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCM', NULL, NULL),
(1430, 'Sonia ELIZABETH', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Benitez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hospital Italiano de Buenos Aires', NULL, NULL),
(1431, 'Daniel', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Otzoy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RECAINSA - Guatemala', NULL, NULL),
(1432, 'Adrián', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Pachecho LÓPEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CENETEC - México', NULL, NULL),
(1433, 'Efren Sanchez', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CENETEC - México', NULL, NULL),
(1434, 'Yeseul', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Jung', NULL, NULL, NULL, '3', 'M59923493', NULL, NULL, NULL, NULL, NULL, 'Koika - KITC- Corea del Sur', NULL, NULL),
(1435, 'Miguel SEBASTIAN ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'EGOAVIL AYALA', NULL, NULL, NULL, '1', '42188165', NULL, NULL, NULL, NULL, NULL, 'HL7/Perú', NULL, NULL),
(1436, 'Ernesto EUGENIO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GOZZER INFANTE', NULL, NULL, NULL, '1', '32764106', NULL, NULL, NULL, NULL, NULL, 'UPCH', NULL, NULL),
(1437, 'Luis ENRIQUE', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PODESTÁ GAVILANO', NULL, NULL, NULL, '1', '8250651', NULL, NULL, NULL, NULL, NULL, 'Decano Medicina UNMSM', NULL, NULL),
(1438, 'Josefa EDITH ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VÁSQUEZ CEVALLOS', NULL, NULL, NULL, '1', '16459028', NULL, NULL, NULL, NULL, NULL, 'Decana CEP', NULL, NULL),
(1439, 'LEDA Yamilee', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Hurtado ROCA', NULL, NULL, NULL, '1', '40060835', NULL, NULL, NULL, NULL, NULL, 'INS', NULL, NULL),
(1440, 'Walberto', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Buelvas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Colombia', NULL, NULL),
(1441, 'VALENTINA Antonieta ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Alarcón Guizado', NULL, NULL, NULL, '1', '7460419', NULL, NULL, NULL, NULL, NULL, 'MINSA', NULL, NULL),
(1442, 'Representante de la Embajada Británica', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL),
(1443, 'Carlos ALBERTO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALVARADO CHICO ', NULL, NULL, NULL, '1', '9675648', NULL, NULL, NULL, NULL, NULL, 'MINSA', NULL, NULL),
(1444, 'May ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Chomali CENS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Chile', NULL, NULL),
(1445, 'Francisco ENRIQUE', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Berrospi Espinoza', NULL, NULL, NULL, '1', '17890703', NULL, NULL, NULL, NULL, NULL, 'INEN', NULL, NULL),
(1446, 'Melina NOELIA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SALAZAR MERINO', NULL, NULL, NULL, '1', '10805659', NULL, NULL, NULL, NULL, NULL, 'Medica Perú', NULL, NULL),
(1447, 'Lina Flores', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bolivia', NULL, NULL),
(1448, 'Darwin EMILIO ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HIDALGO SALAS', NULL, NULL, NULL, '1', '25001443', NULL, NULL, NULL, NULL, NULL, 'SUSALUD', NULL, NULL),
(1449, 'Representante', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DIRIS/DIRESA/GERESA', NULL, NULL),
(1450, 'Luisa', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Rivera ZABALA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bolivia', NULL, NULL),
(1451, 'Maria José Leteliar', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Chile', NULL, NULL),
(1452, 'Sandra EUGENIA ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GALLEGOS MEJÍA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Colombia', NULL, NULL),
(1453, 'ELENA Valeria', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Attianese ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Argentina', NULL, NULL),
(1454, 'MINSA-DIGTEL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL),
(1455, 'Liliana ESTHER ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FLORES NINA', NULL, NULL, NULL, '1', '43172147', NULL, NULL, NULL, NULL, NULL, 'Credicorp - YAPE', NULL, NULL),
(1456, 'Viceministro de Salud', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MINSA', NULL, NULL),
(2608, 'ELISA ', NULL, 'emluaces@gmail.com', 'emluaces@gmail.com', NULL, 'SI', 0, '', NULL, 'MARTÍNEZ LUACES', 'Uruguay', 'OTRO', NULL, '1', '0', NULL, '59891414199', NULL, NULL, 'Mag. Comunicación y Educación', 'BID', NULL, NULL),
(2609, 'ADRIAN ', NULL, 'b.adrian.pacheco@gmail.com', 'b.adrian.pacheco@gmail.com', NULL, 'SI', 0, '', NULL, 'PACHECO', 'México', 'OTRO', NULL, '1', '123', NULL, '525513569457', NULL, NULL, 'Ing Biomedico', 'CENETEC', NULL, NULL),
(2610, 'EYDITH MARIVEL', NULL, 'eydith7328@outlook.com', 'eydith7328@outlook.com', NULL, '', 0, 'SI', NULL, 'VILCAPUMA QUINCHO', 'Perú', 'LIMA NORTE', NULL, '1', '10002225', NULL, '933658396', NULL, NULL, 'ENFERMERA', 'HOSPITAL CARLOS LANFRANCO LA HOZ', NULL, NULL),
(2611, 'PATRICIA JESUSA', NULL, 'patriciacurez2014@gmail.com', 'patriciacurez2014@gmail.com', NULL, 'SI', 0, '', NULL, 'CUAREZ CHAVEZ', 'Perú', 'LIMA SUR', NULL, '1', '10015639', NULL, '927855354', NULL, NULL, 'Medico general', 'Minsa', NULL, NULL),
(2612, 'LUCY ESTELA', NULL, 'Estelaespinozaherrera@gmail.com', 'Estelaespinozaherrera@gmail.com', NULL, 'SI', 0, '', NULL, 'ESPINOZA HERRERA', 'Perú', 'LIMA CENTRO', NULL, '1', '10127444', NULL, '986376424', NULL, NULL, 'Lic. Enfermeria', 'MINSA', NULL, NULL),
(2613, 'MARIA EUGENIA', NULL, 'msoto_escalante@hotmail.com', 'msoto_escalante@hotmail.com', NULL, '', 0, 'SI', NULL, 'SOTO ESCALANTE', 'Perú', 'LIMA ESTE', NULL, '1', '10135222', NULL, '993453736', NULL, NULL, 'Medico', 'Hospital Jose Agurto Tello', NULL, NULL),
(2614, 'OSCAR RUBEN', NULL, 'moreno_200305@hotmail.com', 'moreno_200305@hotmail.com', NULL, 'SI', 0, '', NULL, 'MORENO GARAY', 'Perú', 'LIMA ESTE', NULL, '1', '10168149', NULL, '975136806', NULL, NULL, 'Técnico de Enfermeria', 'Hospital Hermilio Valdizan', NULL, NULL),
(2615, 'JESSICA ROXANA', NULL, 'caossnake@hotmail.com', 'caossnake@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'MATIAS NINANYA', 'Perú', 'JUNÍN', NULL, '1', '42452736', NULL, '97864551', NULL, NULL, 'Comunicador', 'Minsa', NULL, NULL),
(2616, 'DARWIN GINO', NULL, 'dargimolesp@gmail.com', 'dargimolesp@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MOLINA ESPINOZA', 'Perú', 'CALLAO', NULL, '1', '10202922', NULL, '921729122', NULL, NULL, 'Médico', 'Hospital San José de Callao', NULL, NULL),
(2617, 'GENOVEVA ELIZABETH', NULL, 'genoveva_jauregui@yahoo.es', 'genoveva_jauregui@yahoo.es', NULL, 'SI', 0, '', NULL, 'JAUREGUI INGA', 'Perú', 'LIMA REGION', NULL, '1', '10217163', NULL, '944217136', NULL, NULL, 'Nutricionista', 'Hospital Regional Rezola de Cañete ', NULL, NULL),
(2618, 'WALTER HUMBERTO', NULL, 'Wcurioso@continental.Edu.pe', 'Wcurioso@continental.Edu.pe', NULL, 'SI', 0, '', NULL, 'CURIOSO VILCHEZ', 'Perú', 'LIMA CENTRO', NULL, '1', '10220021', NULL, '999633079', NULL, NULL, 'Médico ', 'UC', NULL, NULL),
(2619, 'SILVIA ELENA', NULL, 'silviaegc24@hotmail.com', 'silviaegc24@hotmail.com', NULL, 'SI', 0, '', NULL, 'GUTIERREZ CABEZAS', 'Perú', 'LIMA ESTE', NULL, '1', '10262009', NULL, '969240219', NULL, NULL, 'Médico Internista ', 'Hospital Vitarte ', NULL, NULL),
(2620, 'DANIEL DARIO', NULL, 'danielsuclly1@hotmail.com', 'danielsuclly1@hotmail.com', NULL, '', 0, 'SI', NULL, 'SUCLLY BELAHONIA', 'Perú', 'LIMA CENTRO', NULL, '1', '10263475', NULL, '988 635 490', NULL, NULL, 'Comunicador / técnico informático', 'Instituto Nacional de Enfermedades Neoplásicas', NULL, NULL),
(2621, 'MARITA CAROLA', NULL, 'mcielo_30@hotmail.com', 'mcielo_30@hotmail.com', NULL, '', 0, 'SI', NULL, 'PAREDES AGUILAR', 'Perú', 'SAN MARTÍN', NULL, '1', '10276387', NULL, '996708961', NULL, NULL, 'QUIMICA FARMACEUTICA/ COORDINADORA DE TELESALUD OGESS ALTO MAYO', 'OGESS ALTO MAYO', NULL, NULL),
(2622, 'NELYDA', NULL, 'ncoaquira16@hotmail.com', 'ncoaquira16@hotmail.com', NULL, 'SI', 0, '', NULL, 'COAQUIRA TURPO', 'Perú', 'APURIMAC', NULL, '1', '10297454', NULL, '952659947', NULL, NULL, 'NUTRICIONISTA', 'DIRECCIÓN DE SALUD APURIMAC II - ANDAHUAYLAS', NULL, NULL),
(2623, 'LUZ MORAIMA', NULL, 'diacono10moya@hotmail.com', 'diacono10moya@hotmail.com', NULL, '', 0, 'SI', NULL, 'MENACHO VELASQUEZ', 'Perú', 'ANCASH', NULL, '1', '10303996', NULL, '912608491', NULL, NULL, 'Lic.enfermeria', 'Instituto Nacional de Salud del Niño ', NULL, NULL),
(2624, 'JESUS EDUARDO', NULL, 'jpeinado_ses@pih.org', 'jpeinado_ses@pih.org', NULL, 'SI', 0, '', NULL, 'PEINADO RODRIGUEZ', 'Perú', 'LIMA CENTRO', NULL, '1', '10309788', NULL, '999000586', NULL, NULL, 'Medico', 'Socios En Salud', NULL, NULL),
(2625, 'ROXANA JACQUELINE', NULL, 'ralarcon.hospitalcasimiroulloa@gmail.com', 'ralarcon.hospitalcasimiroulloa@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ALARCON GUIZADO', 'Perú', 'LIMA CENTRO', NULL, '1', '10318310', NULL, '972855823', NULL, NULL, 'Economista', 'Hospital Casimiro Ulloa ', NULL, NULL),
(2626, 'MERY DIANA', NULL, 'merydiana_2@hotmail.com', 'merydiana_2@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'BUSTAMANTE RAMIREZ', 'Perú', 'LIMA CENTRO', NULL, '1', '10351046', NULL, '956706138', NULL, NULL, 'TECNOLOGO MEDICO ', 'CS LA HUAYRONA ', NULL, NULL),
(2627, 'MIGUELINA FLAVIA', NULL, 'scusichallco@gmail.con', 'scusichallco@gmail.con', NULL, '', 0, 'SI', NULL, 'DAMIAN JUAN DE DIOS', 'Perú', 'CUSCO', NULL, '1', '10467152', NULL, '984475098', NULL, NULL, 'Tec E nfermeria', 'Puesto de salud de Huarocondo', NULL, NULL),
(2628, 'LOURDES', NULL, 'lourdesvas3069@gmail.com', 'lourdesvas3069@gmail.com', NULL, 'SI', 0, '', NULL, 'VASQUEZ RUIZ', 'Perú', 'LIMA ESTE', NULL, '1', '10504222', NULL, '988117399', NULL, NULL, 'Docente', 'hermilio valdizan', NULL, NULL),
(2629, 'MARINA PAOLA', NULL, 'mpvaldizanz@yahoo.com', 'mpvaldizanz@yahoo.com', NULL, 'SI', 0, 'SI', NULL, 'VALDIZAN ZAMORA', 'Perú', 'LIMA ESTE', NULL, '1', '10553358', NULL, '993047073', NULL, NULL, 'MEDICO PSIQUIATRA', 'HOSPITAL HERMILIO VALDIZAN', NULL, NULL),
(2630, 'ROSA ESTELA', NULL, 'rosamiajb@gmail.com', 'rosamiajb@gmail.com', NULL, '', 0, 'SI', NULL, 'CORONADO ROJAS', 'Perú', 'LIMA CENTRO', NULL, '1', '10557111', NULL, '51958281231', NULL, NULL, 'Auxiliar administrativo', 'Instituto nacional de enfermedades neoplasica', NULL, NULL),
(2631, 'ZORAIDA DEL PILAR', NULL, 'zoriake18@gmail.com', 'zoriake18@gmail.com', NULL, 'SI', 0, '', NULL, 'ALEGRE HARO', 'Perú', 'LIMA ESTE', NULL, '1', '10576967', NULL, '997359537', NULL, NULL, 'Enfermera', 'Hosp. HERMILIO VALDIZAN', NULL, NULL),
(2632, 'MARCO ANTONIO', NULL, 'mbardales@inen.sld.pe', 'mbardales@inen.sld.pe', NULL, '', 0, 'SI', NULL, 'BARDALES RENGIFO', 'Perú', 'LIMA CENTRO', NULL, '1', '10585856', NULL, '945440369', NULL, NULL, 'Comunicador ', 'INEN', NULL, NULL),
(2633, 'MARITZA DELINA', NULL, 'marian_nita02@hotmail.com', 'marian_nita02@hotmail.com', NULL, 'SI', 0, '', NULL, 'RAMIREZ JARA', 'Perú', 'LIMA CENTRO', NULL, '1', '10663829', NULL, '989864607', NULL, NULL, 'Lic. Enfermeria', 'C.s la huayrona', NULL, NULL),
(2634, 'TANIA YSABEL', NULL, 'Tania_libra_7@hotmail.com', 'Tania_libra_7@hotmail.com', NULL, 'SI', 0, '', NULL, 'CATAÑO HUANEY', 'Perú', 'LIMA CENTRO', NULL, '1', '10684069', NULL, '943542345', NULL, NULL, 'Enfermera', 'Hospital Nacional Dos de Mayo', NULL, NULL),
(2635, 'LUIS FERNANDO', NULL, 'valolcard@gmail.com', 'valolcard@gmail.com', NULL, 'SI', 0, '', NULL, 'VALVERDE OLORTEGUI', 'Perú', 'LIMA NORTE', NULL, '1', '10729109', NULL, '999170860', NULL, NULL, 'Medico', 'DIRIS LIMA NORTE', NULL, NULL),
(2636, 'ADELA VICTORIA', NULL, 'victoriarafael@hotmail.com', 'victoriarafael@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'RAFAEL MAITA', 'Perú', 'LIMA CENTRO', NULL, '1', '10790559', NULL, '990150024', NULL, NULL, 'Medico', 'Hospital San Bartolome', NULL, NULL),
(2637, 'BLYTHE LUCY', NULL, 'blythe.muro@astrazeneca.com', 'blythe.muro@astrazeneca.com', NULL, 'SI', 0, '', NULL, 'MURO CRUZADO', 'Perú', 'LIMA CENTRO', NULL, '1', '10791807', NULL, '948055806', NULL, NULL, 'Abogada', 'astrazeneca', NULL, NULL),
(2638, 'SONIA LUISA', NULL, 'Sonia_gonzales_h@hotmail.com', 'Sonia_gonzales_h@hotmail.com', NULL, '', 0, 'SI', NULL, 'GONZALES HUAPAYA', 'Perú', 'OTRO', NULL, '1', '15426711', NULL, '993628360', NULL, NULL, 'Lic. Enfermeria', 'C.S chilca', NULL, NULL),
(2639, 'FERNANDO MARTIN', NULL, 'Castaneda24n@hotmail.com', 'Castaneda24n@hotmail.com', NULL, 'SI', 0, '', NULL, 'CASTAÑEDA ESTUPIÑAN', 'Perú', 'LIMA REGION', NULL, '1', '15725400', NULL, '976029847', NULL, NULL, 'Médico cirujano', 'Centro de salud Puerto Supe ', NULL, NULL),
(2640, 'GRACIELA YENNY', NULL, 'goliverch@gmail.com', 'goliverch@gmail.com', NULL, 'SI', 0, '', NULL, 'OLIVER CHIRITO', 'Perú', 'LIMA REGION', NULL, '1', '15729206', NULL, '955753608', NULL, NULL, 'INGENIERO', 'DIRESA LIMA', NULL, NULL),
(2641, 'MARIA CECILIA', NULL, 'airam-cci@hotmail.com', 'airam-cci@hotmail.com', NULL, '', 0, 'SI', NULL, 'ESPINOZA OCAÑA', 'Perú', 'LIMA NORTE', NULL, '1', '16027141', NULL, '966171192', NULL, NULL, 'Técnico en Enfermería ', 'Hospital de Supe ', NULL, NULL),
(2642, 'CARMEN FLORINDA', NULL, 'carmencitaqd@gmail.com', 'carmencitaqd@gmail.com', NULL, 'SI', 0, '', NULL, 'QUINTANA DAMIAN', 'Perú', 'LIMA REGION', NULL, '1', '16179648', NULL, '983301357', NULL, NULL, 'Enfermera', 'Hospital de Chosica', NULL, NULL),
(2643, 'MARIA JACQUELINE', NULL, 'tchanamem03@gmail.com', 'tchanamem03@gmail.com', NULL, '', 0, 'SI', NULL, 'TORRES CHANAME', 'Perú', 'LAMBAYEQUE', NULL, '1', '16723216', NULL, '945764186', NULL, NULL, 'Técnico de Enfermería ', 'C.S. MIGUEL CUSTODIO PISFIL MONSEFU ', NULL, NULL),
(2644, 'MARIA CECILIA', NULL, 'mceciliaxsiempre@gmail.com', 'mceciliaxsiempre@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'SOSA QUISPE', 'Perú', 'LIMA REGION', NULL, '1', '17438437', NULL, '997801220', NULL, NULL, 'informatica', 'HOSPITAL DE SUPE', NULL, NULL),
(2645, 'MARIA ELENA', NULL, 'mevm19_24@hotmail.com', 'mevm19_24@hotmail.com', NULL, '', 0, 'SI', NULL, 'VERGARA MEDRANO', 'Perú', 'SAN MARTÍN', NULL, '1', '17807409', NULL, '942616538', NULL, NULL, 'QUIMICA FARMACEUTICA', 'DIRESA SAN MARTIN', NULL, NULL),
(2646, 'OSCAR FEDERICO', NULL, 'javiercarnicero@cognitiosalud.es', 'javiercarnicero@cognitiosalud.es', NULL, 'SI', 0, '', NULL, 'CHICOMA MALCA', 'España', 'OTRO', NULL, '1', '17857372', NULL, '34697902000', NULL, NULL, 'Médico. Consultor de servicios y sistemas de salud', 'Cognitiosalud', NULL, NULL),
(2647, 'WILFREDO SANTOS', NULL, 'dgiesp133@minsa.gob.pe', 'dgiesp133@minsa.gob.pe', NULL, '', 0, 'SI', NULL, 'SOLIS TUPES', 'Perú', 'OTRO', NULL, '1', '17925758', NULL, '985167225', NULL, NULL, 'MEDICO CIRUJANO', 'DPCTB/DGIESP/MINSA', NULL, NULL),
(2648, 'VERONICA DEL PILAR', NULL, 'vvargasd1@upao.edu.pe', 'vvargasd1@upao.edu.pe', NULL, '', 0, 'SI', NULL, 'VARGAS DE LA CRUZ', 'Perú', 'LA LIBERTAD', NULL, '1', '18069283', NULL, '982488812', NULL, NULL, 'ENFERMERA', 'IREN NORTE', NULL, NULL),
(2649, 'ROCIO DEL PILAR', NULL, 'rocioreyesalva@hotmail.com', 'rocioreyesalva@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'REYES ALVA', 'Perú', 'LA LIBERTAD', NULL, '1', '18111600', NULL, '949654428', NULL, NULL, 'Médico ', 'IREN Norte ', NULL, NULL),
(2650, 'JAIME MARXELIO', NULL, 'jaimefamedic@gmail.com', 'jaimefamedic@gmail.com', NULL, 'SI', 0, '', NULL, 'FLORIAN ANGELES', 'Perú', 'LA LIBERTAD', NULL, '1', '18144792', NULL, '949356243', NULL, NULL, 'Medico Cirujano', 'Hospital Belên de Trujillo', NULL, NULL),
(2651, 'JANETT JESSICA', NULL, 'janecita041278@gmail.com', 'janecita041278@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CASTRO CASTRO', 'Perú', 'LIMA SUR', NULL, '1', '40046226', NULL, '972855839', NULL, NULL, 'Administrador ', 'Centro de salud Portada de Manchay ', NULL, NULL),
(2652, 'JERIKA JAMILEI', NULL, 'Jerikacastroc@gmail.com', 'Jerikacastroc@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CASTRO CASTRO', 'Perú', 'LIMA SUR', NULL, '1', '46332321', NULL, '979832851', NULL, NULL, 'PSICOLOGIA', 'CENTRO DE SALUD PORTADA DE MANCHAY', NULL, NULL),
(2653, 'FRANCISCO LEWIS', NULL, 'fcoluisrodri@hotmail.com', 'fcoluisrodri@hotmail.com', NULL, '', 0, 'SI', NULL, 'RODRIGUEZ RODRIGUEZ', 'Perú', 'LA LIBERTAD', NULL, '1', '18182909', NULL, '964687382', NULL, NULL, 'Medico cirujano', 'Hospital Las Mercedes', NULL, NULL),
(2654, 'CARMEN JANNETT', NULL, 'eyleenxiamara@hotmail.com', 'eyleenxiamara@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'VALVERDE MEZA', 'Perú', 'LA LIBERTAD', NULL, '1', '18216758', NULL, '922424895', NULL, NULL, 'Enfermera ', 'Iren norte ', NULL, NULL),
(2655, 'CONSTANTE TEOFILO', NULL, 'guillaume.mesguich@azmed.co', 'guillaume.mesguich@azmed.co', NULL, 'SI', 0, '', NULL, 'GOMEZ PEREZ', 'Francia', 'TACNA', NULL, '1', '19023211', NULL, '\'+33652498928', NULL, NULL, 'International partnership manager', 'AZMed', NULL, NULL),
(2656, 'ALBERTO ZACARIAS', NULL, 'sarab77alz@gmail.com', 'sarab77alz@gmail.com', NULL, 'SI', 0, '', NULL, 'PORTILLA COBA', 'Perú', 'LIMA CENTRO', NULL, '1', '19194276', NULL, '997629330', NULL, NULL, 'Enfermera ', 'Gran Teatro Nacional ', NULL, NULL),
(2657, 'VILMA', NULL, 'vilmilagros19@gmail.com', 'vilmilagros19@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'BALDEON COLQUI', 'Perú', 'LIMA CENTRO', NULL, '1', '19837024', NULL, '943933769', NULL, NULL, 'LIC. EN ENFERMERIA', 'INSTITUTO NACIONAL MATERNO PERINATAL', NULL, NULL),
(2658, 'WILFREDO', NULL, 'wilfvigo@gmail.com', 'wilfvigo@gmail.com', NULL, '', 0, 'SI', NULL, 'VILLA GOMEZ', 'Perú', 'LIMA CENTRO', NULL, '1', '19870123', NULL, '987208014', NULL, NULL, 'Médico Especialista', 'ESSALUD', NULL, NULL),
(2659, 'SUSSY OLINDA', NULL, 'arsu092819@gmail.com', 'arsu092819@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'LARICO DURAND', 'Perú', 'LIMA ESTE', NULL, '1', '19896230', NULL, '985859104', NULL, NULL, 'Lic. En Enfermería', 'Hosputal hermilio valdizan', NULL, NULL),
(2660, 'EMMA RUTH', NULL, 'Epomas20@gmail.com', 'Epomas20@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'POMA SALINAS', 'Perú', 'HUANCAVELICA', NULL, '1', '19914040', NULL, '995880093', NULL, NULL, 'Lic enf', 'Diresa hvca ', NULL, NULL),
(2661, 'ROSINA YANETT', NULL, 'verizueta@gmail.com', 'verizueta@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VERIZUETA ANTIPA', 'Perú', 'LIMA CENTRO', NULL, '1', '20055906', NULL, '986126513', NULL, NULL, 'Cirujano dentista ', 'Diris Lima Centro ', NULL, NULL),
(2662, 'RITA', NULL, 'ritars63@gmail.com', 'ritars63@gmail.com', NULL, '', 0, 'SI', NULL, 'SORIO', 'Perú', 'LIMA CENTRO', NULL, '1', '20182932', NULL, '\'+51993359533', NULL, NULL, 'Esoecialista salud', 'BID', NULL, NULL),
(2663, 'ELIANA RAQUEL', NULL, 'elianarchch@hotmail.com', 'elianarchch@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'CHAVEZ CHANCAHUAÑA', 'Perú', 'LA LIBERTAD', NULL, '1', '71466362', NULL, '965719887', NULL, NULL, 'Obstetra ', 'Hospital Belén de Trujillo ', NULL, NULL),
(2664, 'ROSILYNN MARGOT', NULL, 'roselinleivaturpo@gmail.com', 'roselinleivaturpo@gmail.com', NULL, 'SI', 0, '', NULL, 'LEIVA TURPO', 'Perú', 'CALLAO', NULL, '1', '20726649', NULL, '934079821', NULL, NULL, 'Tec Enfermería ', 'Centro de salud Villa los Reyes ', NULL, NULL),
(2665, 'ROSALINA', NULL, 'rguerrav@minsa.gob.pe', 'rguerrav@minsa.gob.pe', NULL, 'SI', 0, '', NULL, 'GUERRA VEGA', 'Perú', 'LIMA CENTRO', NULL, '1', '21261430', NULL, '967769793', NULL, NULL, 'Ingeniwro', 'Minsa', NULL, NULL),
(2666, 'VICTOR HILARIO', NULL, 'tovar_2154@hotmail.com', 'tovar_2154@hotmail.com', NULL, '', 0, 'SI', NULL, 'TOVAR HUAMAN', 'Perú', 'ICA', NULL, '1', '21426474', NULL, '956923935', NULL, NULL, 'Tecnico de enfermeria', 'minsa', NULL, NULL),
(2667, 'GUIMAR', NULL, 'guivarza54@gmail.com', 'guivarza54@gmail.com', NULL, '', 0, 'SI', NULL, 'VARGAS ZAMORA', 'Perú', 'APURIMAC', NULL, '1', '21462965', NULL, '953723385', NULL, NULL, 'Odontologo', 'C.S. Andahuaylas', NULL, NULL),
(2668, 'ROBERTO CARLOS', NULL, 'robertocarlosgarciameneses9@gmail.com', 'robertocarlosgarciameneses9@gmail.com', NULL, 'SI', 0, '', NULL, 'GARCIA MENESES', 'Perú', 'LIMA SUR', NULL, '1', '21519617', NULL, '993862487', NULL, NULL, 'medico', 'minsa', NULL, NULL),
(2669, 'VERONICA CECILIA', NULL, 'veronicanasthya@gmail.com', 'veronicanasthya@gmail.com', NULL, '', 0, 'SI', NULL, 'CAMPOS APARCANA', 'Perú', 'LIMA NORTE', NULL, '1', '21528726', NULL, '945044179', NULL, NULL, 'Medico Cirujano', 'CMI Tahuantinsuyo Bajo', NULL, NULL),
(2670, 'BETSY DEL PILAR', NULL, 'Maluax19@gmail.com', 'Maluax19@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CORDERO ZAVALETA', 'Perú', 'ICA', NULL, '1', '21533973', NULL, '990002977', NULL, NULL, 'Medico', 'Essalud', NULL, NULL),
(2671, 'ALVARO GONZALO', NULL, 'alvarocordzava@gmail.com', 'alvarocordzava@gmail.com', NULL, '', 0, 'SI', NULL, 'CORDERO ZAVALETA', 'Perú', 'ICA', NULL, '1', '21546681', NULL, '956987670', NULL, NULL, 'Medico', 'Minpu UML II ICA', NULL, NULL),
(2672, 'CARLOS ALBERTO', NULL, 'cchavez@iemp.gob.pe', 'cchavez@iemp.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'CHAVEZ PITA', 'Perú', 'LIMA CENTRO', NULL, '1', '08700975', NULL, '971306295', NULL, NULL, 'Técnico Informático', 'INSTITUTO NACIONAL MATERNO PERINATAL', NULL, NULL),
(2673, 'CARLOS', NULL, 'Carljofer@hotmail.com', 'Carljofer@hotmail.com', NULL, '', 0, 'SI', NULL, 'GONZALEZ OLIVARES', 'Perú', 'LIMA REGION', NULL, '1', '21547873', NULL, '998948131', NULL, NULL, 'Cirujano Dentista ', 'Privada', NULL, NULL),
(2674, 'ANA MARIA', NULL, 'zc.anamari@gmail.com', 'zc.anamari@gmail.com', NULL, '', 0, 'SI', NULL, 'QUISPE HUAMAN', 'Perú', 'LIMA REGION', NULL, '1', '21553309', NULL, '956626152', NULL, NULL, 'Lic. Enfermería ', 'Hospital María Auxiliadora ', NULL, NULL),
(2675, 'ROSARIO JANET', NULL, 'licrjcb0915@gmail.com', 'licrjcb0915@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CORZO BARRANCA DE OLIVERA', 'Perú', 'LIMA ESTE', NULL, '1', '21561657', NULL, '992800140', NULL, NULL, 'LICENCIADA EN ENFERMERIA', 'MINSA', NULL, NULL),
(2676, 'SUSY ROCIO', NULL, 'chiocz@hotmail.com', 'chiocz@hotmail.com', NULL, 'SI', 0, '', NULL, 'CORDERO ZAVALETA', 'Perú', 'ICA', NULL, '1', '21569374', NULL, '985338362', NULL, NULL, 'Medico', 'Particular ', NULL, NULL),
(2677, 'RALPH EDGARDO', NULL, 'raledgar@gmail.com', 'raledgar@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MORENO GALVEZ', 'Perú', 'ICA', NULL, '1', '21574248', NULL, '975779608', NULL, NULL, 'Medico ', 'Centró de salud San Juan de Dios Pisco MINSA', NULL, NULL),
(2678, 'ANITA', NULL, 'anitalauchan@hotmail.com', 'anitalauchan@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'LAU CHAN', 'Perú', 'ICA', NULL, '1', '21783777', NULL, '962744179', NULL, NULL, 'MEDICO', 'CS GROCIO PRADO', NULL, NULL),
(2679, 'JOSE LA ROSA', NULL, 'jtasayco26@hotmail.com', 'jtasayco26@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'YATACO TASAYCO', 'Perú', 'LIMA CENTRO', NULL, '1', '21832527', NULL, '994362769', NULL, NULL, 'ADMINISTRACIÓN', 'INSTITUTO NACIONAL DE SALUD', NULL, NULL),
(2680, 'CESAR ROLANDO', NULL, 'cgrproducciontv@gmail.com', 'cgrproducciontv@gmail.com', NULL, 'SI', 0, '', NULL, 'GARCIA ROJAS', 'Perú', 'LIMA CENTRO', NULL, '1', '21869648', NULL, '980233505', NULL, NULL, 'Comunicador', 'EsSalud', NULL, NULL),
(2681, 'LIMBER NARCISO', NULL, 'limsa13@hotmail.com', 'limsa13@hotmail.com', NULL, 'SI', 0, '', NULL, 'SANCHEZ VILLANUEVA', 'Perú', 'LIMA ESTE', NULL, '1', '22403875', NULL, '999503268', NULL, NULL, 'Psicólogo', 'Hospital Hermilio Valdizán', NULL, NULL),
(2682, 'KARINA CARLA', NULL, 'carlaodio_17@hotmail.com', 'carlaodio_17@hotmail.com', NULL, '', 0, 'SI', NULL, 'VILLANUEVA SANTIAGO', 'Perú', 'HUANUCO', NULL, '1', '22506870', NULL, '962755448', NULL, NULL, 'Lic.Enfermeria', 'C.S.La Unión ', NULL, NULL),
(2683, 'JOHNY WILE', NULL, 'obst.wile@hotmail.com', 'obst.wile@hotmail.com', NULL, 'SI', 0, '', NULL, 'VELASQUEZ CAJALEON', 'Perú', 'LIMA REGION', NULL, '1', '22512095', NULL, '943571754', NULL, NULL, 'Obstetra', 'RIS Huarochiri ', NULL, NULL),
(2684, 'LUZ ELIZABETH', NULL, 'elidafu@hotmail.com', 'elidafu@hotmail.com', NULL, '', 0, 'SI', NULL, 'DAZA FUSTER', 'Perú', 'LIMA CENTRO', NULL, '1', '22527337', NULL, '999176664', NULL, NULL, 'Obstetra', 'Minsa', NULL, NULL),
(2685, 'SONIA', NULL, 'onia.benitez@hospitalitaliano.org.ar', 'onia.benitez@hospitalitaliano.org.ar', NULL, 'SI', 0, '', NULL, 'BENITEZ', 'Argentina', 'CALLAO', NULL, '1', '22638472', NULL, '541130130854', NULL, NULL, 'medica', 'HIBA', NULL, NULL),
(2686, 'VALENTINA PATRICIA', NULL, 'valentinapatriciau@gmail.com', 'valentinapatriciau@gmail.com', NULL, '', 0, 'SI', NULL, 'URRUTIA CALDERON', 'Perú', 'CUSCO', NULL, '1', '23854506', NULL, '984249793', NULL, NULL, 'Técnico En Enfermería ', 'Minsa Cusco Centro de Salud Belénpampa ', NULL, NULL),
(2687, 'CARMEN', NULL, 'carbaug60@gmail.com', 'carbaug60@gmail.com', NULL, '', 0, 'SI', NULL, 'BATALLANOS UGARTE', 'Perú', 'CUSCO', NULL, '1', '23954827', NULL, '972799965', NULL, NULL, 'ENFERMERA ', 'HOSPITAL REGIONAL ', NULL, NULL),
(2688, 'KAROL ELIZABETH', NULL, 'Cori.kari@gmail.com', 'Cori.kari@gmail.com', NULL, 'SI', 0, '', NULL, 'CORRALES REYES', 'Perú', 'LA LIBERTAD', NULL, '1', '71491392', NULL, '934156192', NULL, NULL, 'Enfermera', 'Hospital Belén de Trujillo ', NULL, NULL),
(2689, 'NATTY YOVANA', NULL, 'franciscamarcesissy@gmail.com', 'franciscamarcesissy@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'NINA SONCCO', 'Perú', 'APURIMAC', NULL, '1', '23979753', NULL, '965950066', NULL, NULL, 'medico', 'DISA APU II', NULL, NULL),
(2690, 'MARCO ANTONIO', NULL, 'mosqueirahonor@gmail.com', 'mosqueirahonor@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MOSQUEIRA HONOR', 'Perú', 'APURIMAC', NULL, '1', '24008076', NULL, '974669744', NULL, NULL, 'INGENIERIA DE SISTEMAS E INFORMATICA', 'DIRESA APURIMAC', NULL, NULL),
(2691, 'TANIA KELIN', NULL, 'tania999kelin@gmail.com', 'tania999kelin@gmail.com', NULL, '', 0, 'SI', NULL, 'ARROYO ZORRILLA', 'Perú', 'LIMA CENTRO', NULL, '1', '25556771', NULL, '989695791', NULL, NULL, 'Enfermera', 'C.S. Villa María Perpetuo Socorro ', NULL, NULL),
(2692, 'ELVIRA ESTHER', NULL, 'eeph_68@hotmail.com', 'eeph_68@hotmail.com', NULL, 'SI', 0, '', NULL, 'POZO HUAMAN', 'Perú', 'CALLAO', NULL, '1', '25560237', NULL, '954754568', NULL, NULL, 'Lic. Enfermeria', 'C.s. Santa Fe', NULL, NULL),
(2693, 'LUISA BERNARDA', NULL, 'luisablopez@hotmail.com', 'luisablopez@hotmail.com', NULL, 'SI', 0, '', NULL, 'LOPEZ MIRANDA', 'Perú', 'LIMA CENTRO', NULL, '1', '25568933', NULL, '987907483', NULL, NULL, 'Obstetra ', 'CSMI MAGDALENA ', NULL, NULL),
(2694, 'YOJANI JUDITH', NULL, 'yosima29@hotmail.com', 'yosima29@hotmail.com', NULL, 'SI', 0, '', NULL, 'SILVA MARCHAN DE CAMPOS', 'Perú', 'CALLAO', NULL, '1', '25610485', NULL, '944698394', NULL, NULL, 'Lic.Enfermeria', 'DIRESA CALLAO', NULL, NULL),
(2695, 'PEDRO IVAN', NULL, 'p.i.l.c@hotmail.com', 'p.i.l.c@hotmail.com', NULL, 'SI', 0, '', NULL, 'LARA CANALES', 'Perú', 'CALLAO', NULL, '1', '25719965', NULL, '987197349', NULL, NULL, 'Técnico de enfermería ', 'Diresa callao ', NULL, NULL),
(2696, 'GLADYS ESMERALDA', NULL, 'gcorrea@minsa.gob.pe', 'gcorrea@minsa.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'CORREA BOCANEGRA', 'Perú', 'LIMA CENTRO', NULL, '1', '20566954', NULL, '965604285', NULL, NULL, 'CIRUJANO DENTISTA', 'MINSA', NULL, NULL),
(2697, 'CECILIA', NULL, 'ceyagu@hotmail.com', 'ceyagu@hotmail.com', NULL, '', 0, 'SI', NULL, 'YAPIAS GUTIERREZ', 'Perú', 'CALLAO', NULL, '1', '25807266', NULL, '996936782', NULL, NULL, 'Lic.Psicologia', 'DIRESA CALLAO', NULL, NULL),
(2698, 'JUANA ADELAIDA', NULL, 'juanaacosta0277@gmail.com', 'juanaacosta0277@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ACOSTA IZQUIERDO', 'Perú', 'CALLAO', NULL, '1', '25843603', NULL, '947337132', NULL, NULL, 'Tecn. Salud Ambiental ', 'Diresa Callao ', NULL, NULL),
(2699, 'CARMEN MERCEDES', NULL, 'mia027@gmail.com', 'mia027@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VALDIVIA ANSELMO', 'Perú', 'CALLAO', NULL, '1', '25866813', NULL, '945524560', NULL, NULL, 'TECNICA DE FARMACIA ', 'C.S. CALLAO', NULL, NULL),
(2700, 'ANA MARIA', NULL, 'ana.tiznado@hotmail.com', 'ana.tiznado@hotmail.com', NULL, '', 0, 'SI', NULL, 'TIZNADO DE CUEVA', 'Perú', 'CAJAMARCA', NULL, '1', '26613587', NULL, '976659370', NULL, NULL, 'enfermera', 'essalud', NULL, NULL),
(2701, 'CESAR EDUARDO', NULL, 'cevv5550@gmail.com', 'cevv5550@gmail.com', NULL, '', 0, 'SI', NULL, 'VALENCIA VALDEZ', 'Perú', 'CAJAMARCA', NULL, '1', '26705438', NULL, '927190226', NULL, NULL, 'Obstetra', 'Essalud', NULL, NULL),
(2702, 'FERNANDO', NULL, 'fernando.plazzotta@hospitalitaliano.org.ar', 'fernando.plazzotta@hospitalitaliano.org.ar', NULL, 'SI', 0, '', NULL, 'PLAZZOTTA', 'Argentina', 'OTRO', NULL, '1', '26965207', NULL, '1133960986', NULL, NULL, 'Medico', 'Hospital Italiano de Buenos Aires', NULL, NULL),
(2703, 'LUZ EDITH', NULL, 'pandurito19@hotmail.com', 'pandurito19@hotmail.com', NULL, 'SI', 0, '', NULL, 'DE LA CRUZ PANDURO', 'Perú', 'LA LIBERTAD', NULL, '1', '27721561', NULL, '920618659', NULL, NULL, 'Obstetra', 'Minsa', NULL, NULL),
(2704, 'MEMNA MARGINA', NULL, 'margina1261@gmail.com', 'margina1261@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'GOICOCHEA ESPINO', 'Perú', 'CAJAMARCA', NULL, '1', '28062488', NULL, '966489190', NULL, NULL, 'Enfermera', 'Ps J Gálvez ', NULL, NULL),
(2705, 'BENITO', NULL, 'brc5522@gmail.com', 'brc5522@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ROJAS CANO', 'Perú', 'APURIMAC', NULL, '1', '28267726', NULL, '940419105', NULL, NULL, 'OBSTETRA', 'DISA APURÍMAC II-ANDAHUAYLAS', NULL, NULL),
(2706, 'ALFREDO', NULL, 'Alfredoastop@gmail.com', 'Alfredoastop@gmail.com', NULL, 'SI', 0, '', NULL, 'ASTO PARCO', 'Perú', 'JUNÍN', NULL, '1', '28289180', NULL, '996182255', NULL, NULL, 'Obstetra', 'GORE JUNÍN', NULL, NULL),
(2707, 'YANETH', NULL, 'yanearce20@gmail.com', 'yanearce20@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ARCE HERNANDEZ', 'Perú', 'AYACUCHO', NULL, '1', '28289964', NULL, '951400824', NULL, NULL, 'Obstetra', 'DIRESA AYACUCHO', NULL, NULL),
(2708, 'ADRIAN', NULL, 'ahuamanir@minsa.gob.pe', 'ahuamanir@minsa.gob.pe', NULL, 'SI', 0, '', NULL, 'HUAMANI ROCA', 'Perú', 'LIMA CENTRO', NULL, '1', '28306766', NULL, '966929325', NULL, NULL, 'Administrafor', 'MINSA ', NULL, NULL),
(2709, 'GLADYS MARIA', NULL, 'ggarro@minsa.gob.pe', 'ggarro@minsa.gob.pe', NULL, '', 0, 'SI', NULL, 'GARRO NUÑEZ', 'Perú', 'LIMA CENTRO', NULL, '1', '28307042', NULL, '990291705', NULL, NULL, 'Enfermera', 'CDC MINSA', NULL, NULL),
(2710, 'ANDRES AVELINO', NULL, 'aanampacha@gmail.com', 'aanampacha@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ANAMPA CHAHUARA', 'Perú', 'CALLAO', NULL, '1', '29116074', NULL, '995166874', NULL, NULL, 'Médico Cirujano', 'Hospital Nacional Daniel Alcides Carrion ', NULL, NULL),
(2711, 'CARMEN YSIDORA', NULL, 'camuu.645@gmail.com', 'camuu.645@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MEDINA MANRIQUE', 'Perú', 'TACNA', NULL, '1', '29217854', NULL, '988505192', NULL, NULL, 'Obstetra ', 'Centro de Salud Vista Alegre Minsa', NULL, NULL),
(2712, 'ESTILITA SELINDA', NULL, 'estilita741@gmail.com', 'estilita741@gmail.com', NULL, '', 0, 'SI', NULL, 'LOPEZ PORTILLA', 'Perú', 'AREQUIPA', NULL, '1', '29350974', NULL, '996144746', NULL, NULL, 'Lic.Enfermeria', 'Instituto  Nacional Salud del Niño', NULL, NULL),
(2713, 'EDWIN JOSE', NULL, 'artime5@hotmail.com', 'artime5@hotmail.com', NULL, 'SI', 0, '', NULL, 'ARANIBAR MAKER', 'Perú', 'LIMA ESTE', NULL, '1', '29415615', NULL, '965888722', NULL, NULL, 'Medico', 'Hospital Jose Agurto Tello de  Chosica ', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(2714, 'ANTONY GUSTAVO', NULL, 'gustavotohalinomeza@gmail.com', 'gustavotohalinomeza@gmail.com', NULL, 'SI', 0, '', NULL, 'TOHALINO MEZA', 'Perú', 'AREQUIPA', NULL, '1', '29570107', NULL, '985985275', NULL, NULL, 'Medico', 'Seguro integral de salud', NULL, NULL),
(2715, 'GLADYS', NULL, 'GladysCorrea88@gmail.com', 'GladysCorrea88@gmail.com', NULL, 'SI', 0, '', NULL, 'CORREA BOCANEGRA', 'Perú', 'LIMA CENTRO', NULL, '1', '965604285', NULL, '933106321', NULL, NULL, 'Cirujano Dentista ', 'MINSA', NULL, NULL),
(2716, 'MARIA ISABEL', NULL, 'maria_cahuana@yahoo.es', 'maria_cahuana@yahoo.es', NULL, 'SI', 0, '', NULL, 'CCAHUANA TELLO', 'Perú', 'APURIMAC', NULL, '1', '31004110', NULL, '992212225', NULL, NULL, 'ESTADISTICO', 'DIRESA APURIMAC', NULL, NULL),
(2717, 'JULIAN', NULL, 'smontesv2011@gmail.com', 'smontesv2011@gmail.com', NULL, 'SI', 0, '', NULL, 'ORTIZ FANOLA', 'Perú', 'APURIMAC', NULL, '1', '31024743', NULL, '940326301', NULL, NULL, 'Técnico en Enfermería ', 'Red Abancay', NULL, NULL),
(2718, 'JESUS', NULL, 'jesuscarrionumeres@gmail.com', 'jesuscarrionumeres@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CARRION UMERES', 'Perú', 'APURIMAC', NULL, '1', '31027146', NULL, '950600024', NULL, NULL, 'INGENEIRO DE SISTEMAS E INFORMATICA', 'DIRECCION REGIONAL DE SALUD APURIMAC', NULL, NULL),
(2719, 'ADELAIDA  BELINDA ', NULL, 'amartinez62_1@hotmail.com', 'amartinez62_1@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'MARTINEZ CHIRI', 'Perú', 'TACNA', NULL, '1', '419415', NULL, '958337750', NULL, NULL, 'OBSTETRA', 'MINSA', NULL, NULL),
(2720, 'ELIZABETH MYRNA', NULL, 'rayanpe@hotmail.com', 'rayanpe@hotmail.com', NULL, '', 0, 'SI', NULL, 'RAYAN PANCHE', 'Perú', 'APURIMAC', NULL, '1', '31044645', NULL, '983629721', NULL, NULL, 'Obstetra ', 'Colegio de Obstetras del Perú ', NULL, NULL),
(2721, 'YVONNE', NULL, 'flmj29102006ya@gmail.com', 'flmj29102006ya@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'HERHUAY ARCE', 'Perú', 'APURIMAC', NULL, '1', '31182894', NULL, '983927575', NULL, NULL, 'Técnico enfermería ', 'Minsa', NULL, NULL),
(2722, 'MARCOS', NULL, 'markocondor@hotmail.com', 'markocondor@hotmail.com', NULL, '', 0, 'SI', NULL, 'CONDOR FLORES', 'Perú', 'ANCASH', NULL, '1', '32276135', NULL, '937719817', NULL, NULL, 'TECNICO  EN COMPUTACION', 'RED  DE SALUD CONCHUCOS SUR HUARI', NULL, NULL),
(2723, 'ROSARIO ELIZABETH', NULL, 'chari_eli@hotmail.com', 'chari_eli@hotmail.com', NULL, 'SI', 0, '', NULL, 'MONTALVO CORAJE', 'Perú', 'ANCASH', NULL, '1', '32404307', NULL, '998648674', NULL, NULL, 'obstetra', 'MINSA- PUESTO SALUD YURACOTO', NULL, NULL),
(2724, 'ALEJANDRINA MAURA', NULL, 'amamtauro@gmail.com', 'amamtauro@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ASHTO MEJIA', 'Perú', 'ANCASH', NULL, '1', '32643304', NULL, '943564723', NULL, NULL, 'TECNICO EN ENFERMERIA', 'MINSA', NULL, NULL),
(2725, 'TANIA MARISOL', NULL, 'tania2406_ml@hotmail.com', 'tania2406_ml@hotmail.com', NULL, 'SI', 0, '', NULL, 'MARTINEZ LOZANO', 'Perú', 'LIMA REGION', NULL, '1', '32643723', NULL, '954711701', NULL, NULL, 'Médico cirujano ', 'C.s.  Ricardo Palma,  Red de salud Huarochiri ', NULL, NULL),
(2726, 'WILMER', NULL, 'wcerna_61@hotmail.es', 'wcerna_61@hotmail.es', NULL, 'SI', 0, '', NULL, 'CERNA ALTAMIRANO', 'Perú', 'ANCASH', NULL, '1', '32811467', NULL, '943273167', NULL, NULL, 'ABOGADO', 'HOSPITAL LA CALETA', NULL, NULL),
(2727, 'GEORGE', NULL, 'cmhsolar@gmail.com', 'cmhsolar@gmail.com', NULL, '', 0, 'SI', NULL, 'FIGUEROA CONCHA', 'Perú', 'CUSCO', NULL, '1', '23961273', NULL, '984755208', NULL, NULL, 'MEDICO', 'IPRESS BELENPAMPA', NULL, NULL),
(2728, 'FLOR PERPETUO', NULL, 'Zebaflor20@gmail.com', 'Zebaflor20@gmail.com', NULL, 'SI', 0, '', NULL, 'ZELADA BAZAN', 'Perú', 'CALLAO', NULL, '1', '33961882', NULL, '930358692', NULL, NULL, 'Tec. En Enfermeria', 'DIRESA  CALLAO', NULL, NULL),
(2729, 'MALENA JANETT', NULL, 'malena.nunez.rivas@hotmail.com', 'malena.nunez.rivas@hotmail.com', NULL, 'SI', 0, '', NULL, 'NÚÑEZ RIVAS', 'Perú', 'LIMA CENTRO', NULL, '1', '40010751', NULL, '975711199', NULL, NULL, 'Médico', 'ESSALUD', NULL, NULL),
(2730, 'VALERIE JENIFFER', NULL, 'vflores@inen.sld.pe', 'vflores@inen.sld.pe', NULL, '', 0, 'SI', NULL, 'FLORES SUAZO', 'Perú', 'LIMA CENTRO', NULL, '1', '42104555', NULL, '920229967', NULL, NULL, 'periodista', 'Instituto Nacional de Enfermedades Neoplásicas', NULL, NULL),
(2731, 'CESAR ALBERTO', NULL, 'cealga75@gmail.com', 'cealga75@gmail.com', NULL, 'SI', 0, '', NULL, 'GARAY DEL AGUILA', 'Perú', 'LA LIBERTAD', NULL, '1', '40033709', NULL, '949990355', NULL, NULL, 'TEC ENFERMERÍA ', 'IREN NORTE ', NULL, NULL),
(2732, 'BIBIANA', NULL, 'megaeventos0212@gmail.com', 'megaeventos0212@gmail.com', NULL, '', 0, 'SI', NULL, 'MAMANI CUSI', 'Perú', 'APURIMAC', NULL, '1', '40051206', NULL, '951188450', NULL, NULL, 'Tecnica en enfermeria', 'Hospital tambobamba', NULL, NULL),
(2733, 'LEDA YAMILEE', NULL, 'yhurtado@ins.gob.pe', 'yhurtado@ins.gob.pe', NULL, '', 0, 'SI', NULL, 'HURTADO ROCA', 'Perú', 'LIMA CENTRO', NULL, '1', '40060835', NULL, '952393544', NULL, NULL, 'invetigadora', 'INS', NULL, NULL),
(2734, 'ROBERTO WALTER', NULL, 'Roberto.huamani@unmsm.edu.pe', 'Roberto.huamani@unmsm.edu.pe', NULL, 'SI', 0, 'SI', NULL, 'HUAMANÍ GUZMÁN', 'Perú', 'LIMA CENTRO', NULL, '1', '40065088', NULL, '964 637 633 ', NULL, NULL, 'Médico ', 'Hospital de Emergencias Pediátricas ', NULL, NULL),
(2735, 'JOSE ALEJANDRO', NULL, 'JOSE_SOTO2424@HOTMAIL.COM', 'JOSE_SOTO2424@HOTMAIL.COM', NULL, 'SI', 0, 'SI', NULL, 'SOTO FLORES', 'Perú', 'AYACUCHO', NULL, '1', '40097591', NULL, '991371223', NULL, NULL, 'ENFERMERO', 'DIRESA AYACUCHO', NULL, NULL),
(2736, 'ROSA MARLENY', NULL, 'rangeles.abogada@gmail.com', 'rangeles.abogada@gmail.com', NULL, 'SI', 0, '', NULL, 'ANGELES ÑIQUEN', 'Perú', 'LIMA CENTRO', NULL, '1', '40132195', NULL, '903475819', NULL, NULL, 'Abogada', 'MINSA', NULL, NULL),
(2737, 'BELSI ELENA', NULL, 'isabelmendoza.c5@gmail.com', 'isabelmendoza.c5@gmail.com', NULL, 'SI', 0, '', NULL, 'CASTRO MARIÑOS', 'Perú', 'TACNA', NULL, '1', '40174550', NULL, '991087850', NULL, NULL, 'Tec enfermería ', ' Cs la esperanza ', NULL, NULL),
(2738, 'KARINA MAGALLI', NULL, 'karina_ciudad@hotmail.com', 'karina_ciudad@hotmail.com', NULL, '', 0, 'SI', NULL, 'CIUDAD ARANA', 'Perú', 'CALLAO', NULL, '1', '40206009', NULL, '990891499', NULL, NULL, 'Médico ', 'Hospital San José ', NULL, NULL),
(2739, 'PABLO CESAR', NULL, 'cezzar131@hotmail.com', 'cezzar131@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'TIPULA MAMANI', 'Perú', 'LIMA ESTE', NULL, '1', '40211398', NULL, '940252728', NULL, NULL, 'Tecnólogo Medico en radiologia', 'Hospital de emergencias ate vitarte', NULL, NULL),
(2740, 'JULISSA EMPERATRIZ', NULL, 'dgiesp138@minsa.gob.pe', 'dgiesp138@minsa.gob.pe', NULL, '', 0, 'SI', NULL, 'ALCALA GARAY', 'Perú', 'LIMA CENTRO', NULL, '1', '40249436', NULL, '975641591', NULL, NULL, 'ASISTENTE ADMINISTRATIVO', 'MINSA', NULL, NULL),
(2741, 'CAROLINA YANET', NULL, 'telesalud2023@hospitalrezola.gob.pe', 'telesalud2023@hospitalrezola.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'YACTAYO VICENTE', 'Perú', 'LIMA REGION', NULL, '1', '40251249', NULL, '904345010', NULL, NULL, 'TECNICO EN CONTABILIDAD', 'HOSPITAL REZOLA CAÑETE', NULL, NULL),
(2742, 'KARINA MARIELA', NULL, 'reynakarinace.08@gmail.com', 'reynakarinace.08@gmail.com', NULL, 'SI', 0, '', NULL, 'CUBAS EVANGELISTA', 'Perú', 'LIMA NORTE', NULL, '1', '40314469', NULL, '996892419', NULL, NULL, 'Psicólogo ', 'Diris Lima Norte ', NULL, NULL),
(2743, 'MAGALY NORMA', NULL, 'mrb18122010@gmail.com', 'mrb18122010@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ROBLES BENITES', 'Perú', 'LIMA SUR', NULL, '1', '40330601', NULL, '971732066', NULL, NULL, 'Medico Cirujano', 'DIRIS LIMA SUR', NULL, NULL),
(2744, 'MONICA GIOVANNA', NULL, 'monicavidal776@gmail.com', 'monicavidal776@gmail.com', NULL, 'SI', 0, '', NULL, 'VIDAL ALVARADO', 'Perú', 'LIMA REGION', NULL, '1', '40342415', NULL, '988611336', NULL, NULL, 'Nutricionista ', 'Hospital Barranca Cajatambo ', NULL, NULL),
(2745, 'ROCIO PILAR', NULL, 'rocioic20@hotmail.com', 'rocioic20@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'INFANZON CABEZAS', 'Perú', 'APURIMAC', NULL, '1', '40387051', NULL, '958244736', NULL, NULL, 'Tecnico enfermeria', 'Disa APURIMAC  II ', NULL, NULL),
(2746, 'LUIS', NULL, 'luisherrerasanchez.79@gmail.com', 'luisherrerasanchez.79@gmail.com', NULL, '', 0, 'SI', NULL, 'HERRERA SANCHEZ', 'Perú', 'CALLAO', NULL, '1', '40393355', NULL, '999968275', NULL, NULL, 'Medico', 'DIRESA Callao', NULL, NULL),
(2747, 'MARITZA GIOVANNA', NULL, 'mfcmarigio2001@gmail.com', 'mfcmarigio2001@gmail.com', NULL, 'SI', 0, '', NULL, 'SOTO LIMO', 'Perú', 'LAMBAYEQUE', NULL, '1', '40400014', NULL, '942219639', NULL, NULL, 'Medico Intensivista ', 'HRL', NULL, NULL),
(2748, 'EDYSON AQUILES', NULL, 'esedano23@gmail.com', 'esedano23@gmail.com', NULL, 'SI', 0, '', NULL, 'SEDANO DE LA CRUZ', 'Perú', 'CAJAMARCA', NULL, '1', '40421849', NULL, '955821515', NULL, NULL, 'Médico Internista ', 'Essalud ', NULL, NULL),
(2749, 'LESVIA KARIN', NULL, 'karinvaldivia@hotmail.com', 'karinvaldivia@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'VALDIVIA REYES', 'Perú', 'LIMA CENTRO', NULL, '1', '40422684', NULL, '947381573', NULL, NULL, 'Administracion', 'Hospital de Emergencias José Casimiro Ulloa', NULL, NULL),
(2750, 'JANINE KARINA', NULL, 'karinajav6@hotmai.com', 'karinajav6@hotmai.com', NULL, 'SI', 0, 'SI', NULL, 'AYALA VALVERDE', 'Perú', 'LIMA SUR', NULL, '1', '40435351', NULL, '987249137', NULL, NULL, 'Obstetra', 'Programa Nacional cuna Más', NULL, NULL),
(2751, 'MARY LISSETH', NULL, 'garciahennings77@gmail.com', 'garciahennings77@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'GARCIA HENNINGS TELLEZ', 'Perú', 'TACNA', NULL, '1', '40442281', NULL, '992144385', NULL, NULL, 'Cirujano dentista', 'C.s. leoncio prado ', NULL, NULL),
(2752, 'ROSARIO ELIZABETH', NULL, 'Charito_gomez23@hotmail.com', 'Charito_gomez23@hotmail.com', NULL, 'SI', 0, '', NULL, 'GOMEZ BARBARAN', 'Perú', 'LIMA REGION', NULL, '1', '40464595', NULL, '943483953', NULL, NULL, 'Cirujano Dentista ', 'Centro Salud t', NULL, NULL),
(2753, 'MERY VICTORIA', NULL, 'mbuitron@insm.gob.pe', 'mbuitron@insm.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'BUITRON ALVARADO', 'Perú', 'LIMA NORTE', NULL, '1', '40471732', NULL, '996061099', NULL, NULL, 'INGENIERIA DE SISTEMAS Y COMPUTO', 'INSTITUTO NACIONAL DE SALUD MENTAL', NULL, NULL),
(2754, 'GLENDA ELGA', NULL, 'glendanatura@hotmail.com', 'glendanatura@hotmail.com', NULL, 'SI', 0, '', NULL, 'ESPINOZA ARGUEDAS', 'Perú', 'APURIMAC', NULL, '1', '40485809', NULL, '965756259', NULL, NULL, 'cirujano dentista /Directora de Participación Comunitaria de Promoción de la Salud', 'Diresa Apurímac', NULL, NULL),
(2755, 'MARCELA JUANITA SOLEDAD', NULL, 'marcelatarazonamendoza@hotmail.com', 'marcelatarazonamendoza@hotmail.com', NULL, 'SI', 0, '', NULL, 'TARAZONA MENDOZA', 'Perú', 'LIMA SUR', NULL, '1', '40508038', NULL, '959351296', NULL, NULL, 'Medico', 'Centro de Salud Buenos Aires de Villa', NULL, NULL),
(2756, 'PATRICIA LUCILA', NULL, 'ppadillapaucar@gmail.com', 'ppadillapaucar@gmail.com', NULL, '', 0, 'SI', NULL, 'PADILLA PAUCAR', 'Perú', 'LIMA ESTE', NULL, '1', '40524910', NULL, '963690350', NULL, NULL, 'Licenciada en Enfermería ', 'SG NATCLAR SAC ', NULL, NULL),
(2757, 'HUGO JOHNNY', NULL, 'hugocoila13@gmail.com', 'hugocoila13@gmail.com', NULL, 'SI', 0, '', NULL, 'COILA YANA', 'Perú', 'PUNO', NULL, '1', '40530286', NULL, '965071616', NULL, NULL, 'Médico cirujano ', 'C.S. Cono Sur ', NULL, NULL),
(2758, 'MERLIN YENY', NULL, 'merlita.mrl@gmail.com', 'merlita.mrl@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ROSALES LADERA', 'Perú', 'LIMA CENTRO', NULL, '1', '40548828', NULL, '996760558', NULL, NULL, 'Medico cirujano', 'Diris lima centro ', NULL, NULL),
(2759, 'ELISBAN VICENTE', NULL, 'elisban_3@hotmail.com', 'elisban_3@hotmail.com', NULL, 'SI', 0, '', NULL, 'CENTON QUISPE', 'Perú', 'LIMA ESTE', NULL, '1', '40559334', NULL, '919502905', NULL, NULL, 'Nutrición ', 'Hospital Hermilio Valdizan ', NULL, NULL),
(2760, 'ALDO PIERRE', NULL, 'aldomedinan1@gmail.com', 'aldomedinan1@gmail.com', NULL, 'SI', 0, '', NULL, 'VILLARROEL MEDINA', 'Perú', 'LIMA CENTRO', NULL, '1', '40559440', NULL, '976314110', NULL, NULL, 'ABOGADO', 'MINSA', NULL, NULL),
(2761, 'FREYDA D\'GUILANI', NULL, 'sfloresrivera351@gmail.com', 'sfloresrivera351@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MARCHAN MATAMOROS', 'Perú', 'LIMA REGION', NULL, '1', '00246568', NULL, '999327992', NULL, NULL, 'medico cirujano', 'si,  da vida', NULL, NULL),
(2762, 'IMA IBETH', NULL, 'Isantamaria@minsa.gob.pe', 'Isantamaria@minsa.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'SANTA MARIA DAVILA', 'Perú', 'LIMA CENTRO', NULL, '1', '40576455', NULL, '943660451', NULL, NULL, 'OBSTETRA', 'MINSA', NULL, NULL),
(2763, 'JULIO CESAR', NULL, 'julioasca@gmail.com', 'julioasca@gmail.com', NULL, 'SI', 0, '', NULL, 'ASCA CASTREJON', 'Perú', 'LIMA CENTRO', NULL, '1', '40599823', NULL, '997212572', NULL, NULL, 'ING INFORMÁTICO', 'HOSPITAL SAN BARTOLOME', NULL, NULL),
(2764, 'CARMEN PAOLA', NULL, 'sb_carmen@hotmail.com', 'sb_carmen@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'SARAVIA BACIGALUPO', 'Perú', 'LIMA SUR', NULL, '1', '40628417', NULL, '963751280', NULL, NULL, 'Enfermera', 'Hospital Maria Auxiliadora', NULL, NULL),
(2765, 'HILDA MERCEDES', NULL, 'hildaps18@hotmail.com', 'hildaps18@hotmail.com', NULL, '', 0, 'SI', NULL, 'PAJUELO SANCHEZ', 'Perú', 'LIMA REGION', NULL, '1', '40652213', NULL, '990381568', NULL, NULL, 'Obstetra', 'Red Barranca', NULL, NULL),
(2766, 'ALEX EFRAIN', NULL, 'Mistico7932@hotmail.com', 'Mistico7932@hotmail.com', NULL, 'SI', 0, '', NULL, 'FERNANDEZ MELENDRES', 'Perú', 'AMAZONAS', NULL, '1', '40652995', NULL, '933999452', NULL, NULL, 'Mwdico', 'Hospital maria auxiliadora', NULL, NULL),
(2767, 'ARMANDO MARTIN', NULL, 'Amartin.cmp@gmail.com', 'Amartin.cmp@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'AZCUÑA RODRIGUEZ', 'Perú', 'LIMA SUR', NULL, '1', '40669525', NULL, '951428138', NULL, NULL, 'Médico ', 'Diris lima sur', NULL, NULL),
(2768, 'ANA DE JESUS', NULL, 'Anyforever368@hotmail.com', 'Anyforever368@hotmail.com', NULL, '', 0, 'SI', NULL, 'CALVO COMETIVOS', 'Perú', 'LIMA NORTE', NULL, '1', '40669947', NULL, '991458488', NULL, NULL, 'tecnica en enfermeria', 'c.s carmen medio', NULL, NULL),
(2769, 'MELISA GLENIS', NULL, 'Melisaguillencabezas@gmail.com', 'Melisaguillencabezas@gmail.com', NULL, 'SI', 0, '', NULL, 'GUILLEN CABEZAS', 'Perú', 'APURIMAC', NULL, '1', '40734426', NULL, '966752106', NULL, NULL, 'Lic. Enfermeria', 'Minsa', NULL, NULL),
(2770, 'YOSELINE NELLY DEL PILAR', NULL, 'yoselynisla@hotmail.com', 'yoselynisla@hotmail.com', NULL, 'SI', 0, '', NULL, 'AZNARÁN ISLA DE REYES', 'Perú', 'LIMA REGION', NULL, '1', '40741163', NULL, '976657117', NULL, NULL, 'Obstetra', 'INEN', NULL, NULL),
(2771, 'MARGARITA VIVIANA', NULL, 'marcaval28012@gmail.com', 'marcaval28012@gmail.com', NULL, 'SI', 0, '', NULL, 'CARLOS VALDIVIA', 'Perú', 'TACNA', NULL, '1', '40796735', NULL, '965670201', NULL, NULL, 'Obstetra', 'Minsa', NULL, NULL),
(2772, 'JANETT INOCENTA', NULL, 'miva_2817@hotmail.com', 'miva_2817@hotmail.com', NULL, 'SI', 0, '', NULL, 'MIRANDA VALERA', 'Perú', 'CALLAO', NULL, '1', '40821182', NULL, '978548942', NULL, NULL, 'Obstetra ', 'Centro de salud Villa los Reyes ', NULL, NULL),
(2773, 'SAMANTHA SAU CHEN', NULL, 'sska1303@gmail.com', 'sska1303@gmail.com', NULL, '', 0, 'SI', NULL, 'KU ALTAMIRANO', 'Perú', 'LIMA CENTRO', NULL, '1', '40833176', NULL, '944896938', NULL, NULL, 'Técnico administrativo ', 'Hospital Nacional Arzobispo Loayza ', NULL, NULL),
(2774, 'MARILUZ', NULL, 'mary1004aries@gmail.com', 'mary1004aries@gmail.com', NULL, 'SI', 0, '', NULL, 'ACOSTA CEFERINO', 'Perú', 'LIMA NORTE', NULL, '1', '40838756', NULL, '937758042', NULL, NULL, 'Enfermera', 'Hospital de Supe', NULL, NULL),
(2775, 'LINCOL MARX', NULL, 'drlincolcruz@gmail.com', 'drlincolcruz@gmail.com', NULL, '', 0, 'SI', NULL, 'CRUZ AQUINO', 'Perú', 'LIMA REGION', NULL, '1', '40872798', NULL, '964806510', NULL, NULL, 'MÉDICO', 'RED HUAURA OYÓN', NULL, NULL),
(2776, 'JANETH MARIELA', NULL, 'janethnapanv@gmail.com', 'janethnapanv@gmail.com', NULL, 'SI', 0, '', NULL, 'NAPAN VILLA', 'Perú', 'LIMA REGION', NULL, '1', '40941718', NULL, '989880086', NULL, NULL, 'Médico Cirujano', 'Hospital Rezola Cañete', NULL, NULL),
(2777, 'LIZ HERMELINDA', NULL, 'lizcielo@hotmail.com', 'lizcielo@hotmail.com', NULL, '', 0, 'SI', NULL, 'APAÉSTEGUI HUANCA', 'Perú', 'SAN MARTÍN', NULL, '1', '40958386', NULL, '966010389', NULL, NULL, 'Obstetra ', 'UE 401', NULL, NULL),
(2778, 'JESUS ALEJANDRO', NULL, 'hjesustb@hotmail.com', 'hjesustb@hotmail.com', NULL, 'SI', 0, '', NULL, 'TAMBO BASAURI', 'Perú', 'CAJAMARCA', NULL, '1', '40980970', NULL, '976390563', NULL, NULL, 'Ing. de Sistemas', 'Dirección Regional de Salud cajamarca', NULL, NULL),
(2779, 'AMADEO MARTIN', NULL, 'amadeobenitesg@gmail.com', 'amadeobenitesg@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'BENITES GONZALEZ', 'Perú', 'LA LIBERTAD', NULL, '1', '40993925', NULL, '906169200', NULL, NULL, 'Licenciado en Enfermería ', 'Asistencia Vida', NULL, NULL),
(2780, 'NENA ALICIA', NULL, 'nenitaa9@hotmail.com', 'nespinal@inen.sld.pe', NULL, '', 0, 'SI', NULL, 'ESPINAL QUINTEROS', 'Perú', 'LIMA CENTRO', NULL, '1', '41135967', NULL, '975458495', NULL, NULL, 'Adm. Salud', 'Inen', NULL, NULL),
(2781, 'CLAUDIA', NULL, 'Lic.claudia.abad@hotmail.com', 'Lic.claudia.abad@hotmail.com', NULL, 'SI', 0, '', NULL, 'ABAD SANDOVAL', 'Perú', 'LIMA SUR', NULL, '1', '41147927', NULL, '956033127', NULL, NULL, 'TM terapia de lenguaje', 'Csmc 12 de noviembre', NULL, NULL),
(2782, 'BELTRAN AMARO', NULL, 'beltranamaro@gmail.com', 'beltranamaro@gmail.com', NULL, 'SI', 0, '', NULL, 'BRAVO CHAVEZ', 'Perú', 'CAJAMARCA', NULL, '1', '41232434', NULL, '976386176', NULL, NULL, 'MEDICO', 'ESSALUD', NULL, NULL),
(2783, 'CAROL', NULL, 'Carolvasquezc10@gmail.com', 'Carolvasquezc10@gmail.com', NULL, 'SI', 0, '', NULL, 'VASQUEZ CARDENAS', 'Perú', 'LIMA NORTE', NULL, '1', '41236894', NULL, '930892606', NULL, NULL, 'Tecnica en enfermeria', 'Cs villa los reyes', NULL, NULL),
(2784, 'CLAUDIA ISABEL', NULL, 'CLAISA17@GMAIL.COM', 'CLAISA17@GMAIL.COM', NULL, 'SI', 0, '', NULL, 'FLORES MURO', 'Perú', 'AMAZONAS', NULL, '1', '41257363', NULL, '952834881', NULL, NULL, 'OBSTETRA', 'RED DE SALUD CONDORCANQUI', NULL, NULL),
(2785, 'ANGELICA ROXANA', NULL, 'angelica_biagge@hotmail.com', 'angelica_biagge@hotmail.com', NULL, 'SI', 0, '', NULL, 'BIAGGE ESPINOZA', 'Perú', 'LIMA SUR', NULL, '1', '41262115', NULL, '966166269', NULL, NULL, 'Enfermera ', 'DIRIS LIMA SUR', NULL, NULL),
(2786, 'YESHLIG AGDALY', NULL, 'garciabobadillay@gmail.com', 'garciabobadillay@gmail.com', NULL, 'SI', 0, '', NULL, 'GARCIA BOBADILLA', 'Perú', 'CALLAO', NULL, '1', '47549930', NULL, '929237293', NULL, NULL, 'Tec enfermeria', 'Diresa', NULL, NULL),
(2787, 'MAGALY XIOMARA', NULL, 'Sxiomaram@gmail.com', 'Sxiomaram@gmail.com', NULL, '', 0, 'SI', NULL, 'SANCHEZ RAMOS', 'Perú', 'LIMA CENTRO', NULL, '1', '41301862', NULL, '986216906', NULL, NULL, 'Obstetra', 'Diris lima centro', NULL, NULL),
(2788, 'MARIA ISABEL', NULL, 'mary_isabel.aqp@hotmail.com', 'mary_isabel.aqp@hotmail.com', NULL, 'SI', 0, '', NULL, 'APAZA CHUTA', 'Perú', 'APURIMAC', NULL, '1', '41313696', NULL, '991346449', NULL, NULL, 'Enfermera ', 'Hospital Tambobamba ', NULL, NULL),
(2789, 'JIMMY', NULL, 'jimmysistemas2@gmail.com', 'jimmysistemas2@gmail.com', NULL, 'SI', 0, '', NULL, 'HERNANDEZ QUIROZ', 'Perú', 'LIMA NORTE', NULL, '1', '41332455', NULL, '986101374', NULL, NULL, 'INGENIERO DE SISTEMAS', 'INSTITUTO NACIONAL DE SALUD MENTAL', NULL, NULL),
(2790, 'JORGE ARMANDO', NULL, 'jaga22@hotmail.com', 'jaga22@hotmail.com', NULL, 'SI', 0, '', NULL, 'GUTIÉRREZ ALBINAGORTA', 'Perú', 'LIMA CENTRO', NULL, '1', '41393416', NULL, '966950456', NULL, NULL, 'Médico cirujano ', 'Essalud ', NULL, NULL),
(2791, 'SONIA ALEXANDRA', NULL, 'Sonika1820@hotmail.com', 'Sonika1820@hotmail.com', NULL, 'SI', 0, '', NULL, 'VARGAS LEYVA', 'Perú', 'LA LIBERTAD', NULL, '1', '41400852', NULL, '936163098', NULL, NULL, 'Obstetra', 'Mínsa', NULL, NULL),
(2792, 'DIANA BEATRIZ', NULL, 'diana_cg21@hotmail.com', 'diana_cg21@hotmail.com', NULL, 'SI', 0, '', NULL, 'GONZALES QUEREVALU', 'Perú', 'LIMA REGION', NULL, '1', '44441447', NULL, '956296911', NULL, NULL, 'MEDICO GESTOR EN SALUD', 'stantec', NULL, NULL),
(2793, 'YANETH', NULL, 'Yanethgonzaf4@gmail.com', 'Yanethgonzaf4@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'GONZALES CABALLERO', 'Perú', 'LIMA CENTRO', NULL, '1', '44800645', NULL, '988965690', NULL, NULL, 'Medico', 'Diris lima centro', NULL, NULL),
(2794, 'HERVE JAMES', NULL, 'Herve.oscco@gmail.com', 'Herve.oscco@gmail.com', NULL, 'SI', 0, '', NULL, 'OSCCO PINEDO', 'Perú', 'LIMA REGION', NULL, '1', '41425006', NULL, '993483169', NULL, NULL, 'Ingeniero sistemas', 'MINSA', NULL, NULL),
(2795, 'LIDA', NULL, 'lidakassandra@hotmail.com', 'lidakassandra@hotmail.com', NULL, '', 0, 'SI', NULL, 'ZAMALLOA CHAMORRO', 'Perú', 'LIMA CENTRO', NULL, '1', '41428099', NULL, '984005605', NULL, NULL, 'ENFERMERA', 'MINSA', NULL, NULL),
(2796, 'GIULIANA ELIZABETH', NULL, 'eliescobar1824@gmail.com', 'eliescobar1824@gmail.com', NULL, 'SI', 0, '', NULL, 'ESCOBAR SANCHEZ', 'Perú', 'LIMA NORTE', NULL, '1', '41451135', NULL, '90269918', NULL, NULL, 'Licenciada en enfermeria', 'C.s bahia blanca', NULL, NULL),
(2797, 'DAYSI MILAGROS', NULL, 'Daysihornacastro@gmail.com', 'Daysihornacastro@gmail.com', NULL, '', 0, 'SI', NULL, 'HORNA CASTRO', 'Perú', 'LIMA CENTRO', NULL, '1', '41477957', NULL, '912990311', NULL, NULL, 'Farmacéutico ', 'Minsa', NULL, NULL),
(2798, 'FREDDY LUIS', NULL, 'fmg20035@hotmail.com', 'fmg20035@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'MUÑANTE GIRALDO', 'Perú', 'ICA', NULL, '1', '41481614', NULL, '971435954', NULL, NULL, 'Medico', 'Cs Tupac Amaru ', NULL, NULL),
(2799, 'KATERINE ELIZABETH', NULL, 'katerine.rupay@gmail.com', 'katerine.rupay@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'RUPAY HOSPINAL', 'Perú', 'LIMA CENTRO', NULL, '1', '41495336', NULL, '940146436', NULL, NULL, 'Especialista en Monitoreo y Seguimiento', 'Ministerio de Salud', NULL, NULL),
(2800, 'YISENIA VICTORIA', NULL, 'viyi2112@hotmail.com', 'viyi2112@hotmail.com', NULL, '', 0, 'SI', NULL, 'HUAMAN QUIJANDRIA', 'Perú', 'ICA', NULL, '1', '21547539', NULL, '962904574', NULL, NULL, 'Cirujano Dentista ', 'Privada ', NULL, NULL),
(2801, 'JANET JAQUELINE', NULL, 'janetvilladelacruz@outlook.com', 'janetvilladelacruz@outlook.com', NULL, 'SI', 0, '', NULL, 'VILLA VILLA', 'Perú', 'CALLAO', NULL, '1', '41536215', NULL, '963425642', NULL, NULL, 'Tecnicl de enfermeria', 'C.S Poligono IV', NULL, NULL),
(2802, 'KARLA', NULL, 'kguerram@minsa.gob.pe', 'kguerram@minsa.gob.pe', NULL, '', 0, 'SI', NULL, 'GUERRA MOTTA', 'Perú', 'LIMA CENTRO', NULL, '1', '41589301', NULL, '943502817', NULL, NULL, 'Nutricionista', 'MINSA', NULL, NULL),
(2803, 'ALEXANDER', NULL, 'APAICO8@HOTMAIL.COM', 'APAICO8@HOTMAIL.COM', NULL, 'SI', 0, '', NULL, 'APAICO MENDOZA', 'Perú', 'ANCASH', NULL, '1', '41605665', NULL, '972987309', NULL, NULL, 'QUIMICO FARMACEUTICO', 'CSMC QORI QOYLLUR', NULL, NULL),
(2804, 'CRISTOPHER NORMAN', NULL, 'cmalagahnhu@gmail.com', 'cmalagahnhu@gmail.com', NULL, '', 0, 'SI', NULL, 'MALAGA ESPINOZA', 'Perú', 'LIMA ESTE', NULL, '1', '41661549', NULL, '935532220', NULL, NULL, 'Analista en Estadística', 'Hospital Nacional Hipólito Unanue', NULL, NULL),
(2805, 'EVELYN GIZEHP JOAHANNA', NULL, 'Evelyngircis@gmail.com', 'Evelyngircis@gmail.com', NULL, 'SI', 0, '', NULL, 'GIRALDO CISNEROS', 'Perú', 'LIMA CENTRO', NULL, '1', '41669206', NULL, '987484118', NULL, NULL, 'Médico ', 'Minsa ', NULL, NULL),
(2806, 'RUTH PAOLA', NULL, 'ruparuna2320@gmail.com', 'ruthparuna@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'RUIZ NARBAJO', 'Perú', 'CALLAO', NULL, '1', '41716978', NULL, '961928976', NULL, NULL, 'tecnologo medico en terapia fisica y rehabilitacion', 'HOSPITAL DE REHABILITACION DEL CALLAO', NULL, NULL),
(2807, 'MILICENDA MILAGROS', NULL, 'mherrera.hnhu@gmail.com', 'mherrera.hnhu@gmail.com', NULL, '', 0, 'SI', NULL, 'HERRERA ROMAN', 'Perú', 'LIMA ESTE', NULL, '1', '41752314', NULL, '987556445', NULL, NULL, 'Licenciada en Enfermería ', 'Hospital Nacional Hipólito Unanue ', NULL, NULL),
(2808, 'CARMEN AMELIA', NULL, 'YELIT_C@hotmail.com', 'YELIT_C@hotmail.com', NULL, 'SI', 0, '', NULL, 'QUEREVALU QUEREVALU', 'Perú', 'PIURA', NULL, '1', '41776908', NULL, '968123062', NULL, NULL, 'OBSTETRA ASISTENCIAL ', 'Centro de salud I-4 la UNIÓN ', NULL, NULL),
(2809, 'EVELYN ROCIO', NULL, 'Trabajomartinez456@gmail.com', 'Trabajomartinez456@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MARTINEZ RAMIREZ', 'Perú', 'CALLAO', NULL, '1', '41831994', NULL, '900871170', NULL, NULL, 'Tecnica de Enfermeria', 'Diresa Callao- Centro de Salud Mi Peru', NULL, NULL),
(2810, 'CARLA EDITH', NULL, 'atencioncarla@gmail.com', 'atencioncarla@gmail.com', NULL, 'SI', 0, '', NULL, 'SERRANO CASTILLO', 'Perú', 'LIMA CENTRO', NULL, '1', '41859345', NULL, '921876036', NULL, NULL, 'Médico cirujano', 'Centro de salud San Sebastián ', NULL, NULL),
(2811, 'CARLOS FRANCISCO', NULL, 'digtel043@minsa.gob.pe', 'digtel043@minsa.gob.pe', NULL, 'SI', 0, '', NULL, 'FLORES MERA', 'Perú', 'LIMA CENTRO', NULL, '1', '41870773', NULL, '949650270', NULL, NULL, 'Economista', 'MINSA', NULL, NULL),
(2812, 'MIGUEL ANGEL', NULL, 'hilariogma83@gmail.com', 'hilariogma83@gmail.com', NULL, 'SI', 0, '', NULL, 'HILARIO GARCIA', 'Perú', 'LIMA ESTE', NULL, '1', '41877141', NULL, '915148799', NULL, NULL, 'ingeniero de sistemas', 'hospital jose agurto telo', NULL, NULL),
(2813, 'RICHARD OSWALDO', NULL, 'Rixard25_5@hotmail.com', 'Rixard25_5@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'MEDINA SERRANO', 'Perú', 'CALLAO', NULL, '1', '41933021', NULL, '985351509', NULL, NULL, 'Técnico de Farmacia ', 'Diresa callao- Centro salud Callao', NULL, NULL),
(2814, 'PATRICIA ROXANA', NULL, 'Patyhuao@gmail.com', 'Patyhuao@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'HUAMAN OJEDA', 'Perú', 'LIMA REGION', NULL, '1', '41941811', NULL, '966968906', NULL, NULL, 'Lic.enfermeria', 'Hospitsl Regional  cañete', NULL, NULL),
(2815, 'MAURO', NULL, 'HNMAURO@GMAIL.COM', 'HNMAURO@GMAIL.COM', NULL, 'SI', 0, 'SI', NULL, 'HUAMANI NAVARRO', 'Perú', 'LIMA SUR', NULL, '1', '41973664', NULL, '960360777', NULL, NULL, 'OBSTETRA', 'HEVES MINSA', NULL, NULL),
(2816, 'JOSE MARIA', NULL, 'jose@cesk.us', 'jose@cesk.us', NULL, '', 0, 'SI', NULL, 'CORONEL DE LA CRUZ', 'Perú', 'LIMA CENTRO', NULL, '1', '41983273', NULL, '970863967', NULL, NULL, 'INGENIERO', 'CESK ENGINEERS', NULL, NULL),
(2817, 'CLAUDIO', NULL, 'Claudinibauti@gmail.com', 'Claudinibauti@gmail.com', NULL, 'SI', 0, '', NULL, 'BAUTISTA DAMIAN', 'Perú', 'APURIMAC', NULL, '1', '42009480', NULL, '986873706', NULL, NULL, 'Enfermero ', 'Curahuasi ', NULL, NULL),
(2818, 'JANETH MAGALY', NULL, 'magissa5@gmail.com', 'magissa5@gmail.com', NULL, '', 0, 'SI', NULL, 'SALAZAR ALFARO', 'Perú', 'LIMA CENTRO', NULL, '1', '42072490', NULL, '973803448', NULL, NULL, 'Medico', 'Hospital dos d e ayo ', NULL, NULL),
(2819, 'YESSENIA ELIANA', NULL, 'yesel1601@hotmail.com', 'yesel1601@hotmail.com', NULL, 'SI', 0, '', NULL, 'HUAMAN ATENCIO', 'Perú', 'LIMA CENTRO', NULL, '1', '45676251', NULL, '975429272', NULL, NULL, 'Desarrolladora de software', 'DITEL-MINSA', NULL, NULL),
(2820, 'JHON DANIEL', NULL, 'galeno_bravo@hotmail.com', 'galeno_bravo@hotmail.com', NULL, 'SI', 0, '', NULL, 'BRAVO CALDERON', 'Perú', 'LIMA CENTRO', NULL, '1', '42146846', NULL, '963633039', NULL, NULL, 'Medico Intensivista', 'Hospital II pasco', NULL, NULL),
(2821, 'ENDIRA EMMA', NULL, 'indirafanoureta@gmail.com', 'indirafanoureta@gmail.com', NULL, '', 0, 'SI', NULL, 'FANO URETA', 'Perú', 'HUANUCO', NULL, '1', '42237682', NULL, '927230678', NULL, NULL, 'Enfermera ', 'Red de salud huanuco ', NULL, NULL),
(2822, 'KATHERINE FANNY', NULL, 'kafyndos@gmail.com', 'kafyndos@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ROSPIGLIOSI VARGAS', 'Perú', 'TACNA', NULL, '1', '42261503', NULL, '921176626', NULL, NULL, 'Médico Cirujano', 'Centro de Salud La Esperanza', NULL, NULL),
(2823, 'MILAGROS', NULL, 'milagrostoribiovillalobos@gmail.com', 'milagrostoribiovillalobos@gmail.com', NULL, 'SI', 0, '', NULL, 'TORIBIO VILLALOBOS', 'Perú', 'LIMA SUR', NULL, '1', '42264091', NULL, '949739309', NULL, NULL, 'Medico', 'MINSA ', NULL, NULL),
(2824, 'MARINO', NULL, 'marinoclqynp@gmail.com', 'marinoclqynp@gmail.com', NULL, '', 0, 'SI', NULL, 'COLQUE YANAPA', 'Perú', 'CAJAMARCA', NULL, '1', '42292661', NULL, '931972844', NULL, NULL, 'Medico Residente ', 'Hospital Regional Docente de Cajamarca ', NULL, NULL),
(2825, 'SOLEDAD', NULL, 'pricesqj@gmail.com', 'pricesqj@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'QUISPE JORGE', 'Perú', 'HUANCAVELICA', NULL, '1', '42301034', NULL, '976305105', NULL, NULL, 'Obstetra', 'Unidad Ejecutora Red de Salud Acobamba', NULL, NULL),
(2826, 'FERNANDO', NULL, 'fernando.coronado.d@gmail.com', 'fernando.coronado.d@gmail.com', NULL, '', 0, 'SI', NULL, 'CORONADO DAVILA', 'Perú', 'LIMA CENTRO', NULL, '1', '42376660', NULL, '965029220', NULL, NULL, 'Médico cirujano ', 'MInsa', NULL, NULL),
(2827, 'CENIA', NULL, 'crimachi@minsa.gob.pe', 'crimachi@minsa.gob.pe', NULL, 'SI', 0, '', NULL, 'RIMACHI HUARIPAUCAR', 'Perú', 'LIMA REGION', NULL, '1', '42382480', NULL, '915019366', NULL, NULL, 'ASISTENTE ADMINISTRATIVO', 'DIGTEL-MINSA', NULL, NULL),
(2828, 'CINTHYA VANEZA', NULL, 'vaneza_k@hotmail.com', 'vaneza_k@hotmail.com', NULL, '', 0, 'SI', NULL, 'KUWATA CORNEJO', 'Perú', 'LIMA CENTRO', NULL, '1', '42400392', NULL, '966711377', NULL, NULL, 'cirujano dentista', 'MINSA', NULL, NULL),
(2829, 'MIRIAM ELIZABETH', NULL, 'elizabet117_8@hotmail.com', 'elizabet117_8@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'PAIVA PURIZACA', 'Perú', 'PIURA', NULL, '1', '42409815', NULL, '971448854', NULL, NULL, 'TEC. COMPUTACION', 'E.S.I-4 BERNAL', NULL, NULL),
(2830, 'JULIA ELIZABETH', NULL, 'juliaelizabethacunapolo@gmail.com', 'telesalud@diresalalibertad.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'ACUÑA POLO', 'Perú', 'LA LIBERTAD', NULL, '1', '42420327', NULL, '954336483', NULL, NULL, 'obstetra', 'GERESA LL', NULL, NULL),
(2831, 'FABIAN GELIM', NULL, 'fabian.canales.84@gmail.com', 'fabian.canales.84@gmail.com', NULL, 'SI', 0, '', NULL, 'CANALES PADILLA', 'Perú', 'LIMA CENTRO', NULL, '1', '42425067', NULL, '949234707', NULL, NULL, 'Medico Cirujano', 'CS San Fernando - SJL', NULL, NULL),
(2832, 'JOSE GUILLERMO', NULL, 'guillermo110584@outlook.com', 'guillermo110584@outlook.com', NULL, 'SI', 0, '', NULL, 'ESPINOZA SEMINARIO', 'Perú', 'LIMA CENTRO', NULL, '1', '42427169', NULL, '949556137', NULL, NULL, 'Licenciado en Enfermeria', 'AHF Perú', NULL, NULL),
(2833, 'ALICIA MABEL', NULL, 'alyslop14@hotmail.com', 'alyslop14@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'LOPEZ MUÑOZ', 'Perú', 'LA LIBERTAD', NULL, '1', '41408656', NULL, '977315703', NULL, NULL, 'enfermera', 'IREN norte', NULL, NULL),
(2834, 'CLARA MARGOT', NULL, 'equipotecnicoprogramas@gmail.com', 'equipotecnicoprogramas@gmail.com', NULL, 'SI', 0, '', NULL, 'TORRES BLANCO', 'Ecuador', 'OTRO', NULL, '1', '42457845', NULL, '9965487845', NULL, NULL, 'SOCIOLOGO', 'PUBLICO', NULL, NULL),
(2835, 'MIRLA KAROL', NULL, 'mirlakarol11_82@hotmail.com', 'mirlakarol11_82@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'CASTILLO COLLANTES', 'Perú', 'LA LIBERTAD', NULL, '1', '42462857', NULL, '900168438', NULL, NULL, 'OBSTETRA', 'HOSPITAL CESAR VALLEJO MENDOZA', NULL, NULL),
(2836, 'ELENA CECILIA', NULL, 'elena_calisaya@hotmail.com', 'elena_calisaya@hotmail.com', NULL, 'SI', 0, '', NULL, 'CALISAYA RODRIGUEZ', 'Perú', 'LIMA ESTE', NULL, '1', '42555336', NULL, '956620079', NULL, NULL, 'Licenciada de enfermería', 'Hospital Hermilio Valdizan', NULL, NULL),
(2837, 'JUAN CARLOS', NULL, 'jcacenteno2406@gmail.com', 'jcacenteno2406@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ASTO CENTENO', 'Perú', 'LIMA NORTE', NULL, '1', '42558056', NULL, '958432017', NULL, NULL, 'Medico', 'HCH', NULL, NULL),
(2838, 'MARGOT MAGALY', NULL, 'claudia_10184@hotmail.com', 'investigacionesterapia@hotmail.com', NULL, 'SI', 0, '', NULL, 'RODAS LIÑAN', 'Perú', 'CALLAO', NULL, '1', '42580750', NULL, '961927473', NULL, NULL, 'Terapeuta fisico ', 'Hospital de rehabilitación del Callao ', NULL, NULL),
(2839, 'EVELYN AMARILIS', NULL, 'eveamasanchez@gmail.com', 'eveamasanchez@gmail.com', NULL, '', 0, 'SI', NULL, 'ORE SANCHEZ', 'Perú', 'LIMA CENTRO', NULL, '1', '42610165', NULL, '996136135', NULL, NULL, 'Medico', 'Hospital Santa Rosa ', NULL, NULL),
(2840, 'RANDY RAUL', NULL, 'randyraulchangacastillo@gmail.com', 'randyraulchangacastillo@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CHANGA CASTILLO', 'Perú', 'LIMA NORTE', NULL, '1', '42644868', NULL, '930214236', NULL, NULL, 'TEC COMPUTACION E INFORMATICA', 'HOSPITAL LAURA ESTHER RODRIGUEZ DULANTO - SUPE', NULL, NULL),
(2841, 'MANUEL SALOMÓN', NULL, 'nc_manuel@outlook.com', 'nc_manuel@outlook.com', NULL, 'SI', 0, 'SI', NULL, 'NÚÑEZ CASTILLO', 'Perú', 'LIMA CENTRO', NULL, '1', '42663663', NULL, '975470044', NULL, NULL, 'NEURÓLOGO ', 'HOSPITAL VICTOR LARCO HERRERA ', NULL, NULL),
(2842, 'BETSY MARIELA', NULL, 'betsymarielalp@gmail.com', 'betsymarielalp@gmail.com', NULL, '', 0, 'SI', NULL, 'LOPEZ PONCE', 'Perú', 'LA LIBERTAD', NULL, '1', '40564313', NULL, '942001703', NULL, NULL, 'Comunicadora social', 'IREN Norte ', NULL, NULL),
(2843, 'ERIKSON', NULL, 'eriksonzch@gmail.com', 'eriksonzch@gmail.com', NULL, 'SI', 0, '', NULL, 'ZORRILLA CHACON', 'Perú', 'CALLAO', NULL, '1', '42755421', NULL, '979717518', NULL, NULL, 'Medico', 'Policlinico Alberto Barton Thompson', NULL, NULL),
(2844, 'JUAN NICOLAS', NULL, 'naty_elka18@hotmail.com', 'naty_elka18@hotmail.com', NULL, '', 0, 'SI', NULL, 'HERMOZA VALLEJOS', 'Perú', 'LA LIBERTAD', NULL, '1', '42755567', NULL, '983985607', NULL, NULL, 'Medico', 'Hospital regional de trujillo', NULL, NULL),
(2845, 'ELENA MARISELA', NULL, 'Elenamariselamartinezchauca@gmail.com', 'Elenamariselamartinezchauca@gmail.com', NULL, 'SI', 0, '', NULL, 'MARTINEZ CHAUCA', 'Perú', 'APURIMAC', NULL, '1', '42765393', NULL, '929172958', NULL, NULL, 'Medico Cirujano', 'C.S.San Martin', NULL, NULL),
(2846, 'YOSILU VISABEL', NULL, 'yosiluaguilar1884@gmail.com', 'yosiluaguilar1884@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'AGUILAR CRUCES', 'Perú', 'LIMA REGION', NULL, '1', '42801939', NULL, '962725592', NULL, NULL, 'Medico', 'EsSalud', NULL, NULL),
(2847, 'NOEMI DEHICE', NULL, 'Noemi_huaringa.20@hotmail.com', 'Noemi_huaringa.20@hotmail.com', NULL, 'SI', 0, '', NULL, 'HUARINGA ALBERCO', 'Perú', 'LIMA REGION', NULL, '1', '42825176', NULL, '961749618', NULL, NULL, 'Técnica de enfermería ', 'Red de salud huarochiri ', NULL, NULL),
(2848, 'JULIO CESAR', NULL, 'maccanascca10@gmail.com', 'maccanascca10@gmail.com', NULL, '', 0, 'SI', NULL, 'CABRERA MACCANASCCA', 'Perú', 'LIMA CENTRO', NULL, '1', '42828209', NULL, '943926975', NULL, NULL, 'Médico cirujano ', 'Ps huaca pando', NULL, NULL),
(2849, 'DENISSE NOEMI', NULL, 'Dennisenoemipachas07@gmail.com', 'Dennisenoemipachas07@gmail.com', NULL, '', 0, 'SI', NULL, 'PACHAS VILCAPUMA', 'Perú', 'LIMA NORTE', NULL, '1', '42832981', NULL, '978531740', NULL, NULL, 'Lic. Enfermeria', 'Hospital Carlos Lanfranco La Hoz ', NULL, NULL),
(2850, 'MELVA JENNIFER', NULL, 'melvavalenzuela2020@gmail.com', 'melvavalenzuela2020@gmail.com', NULL, 'SI', 0, '', NULL, 'VALENZUELA SAPA', 'Perú', 'LIMA CENTRO', NULL, '1', '42845363', NULL, '993389380', NULL, NULL, 'Obstetra ', 'MINSA - INFOSALUD ', NULL, NULL),
(2851, 'KELY', NULL, 'ninaabrillkely@gmail.com', 'ninaabrillkely@gmail.com', NULL, 'SI', 0, '', NULL, 'NINA ABRILL', 'Perú', 'CUSCO', NULL, '1', '42860563', NULL, '984767279', NULL, NULL, 'CD', 'HRC', NULL, NULL),
(2852, 'KATIA KATHERINE', NULL, 'Katiamallmarojas@gmail.com', 'Katiamallmarojas@gmail.com', NULL, '', 0, 'SI', NULL, 'MALLMA ROJAS', 'Perú', 'LIMA CENTRO', NULL, '1', '42898916', NULL, '949073999', NULL, NULL, 'medico', 'DIRIS LIMA CENTRO-', NULL, NULL),
(2853, 'DIANA LUZ', NULL, 'Deffio1404@hotmail.com', 'Deffio1404@hotmail.com', NULL, 'SI', 0, '', NULL, 'EFFIO BERNAL', 'Perú', 'LIMA REGION', NULL, '1', '42917971', NULL, '934794591', NULL, NULL, 'Lic. Enferneria', 'DIRESA LIMA', NULL, NULL),
(2854, 'DEYSI SARAIT', NULL, 'dgamonal01@hotmail.com', 'dgamonal01@hotmail.com', NULL, '', 0, 'SI', NULL, 'GAMONAL NICODEMOS', 'Perú', 'SAN MARTÍN', NULL, '1', '43019545', NULL, '920514050', NULL, NULL, 'Obstetra ', 'Ogess alto mayo', NULL, NULL),
(2855, 'DORCAS', NULL, 'dorkis@hotmail.es', 'dorkis@hotmail.es', NULL, 'SI', 0, 'SI', NULL, 'ROCA PEZO', 'Perú', 'LIMA ESTE', NULL, '1', '43080417', NULL, '971076219', NULL, NULL, 'medico ', 'minsa', NULL, NULL),
(2856, 'MILAGROS ROSARIO', NULL, 'rosariosalvatierra2@gmail.com', 'rosariosalvatierra2@gmail.com', NULL, 'SI', 0, '', NULL, 'SALVATIERRA LEON', 'Perú', 'PIURA', NULL, '1', '43094391', NULL, '956181575', NULL, NULL, 'Medico cirujano', 'Subregion salud luciano colomma', NULL, NULL),
(2857, 'SERGIO', NULL, 'sergio.luque@unmsm.edu.pe', 'sergio.luque@unmsm.edu.pe', NULL, '', 0, 'SI', NULL, 'LUQUE MAMANI', 'Perú', 'LIMA CENTRO', NULL, '1', '43169663', NULL, '994431166', NULL, NULL, 'Computación Científica ', 'CDC MINSA ', NULL, NULL),
(2858, 'WILY LEONARDO', NULL, 'leonardoqch@gmail.com', 'leonardoqch@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'QUISPE CHURA', 'Perú', 'MADRE DE DIOS', NULL, '1', '43212953', NULL, '973698385', NULL, NULL, 'Técnico en Enfermería', 'P.s. HUEPETUHE', NULL, NULL),
(2859, 'CARLA MILUSKA', NULL, 'carla.solis16@gmail.com', 'carla.solis16@gmail.com', NULL, 'SI', 0, '', NULL, 'SOLIS CANO', 'Perú', 'PUNO', NULL, '1', '43318728', NULL, '948142556', NULL, NULL, 'Obstetra', 'Minsa', NULL, NULL),
(2860, 'KARLA YURUANI', NULL, 'yursali856@hotmail.com', 'yursali856@hotmail.com', NULL, 'SI', 0, '', NULL, 'SALINAS ORDOÑEZ', 'Perú', 'HUANUCO', NULL, '1', '43377875', NULL, '927385966', NULL, NULL, 'Licenciada en Enfermería ', 'Diresa Huánuco ', NULL, NULL),
(2861, 'RUBY GUISELLE', NULL, 'rubyguiselle@gmail.com', 'rubyguiselle@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MOSCOSO JARRO', 'Perú', 'TACNA', NULL, '1', '43392593', NULL, '944438742', NULL, NULL, 'MEDICO CIRUJANO', 'CENTRO DE SALUD AUGUSTO B LEGUIA', NULL, NULL),
(2862, 'NATALI EMPERATRIZ', NULL, 'Natie1001@hotmail.com', 'Natie1001@hotmail.com', NULL, '', 0, 'SI', NULL, 'VENANCIO ESPINOZA', 'Perú', 'LIMA CENTRO', NULL, '1', '43398590', NULL, '987199190', NULL, NULL, 'Medico cirujano ', 'PS PALERMO ', NULL, NULL),
(2863, 'ERNESTO LUCIANO', NULL, 'rethiagoer26@gmail.com', 'rethiagoer26@gmail.com', NULL, 'SI', 0, '', NULL, 'LOPEZ CURAY', 'Perú', 'PIURA', NULL, '1', '72212239', NULL, '940266415', NULL, NULL, 'Médico Cirujano', 'CS Las Lomas ', NULL, NULL),
(2864, 'VANESSA JESICA', NULL, 'jesica_vane_11@hotmail.com', 'jesica_vane_11@hotmail.com', NULL, 'SI', 0, '', NULL, 'MINAYA PACCO', 'Perú', 'ANCASH', NULL, '1', '43510153', NULL, '943119147', NULL, NULL, 'psicologa', 'red huaylas norte', NULL, NULL),
(2865, 'JUAN PEDRO', NULL, 'rutlozano1971@hotmail.com', 'rutlozano1971@hotmail.com', NULL, '', 0, 'SI', NULL, 'PARI MORALES', 'Perú', 'LIMA ESTE', NULL, '1', '43562356', NULL, '985965569', NULL, NULL, 'Enfermera ', 'Minsa ', NULL, NULL),
(2866, 'MIRELLA MAVEL', NULL, 'mirel.mmca@gmail.com', 'mirel.mmca@gmail.com', NULL, 'SI', 0, '', NULL, 'CASTAÑEDA ALARCON', 'Perú', 'ICA', NULL, '1', '43590944', NULL, '956063070', NULL, NULL, 'Medico', 'Puesto salud San Martin Porres ', NULL, NULL),
(2867, 'DANIEL ANIBAL', NULL, 'd.conislla.jeri@gmail.com', 'd.conislla.jeri@gmail.com', NULL, '', 0, 'SI', NULL, 'CONISLLA JERI', 'Perú', 'LIMA CENTRO', NULL, '1', '43591700', NULL, '987268418', NULL, NULL, 'Médico', 'HONADOMANI', NULL, NULL),
(2868, 'SARA LEONOR', NULL, 'seretuangelx@hotmail.com', 'seretuangelx@hotmail.com', NULL, 'SI', 0, '', NULL, 'GARRO ESPINOZA', 'Perú', 'ANCASH', NULL, '1', '43592364', NULL, '947441030', NULL, NULL, 'Obstetricia', 'Centro de salud huarupampa', NULL, NULL),
(2869, 'SONIA KARINA', NULL, 'soniakarina.br118@gmail.com', 'soniakarina.br118@gmail.com', NULL, 'SI', 0, '', NULL, 'BARDALES RENGIFO', 'Perú', 'LIMA SUR', NULL, '1', '43613838', NULL, '980685412', NULL, NULL, 'Médico', 'CMI CEASR LÓPEZ SILVA', NULL, NULL),
(2870, 'JOSÉ RAÚL', NULL, 'telemedicinajc@gmail.com', 'telemedicinajc@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'COLLANTES SCHMIDT', 'Perú', 'LIMA CENTRO', NULL, '1', '43653505', NULL, '945597680', NULL, NULL, 'Medico', 'Hospital Dos de Mayo', NULL, NULL),
(2871, 'DELVIA', NULL, 'VIDEL1PE@GMAIL.COM', 'VIDEL1PE@GMAIL.COM', NULL, '', 0, 'SI', NULL, 'LIZARRAGA RAMOS', 'Perú', 'LIMA CENTRO', NULL, '1', '43675781', NULL, '921313144', NULL, NULL, 'Medica Cirujana', 'Essalud', NULL, NULL),
(2872, 'MARILY MAGDALENA', NULL, 'Marily_1815@hotmail.com', 'Marily_1815@hotmail.com', NULL, '', 0, 'SI', NULL, 'QUIROZ MONTALVAN', 'Perú', 'LAMBAYEQUE', NULL, '1', '43709801', NULL, '958028858', NULL, NULL, 'Técnica en computación e informática ', 'Red Lambayeque ', NULL, NULL),
(2873, 'GLADYS ELSA', NULL, 'mendozamh97@hotmail.com', 'telesalud@hospitalsjl.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'MENDOZA SUAREZ', 'Perú', 'LIMA CENTRO', NULL, '1', '10662719', NULL, '994556372', NULL, NULL, 'medico', 'Hospital san juan de lurigancho', NULL, NULL),
(2874, 'JANET IVON', NULL, 'royjaraolivera@gmail.com', 'royjaraolivera@gmail.com', NULL, 'SI', 0, '', NULL, 'VERGARAY UZURIAGA', 'Perú', 'LIMA CENTRO', NULL, '1', '43826123', NULL, '944437517', NULL, NULL, 'Ingeniero ', 'Ditel', NULL, NULL),
(2875, 'CYNTHIA', NULL, 'decopcy@gmail.com', 'decopcy@gmail.com', NULL, 'SI', 0, '', NULL, 'CAYLLAHUA GUTIERREZ', 'Perú', 'LIMA ESTE', NULL, '1', '43826617', NULL, '986971516', NULL, NULL, 'OBSTETRA / AUDITORA EN SALUD', 'DIRECCION DE REDES INTEGRADAS EN SALUD LIAM ESTE', NULL, NULL),
(2876, 'SANDRA MILAGROS', NULL, 'Ssandra1911chirinos@gmail.com', 'Ssandra1911chirinos@gmail.com', NULL, 'SI', 0, '', NULL, 'CHIRINOS LLACSAHUANGA', 'Perú', 'APURIMAC', NULL, '1', '43880383', NULL, '992397649', NULL, NULL, 'Licenciada en enfermería ', 'Disa apurimac II', NULL, NULL),
(2877, 'SILVIA TRINIDAD', NULL, 'Silviatcsp@gmail.com', 'Silviatcsp@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CORDOVA SAINT - PERE', 'Perú', 'LIMA REGION', NULL, '1', '44007498', NULL, '975528743', NULL, NULL, 'Enfermera', 'Insn san borja', NULL, NULL),
(2878, 'ANGIE CECILIA', NULL, 'andg12@gmail.com', 'andg12@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MERCADO RODRIGUEZ', 'Perú', 'LIMA CENTRO', NULL, '1', '44034599', NULL, '993169939', NULL, NULL, 'Medico auditor', 'Insnsb', NULL, NULL),
(2879, 'JESSICA', NULL, 'Yetty179@gmail.com', 'Yetty179@gmail.com', NULL, '', 0, 'SI', NULL, 'LAZARO RENGIFO', 'Perú', 'LIMA CENTRO', NULL, '1', '44226779', NULL, '922173088', NULL, NULL, 'Ing. Sistemas e informatica', 'Hospital Nacional Dos de Mayo', NULL, NULL),
(2880, 'JACOBO ANDRES', NULL, 'jtalledo@minsa.gob.pe', 'jtalledo@minsa.gob.pe', NULL, 'SI', 0, '', NULL, 'TALLEDO PORTA', 'Perú', 'LIMA CENTRO', NULL, '1', '44227331', NULL, '992523742', NULL, NULL, 'Ing. de Sistemas', 'MINSA', NULL, NULL),
(2881, 'ISABEL MÓNICA', NULL, 'monicaparrabaltazar@gmail.com', 'monicaparrabaltazar@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'PARRA BALTAZAR', 'Perú', 'LIMA SUR', NULL, '1', '44228733', NULL, '924425028', NULL, NULL, 'MEDICO', 'ESSALUD', NULL, NULL),
(2882, 'ORIALIZ', NULL, 'orializdent6@gmail.com', 'orializdent6@gmail.com', NULL, '', 0, 'SI', NULL, 'HUANCA ARROYO', 'Perú', 'LIMA CENTRO', NULL, '1', '44238311', NULL, '954148100', NULL, NULL, 'CIRUJANO DENTISTA ', 'HOSPITAL DE EMERGENCIAS PEDIATRICAS ', NULL, NULL),
(2883, 'MARIA ISABEL', NULL, 'MARIA.ROSASP@UNMSM.EDU.PE', 'MARIA.ROSASP@UNMSM.EDU.PE', NULL, 'SI', 0, 'SI', NULL, 'ROSAS PIMENTEL', 'Perú', 'LIMA CENTRO', NULL, '1', '44251665', NULL, '941494705', NULL, NULL, 'MEDICO', 'MINSA', NULL, NULL),
(2884, 'RICHARD JAVIER', NULL, 'richardtorresr@gmail.com', 'richardtorresr@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'TORRES RIVERA', 'Perú', 'LIMA ESTE', NULL, '1', '44273306', NULL, '996796783', NULL, NULL, 'Técnico Informático', 'Hospital Hermilio Valdizán', NULL, NULL),
(2885, 'MARIA ELENA', NULL, 'msaenz@diresalima.gob.pe', 'msaenz@diresalima.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'SAENZ YZAGUIRRE', 'Perú', 'LIMA REGION', NULL, '1', '44308326', NULL, '975150115', NULL, NULL, 'Enfermera', 'Diresa Lima', NULL, NULL),
(2886, 'MERLY JACQUELINE', NULL, 'Myf10112007@hotmail.com', 'Myf10112007@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'HUAMANI QUISPE', 'Perú', 'ICA', NULL, '1', '44352425', NULL, '970807596', NULL, NULL, 'Lic. Enfermeria', 'Hospital san juan de dios de pisco', NULL, NULL),
(2887, 'WILLIAM HERNAN', NULL, 'ortizarrunategui@gmail.com', 'ortizarrunategui@gmail.com', NULL, 'SI', 0, '', NULL, 'ORTIZ ARRUNATEGUI', 'Perú', 'CALLAO', NULL, '1', '09955415', NULL, '955176314', NULL, NULL, 'obstetra', 'diresa callao', NULL, NULL),
(2888, 'HERLY MARYZETH', NULL, 'herly_zet@hotmial.com', 'herly_zet@hotmial.com', NULL, 'SI', 0, '', NULL, 'TORRE GAMARRA', 'Perú', 'ANCASH', NULL, '1', '44459881', NULL, '929524268', NULL, NULL, 'CIRUJANO DENTISTA', 'MICRO RED CHASQUITAMBO', NULL, NULL),
(2889, 'REED GONZALO', NULL, 'rg11dv@gmail.com', 'rg11dv@gmail.com', NULL, 'SI', 0, '', NULL, 'DIONISIO VALENCIA', 'Perú', 'LIMA ESTE', NULL, '1', '44466158', NULL, '946134638', NULL, NULL, 'Cirujano dentista ', 'Hospital José Agurto Tello de Chosica ', NULL, NULL),
(2890, 'ZAIDA PAMELA', NULL, 'daizamela@gmail.com', 'daizamela@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'GUZMAN LAPA', 'Perú', 'LIMA NORTE', NULL, '1', '44492514', NULL, '902838502', NULL, NULL, 'administrativo ', 'hospital nacional cayetano heredia ', NULL, NULL),
(2891, 'LUZLITA', NULL, 'luzcazu@gmail.com', 'luzcazu@gmail.com', NULL, 'SI', 0, '', NULL, 'CANTA ZUMAETA', 'Perú', 'AMAZONAS', NULL, '1', '44499364', NULL, '924660577', NULL, NULL, 'ENFERMERA', 'DIRESA AMAZONAS', NULL, NULL),
(2892, 'MILAGROS STEFANÍ', NULL, 'stefani.prado.aparcana@gmail.com', 'stefani.prado.aparcana@gmail.com', NULL, '', 0, 'SI', NULL, 'PRADO APARCANA', 'Perú', 'CALLAO', NULL, '1', '44538009', NULL, '996439567', NULL, NULL, 'Médico cirujano', 'Hospital San José del Callao', NULL, NULL),
(2893, 'NELLY KATALINA', NULL, 'nellycepeda270787@gmail.com', 'nellycepeda270787@gmail.com', NULL, '', 0, 'SI', NULL, 'CEPEDA ZAVALETA', 'Perú', 'LIMA CENTRO', NULL, '1', '44623924', NULL, '987929493', NULL, NULL, 'Medico', 'Hospital nacional dos de mayo', NULL, NULL),
(2894, 'DAMARIZ MELIZA', NULL, 'meliza4488@gmail.com', 'meliza4488@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CARBAJAL PAPAS', 'Perú', 'CALLAO', NULL, '1', '44642579', NULL, '985957774', NULL, NULL, 'Farmacia técnica ', 'Instituto Daniel Alcides Carrión ', NULL, NULL),
(2895, 'GUADALUPE MARIA MARGARITA', NULL, 'guadalupedlc@gmail.com', 'telesalud@dirislimacentro.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'OCHOA DE LA COLINA', 'Perú', 'LIMA CENTRO', NULL, '1', '44673512', NULL, '928741437', NULL, NULL, 'EQUIPO TÉCNICO TELESALUD DIRIS LC', 'DIRIS LC', NULL, NULL),
(2896, 'INGRID', NULL, 'ingridpval@hotmail.com', 'ingridpval@hotmail.com', NULL, '', 0, 'SI', NULL, 'PEÑA VALENZUELA', 'Perú', 'CUSCO', NULL, '1', '42621671', NULL, '984776152', NULL, NULL, 'Cirujano Dentista', 'EsSalud', NULL, NULL),
(2897, 'JANINA MELISSA', NULL, 'jm.vega2801@gmail.com', 'jm.vega2801@gmail.com', NULL, '', 0, 'SI', NULL, 'VEGA VERGARAY', 'Perú', 'LIMA CENTRO', NULL, '1', '44808721', NULL, '954444148', NULL, NULL, 'Médico', 'MINSA', NULL, NULL),
(2898, 'GLEDY KATERIN', NULL, 'qf.gledy@gmail.com', 'qf.gledy@gmail.com', NULL, 'SI', 0, '', NULL, 'MARTINEZ PALOMINO', 'Perú', 'LIMA REGION', NULL, '1', '44823892', NULL, '996367719', NULL, NULL, 'Químico Farmacéutico ', 'Grupo AK', NULL, NULL),
(2899, 'JUNIOR ALEXANDER', NULL, 'jreyesg@diresalima.gob.pe', 'jreyesg@diresalima.gob.pe', NULL, 'SI', 0, '', NULL, 'REYES GRIMAREY', 'Perú', 'LIMA REGION', NULL, '1', '44828211', NULL, '969443193', NULL, NULL, 'Ing. sistemas', 'DIRESA LIMA', NULL, NULL),
(2900, 'ZENAIDA LIZ', NULL, 'Camilita_626@hotmail.com', 'Camilita_626@hotmail.com', NULL, '', 0, 'SI', NULL, 'VENTURA COARICONA', 'Perú', 'MOQUEGUA', NULL, '1', '44909291', NULL, '964482859', NULL, NULL, 'Enfermera', 'Red salud ', NULL, NULL),
(2901, 'MARBIN LENIN', NULL, 'maverit_72@hotmail.com', 'maverit_72@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'CARRASCO TINEO', 'Perú', 'CAJAMARCA', NULL, '1', '44936201', NULL, '959553297', NULL, NULL, 'Licenciado en Enfermería ', 'Hospital General de Jaén ', NULL, NULL),
(2902, 'SARA ELIZABETH', NULL, 'sara.ruiz.26@gmail.com', 'sara.ruiz.26@gmail.com', NULL, 'SI', 0, '', NULL, 'RUIZ FLORIAN', 'Perú', 'LIMA ESTE', NULL, '1', '44970267', NULL, '992253222', NULL, NULL, 'Medico psiquiatra', 'Hospital Hermilio Valdizan', NULL, NULL),
(2903, 'YHONY BALTAZAR', NULL, '06yhoni01.1986paiba@gmail.com', '06yhoni01.1986paiba@gmail.com', NULL, 'SI', 0, '', NULL, 'PAIBA FIESTAS', 'Perú', 'PIURA', NULL, '1', '45000535', NULL, '940539654', NULL, NULL, 'Técnico en enfermería ', 'E.s I-4 Bernal ', NULL, NULL),
(2904, 'BEATRIZ', NULL, 'beatriz19p@gmail.com', 'beatriz19p@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'PACO GUTIERREZ', 'Perú', 'TACNA', NULL, '1', '45010979', NULL, '972710424', NULL, NULL, 'psicóloga ', 'Red de salud Tacna', NULL, NULL),
(2905, 'CLAUDIA VIOLETA', NULL, 'hollyvio88@gmail.com', 'hollyvio88@gmail.com', NULL, 'SI', 0, '', NULL, 'HUAMANI MENDOZA', 'Perú', 'APURIMAC', NULL, '1', '45016952', NULL, '958575005', NULL, NULL, 'Psicologa', 'Disa Apurímac ll', NULL, NULL),
(2906, 'ERICKA GIULIANA', NULL, 'milene_155@hotmail.com', 'milene_155@hotmail.com', NULL, '', 0, 'SI', NULL, 'PISCONTE SALVATIERRA', 'Perú', 'ICA', NULL, '1', '45070984', NULL, '941975995', NULL, NULL, 'LICENCIADA DE ENFERMERIA ', 'HOSPITAL DE EMERGENCIAS JOSE CASIMIRO ULLOA ', NULL, NULL),
(2907, 'JORGE MARTIN', NULL, 'jorge.chavez@upch.pe', 'jorge.chavez@upch.pe', NULL, 'SI', 0, '', NULL, 'CHAVEZ YALLES', 'Perú', 'LIMA NORTE', NULL, '1', '45097969', NULL, '967762909', NULL, NULL, 'medico', 'Preventiva Laboral', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(2908, 'NOE', NULL, 'NRODRIGUEZH@IEMP.GOB.PE', 'NRODRIGUEZH@IEMP.GOB.PE', NULL, 'SI', 0, 'SI', NULL, 'RODRIGUEZ HILARIO', 'Perú', 'LIMA CENTRO', NULL, '1', '45119515', NULL, '934561610', NULL, NULL, 'INGENIERO DE SISTEMAS', 'INSTITUTO NACIONAL MATERNO PERINATAL', NULL, NULL),
(2909, 'ANA LUCIA', NULL, 'al.guerreroc@alum.up.edu.pe', 'al.guerreroc@alum.up.edu.pe', NULL, 'SI', 0, 'SI', NULL, 'GUERRERO CHENIQUE', 'Perú', 'LIMA CENTRO', NULL, '1', '45126684', NULL, '995111371', NULL, NULL, 'Enfermera', 'MINSA', NULL, NULL),
(2910, 'KAREN MAGDALENA', NULL, 'karenredlambayeque@gmail.com', 'karenredlambayeque@gmail.com', NULL, '', 0, 'SI', NULL, 'HUARAC GARCIA', 'Perú', 'LAMBAYEQUE', NULL, '1', '45142144', NULL, '982294459', NULL, NULL, 'LICENCIADA EN ENFERMERIA', 'RED DE SALUD  LAMBAYEQUE', NULL, NULL),
(2911, 'EVELYN MILUSKA', NULL, 'changaevelyn21@gmail.com', 'changaevelyn21@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CHANGA FERNANDEZ', 'Perú', 'APURIMAC', NULL, '1', '45145480', NULL, '963364586', NULL, NULL, 'Cirujano Dentista', 'Disa Virgen de Cocharcas', NULL, NULL),
(2912, 'CARMEN LIZBET', NULL, 'lisca2003@hotmail.com', 'lisca2003@hotmail.com', NULL, '', 0, 'SI', NULL, 'BEGAZO SOLIS', 'Perú', 'LIMA REGION', NULL, '1', '45174659', NULL, '984711326', NULL, NULL, 'MEDICO CIRUJANO', 'HOSPITAL NACIONAL CAYETANO HEREDIA', NULL, NULL),
(2913, 'RICARDO MITSURU', NULL, 'ricardo.hanada@upch.pe', 'ricardo.hanada@upch.pe', NULL, '', 0, 'SI', NULL, 'HANADA ANGULO', 'Perú', 'LIMA NORTE', NULL, '1', '45243842', NULL, '974755444', NULL, NULL, 'Médico cirujano ', 'Hospital de chancay ', NULL, NULL),
(2914, 'LESLIE ELIZABETH', NULL, 'leslie_14_@hotmail.com', 'leslie_14_@hotmail.com', NULL, 'SI', 0, '', NULL, 'CAICEDO CUMPA', 'Perú', 'CALLAO', NULL, '1', '45277971', NULL, '950691497', NULL, NULL, 'Quimico farmaceutico/ Técnica en Farmacia', 'P.S. Angamos ', NULL, NULL),
(2915, 'VIRGINIA VERONICA', NULL, 'virginia.antunez23@gmail.com', 'virginia.antunez23@gmail.com', NULL, 'SI', 0, '', NULL, 'VIA ANTUNEZ', 'Perú', 'LIMA NORTE', NULL, '1', '45286775', NULL, '921870018', NULL, NULL, 'ENFERMERA', 'HOSPITAL BARRANCA ', NULL, NULL),
(2916, 'CLAUDIA ELIZABETH', NULL, 'celizabethbr88@gmail.com', 'celizabethbr88@gmail.com', NULL, '', 0, 'SI', NULL, 'BAUTISTA RAMOS', 'Perú', 'CUSCO', NULL, '1', '45311351', NULL, '992755335', NULL, NULL, 'Lic. En Enfermería ', 'RSSCN', NULL, NULL),
(2917, 'MARYBEL GERTRUDES', NULL, 'maribelarmas2013@gmail.com', 'maribelarmas2013@gmail.com', NULL, 'SI', 0, '', NULL, 'ARMAS GUERRERO', 'Perú', 'LIMA NORTE', NULL, '1', '45312853', NULL, '939130608', NULL, NULL, 'T.M. Radiologia ', 'Hospital de la Solidaridad ', NULL, NULL),
(2918, 'STEPHANY LUCIA', NULL, 'Slaq2710@gmail.com', 'Slaq2710@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'AREVALO QUIO', 'Perú', 'UCAYALI', NULL, '1', '45371609', NULL, '961611818', NULL, NULL, 'Lic. Enfermería ', 'Hospital amazónico ', NULL, NULL),
(2919, 'LUZ EDITHA', NULL, 'psic.lhuaman@gmail.com', 'psic.lhuaman@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'HUAMAN CHAVEZ', 'Perú', 'ANCASH', NULL, '1', '45410113', NULL, '985853999', NULL, NULL, 'psicologa', 'Red de Salud Conchucos Sur', NULL, NULL),
(2920, 'LENIN RODER', NULL, 'lennyperalta19@gmail.com', 'lennyperalta19@gmail.com', NULL, '', 0, 'SI', NULL, 'PERALTA HORNA', 'Perú', 'LIMA NORTE', NULL, '1', '42439867', NULL, '996981936', NULL, NULL, 'Técnico administrativo ', 'Hospital Carlos Lanfranco La Hoz ', NULL, NULL),
(2921, 'ERIKA YANETT', NULL, 'Jaeriml16@gmail.com', 'Jaeriml16@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'MARREROS LARA', 'Perú', 'LIMA ESTE', NULL, '1', '45463003', NULL, '992225474', NULL, NULL, 'Tecnologo medico en Radiologia', 'centro diagnostico Imaben', NULL, NULL),
(2922, 'FIORELLA KAREN', NULL, 'Fiorellaescobar16@gmail.com', 'Fiorellaescobar16@gmail.com', NULL, 'SI', 0, '', NULL, 'ESCOBAR PALACIN', 'Perú', 'LIMA NORTE', NULL, '1', '45468241', NULL, '999390499', NULL, NULL, 'Técnico en Farmacia ', 'Centro de Salud Enrique Milla Ochoa ', NULL, NULL),
(2923, 'ERICK DANIEL', NULL, 'erickluchini@gmail.com', 'erickluchini@gmail.com', NULL, '', 0, 'SI', NULL, 'SANCHEZ LUCHINI', 'Perú', 'LIMA NORTE', NULL, '1', '45507174', NULL, '954454225', NULL, NULL, 'Cirujano Dentista', 'DIRIS lima norte', NULL, NULL),
(2924, 'NELIDA', NULL, 'Neli_ale@outlook.com', 'Neli_ale@outlook.com', NULL, '', 0, 'SI', NULL, 'CASTILLO MAMANI', 'Perú', 'TACNA', NULL, '1', '45520113', NULL, '950403028', NULL, NULL, 'Te enfermería ', 'Minsa', NULL, NULL),
(2925, 'LUIS ALONSO', NULL, 'lcisneros.1602@gmail.com', 'lcisneros.1602@gmail.com', NULL, 'SI', 0, '', NULL, 'CISNEROS CUYA', 'Perú', 'LIMA NORTE', NULL, '1', '45545757', NULL, '933067789', NULL, NULL, 'TEC INF', 'DIRIS LN', NULL, NULL),
(2926, 'SASKIA ELENA', NULL, 'saskia.arauco@gmail.com', 'saskia.arauco@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ARAUCO AGUILAR', 'Perú', 'JUNÍN', NULL, '1', '45585504', NULL, '964259906', NULL, NULL, 'Cirujano Dentista', 'INEN', NULL, NULL),
(2927, 'SILVIA STEFANY', NULL, 'csilvia1103@gmail.com', 'csilvia1103@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CAVERO ASPAJO', 'Perú', 'LIMA CENTRO', NULL, '1', '45604396', NULL, '991475087', NULL, NULL, 'Lic enfermería ', 'Infosalud', NULL, NULL),
(2928, 'ZULEMA', NULL, 'azucenaoblitas@gemail.Com', 'azucenaoblitas@gemail.Com', NULL, '', 0, 'SI', NULL, 'PERALTA OBLITAS DE CARRASCO', 'Perú', 'LIMA REGION', NULL, '1', '06267405', NULL, '982679179', NULL, NULL, 'Técnico administrativo', 'HNDM', NULL, NULL),
(2929, 'YESENIA MELISSA', NULL, 'yesi_zav@hotmail.com', 'yesi_zav@hotmail.com', NULL, 'SI', 0, '', NULL, 'ZAVALA MEJIA', 'Perú', 'LIMA CENTRO', NULL, '1', '45889902', NULL, '929255090', NULL, NULL, 'Enfermera', 'C.S. Daniel Alcides Carrión ', NULL, NULL),
(2930, 'HUGO GABRIEL', NULL, 'hamarillo@minsa.gob.pe', 'hamarillo@minsa.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'AMARILLO CORDERO', 'Perú', 'LIMA CENTRO', NULL, '1', '45890493', NULL, '953071024', NULL, NULL, 'Especialista Administrativo ', 'MINSA', NULL, NULL),
(2931, 'XIOMARA MALENA', NULL, 'xiomaramerma@gmail.com', 'xiomaramerma@gmail.com', NULL, '', 0, 'SI', NULL, 'MERMA SUCLLE', 'Perú', 'LIMA CENTRO', NULL, '1', '45895504', NULL, '941776052', NULL, NULL, 'Lic. en enfermeria ', 'MINSA', NULL, NULL),
(2932, 'LEO SIVORI', NULL, 'leozm23@gmail.com', 'leozm23@gmail.com', NULL, 'SI', 0, '', NULL, 'ZEVALLOS MEZA', 'Perú', 'CALLAO', NULL, '1', '45912156', NULL, '942188051', NULL, NULL, 'TECNÓLOGO MÉDICO EN RADIOLOGÍA', 'CENTRO MATERNO INFANTIL MI PERÚ', NULL, NULL),
(2933, 'DIANA CAROLINA', NULL, 'dcustodio@minsa.gob.pe', 'dcustodio@minsa.gob.pe', NULL, 'SI', 0, '', NULL, 'CUSTODIO RAMIREZ', 'Perú', 'LIMA CENTRO', NULL, '1', '45957281', NULL, '958889162', NULL, NULL, 'enfermera', 'diigtel', NULL, NULL),
(2934, 'TERESA YOLANDA', NULL, 'teresasaldana89@gmail.com', 'teresasaldana89@gmail.com', NULL, 'SI', 0, '', NULL, 'SALDAÑA HONORIO', 'Perú', 'LA LIBERTAD', NULL, '1', '45957853', NULL, '991358284', NULL, NULL, 'Enfermera ', 'IREN NORTE', NULL, NULL),
(2935, 'RENATA ANDREA', NULL, 'renataandreabullonlizarbe@gmail.com', 'renataandreabullonlizarbe@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'BULLON LIZARBE', 'Perú', 'UCAYALI', NULL, '1', '46122661', NULL, '948113010', NULL, NULL, 'Médica Cirujana', 'Seguro Integral de Salud', NULL, NULL),
(2936, 'JOSE ARMANDO', NULL, 'joar2108@gmail.com', 'joar2108@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CHANAME PAIVA', 'Perú', 'LAMBAYEQUE', NULL, '1', '46157947', NULL, '926941895', NULL, NULL, 'TÉCNICO COMPUTACIÓN ', 'C.S. PITIPO', NULL, NULL),
(2937, 'DÁNNAY LIZBETH', NULL, 'dalizbame@gmail.com', 'cenate.servicios@essalud.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'BARONA MEZA DE CHANDUCAS', 'Perú', 'LIMA ESTE', NULL, '1', '46159424', NULL, '943760437', NULL, NULL, 'Enfermera', 'ESSALUD', NULL, NULL),
(2938, 'CLEYDY', NULL, 'cleydyah@gmail.com', 'cleydyah@gmail.com', NULL, 'SI', 0, '', NULL, 'APAZA HIDALGO', 'Perú', 'LIMA NORTE', NULL, '1', '46172451', NULL, '931129946', NULL, NULL, 'INGENIERA DE SISTEMAS Y COMPUTACION', 'DIRECION DE REDES INTEGRADAS DE SALUD DE LIMA NORTE', NULL, NULL),
(2939, 'BRAYAN EDWAR', NULL, 'bennunxxez333@gmail.com', 'bennunxxez333@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'NUÑEZ OCHOA', 'Perú', 'LIMA CENTRO', NULL, '1', '46224788', NULL, '941324364', NULL, NULL, 'medico', 'lima centro', NULL, NULL),
(2940, 'MILAGROS PATRICIA', NULL, 'Milagros_27_14@hotmail.com', 'Milagros_27_14@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'MALCA MENDOZA', 'Perú', 'LIMA ESTE', NULL, '1', '46258524', NULL, '993092755', NULL, NULL, 'Psicologa', 'C.s. Daniel A. Carrion ', NULL, NULL),
(2941, 'ALFONSO ANDRE', NULL, 'Alfonso.apaestegui@gmail.com', 'Alfonso.apaestegui@gmail.com', NULL, '', 0, 'SI', NULL, 'APAESTEGUI ORTEGA', 'Perú', 'OTRO', NULL, '1', '46263915', NULL, '961986229', NULL, NULL, 'Comunicador ', 'Minsa', NULL, NULL),
(2942, 'KATTERIN STEFANI', NULL, 'camonesks@gmail.com', 'camonesks@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VILLARREAL CAMONES', 'Perú', 'ANCASH', NULL, '1', '46327647', NULL, '995214904', NULL, NULL, 'OBSTETRA', 'GOBIERNO REGIONAL ', NULL, NULL),
(2943, 'DANNA VICTORIA', NULL, 'dannap45@gmail.com', 'dannap45@gmail.com', NULL, '', 0, 'SI', NULL, 'PINTO RAMOS', 'Perú', 'LIMA REGION', NULL, '1', '46354325', NULL, '981418205', NULL, NULL, 'Médico ', 'RED MEDICA ', NULL, NULL),
(2944, 'LEDID', NULL, 'melanycuripacoquintol@gmail.com', 'melanycuripacoquintol@gmail.com', NULL, '', 0, 'SI', NULL, 'CORDOVA DELGADO', 'Perú', 'AYACUCHO', NULL, '1', '46376738', NULL, '945594632', NULL, NULL, 'Enfwemer', 'Hospital ', NULL, NULL),
(2945, 'JESSICA', NULL, 'Jesskham5599@gmail.com', 'Jesskham5599@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'AÑO MEZA', 'Perú', 'LIMA REGION', NULL, '1', '46407420', NULL, '918858835', NULL, NULL, 'Médico ', 'INSN', NULL, NULL),
(2946, 'JESUS OMAR', NULL, 'dromaraguinaga@gmail.com', 'dromaraguinaga@gmail.com', NULL, 'SI', 0, '', NULL, 'AGUINAGA PEREZ', 'Perú', 'LAMBAYEQUE', NULL, '1', '46456716', NULL, '979432946', NULL, NULL, 'Médico Ocupacional ', 'OISO', NULL, NULL),
(2947, 'LIZETH', NULL, 'LMALPARTIDAM@MINSA.GOB.PE', 'LMALPARTIDAM@MINSA.GOB.PE', NULL, 'SI', 0, 'SI', NULL, 'MALPARTIDA MENDOZA', 'Perú', 'LIMA CENTRO', NULL, '1', '46456934', NULL, '962633447', NULL, NULL, 'LIC. ADMINISTRACIÓN / ESPECIALISTA ADMINISTRATIVO', 'DIGTEL-MINSA', NULL, NULL),
(2948, 'SARA REBECA', NULL, 'sara_14_3_5@hotmail.com', 'sara_14_3_5@hotmail.com', NULL, 'SI', 0, '', NULL, 'ESQUERRE ENRIQUEZ', 'Perú', 'LA LIBERTAD', NULL, '1', '46473665', NULL, '951985955', NULL, NULL, 'medico', 'puesto de salud', NULL, NULL),
(2949, 'JOEL EUGENIO', NULL, 'dr.joelmamani@gmail.com', 'dr.joelmamani@gmail.com', NULL, 'SI', 0, '', NULL, 'MAMANI OBADA', 'Perú', 'LIMA CENTRO', NULL, '1', '46482875', NULL, '994843626', NULL, NULL, 'Medico', 'Essalud ', NULL, NULL),
(2950, 'ELIZABETH', NULL, 'Riverval2406@gmail.com', 'Riverval2406@gmail.com', NULL, '', 0, 'SI', NULL, 'RIVEROS VALENCIA', 'Perú', 'HUANCAVELICA', NULL, '1', '46549407', NULL, '901140479', NULL, NULL, 'Obstetra', 'Hospital lircay', NULL, NULL),
(2951, 'JEAN FRANK', NULL, 'jeanreyes266@gmail.com', 'jeanreyes266@gmail.com', NULL, '', 0, 'SI', NULL, 'REYES HUERTA', 'Perú', 'LIMA CENTRO', NULL, '1', '46573829', NULL, '980338053', NULL, NULL, 'Enfermero ', 'Ministerio de Salud ', NULL, NULL),
(2952, 'ERICA NATALI', NULL, 'ericaugaz.dirislc@gmail.com', 'ericaugaz.dirislc@gmail.com', NULL, '', 0, 'SI', NULL, 'UGAZ TORRES', 'Perú', 'LIMA CENTRO', NULL, '1', '46618846', NULL, '957821878', NULL, NULL, 'Obstetra ', 'DIRIS LIMA CENTRO ', NULL, NULL),
(2953, 'DUBEYSI EVELYN', NULL, 'B3ch164@gmail.com', 'B3ch164@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VICENTE IRIARTE', 'Perú', 'TACNA', NULL, '1', '46625429', NULL, '932680698', NULL, NULL, 'Cirujano dentista ', 'Ps.  Cana', NULL, NULL),
(2954, 'KATTY CAROL', NULL, 'karol17_5@hotmail.com', 'karol17_5@hotmail.com', NULL, '', 0, 'SI', NULL, 'BENITEZ BALDEON', 'Perú', 'APURIMAC', NULL, '1', '46666987', NULL, '974383679', NULL, NULL, 'Médico Cirujano ', 'Minsa', NULL, NULL),
(2955, 'PEDRO LUIS VICTOR', NULL, 'agurtpedro@gmail.com', 'agurtpedro@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'AGURTO TORRES', 'Perú', 'LIMA REGION', NULL, '1', '46709986', NULL, '995757949', NULL, NULL, 'INGENIERO', 'HOSPITAL DE SUPE', NULL, NULL),
(2956, 'LADY', NULL, 'leyd09@gmail.com', 'leyd09@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CAMPOSANO GOMEZ', 'Perú', 'LIMA REGION', NULL, '1', '46732288', NULL, '997714401', NULL, NULL, 'Médico Cirujana ', 'NATCLAR ', NULL, NULL),
(2957, 'ELKEN SHARO', NULL, 'sharodaylin2016@gmail.com', 'sharodaylin2016@gmail.com', NULL, 'SI', 0, '', NULL, 'HUAMAN COCHA', 'Perú', 'ANCASH', NULL, '1', '46746227', NULL, '976878256', NULL, NULL, 'LIC. EN ENFERMERIA', 'CENTRO DE SALUD MENTAL COMUNITARIO QORI QOYLLUR', NULL, NULL),
(2958, 'ENURY MARGOTH', NULL, 'enury.castillodiaz@gmail.com', 'enury.castillodiaz@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CASTILLO DIAZ', 'Perú', 'LIMA REGION', NULL, '1', '46787953', NULL, '927927024', NULL, NULL, 'TECNICO INFORMATICO', 'HOSPITAL DE SUPE', NULL, NULL),
(2959, 'MARILIA', NULL, 'piocajaleonm@hotmail.com', 'piocajaleonm@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'PIO CAJALEON', 'Perú', 'HUANUCO', NULL, '1', '46795243', NULL, '976312028', NULL, NULL, 'LICENCIADA EN ENFERMERIA', 'RED DE SALUD DOS DE MAYO', NULL, NULL),
(2960, 'ROSA STEPHANIE', NULL, 'Rosastephaniec@gmail.com', 'Rosastephaniec@gmail.com', NULL, 'SI', 0, '', NULL, 'CAYCHO BUSTAMANTE', 'Perú', 'LIMA CENTRO', NULL, '1', '46797931', NULL, '992669554', NULL, NULL, 'Medico cirujano', 'Rezola', NULL, NULL),
(2961, 'ADELA LETICIA', NULL, 'leticialipiz@gmail.com', 'leticialipiz@gmail.com', NULL, 'SI', 0, '', NULL, 'DELGADO CARRION', 'Perú', 'LA LIBERTAD', NULL, '1', '46803364', NULL, '977115760', NULL, NULL, 'Medico', 'Viru', NULL, NULL),
(2962, 'LISS MARLEE', NULL, 'lmzp4689@gmail.com', 'lmzp4689@gmail.com', NULL, 'SI', 0, '', NULL, 'ZAMBRANO PERALTA', 'Perú', 'APURIMAC', NULL, '1', '46892545', NULL, '933566019', NULL, NULL, 'Enfermera ', 'Centro de salud mental ALLIN KAWSAY ', NULL, NULL),
(2963, 'PEDRO JHONATAN', NULL, 'Ps0991136@gmail.com', 'Ps0991136@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'SANTISTEBAN YNOÑAN', 'Perú', 'LIMA CENTRO', NULL, '1', '46947705', NULL, '931039476', NULL, NULL, 'Técnico en computación ', 'INFOSALUD ', NULL, NULL),
(2964, 'YARINA NATHALY', NULL, 'yarinapilcoroman@gmail.com', 'yarinapilcoroman@gmail.com', NULL, 'SI', 0, '', NULL, 'PILCO ROMAN', 'Perú', 'LIMA CENTRO', NULL, '1', '47088792', NULL, '929421015', NULL, NULL, 'Lic. Enfermeras ', 'Hndm', NULL, NULL),
(2965, 'YAMEL NAHUN', NULL, 'yamel3005@gmail.com', 'yamel3005@gmail.com', NULL, 'SI', 0, '', NULL, 'PARRAGA HUAMANCHAO', 'Perú', 'JUNÍN', NULL, '1', '47151357', NULL, '966806653', NULL, NULL, 'Cirujano Dentista', 'IREN CENTRO', NULL, NULL),
(2966, 'GIANCARLO JUNIOR ENRIQUE', NULL, 'junior_castro_6@hotmail.com', 'junior_castro_6@hotmail.com', NULL, '', 0, 'SI', NULL, 'CASTRO RAMOS', 'Perú', 'HUANUCO', NULL, '1', '47151889', NULL, '931516862', NULL, NULL, 'Medico', 'CS Jesus', NULL, NULL),
(2967, 'MARIA DENISSE', NULL, 'mariaclovn@gmail.com', 'mariaclovn@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CANO LOVON', 'Perú', 'ANCASH', NULL, '1', '47162415', NULL, '966345773', NULL, NULL, 'Medico cirujana', 'Hospital de Carhuaz', NULL, NULL),
(2968, 'MEDALIT MELINA', NULL, 'Medalitvegam@gmail.com', 'Medalitvegam@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VEGA MIRANDA', 'Perú', 'LIMA CENTRO', NULL, '1', '47176850', NULL, '994626898', NULL, NULL, 'Medico', 'INSN-SB', NULL, NULL),
(2969, 'LOURDES NOEMI', NULL, 'lou.villa1465@gmail.com', 'lou.villa1465@gmail.com', NULL, 'SI', 0, '', NULL, 'VILLACORTA ZACARIAS', 'Perú', 'LA LIBERTAD', NULL, '1', '47190305', NULL, '966955243', NULL, NULL, 'Cirujano Dentista', 'Hospital Jose Agurto Tello de Chosica ', NULL, NULL),
(2970, 'LISIDEY', NULL, 'lisidey3@gmail.com', 'lisidey3@gmail.com', NULL, '', 0, 'SI', NULL, 'MORA MORALES', 'Perú', 'CUSCO', NULL, '1', '47267011', NULL, '947856252', NULL, NULL, 'Enfermera', 'Red norte', NULL, NULL),
(2971, 'JOSSY AMNELISSE', NULL, 'jossyramos1990@gmail.com', 'jossyramos1990@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'RAMOS HERRERA', 'Perú', 'PIURA', NULL, '1', '46387805', NULL, '910271561', NULL, NULL, 'Auxiliar Asistencial de la Salud', 'E.S I-3 La Arena', NULL, NULL),
(2972, 'LIZ IBETH', NULL, 'lis4812@hotmail.com', 'lis4812@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'VALLADARES ROMAN', 'Perú', 'LIMA CENTRO', NULL, '1', '47398353', NULL, '978703803', NULL, NULL, 'MÉDICO', 'DIRIS LIMA CENTRO', NULL, NULL),
(2973, 'PIERRE ERWIN', NULL, 'pierregonzales_2710@hotmail.com', 'pierregonzales_2710@hotmail.com', NULL, 'SI', 0, '', NULL, 'GONZALES PACHECO', 'Perú', 'LA LIBERTAD', NULL, '1', '47402609', NULL, '950863628', NULL, NULL, 'LIC. EN ENFERMERIA ', 'RED DE SALUD OTUZCO', NULL, NULL),
(2974, 'KARENM RSHUNELY', NULL, 'Rshunely@hotmail.com', 'Rshunely@hotmail.com', NULL, '', 0, 'SI', NULL, 'SILVA ORTIZ', 'Perú', 'LIMA CENTRO', NULL, '1', '47515252', NULL, '956109330', NULL, NULL, 'Cirujano.dentista ', 'Centro salud Magdalena', NULL, NULL),
(2975, 'MILUSKA TATIANA', NULL, 'Miluska_med@hotmail.com', 'Miluska_med@hotmail.com', NULL, 'SI', 0, '', NULL, 'SANDOVAL SILUPU', 'Perú', 'PIURA', NULL, '1', '47530412', NULL, '966126362', NULL, NULL, 'Medico cirujano ', 'Subregion de salud Luciano castillo colonia _ cs marcavelica', NULL, NULL),
(2976, 'MARIA DEL PILAR', NULL, 'mramosrojas759@gmail.com', 'mramosrojas759@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'RAMOS ROJAS', 'Perú', 'AREQUIPA', NULL, '1', '72297254', NULL, '948948329', NULL, NULL, 'Médico Cirujano', 'MINSA - Puesto de Salud Sondor Caraveli', NULL, NULL),
(2977, 'MAYDA MARIELA', NULL, 'mgamarra@minsa.gob.pe', 'mgamarra@minsa.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'GAMARRA PAREDES', 'Perú', 'CALLAO', NULL, '1', '47549970', NULL, '976490661', NULL, NULL, 'MEDICO', 'MINSA', NULL, NULL),
(2978, 'ERVIN APOLINARIO', NULL, 'ervinreyes_0706@hotmail.com', 'ervinreyes_0706@hotmail.com', NULL, 'SI', 0, '', NULL, 'REYES DE LA CRUZ', 'Perú', 'LIMA REGION', NULL, '1', '15283494', NULL, '974186825', NULL, NULL, 'LIC. ADMINISTRACION', 'DIRESA LIMA', NULL, NULL),
(2979, 'LOURDES MARISOL', NULL, 'LOURDESMARISOL29@GMAIL.COM', 'LOURDESMARISOL29@GMAIL.COM', NULL, 'SI', 0, 'SI', NULL, 'ZEÑA RAMIREZ', 'Perú', 'LIMA CENTRO', NULL, '1', '47821600', NULL, '944696850', NULL, NULL, 'LICENCIADA EN CIENCAS DE LA COMUNICACION', 'INSTITUTO NACIONAL MATERNO PERINATAL', NULL, NULL),
(2980, 'CARLOS ANTONIO', NULL, 'carlosuribecarlin@gmail.com', 'carlosuribecarlin@gmail.com', NULL, 'SI', 0, '', NULL, 'URIBE CARLIN', 'Perú', 'LIMA ESTE', NULL, '1', '48088772', NULL, '967899570', NULL, NULL, 'Ingeniero de sistemas', 'Hospital Jose Agurto Tello', NULL, NULL),
(2981, 'ERIKA YUSLY', NULL, 'Eyusly@gmail.com', 'Eyusly@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'PAPAS NIETO', 'Perú', 'CALLAO', NULL, '1', '48165925', NULL, '986764609', NULL, NULL, 'Enfermera ', 'Independiente ', NULL, NULL),
(2982, 'MILAN', NULL, 'milyarteaga25@gmail.com', 'milyarteaga25@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ARTEAGA ARAUJO', 'Perú', 'LA LIBERTAD', NULL, '1', '48179836', NULL, '947004278', NULL, NULL, 'LIC. Enfermería ', 'Hospital Leoncio Prado ', NULL, NULL),
(2983, 'JOSELYN CATERIN', NULL, 'rjoselyn680@gmail.com', 'rjoselyn680@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ROMERO CASTILLO', 'Perú', 'ANCASH', NULL, '1', '48238825', NULL, '957502269', NULL, NULL, 'Enfermera', 'Red Huaylas Sur', NULL, NULL),
(2984, 'JOHN JAIRO', NULL, 'johnjairo_23@hotmail.com', 'johnjairo_23@hotmail.com', NULL, 'SI', 0, '', NULL, 'HENRIQUEZ RODRIGUEZ', 'Perú', 'LA LIBERTAD', NULL, '1', '48321783', NULL, '954736343', NULL, NULL, 'Médico Cirujano', 'Centro de Salud Uliachin', NULL, NULL),
(2985, 'ERIKA SANDRA', NULL, 'mreyesv@minsa.gob.pe', 'mreyesv@minsa.gob.pe', NULL, '', 0, 'SI', NULL, 'CARDENAS GARCIA', 'Perú', 'LIMA CENTRO', NULL, '1', '45435435', NULL, '43543543', NULL, NULL, 'medico', 'minsa', NULL, NULL),
(2986, 'ALDAIR OMAR', NULL, 'aldair97sotelo@gmail.com', 'aldair97sotelo@gmail.com', NULL, '', 0, 'SI', NULL, 'SOTELO CAHUANA', 'Perú', 'LIMA CENTRO', NULL, '1', '48865074', NULL, '917841373', NULL, NULL, 'Médico ', 'Sissa medic ', NULL, NULL),
(2987, 'CIELO ROSARIO', NULL, 'dracielo.rd@gmail.com', 'dracielo.rd@gmail.com', NULL, '', 0, 'SI', NULL, 'RIVERA DAVILA', 'Perú', 'LIMA REGION', NULL, '1', '41419954', NULL, '954649246', NULL, NULL, 'Médico rehabilitador', 'Essalud', NULL, NULL),
(2988, 'SANDRA', NULL, 'sgallegos20@gmail.com', 'sgallegos20@gmail.com', NULL, '', 0, 'SI', NULL, 'GALLEGOS', 'Colombia', 'OTRO', NULL, '1', '51607157', NULL, '\'+573173310279', NULL, NULL, 'Medicina', 'Ministerio de Salud', NULL, NULL),
(2989, 'KAREN ALISSON', NULL, 'karenastocondor114@gmail.com', 'karenastocondor114@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ASTOCONDOR CASTAÑEDA', 'Perú', 'LIMA CENTRO', NULL, '1', '60070668', NULL, '951491831', NULL, NULL, 'Lic enfermería ', 'INFOSALUD ', NULL, NULL),
(2990, 'RAMON ANTHONY', NULL, 'notorioussama2017@gmail.com', 'notorioussama2017@gmail.com', NULL, '', 0, 'SI', NULL, 'SAAVEDRA MAZA', 'Perú', 'PIURA', NULL, '1', '70000918', NULL, '937029397', NULL, NULL, 'Médico cirujano ', 'C.S BERNAL I-4', NULL, NULL),
(2991, 'ESTEBAN ALEXANDER', NULL, 'ten112@hotmail.com', 'ten112@hotmail.com', NULL, 'SI', 0, '', NULL, 'ESTRADA BORRERO', 'Perú', 'PIURA', NULL, '1', '70003105', NULL, '938801509', NULL, NULL, 'medico cirujano', 'samu', NULL, NULL),
(2992, 'ELIZABETH', NULL, 'elizabethgonzalezcruz@gmail.com', 'elizabethgonzalezcruz@gmail.com', NULL, '', 0, 'SI', NULL, 'GONZALEZ CRUZ', 'Perú', 'APURIMAC', NULL, '1', '70028132', NULL, '930116472', NULL, NULL, 'Obstetra', ' Cs Magdalena ', NULL, NULL),
(2993, 'CINDY GRACE', NULL, 'cindygmr.03@gmail.com', 'cindygmr.03@gmail.com', NULL, 'SI', 0, '', NULL, 'MUÑOZ RAMIREZ', 'Perú', 'LA LIBERTAD', NULL, '1', '70095686', NULL, '916205058', NULL, NULL, 'Medico', 'Guadalupito', NULL, NULL),
(2994, 'ROY JAIRO', NULL, 'ROYSILVAHCLLH@GMAIL.COM', 'ROYSILVAHCLLH@GMAIL.COM', NULL, 'SI', 0, '', NULL, 'SILVA SANCHEZ', 'Perú', 'LIMA NORTE', NULL, '1', '70131677', NULL, '987735236', NULL, NULL, 'INGENIERO ELECTRONICO', 'HOSPITAL CARLOS LANFRANCO LA HOZ', NULL, NULL),
(2995, 'JEAN GEFFERSON', NULL, 'Jeanboss00194@gmail.com', 'Jeanboss00194@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'GARCIA CHOTA', 'Perú', 'SAN MARTÍN', NULL, '1', '70160680', NULL, '925 395 866', NULL, NULL, 'Ingeniero de sistemas ', 'Diresa San Martín ', NULL, NULL),
(2996, 'RODIBEL EMILDO', NULL, 'Rodivelcuriquispe@gmail.com', 'Rodivelcuriquispe@gmail.com', NULL, 'SI', 0, '', NULL, 'CURI QUISPE', 'Perú', 'HUANCAVELICA', NULL, '1', '70175581', NULL, '963544947', NULL, NULL, 'Lic. ENFERMERÍA ', 'CENTRO DE SALUD MENTAL COMUNITARIO DE ACOBAMBA ', NULL, NULL),
(2997, 'URLISH KLEYBER', NULL, 'urlish.marroquin@gmail.com', 'urlish.marroquin@gmail.com', NULL, 'SI', 0, '', NULL, 'MARROQUIN MARROQUIN', 'Perú', 'LIMA CENTRO', NULL, '1', '70249908', NULL, '943204706', NULL, NULL, 'Desarrollador de Software', 'Minsa', NULL, NULL),
(2998, 'DIANA ALEXANDRA', NULL, 'dianaapr.20985@gmail.com', 'dianaapr.20985@gmail.com', NULL, 'SI', 0, '', NULL, 'POMA RAMIREZ', 'Perú', 'LIMA CENTRO', NULL, '1', '70251662', NULL, '966923564', NULL, NULL, 'medico ', 'P.S. Bambamarca', NULL, NULL),
(2999, 'MEYLIN LLOSEANY', NULL, 'meylintd@gmail.com', 'meylintd@gmail.com', NULL, '', 0, 'SI', NULL, 'TIPULA DEZA', 'Perú', 'LIMA CENTRO', NULL, '1', '70258081', NULL, '933984914', NULL, NULL, 'medico', 'sis', NULL, NULL),
(3000, 'JAIRO MOISES', NULL, 'jairomoises30@hotmail.com', 'jairomoises30@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'VIVANCO MAZZO', 'Perú', 'PIURA', NULL, '1', '70299958', NULL, '964381875', NULL, NULL, 'Medico Cirujano', 'Centro de Salud I-4 Ayabaca', NULL, NULL),
(3001, 'GONZALO ALBERTO', NULL, 'hesagatpto@gmail.com', 'hesagatpto@gmail.com', NULL, 'SI', 0, '', NULL, 'SANTA CRUZ SANCHEZ', 'Perú', 'LIMA REGION', NULL, '1', '70361628', NULL, '906990922', NULL, NULL, 'Tco Administrativo', 'IDEPRO', NULL, NULL),
(3002, 'ROGER DICKMAN', NULL, 'rogergarcia2701@gmail.com', 'rogergarcia2701@gmail.com', NULL, '', 0, 'SI', NULL, 'GARCIA MARIN', 'Perú', 'HUANUCO', NULL, '1', '70430843', NULL, '993728388', NULL, NULL, 'MÉDICO CIRUJANO', 'CS BAÑOS - MINSA ', NULL, NULL),
(3003, 'EDITH ROXANA', NULL, 'edith5388@gmail.com', 'edith5388@gmail.com', NULL, 'SI', 0, '', NULL, 'CABEZAS QUISPE', 'Perú', 'LIMA CENTRO', NULL, '1', '70432687', NULL, '991427741', NULL, NULL, 'Obstetra', 'Centro de Salud San Fernando', NULL, NULL),
(3004, 'CLORINDA ELITA ANDREA', NULL, 'cyaya@dge.gob.pe', 'cyaya@dge.gob.pe', NULL, 'SI', 0, '', NULL, 'YAYA GARCIA', 'Perú', 'LIMA CENTRO', NULL, '1', '70436876', NULL, '993725579', NULL, NULL, 'enfermera', 'CDC MINSA', NULL, NULL),
(3005, 'GERALDINE STEFFANY', NULL, 'caposki20@gmail.com', 'caposki20@gmail.com', NULL, 'SI', 0, '', NULL, 'ESCOBAR AVILES DE ZORRILLA', 'Perú', 'CALLAO', NULL, '1', '70438917', NULL, '961889051', NULL, NULL, 'Medico', 'Hospital Alberto Sabogal Sologuren', NULL, NULL),
(3006, 'ALINA CATIA', NULL, 'alina.herrera.h@gmail.com', 'alina.herrera.h@gmail.com', NULL, '', 0, 'SI', NULL, 'HERRERA HUARANCCA', 'Perú', 'LIMA CENTRO', NULL, '1', '70442343', NULL, '984023766', NULL, NULL, 'Medico', 'MINSA', NULL, NULL),
(3007, 'ENRIQUE JUNIOR', NULL, 'jpalomino130815@gmail.com', 'jpalomino130815@gmail.com', NULL, 'SI', 0, '', NULL, 'PALOMINO ACOSTA', 'Perú', 'LIMA ESTE', NULL, '1', '70508431', NULL, '984354157', NULL, NULL, 'Técnico en Administración ', 'Centro de Salud Huáscar ', NULL, NULL),
(3008, 'SUSY LORENA', NULL, 'Lorenalavadovela@outlook.com', 'Lorenalavadovela@outlook.com', NULL, 'SI', 0, 'SI', NULL, 'LAVADO VELA', 'Perú', 'LA LIBERTAD', NULL, '1', '70866341', NULL, '931292386', NULL, NULL, 'Enfermera', 'Red viru', NULL, NULL),
(3009, 'KAREN ELIZABETH', NULL, 'telemedicina@incn.gob.pe', 'telemedicina@incn.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'RAYME PALOMINO', 'Perú', 'LIMA CENTRO', NULL, '1', '70885194', NULL, '982880393', NULL, NULL, 'Tecnico Administrativo', 'INSTITUTO NACIONAL DE CIENCIAS NEUROLÓGICAS ', NULL, NULL),
(3010, 'MAYRA CHABELI', NULL, 'chumbiaucamayra75@gmail.com', 'chumbiaucamayra75@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CHUMBIAUCA QUIÑONEZ', 'Perú', 'LIMA NORTE', NULL, '1', '71057601', NULL, '925905816', NULL, NULL, 'Trabajadora Social', 'Municipalidad Distrital de Supe', NULL, NULL),
(3011, 'ROSA FIORELLA', NULL, 'fiorellavierac@gmail.com', 'fiorellavierac@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VIERA CUMBAY', 'Perú', 'PIURA', NULL, '1', '71119720', NULL, '948400278', NULL, NULL, 'ING. SISTEMAS', 'DIRESA PIURA', NULL, NULL),
(3012, 'DIANA ZOLANS', NULL, 'dgonzales@natclar.com.pe', 'dgonzales@natclar.com.pe', NULL, '', 0, 'SI', NULL, 'GONZALES RUBIANES', 'Perú', 'LIMA CENTRO', NULL, '1', '71227960', NULL, '949190086', NULL, NULL, 'Médico', 'Natclar', NULL, NULL),
(3013, 'IVONNE JESSABEL', NULL, 'ijhc2202@gmail.com', 'ijhc2202@gmail.com', NULL, '', 0, 'SI', NULL, 'HERRERA CARAZAS', 'Perú', 'LIMA CENTRO', NULL, '1', '71267488', NULL, '955309419', NULL, NULL, 'Tecnología médica en terapia física y rehabilitación ', 'Ministerio de salud ', NULL, NULL),
(3014, 'MIGUEL ANGEL', NULL, 'miguelarias0001@hotmail.com', 'miguelarias0001@hotmail.com', NULL, 'SI', 0, '', NULL, 'ARIAS LINARES', 'Perú', 'LIMA ESTE', NULL, '1', '71400947', NULL, '941401497', NULL, NULL, 'Médico cirujano', 'Instituto Nacional de Innovación Agraria', NULL, NULL),
(3015, 'ZYNTHIA KARINA', NULL, 'karina_48_13@hotmail.com', 'karina_48_13@hotmail.com', NULL, 'SI', 0, '', NULL, 'BERILLO HURTADO', 'Perú', 'ANCASH', NULL, '1', '71435348', NULL, '952654413', NULL, NULL, 'Técnico en farmacia ', 'Hospital de carhuaz ', NULL, NULL),
(3016, 'ALEXANDRA GUADALUPE', NULL, 'Ale.altn02@gmail.com', 'Ale.altn02@gmail.com', NULL, 'SI', 0, '', NULL, 'ALTUNA ÑIQUE', 'Perú', 'LA LIBERTAD', NULL, '1', '71446654', NULL, '913183252', NULL, NULL, 'Estudiante de medicina ', 'Ucv', NULL, NULL),
(3017, 'JUNIOR OMAR', NULL, 'Juniorgonzalesvela99@hotmail.com', 'Juniorgonzalesvela99@hotmail.com', NULL, '', 0, 'SI', NULL, 'GONZALES VELA', 'Perú', 'LORETO', NULL, '1', '71484150', NULL, '990217817', NULL, NULL, 'Estudiante de medicina ', 'UNAP ', NULL, NULL),
(3018, 'ANGELO YAMIL', NULL, 'callupemedinayamilito@gmail.com', 'callupemedinayamilito@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CALLUPE MEDINA', 'Perú', 'LIMA REGION', NULL, '1', '71618518', NULL, '969240014', NULL, NULL, 'Universitario ', 'Upn', NULL, NULL),
(3019, 'WALDO ALBERTO', NULL, 'wacz.peru@gmail.com', 'wacz.peru@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CATERIANO ZUÑIGA', 'Perú', 'LIMA REGION', NULL, '1', '71712098', NULL, '957955747', NULL, NULL, 'Médico residente ', 'MINSA', NULL, NULL),
(3020, 'LADY MAGALY', NULL, 'Ladylaura368@gmail.com', 'ladylaura368@gmail.com', NULL, '', 0, 'SI', NULL, 'LAURA MAMANI', 'Perú', 'TACNA', NULL, '1', '71714538', NULL, '933275545', NULL, NULL, 'Psicología ', 'Ps. Las yaras ', NULL, NULL),
(3021, 'RONALD DAVID', NULL, 'ronald.viera.moron@gmail.com', 'ronald.viera.moron@gmail.com', NULL, 'SI', 0, '', NULL, 'VIERA MORON', 'Perú', 'LA LIBERTAD', NULL, '1', '71789261', NULL, '939787751', NULL, NULL, 'MÉDICO ', 'HOSPITAL PROVINCIAL DE BOLIVAR ', NULL, NULL),
(3022, 'CANDY MARGOTH', NULL, 'candymargothespinozaysidro@gmail.com', 'candymargothespinozaysidro@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ESPINOZA YSIDRO', 'Perú', 'LIMA SUR', NULL, '1', '71831369', NULL, '995551374', NULL, NULL, 'Licenciada en Enfermería ', 'Infosalud', NULL, NULL),
(3023, 'AYRTON', NULL, 'ayrton.gamez@upch.pe', 'ayrton.gamez@upch.pe', NULL, 'SI', 0, '', NULL, 'GAMEZ ENRIQUEZ', 'Perú', 'MOQUEGUA', NULL, '1', '72026567', NULL, '900989301', NULL, NULL, 'Médico Cirujano ', 'Minsa', NULL, NULL),
(3024, 'JENNYFER PAMELA', NULL, 'pamelamontes126@gmail.com', 'pamelamontes126@gmail.com', NULL, 'SI', 0, '', NULL, 'MONTES HINOSTROZA', 'Perú', 'AYACUCHO', NULL, '1', '72027893', NULL, '940731893', NULL, NULL, 'medico cirujano', 'centro de salud choclococha', NULL, NULL),
(3025, 'MARTIN ORLANDO', NULL, 'martinramirezvar@gmail.com', 'martinramirezvar@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'RAMIREZ VARONA', 'Perú', 'PIURA', NULL, '1', '72112934', NULL, '996797392', NULL, NULL, 'INGENIERO DE SISTEMAS', 'E.S. II-1 HOSPITAL CHULUCANAS', NULL, NULL),
(3026, 'ANTHONY FRANCY', NULL, 'aprincipe112@gmail.com', 'aprincipe112@gmail.com', NULL, 'SI', 0, '', NULL, 'PRINCIPE QUILLAY', 'Perú', 'LIMA REGION', NULL, '1', '72129010', NULL, '940664003', NULL, NULL, 'Estudiante ', 'Ucv', NULL, NULL),
(3027, 'HENRY JOSEPH', NULL, 'josephcarrilloleon@gmail.com', 'josephcarrilloleon@gmail.com', NULL, 'SI', 0, '', NULL, 'CARRILLO LEON', 'Perú', 'LIMA REGION', NULL, '1', '72183022', NULL, '949253207', NULL, NULL, 'Administrador en Salud', 'G&C Salud y Desarrollo', NULL, NULL),
(3028, 'SHIRLEY LIZBETH', NULL, 'shirley.huarino@gmail.com', 'shirley.huarino@gmail.com', NULL, 'SI', 0, '', NULL, 'HUARINO SUCA', 'Perú', 'TACNA', NULL, '1', '72230560', NULL, '986636221', NULL, NULL, 'Obstetra', 'C.S. La Esperanza', NULL, NULL),
(3029, 'MARCO ANTONIO', NULL, 'karinarodriguezc44@gmail.com', 'karinarodriguezc44@gmail.com', NULL, '', 0, 'SI', NULL, 'BARRERA ZERPA', 'Perú', 'LIMA CENTRO', NULL, '1', '49001552', NULL, '941131618', NULL, NULL, 'Medico', 'Minsa', NULL, NULL),
(3030, 'JHONATAN JOEL', NULL, 'Montoya391746@gmail.com', 'Montoya391746@gmail.com', NULL, '', 0, 'SI', NULL, 'MONTOYA MARAVI', 'Perú', 'LIMA CENTRO', NULL, '1', '72302831', NULL, '987210064', NULL, NULL, 'Asistente Administrativo', 'INSN BREÑA', NULL, NULL),
(3031, 'ROSANA ANTONELLA', NULL, 'antonellazarate93@gmail.com', 'antonellazarate93@gmail.com', NULL, 'SI', 0, '', NULL, 'ZARATE SALINAS', 'Perú', 'LA LIBERTAD', NULL, '1', '72306671', NULL, '991382925', NULL, NULL, 'Médico cirujano ', 'MINSA', NULL, NULL),
(3032, 'CINDY CECILIA', NULL, 'Cindyortegabeltran@gmail.com', 'CINDYORTEGABELTRAN@GMAIL.COM', NULL, 'SI', 0, '', NULL, 'ORTEGA BELTRAN', 'Perú', 'LIMA REGION', NULL, '1', '72428941', NULL, '941254851', NULL, NULL, 'Lic. En sociologia', 'Hospital Huaral', NULL, NULL),
(3033, 'CHRISTIAN GUIDO', NULL, 'leva.cemh@gmail.com', 'leva.cemh@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'LEVA CONDORI', 'Perú', 'CUSCO', NULL, '1', '72459865', NULL, '958122037', NULL, NULL, 'Medico cirujano', 'CENTRO DE SALUD DE CAMISEA', NULL, NULL),
(3034, 'MILAGROS VIRGINIA', NULL, 'Miliqn315@gmail.com', 'Miliqn315@gmail.com', NULL, '', 0, 'SI', NULL, 'QUISPE NIETO', 'Perú', 'LIMA SUR', NULL, '1', '72484429', NULL, '964525774', NULL, NULL, 'Medico', 'CENTRO MATERNO INFANTIL JOSE CARLOS MARIATEGUI ', NULL, NULL),
(3035, 'SAYURI GUISELLE', NULL, 'sayu_21_02@hotmail.com', 'sayu_21_02@hotmail.com', NULL, 'SI', 0, '', NULL, 'TUYA PUSCAN', 'Perú', 'ANCASH', NULL, '1', '72753334', NULL, '945663663', NULL, NULL, 'Médico ', 'PS RANRAHIRCA ', NULL, NULL),
(3036, 'RAUL ANTHONY', NULL, 'raullegri@gmail.com', 'raullegri@gmail.com', NULL, '', 0, 'SI', NULL, 'LEGUIA GRIJALVA', 'Perú', 'LIMA REGION', NULL, '1', '72875277', NULL, '935492873', NULL, NULL, 'Ingeniería Mecatrónica', 'UPC', NULL, NULL),
(3037, 'ADRIANA IRENE', NULL, 'verastegui.adriana.94@gmail.com', 'verastegui.adriana.94@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VERASTEGUI AZALDE', 'Perú', 'CALLAO', NULL, '1', '72911094', NULL, '922018484', NULL, NULL, 'LIC EN ENFERMERIA', 'HOSPITAL NACIONAL ', NULL, NULL),
(3038, 'LIZBETYT ANGHELINE GREGORIA', NULL, 'lagys9.virgo@gmail.com', 'lagys9.virgo@gmail.com', NULL, 'SI', 0, '', NULL, 'YABAR SANDOVAL', 'Perú', 'PIURA', NULL, '1', '72970307', NULL, '977726395', NULL, NULL, 'Obstetra', 'Sub Región de Salud Morropon Huancabamba ', NULL, NULL),
(3039, 'ROSA ANGELICA', NULL, 'angelica.carlos27@gmail.com', 'angelica.carlos27@gmail.com', NULL, '', 0, 'SI', NULL, 'CARLOS ESPINOZA', 'Perú', 'LIMA REGION', NULL, '1', '73008234', NULL, '972028093', NULL, NULL, 'asistente administrativo', 'federico villarreal', NULL, NULL),
(3040, 'FIORELLA ISBETH', NULL, 'fiore.lonvargas@gmail.com', 'fiore.lonvargas@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'LON VARGAS', 'Perú', 'LIMA ESTE', NULL, '1', '73038942', NULL, '973697807', NULL, NULL, 'Medico', 'Hnhu', NULL, NULL),
(3041, 'KENIA ARACELY', NULL, 'kenia.oyola@gmail.com', 'kenia.oyola@gmail.com', NULL, 'SI', 0, '', NULL, 'OYOLA ANGELES', 'Perú', 'APURIMAC', NULL, '1', '73053937', NULL, '967114152', NULL, NULL, 'Médico ', 'Centro de Salud Palpacachi ', NULL, NULL),
(3042, 'FELIX AUGUSTO', NULL, 'felixperez.94@hotmail.com', 'felixperez.94@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'PEREZ CASTELLANOS', 'Perú', 'LA LIBERTAD', NULL, '1', '73086254', NULL, '968167216', NULL, NULL, 'Medico', 'CSMI Quiruvilca', NULL, NULL),
(3043, 'SANTIAGO EDUARDO', NULL, 'lopezgar.santiago@gmail.com', 'lopezgar.santiago@gmail.com', NULL, 'SI', 0, '', NULL, 'LOPEZ GARCIA', 'Perú', 'LIMA CENTRO', NULL, '1', '73116100', NULL, '998816663', NULL, NULL, 'Estudiante', 'UPC', NULL, NULL),
(3044, 'ZUSSAN KATHERINE', NULL, 'Zussan.postigo.19@gmail.com', 'Zussan.postigo.19@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'POSTIGO GUERRA', 'Perú', 'LIMA CENTRO', NULL, '1', '73149530', NULL, '941116879', NULL, NULL, 'Lic. Enfermería ', 'Diris Lima centro', NULL, NULL),
(3045, 'MIYOSHI', NULL, 'mcerpacruz@gmail.com', 'mcerpacruz@gmail.com', NULL, '', 0, 'SI', NULL, 'CERPA CRUZ', 'Perú', 'LIMA CENTRO', NULL, '1', '73237852', NULL, '974218560', NULL, NULL, 'Medico', 'Essalud', NULL, NULL),
(3046, 'LIZBETH LUCERO', NULL, 'llucar199431@gmail.com', 'llucar199431@gmail.com', NULL, '', 0, 'SI', NULL, 'LUCAR CALLE', 'Perú', 'LIMA SUR', NULL, '1', '73358194', NULL, '998504950', NULL, NULL, 'Bach. Ing. de Sistema e Informatica', 'INEI', NULL, NULL),
(3047, 'EDITA ROSAANY', NULL, 'rosaany91@gmail.com', 'rosaany91@gmail.com', NULL, 'SI', 0, '', NULL, 'YAMUNAQUE BUSTAMANTE', 'Perú', 'LIMA CENTRO', NULL, '1', '73433236', NULL, '950020741', NULL, NULL, 'Administradora en salud ', 'Salud ', NULL, NULL),
(3048, 'YERSON', NULL, 'yersoncucho20@gmail.com', 'yersoncucho20@gmail.com', NULL, 'SI', 0, '', NULL, 'CUCHO HUANCA', 'Perú', 'PUNO', NULL, '1', '73495496', NULL, '951501114', NULL, NULL, 'ESTADISTICA', 'HCMM', NULL, NULL),
(3049, 'ALEXANDRA', NULL, 'alexazc710@gmail.com', 'alexazc710@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ZAMBRANO CARPIO', 'Perú', 'LIMA ESTE', NULL, '1', '73738428', NULL, '933255332', NULL, NULL, 'Comunicadora Social', 'Hospital Hermilio Valdizan', NULL, NULL),
(3050, 'DANIEL ALEXIS', NULL, 'danign572@gmail.com', 'danign572@gmail.com', NULL, '', 0, 'SI', NULL, 'GRANADOS NOA', 'Perú', 'CALLAO', NULL, '1', '73753476', NULL, '992470045', NULL, NULL, 'Ingeniero de Computación y Sistemas', 'ESSALUD', NULL, NULL),
(3051, 'ROSA ERIKA', NULL, 'roeri16@gmail.com', 'roeri16@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ROJAS DE LA TORRE', 'Perú', 'LIMA CENTRO', NULL, '1', '21559556', NULL, '949397327', NULL, NULL, 'Cirujano Dentista', 'HNAL', NULL, NULL),
(3052, 'LESLY HERLINDA', NULL, 'leslypr123@gmail.com', 'leslypr123@gmail.com', NULL, 'SI', 0, '', NULL, 'PAREDES RUIZ DE DEWAN', 'Perú', 'LIMA NORTE', NULL, '1', '73957750', NULL, '900699617', NULL, NULL, 'Secigrista', 'Dirección de telemedicina', NULL, NULL),
(3053, 'LEVINY GRACIELA', NULL, 'Leviny1107@gmail.com', 'Leviny1107@gmail.com', NULL, '', 0, 'SI', NULL, 'LEON YANCE', 'Perú', 'HUANUCO', NULL, '1', '74029143', NULL, '920220799', NULL, NULL, 'Médico Cirujano', 'CS Baños ', NULL, NULL),
(3054, 'PAOLA ANTUANETTE', NULL, 'panaveda@hotmail.com', 'panaveda@hotmail.com', NULL, 'SI', 0, '', NULL, 'NAVEDA SANTAMARIA', 'Perú', 'LIMA ESTE', NULL, '1', '74137432', NULL, '941376186', NULL, NULL, 'Medico', 'Clinica', NULL, NULL),
(3055, 'JOSSELYN JANNET', NULL, 'jossi.h_15@hotmail.com', 'jossi.h_15@hotmail.com', NULL, '', 0, 'SI', NULL, 'HILARIO ROJAS', 'Perú', 'LIMA CENTRO', NULL, '1', '74247453', NULL, '970345882', NULL, NULL, 'ing. sistemas e informatico', 'INEN', NULL, NULL),
(3056, 'LEONARDO RONYALD', NULL, 'lrojasm@minsa.gob.pe', 'lrojasm@minsa.gob.pe', NULL, 'SI', 0, '', NULL, 'ROJAS MEZARINA', 'Perú', 'LIMA NORTE', NULL, '1', '40028376', NULL, '997242891', NULL, NULL, 'Medico', 'Minsa', NULL, NULL),
(3057, 'BRENDA DAYAN', NULL, 'Brenda.arce17@gmail.com', 'Brenda.arce17@gmail.com', NULL, '', 0, 'SI', NULL, 'ARCE BANDA', 'Perú', 'LIMA SUR', NULL, '1', '74395175', NULL, '987931855', NULL, NULL, 'Ingeniera de sistemas', 'Utp', NULL, NULL),
(3058, 'ASHLEY JHOSELYN MARIBEL', NULL, 'ASYOMA19@GMAIL.COM', 'ASYOMA19@GMAIL.COM', NULL, 'SI', 0, '', NULL, 'ORDOÑEZ ROJAS', 'Perú', 'LA LIBERTAD', NULL, '1', '74425003', NULL, '915382778', NULL, NULL, 'Lic. Enfermería ', 'Minsa', NULL, NULL),
(3059, 'JEIMY ALEJANDRA', NULL, 'alejandraurbinagallardo@gmail.com', 'alejandraurbinagallardo@gmail.com', NULL, '', 0, 'SI', NULL, 'URBINA GALLARDO', 'Perú', 'LIMA CENTRO', NULL, '1', '74624654', NULL, '950372615', NULL, NULL, 'INGENIERIA DE SISTEMAS', 'INSTITUTO NACIONAL DE SALUD DEL NIÑO', NULL, NULL),
(3060, 'JUDITH CLAUDIA', NULL, 'claudiajudi45@gmail.com', 'claudiajudi45@gmail.com', NULL, '', 0, 'SI', NULL, 'DE LA CRUZ JULCA', 'Perú', 'LIMA CENTRO', NULL, '1', '74734101', NULL, '947254295', NULL, NULL, 'Ingeniería de Sistemas ', 'Instituto Nacional de Neoplásica', NULL, NULL),
(3061, 'ANDERSON CARLOS', NULL, 'digtel354@minsa.gob.pe', 'digtel354@minsa.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'CASTILLO MATICORENA', 'Perú', 'LIMA CENTRO', NULL, '1', '74879816', NULL, '932831442', NULL, NULL, 'Ingeniería de Sistemas', 'MINSA/INFOSALUD', NULL, NULL),
(3062, 'ARTURO ELISBAN', NULL, 'alinares3681@gmail.com', 'alinares3681@gmail.com', NULL, '', 0, 'SI', NULL, 'LINARES MARTINEZ', 'Perú', 'LIMA SUR', NULL, '1', '74996595', NULL, '993143273', NULL, NULL, '.', '.', NULL, NULL),
(3063, 'MIMI LILY', NULL, 'mimirojas03@gmail.com', 'mimirojas03@gmail.com', NULL, '', 0, 'SI', NULL, 'ROJAS SILVA', 'Perú', 'LIMA CENTRO', NULL, '1', '07265802', NULL, '997929276', NULL, NULL, 'Obstetra', 'Colegio de Obstetras del Perú ', NULL, NULL),
(3064, 'JAHAIRA PAMELA', NULL, 'naquicheyaha98@gmail.com', 'naquicheyaha98@gmail.com', NULL, 'SI', 0, '', NULL, 'NAQUICHE ADANAQUE', 'Perú', 'LA LIBERTAD', NULL, '1', '75697023', NULL, '9121211', NULL, NULL, 'Enfermeria', 'p.s longotea', NULL, NULL),
(3065, 'ESTHER ABIGAIL', NULL, 'abigailgalindoarcos@gmail.com', 'abigailgalindoarcos@gmail.com', NULL, '', 0, 'SI', NULL, 'GALINDO ARCOS', 'Perú', 'LIMA REGION', NULL, '1', '75724193', NULL, '970500684', NULL, NULL, 'Médico veterinario ', 'Hospital de supe Laura esther Rodríguez dulanto', NULL, NULL),
(3066, 'YESICA ELIZETH', NULL, '940951301q@gmail.com', '940951301q@gmail.com', NULL, 'SI', 0, '', NULL, 'QUINTO QUISPE', 'Perú', 'LIMA REGION', NULL, '1', '76121160', NULL, '966917718', NULL, NULL, 'Estadistica', 'Red huarochiri', NULL, NULL),
(3067, 'CYNTHYA', NULL, 'cynthyaabuhadba@gmail.com', 'cynthyaabuhadba@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ABUHADBA GUTIERREZ', 'Perú', 'APURIMAC', NULL, '1', '31037834', NULL, '983772022', NULL, NULL, 'Tecnologo en terapia física y rehabilitación ', 'Hospital Guillermo Díaz de la Vega ', NULL, NULL),
(3068, 'PAMELA HEIDI', NULL, 'Heidi1230lm@gmail.com', 'Heidi1230lm@gmail.com', NULL, '', 0, 'SI', NULL, 'LANDEO MANUYAMA', 'Perú', 'UCAYALI', NULL, '1', '76288895', NULL, '949517993', NULL, NULL, 'Técnico en enfermería ', 'Centro de Salud Atalaya ', NULL, NULL),
(3069, 'ROMMEL ABILIO', NULL, 'rinfante@pcm.gob.pe', 'rinfante@pcm.gob.pe', NULL, 'SI', 0, '', NULL, 'INFANTE ASTO', 'Perú', 'LIMA CENTRO', NULL, '1', '76647101', NULL, '976392273', NULL, NULL, 'Abogado', 'PCM', NULL, NULL),
(3070, 'MARIAURIA WINNIE', NULL, 'winniebravo25@gmail.com', 'winniebravo25@gmail.com', NULL, '', 0, 'SI', NULL, 'BRAVO ROJAS', 'Perú', 'LIMA CENTRO', NULL, '1', '76699998', NULL, '996195539', NULL, NULL, 'Psicología ', 'HOSPITAL San Juan de LURIGANCHO ', NULL, NULL),
(3071, 'ELISABETH ABIGAIL', NULL, 'Sirena9406@gmail.com', 'Sirena9406@gmail.com', NULL, 'SI', 0, '', NULL, 'ABARCA DELGADO', 'Perú', 'LIMA NORTE', NULL, '1', '76771213', NULL, '937075965', NULL, NULL, 'Obstetra', 'Hospital de Emergencias Villa El Salvador ', NULL, NULL),
(3072, 'ARELIS BRIGITTE', NULL, 'ARELRAMIREZTELLO@HOTMAIL.COM', 'telesalud@dirislimacentro.gob.pe', NULL, '', 0, 'SI', NULL, 'RAMIREZ TELLO', 'Perú', 'LIMA CENTRO', NULL, '1', '77276685', NULL, '927701192', NULL, NULL, 'ASISTENTE ADMINISTRATIVO', 'DIRIS LC', NULL, NULL),
(3073, 'RICHARD ALONSO', NULL, 'alonsogarcia1506@gmail.com', 'alonsogarcia1506@gmail.com', NULL, 'SI', 0, '', NULL, 'GARCIA GONZALES', 'Perú', 'LIMA CENTRO', NULL, '1', '77700988', NULL, '922085034', NULL, NULL, 'Administrador', 'Hospital San Juan de Lurigancho', NULL, NULL),
(3074, 'ALEXIA BELINDA', NULL, 'innovacionsalud@medisinu.com', 'innovacionsalud@medisinu.com', NULL, '', 0, 'SI', NULL, 'ELESPURU RIVERA', 'Colombia', 'UCAYALI', NULL, '1', '78730568', NULL, '3043358392', NULL, NULL, 'medico', 'medisinu IPS', NULL, NULL),
(3075, 'ARIANA SAYUMI', NULL, 'mchomali@cens.cl', 'mchomali@cens.cl', NULL, '', 0, 'SI', NULL, 'PADILLA CANO', 'chile', 'CALLAO', NULL, '1', '79729655', NULL, '56992434285', NULL, NULL, 'medico', 'CENS', NULL, NULL),
(3076, 'CRISTIAN OMAR', NULL, 'darque7@hotmail.com', 'darque7@hotmail.com', NULL, 'SI', 0, '', NULL, 'VALDERA MUÑOZ', 'Perú', 'TUMBES', NULL, '1', '80226587', NULL, '952901477', NULL, NULL, 'Licenciado Enfermeria ', 'DIRESA TUMBES ', NULL, NULL),
(3077, 'OMIDRES', NULL, 'info@draomidresperez.com', 'info@draomidresperez.com', NULL, 'SI', 0, '', NULL, 'PEREZ', 'Ecuador', 'PIURA', NULL, '1', '961279080', NULL, '\'+593982062988', NULL, NULL, 'Medico', 'OITT', NULL, NULL),
(3078, 'SANTIAGO', NULL, 'santiago.fajardo@astrazeneca.com', 'santiago.fajardo@astrazeneca.com', NULL, '', 0, 'SI', NULL, 'FAJARDO', 'Colombia', 'OTRO', NULL, '1', '1000149694', NULL, '\'+573015321984', NULL, NULL, 'Comunicador Audiovisual', 'AstraZeneca', NULL, NULL),
(3079, 'EMILIA ', NULL, 'emilia.cano1@astrazeneca.com', 'emilia.cano1@astrazeneca.com', NULL, 'SI', 0, '', NULL, 'CANO ', 'Ecuador ', 'LIMA REGION', NULL, '1', '1711571529', NULL, '593992696348', NULL, NULL, 'Government Affairs ', 'AstraZeneca ', NULL, NULL),
(3080, 'EDY ', NULL, 'cieloedy222@gmail.com', 'cieloedy222@gmail.com', NULL, '', 0, 'SI', NULL, 'PALACIOS RAMOS ', 'Perú', 'HUANUCO', NULL, '1', '10200372013', NULL, '938112829', NULL, NULL, 'Licenciada Enfermería ', 'Essalud', NULL, NULL),
(3081, 'ERNESTO', NULL, 'velarde@cneuro.cu', 'velarde@cneuro.cu', NULL, 'SI', 0, '', NULL, 'VELARDE', 'Cuba', 'OTRO', NULL, '1', '80030207741', NULL, '\'+5358056223', NULL, NULL, 'Ingeniero/Desarrollador de Equipamiento Medico', 'Centro de Neurociencias de Cuba', NULL, NULL),
(3082, 'CENTRO', NULL, 'cenate.telecapa@essalud.gob.pe', 'cenate.telecapa@essalud.gob.pe', NULL, 'SI', 0, '', NULL, 'NACIONAL DE TELEMEDICINA', 'Perú', 'LIMA CENTRO', NULL, '1', '999999999999', NULL, '9999999999', NULL, NULL, 'sistema', 'CENATE', NULL, NULL),
(3083, 'FREDY', NULL, 'frecopa-1674@hotmail.com', 'frecopa-1674@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'CORDOVA PAKER', 'Perú', 'PIURA', NULL, '1', '00245888', NULL, '964069203', NULL, NULL, 'OBSTETRA', 'PS MONTERON', NULL, NULL),
(3084, 'PEDRO EMILIO PASCUAL', NULL, 'pvargasrivera@yahoo.es', 'pvargasrivera@yahoo.es', NULL, '', 0, 'SI', NULL, 'VARGAS RIVERA', 'Perú', 'TACNA', NULL, '1', '00415208', NULL, '980032910', NULL, NULL, 'MEDICO CIRUJANO', 'MINISTERIO DE SALUD', NULL, NULL),
(3085, 'ISAIAS TEODORO', NULL, 'juanjosuecarpio@gmail.com', 'juanjosuecarpio@gmail.com', NULL, '', 0, 'SI', NULL, 'CARPIO VILLANUEVA', 'Perú', 'TACNA', NULL, '1', '00418151', NULL, '952004565', NULL, NULL, 'Técnico Administrativo ', 'Puesto de Salud Las Yaras', NULL, NULL),
(3086, 'JANETT', NULL, 'janejulve@hotmail.com', 'janejulve@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'JULVE', 'Perú', 'LIMA ESTE', NULL, '1', '7936594', NULL, '997362499', NULL, NULL, 'medico', 'CMI C L Silva', NULL, NULL),
(3087, 'BLANCA RAQUEL', NULL, 'brazede@gmail.com', 'brazede@gmail.com', NULL, '', 0, 'SI', NULL, 'ZEVALLOS DELGADO', 'Perú', 'TACNA', NULL, '1', '00432855', NULL, '952991434', NULL, NULL, 'ENFERMERA', 'HOSPITAL HIPOLITO UNANUE DE TACNA', NULL, NULL),
(3088, 'MARIA TERESA', NULL, 'mariafloresvisa@gmail.com', 'mariafloresvisa@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'FLORES VISA', 'Perú', 'TACNA', NULL, '1', '00442687', NULL, '952361412', NULL, NULL, 'Lic. Obstetricia', 'P.S. CONO NORTE    MINSA', NULL, NULL),
(3089, 'CRISTINA HERMELINDA', NULL, 'cristinallosa@hotmail.com', 'cristinallosa@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'LLOSA RODRIGUEZ', 'Perú', 'TACNA', NULL, '1', '00473441', NULL, '952950519', NULL, NULL, 'medico cirujan0', 'minsa', NULL, NULL),
(3090, 'YULIANA ERSILIA', NULL, 'yulianaednoc@gmail.com', 'yulianaednoc@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CONDE OLIVERA', 'Perú', 'TACNA', NULL, '1', '00514936', NULL, '920618899', NULL, NULL, 'Licenciada en Enfermería ', 'Minsa', NULL, NULL),
(3091, 'NORFELINA VICTORIA', NULL, 'a_vicky1@hotmail.com', 'a_vicky1@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'CHOQUE MAMANI', 'Perú', 'TACNA', NULL, '1', '00516651', NULL, '998776688', NULL, NULL, 'Obstetra', 'P.s. intiorko', NULL, NULL),
(3092, 'ROCIO MATILDE', NULL, 'romamed1414@gmail.com', 'romamed1414@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'LAQUI ESPINOZA', 'Perú', 'TACNA', NULL, '1', '00520837', NULL, '910881550', NULL, NULL, 'MEDICO', 'MINISTERIO DE SALUD', NULL, NULL),
(3093, 'MARIA LUZ', NULL, 'mariavilchura@gmail.com', 'mariavilchura@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VILCA CHURA', 'Perú', 'TACNA', NULL, '1', '00791925', NULL, '952811933', NULL, NULL, 'Enfermera ', 'Red de Salud Tacna ', NULL, NULL),
(3094, 'ROSSEMARY', NULL, 'eysaor30@gmail.com', 'eysaor30@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ROJAS TUANAMA', 'Perú', 'SAN MARTÍN', NULL, '1', '43723159', NULL, '921349060', NULL, NULL, 'Obstetra', 'Dires san martín', NULL, NULL),
(3095, 'ROLANDO', NULL, 'rolandopa1321@gmail.com', 'rolandopa1321@gmail.com', NULL, 'SI', 0, '', NULL, 'PAUCARA APAZA', 'Perú', 'AREQUIPA', NULL, '1', '01308972', NULL, '990132116', NULL, NULL, 'Abogado', 'GERENCIA  REGIONAL DE SALUD AREQUIPA', NULL, NULL),
(3096, 'ABEL', NULL, 'abelvargasvi@gmail.com', 'abelvargasvi@gmail.com', NULL, '', 0, 'SI', NULL, 'VARGAS VILCA', 'Perú', 'SAN MARTÍN', NULL, '1', '01319640', NULL, '959625737', NULL, NULL, 'INGENIERO', 'OFICINA  DE GESTION DE SERVICIOS DE SALUD ALTO MAYO', NULL, NULL),
(3097, 'BETZABE ROSARIO', NULL, 'betzabecutipa@gmail.com', 'betzabecutipa@gmail.com', NULL, 'SI', 0, '', NULL, 'CUTIPA APAZA', 'Perú', 'LIMA CENTRO', NULL, '1', '01327232', NULL, '940301944', NULL, NULL, 'Médico ocupacional ', 'INPE ', NULL, NULL),
(3098, 'SANDRA', NULL, 'sm.perez@pucp.edu.pe', 'sm.perez@pucp.edu.pe', NULL, 'SI', 0, '', NULL, 'PÉREZ', 'Perú', 'LIMA SUR', NULL, '1', '02107293', NULL, '922303342', NULL, NULL, 'Profesor', 'Pontificia Universidad Católica del Perú', NULL, NULL),
(3099, 'MARÍA DEL CARMEN ', NULL, 'macacoronelvillalta@gmail.com', 'macacoronelvillalta@gmail.com', NULL, 'SI', 0, '', NULL, 'CORONEL VILLALTA', 'Perú', 'PIURA', NULL, '1', '02329787', NULL, '959423424', NULL, NULL, 'Lic. Enfermería ', 'Hospital de Chulucanas ', NULL, NULL),
(3100, 'FABIAN ENRIQUE', NULL, 'fabifar1025@gmail.com', 'fabifar1025@gmail.com', NULL, 'SI', 0, '', NULL, 'FARFAN CHUNGA', 'Perú', 'PIURA', NULL, '1', '02822336', NULL, '962110753', NULL, NULL, 'TECNICO EN ENFERMERIA', 'MINSA', NULL, NULL),
(3101, 'MARIA ESMERITA', NULL, 'mariaesmeritasosamendoza@gmail.com', 'mariaesmeritasosamendoza@gmail.com', NULL, '', 0, 'SI', NULL, 'SOSA MENDOZA DE SOSA', 'Perú', 'PIURA', NULL, '1', '02827580', NULL, '965936165', NULL, NULL, 'Téc de enfermería ', 'Minsa ', NULL, NULL),
(3102, 'PAOLA MARISELLA', NULL, 'pamameaq@hotmail.com', 'pamameaq@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'MENDOZA AQUINO', 'Perú', 'PIURA', NULL, '1', '02848269', NULL, '934999545', NULL, NULL, 'Enfermera ', 'E.S I-4 Consuelo de Velasco ', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(3103, 'TERESMILA', NULL, 'teresagho1@yahoo.es', 'teresagho1@yahoo.es', NULL, 'SI', 0, 'SI', NULL, 'AGUILAR HONORIO', 'Perú', 'PIURA', NULL, '1', '02888108', NULL, '959905181', NULL, NULL, 'ENFERMERA', 'DIRESA PIURA', NULL, NULL),
(3104, 'LUIS FRANCISCO', NULL, 'lbeingolea@conhu.org.pe', 'lbeingolea@conhu.org.pe', NULL, 'SI', 0, '', NULL, 'BEINGOLEA MORE', 'Perú', 'OTRO', NULL, '1', '02890001', NULL, '979065620', NULL, NULL, 'Medico', 'ORAS CONHU', NULL, NULL),
(3105, 'CARMEN AMELIA', NULL, 'Ysalas@conhu.org.pe', 'Ysalas@conhu.org.pe', NULL, 'SI', 0, '', NULL, 'ABAD SAN MARTIN', 'Perú', 'LIMA SUR', NULL, '1', '03122788', NULL, '915985325', NULL, NULL, 'Responsable de salud digital ', 'Organismo Andino de Salud Convenio Hipólito Unanue ', NULL, NULL),
(3106, 'MARUJA', NULL, 'marujasandovalquispe@gmail.com', 'marujasandovalquispe@gmail.com', NULL, '', 0, 'SI', NULL, 'SANDOVAL QUISPE', 'Perú', 'PIURA', NULL, '1', '03650162', NULL, '953432240', NULL, NULL, 'LIC EN ENFERMERIA ', 'DIRESA DIRESA PIURA ', NULL, NULL),
(3107, 'SARITA', NULL, 'telesalud@hospitaltarapoto.gob.pe', 'telesalud@hospitaltarapoto.gob.pe', NULL, '', 0, 'SI', NULL, 'SAAVEDRA', 'Perú', 'SAN MARTÍN', NULL, '1', '92213', NULL, '945897310', NULL, NULL, 'Enfermera', 'Hospital Tarapoto', NULL, NULL),
(3108, 'LILY', NULL, 'bayonatalledolily@gmail.com', 'bayonatalledolily@gmail.com', NULL, '', 0, 'SI', NULL, 'BAYONA TALLEDO', 'Perú', 'PIURA', NULL, '1', '03699441', NULL, '956598580', NULL, NULL, 'Tecnólogo Médico ', 'E S I 4 Bernal ', NULL, NULL),
(3109, 'ELIZABETH LUCY', NULL, 'alvaradoelizabeth295@gmail.com', 'alvaradoelizabeth295@gmail.com', NULL, '', 0, 'SI', NULL, 'ALVARADO RIVERA', 'Perú', 'PASCO', NULL, '1', '04050203', NULL, '990090611', NULL, NULL, 'Enfermera ', 'C.S. Huachon ', NULL, NULL),
(3110, 'YESENIA LUISA', NULL, 'Yeamlo@hotmail.com', 'Yeamlo@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'AMBROSIO LOYA', 'Perú', 'LIMA SUR', NULL, '1', '04071095', NULL, '941926223', NULL, NULL, 'Obstetra', 'INSNSB', NULL, NULL),
(3111, 'MARIA DEL CARMEN SUSANA', NULL, 'krmensusana@gmail.com', 'krmensusana@gmail.com', NULL, '', 0, 'SI', NULL, 'APAZA CAMA', 'Perú', 'MOQUEGUA', NULL, '1', '04406701', NULL, '996878898', NULL, NULL, 'OBSTETRA', 'MINSA MOQUEGUA', NULL, NULL),
(3112, 'NIURKA', NULL, 'niurkapm@hotmail.com', 'niurkapm@hotmail.com', NULL, '', 0, 'SI', NULL, 'PUMA MENACHO', 'Perú', 'TACNA', NULL, '1', '04438705', NULL, '999132591', NULL, NULL, 'Enfermera', 'Red de Salud Tacna', NULL, NULL),
(3113, 'GLORIA AHIDA', NULL, 'glocen2309@gmail.com', 'glocen2309@gmail.com', NULL, '', 0, 'SI', NULL, 'CENTENO MAMANI', 'Perú', 'MOQUEGUA', NULL, '1', '04438998', NULL, '959577474', NULL, NULL, 'Licenciada en Enfermería ', 'DIRESA MOQUEGUA ', NULL, NULL),
(3114, 'ROSA', NULL, 'jahuirarosa4@gmail.com', 'jahuirarosa4@gmail.com', NULL, '', 0, 'SI', NULL, 'JAHUIRA RODRIGUEZ', 'Perú', 'MOQUEGUA', NULL, '1', '04648232', NULL, '953656576', NULL, NULL, 'enfermera', 'C.S.M.C.CESAR GALLARDO /RED SALUD ILO', NULL, NULL),
(3115, 'YESSICA MARIA', NULL, 'yramos@diresamoquegua.gob.pe', 'yramos@diresamoquegua.gob.pe', NULL, '', 0, 'SI', NULL, 'RAMOS QUISPE', 'Perú', 'MOQUEGUA', NULL, '1', '04742850', NULL, '966600850', NULL, NULL, 'LIC. EN ENFERMERIA', 'DIRESA MOQUEGUA', NULL, NULL),
(3116, 'IRMA BERTHA', NULL, 'ircevela.13@gmail.com', 'ircevela.13@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CENTENO VELASQUEZ', 'Perú', 'MADRE DE DIOS', NULL, '1', '04826847', NULL, '998466995', NULL, NULL, 'OBSTETRA', 'DIRESA MADRE DE DIOS', NULL, NULL),
(3117, 'WILLIAM ALBERTO', NULL, 'willyjordan@hotmail.com', 'willyjordan@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'JORDAN LEDESMA', 'Perú', 'LIMA ESTE', NULL, '1', '05266581', NULL, '995035464', NULL, NULL, 'Médico ', 'Hospital de Emergencia Ate Vitarte ', NULL, NULL),
(3118, 'ABNER', NULL, 'luriza88@gmail.com', 'luriza88@gmail.com', NULL, '', 0, 'SI', NULL, 'IPUSHIMA VASQUEZ', 'Bolivia', 'OTRO', NULL, '1', '05615168', NULL, '63569304', NULL, NULL, 'MÉDICO', 'MINSITERIO DE SALUD Y DEPORTES', NULL, NULL),
(3119, 'NANCY ', NULL, 'nancy_alvarez11@hotmail.com', 'nancy_alvarez11@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'ALVAREZ CHUQUIHUANCA', 'Perú', 'PIURA', NULL, '1', '05643722', NULL, '950821328', NULL, NULL, 'Enfermera ', 'Minsa', NULL, NULL),
(3120, 'MARIA DEL CARMEN', NULL, 'mctaquia@gmail.com', 'mtaquia@insn.gob.pe', NULL, '', 0, 'SI', NULL, 'TAQUIA CUEVA', 'Perú', 'LIMA CENTRO', NULL, '1', '06041451', NULL, '99 5531 156 ', NULL, NULL, 'Enfermera', 'Insn', NULL, NULL),
(3121, 'YDA JOVITA', NULL, 'ydajov@yahoo.es', 'ydajov@yahoo.es', NULL, 'SI', 0, 'SI', NULL, 'PEÑAFIEL SALCEDO', 'Perú', 'LIMA CENTRO', NULL, '1', '06201634', NULL, '995733663', NULL, NULL, 'Psicologa', 'Centro especializado raul patrucco puig', NULL, NULL),
(3122, 'JUANA ROSA', NULL, 'jmolinas@unmsm.edu.pe', 'jmolinas@unmsm.edu.pe', NULL, 'SI', 0, 'SI', NULL, 'MOLINA SALAS', 'Perú', 'LIMA CENTRO', NULL, '1', '06220177', NULL, '995129880', NULL, NULL, 'ENFERMERA', 'INSTITUTO NACIONAL MATERNO PERINATAL', NULL, NULL),
(3123, 'ZOILA CONSUELO', NULL, 'saldanagarciazoila895@gmail.com', 'saldanagarciazoila895@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'SALDAÑA GARCIA', 'Perú', 'CALLAO', NULL, '1', '06251789', NULL, '971541464', NULL, NULL, 'Tecn. Laboratorio Clínico', 'Diresa Callao', NULL, NULL),
(3124, 'DORIS MERY', NULL, 'dulcenurse@gmail.com', 'dulcenurse@gmail.com', NULL, '', 0, 'SI', NULL, 'TITO CCOICCA', 'Perú', 'LIMA CENTRO', NULL, '1', '06257101', NULL, '979313007', NULL, NULL, 'enfermera especialista', 'INSTITUTO NACIONAL MATERNO PERINATAL', NULL, NULL),
(3125, 'JESSICA CECILIA', NULL, 'jessyvalladolid2202@gmail.com', 'jessyvalladolid2202@gmail.com', NULL, '', 0, 'SI', NULL, 'SAAVEDRA VALLADOLID', 'Perú', 'PIURA', NULL, '1', '32545795', NULL, '9699004148', NULL, NULL, 'ECONOMISTA', 'SUB REGION DE SALUD MORROPON HUANCABAMBA', NULL, NULL),
(3126, 'CARLOS MAXIMO', NULL, 'carlosmatosperez@yahoo.com.ar', 'carlosmatosperez@yahoo.com.ar', NULL, 'SI', 0, 'SI', NULL, 'MATOS PEREZ', 'Perú', 'LIMA CENTRO', NULL, '1', '06289094', NULL, '997879387', NULL, NULL, 'Medico cirujano', 'C de salud santa rosa de lima', NULL, NULL),
(3127, 'ROCIO DE JESUS', NULL, 'rovapi_2@hotmail.com', 'rovapi_2@hotmail.com', NULL, '', 0, 'SI', NULL, 'VASQUEZ PINEDO', 'Perú', 'CALLAO', NULL, '1', '06290317', NULL, '952857717', NULL, NULL, 'Médico cirujano ', 'Minsa', NULL, NULL),
(3128, 'RENEE DIANA', NULL, 'dayanasc28@gmail.com', 'dayanasc28@gmail.com', NULL, 'SI', 0, '', NULL, 'SALAZAR CASAFRANCA', 'Perú', 'LIMA NORTE', NULL, '1', '47801826', NULL, '993652187', NULL, NULL, 'ADMINISTRADORA EN SALUD ', 'HNCH', NULL, NULL),
(3129, 'MERCEDES ISABEL', NULL, 'mercy_geri_@hotmail.com', 'mercy_geri_@hotmail.com', NULL, 'SI', 0, '', NULL, 'GUTIERREZ CORDOVA', 'Perú', 'LIMA ESTE', NULL, '1', '06550714', NULL, '947195159', NULL, NULL, 'Tecnica en enfermeria', 'Hospital Hermilio  Valdizan', NULL, NULL),
(3130, 'ELIZABETH AZUCENA', NULL, 'elita042727@gmail.com', 'elita042727@gmail.com', NULL, '', 0, 'SI', NULL, 'SANCHEZ LANDEO', 'Perú', 'LIMA CENTRO', NULL, '1', '06589374', NULL, '652985632', NULL, NULL, 'Enfermera ', 'INMP', NULL, NULL),
(3131, 'LUISA MELCHORITA', NULL, 'lmaurtua@insn.gob.pe', 'lmaurtua@insn.gob.pe', NULL, 'SI', 0, '', NULL, 'MAURTUA ROJAS DE LAUREANO', 'Perú', 'LIMA CENTRO', NULL, '1', '06704560', NULL, '988330022', NULL, NULL, 'Secretaria médica', 'Instituto Nacional de Salud del Niño-Breña', NULL, NULL),
(3132, 'ELEANA PILAR', NULL, 'eiannaconesilva@gmail.com', 'eiannaconesilva@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'IANNACONE SILVA', 'Perú', 'CALLAO', NULL, '1', '06712885', NULL, '990242801', NULL, NULL, 'Médico Pediatra', 'Centro de Salud Bellavista ', NULL, NULL),
(3133, 'GREGORIA HEROTILDE', NULL, 'Herotildealvadiaz@gmail.com', 'Herotildealvadiaz@gmail.com', NULL, 'SI', 0, '', NULL, 'ALVA DIAZ', 'Perú', 'CALLAO', NULL, '1', '06739453', NULL, '948095456', NULL, NULL, 'Técnica de Enfermería ', 'Diresa Callao', NULL, NULL),
(3134, 'ANA MARIA', NULL, 'anamariaalvarezgr@gmail.com', 'anamariaalvarezgr@gmail.com', NULL, 'SI', 0, '', NULL, 'ALVAREZ GRAJEDA', 'Perú', 'LIMA ESTE', NULL, '1', '06944746', NULL, '989683901', NULL, NULL, 'Tecnico en Enfermería ', 'Hospital Hermilio Valdizan ', NULL, NULL),
(3135, 'EDITH ISABEL', NULL, 'Isabelabantoavalis@gmail.com', 'Isabelabantoavalis@gmail.com', NULL, '', 0, 'SI', NULL, 'ABANTO AVALOS', 'Perú', 'LIMA REGION', NULL, '1', '07035336', NULL, '999793148', NULL, NULL, 'Enfermera ', 'Instituto Nacional Materno Perinatal ', NULL, NULL),
(3136, 'JOSE ROBERTO', NULL, 'jorocascaro@gmbail.com', 'jorocascaro@gmbail.com', NULL, 'SI', 0, '', NULL, 'CASTILLO CARO', 'Perú', 'LIMA ESTE', NULL, '1', '07106466', NULL, '993606066', NULL, NULL, 'Psicólogo ', 'Hospital Hermilo Valdizan ', NULL, NULL),
(3137, 'YUVITZA KARELY', NULL, 'salazaryuvitza@gmail.com', 'salazaryuvitza@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'SALAZAR VARELA', 'Perú', 'LIMA CENTRO', NULL, '1', '70032108', NULL, '972313078', NULL, 'PÚBLICA', 'MÉDICO CIRUJANO', 'DITEL', NULL, NULL),
(3138, 'JOSE RAUL', NULL, 'jose.naupari@upch.pe', 'jose.naupari@upch.pe', NULL, 'SI', 0, '', NULL, 'ÑAUPARI PINEDA', 'Perú', 'LIMA REGION', NULL, '1', '07260100', NULL, '951307572', NULL, NULL, 'ODONTÓLOGO ', 'UPCH ', NULL, NULL),
(3139, 'GABY DEL CARMEN', NULL, 'g.sosa.r14@gmail.com', 'g.sosa.r14@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'SOSA ROJAS', 'Perú', 'LIMA CENTRO', NULL, '1', '7263546', NULL, '994478702', NULL, NULL, 'Administradora', 'INO', NULL, NULL),
(3140, 'NIDIA RITA', NULL, 'nidiajulcapedraza@gmail.com', 'nidiajulcapedraza@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'JULCA PEDRAZA', 'Perú', 'LIMA CENTRO', NULL, '1', '07324928', NULL, '987492904', NULL, NULL, 'Lic en Enfermería', 'Instituto Nacional del Niño', NULL, NULL),
(3141, 'GINA MILAGROS', NULL, 'mistygymi30@hotmail.com', 'mistygymi30@hotmail.com', NULL, 'SI', 0, '', NULL, 'SANCHEZ ARANA', 'Perú', 'LIMA REGION', NULL, '1', '07346714', NULL, '937523008', NULL, NULL, 'ENFERMERA', 'HOSPITAL MILITAR CENTRAL \" CRL LUÍS A. SCHEREIBER\"', NULL, NULL),
(3142, 'MANUEL JOSE', NULL, 'manuelj.sanchezr@gmail.com', 'manuelj.sanchezr@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'SANCHEZ RODRIGUEZ', 'Perú', 'LIMA CENTRO', NULL, '1', '07458249', NULL, '999655246', NULL, NULL, 'Analista de datos', 'Clinica Javier Prado', NULL, NULL),
(3143, 'SOLEDAD DANILA', NULL, 'srivera@sis.gob.pe', 'srivera@sis.gob.pe', NULL, 'SI', 0, '', NULL, 'RIVERA ZEVALLOS', 'Perú', 'LIMA CENTRO', NULL, '1', '07493977', NULL, '995942256', NULL, NULL, 'medico', 'SIS', NULL, NULL),
(3144, 'EDWIN JAVIER', NULL, 'javitoca1@hotmail.com', 'javitoca1@hotmail.com', NULL, 'SI', 0, '', NULL, 'TORRES CASTAÑEDA', 'Perú', 'LIMA ESTE', NULL, '1', '07525644', NULL, '910995312', NULL, NULL, 'Trabajador Social ', 'Hospital hermilio valdizan ', NULL, NULL),
(3145, 'ADRIANO', NULL, 'adriquenta280716@gmail.com', 'adriquenta280716@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'QUENTA CHIPANA', 'Perú', 'LIMA ESTE', NULL, '1', '07664207', NULL, '991491146', NULL, NULL, 'Piloto de Ambulancia ', 'Hospital Hermilio Valdizán ', NULL, NULL),
(3146, 'JASMIN CAROLA', NULL, 'jascar49@gmail.com', 'jascar49@gmail.com', NULL, 'SI', 0, '', NULL, 'MAMANI PORTUGAL', 'Perú', 'LIMA ESTE', NULL, '1', '07671441', NULL, '971533517', NULL, NULL, 'Enfermera ', 'Hospital de chosica ', NULL, NULL),
(3147, 'DORIS', NULL, 'dcaceresvargas@gmail.com', 'dcaceresvargas@gmail.com', NULL, 'SI', 0, '', NULL, 'CACERES VARGAS', 'Perú', 'LIMA ESTE', NULL, '1', '07673012', NULL, '999354431', NULL, NULL, 'Medico psiquiatra', 'Jose Agurto Tello_Chosica ', NULL, NULL),
(3148, 'ROSARIO DE LOURDES', NULL, 'rosariotole@hotmail.com', 'rosariotole@hotmail.com', NULL, 'SI', 0, '', NULL, 'TOLEDO SANTOS', 'Perú', 'LIMA ESTE', NULL, '1', '07684125', NULL, '954145222', NULL, NULL, 'PSICOLOGA', 'HOSPITAL JOSE AGURTO TELLO DE CHOSICA', NULL, NULL),
(3149, 'GUILLERMO EDUARDO', NULL, 'gfrias@pcris.gob.pe', 'gfrias@pcris.gob.pe', NULL, 'SI', 0, '', NULL, 'FRIAS MARTINELLI', 'Perú', 'LIMA CENTRO', NULL, '1', '07729287', NULL, '999367276', NULL, NULL, 'Medico', 'pcris', NULL, NULL),
(3150, 'MARLENE SANDRA', NULL, 'sarojasma@gmail.com', 'sarojasma@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'ROJAS MAMANI', 'Perú', 'LIMA NORTE', NULL, '1', '07735129', NULL, '992563351', NULL, NULL, 'Tec de Enfermeria', 'CS Sagrado Corazón de Jesus', NULL, NULL),
(3151, 'RICARDO ARIOSTO', NULL, 'ripazsol_1968@hotmail.com', 'ripazsol_1968@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'PAZ SOLDÁN OBLITAS', 'Perú', 'LIMA CENTRO', NULL, '1', '07749017', NULL, '975557979', NULL, NULL, 'Cirujano Dentista', 'MINSA: Centro de Salud Materno Infantil El Porvenir de la DIRIS Lima Centro', NULL, NULL),
(3152, 'MARIA MERCEDES', NULL, 'pereyra.marita@gmail.com', 'pereyra.marita@gmail.com', NULL, '', 0, 'SI', NULL, 'PEREYRA QUIROS', 'Perú', 'LIMA CENTRO', NULL, '1', '07820410', NULL, '998437193', NULL, NULL, 'Médico ', 'MİNİSTERİO DE SALUD ', NULL, NULL),
(3153, 'IVONNE ROSSANA', NULL, 'ivonneseguranolasco@gmail.com', 'ivonneseguranolasco@gmail.com', NULL, 'SI', 0, '', NULL, 'SEGURA NOLASCO', 'Perú', 'LIMA CENTRO', NULL, '1', '07876421', NULL, '986661528', NULL, NULL, 'Lic.en Enfermería ', 'Hospital Nacional Edgardo Rebagliati Martins ', NULL, NULL),
(3154, 'ALEXIA', NULL, 'Abaez@minsa.gob.pe', 'Abaez@minsa.gob.pe', NULL, 'SI', 0, '', NULL, 'BAEZ', 'Perú', 'CALLAO', NULL, '1', NULL, NULL, '999999999', NULL, NULL, 'Aux adm', 'Minsa', NULL, NULL),
(3155, 'EDDY LAURA', NULL, 'eddylaura_01@hotmail.com', 'eddylaura_01@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'MATA LANDAURO', 'Perú', 'CALLAO', NULL, '1', '08039107', NULL, '959751943', NULL, NULL, 'Obstretra', 'Hospital de ventanilla', NULL, NULL),
(3156, 'LEONARDO MIGUEL', NULL, 'leokaseng2111@gmail.com', 'leokaseng2111@gmail.com', NULL, '', 0, 'SI', NULL, 'KASENG VEAS', 'Perú', 'LIMA CENTRO', NULL, '1', '08135097', NULL, '972698999', NULL, NULL, 'Periodista', 'INSTITUTO NACIONAL DE SALUD DEL NIÑO', NULL, NULL),
(3157, 'MARIO EMILIANO', NULL, 'mario_tflores@hotmail.com', 'mario_tflores@hotmail.com', NULL, 'SI', 0, '', NULL, 'TOLENTINO FLORES', 'Perú', 'LIMA REGION', NULL, '1', '08171814', NULL, '952955482', NULL, NULL, 'ADMINISTRADOR', 'DIRESA LIMA', NULL, NULL),
(3158, 'RAUL MARTIN', NULL, 'raulamigo2005@yahoo.es', 'raulamigo2005@yahoo.es', NULL, 'SI', 0, 'SI', NULL, 'CASTAÑEDA MARIN', 'Perú', 'LIMA CENTRO', NULL, '1', '08186879', NULL, '997359347', NULL, NULL, 'Medico', 'CMI SURQUILLO ', NULL, NULL),
(3159, 'MARIA DEL PILAR', NULL, 'fbenites2002@yahoo.com', 'fbenites2002@yahoo.com', NULL, '', 0, 'SI', NULL, 'BENITES BENITES', 'Perú', 'LIMA CENTRO', NULL, '1', '08209761', NULL, '992778347', NULL, NULL, 'Medico', 'Hnerm', NULL, NULL),
(3160, 'MARIA ISABEL', NULL, 'Mitorresf19@gmail.com', 'Mitorresf19@gmail.com', NULL, 'SI', 0, '', NULL, 'TORRES FALEN', 'Perú', 'LIMA CENTRO', NULL, '1', '08253518', NULL, '999121108', NULL, NULL, 'Medico', 'Instituto Nacional de Enfermedades Neoplásicas ', NULL, NULL),
(3161, 'ANA MARIA', NULL, 'anafashe47@gmail.com', 'anafashe47@gmail.com', NULL, 'SI', 0, '', NULL, 'FASHE SALAS', 'Perú', 'LIMA CENTRO', NULL, '1', '08296431', NULL, '964326862', NULL, NULL, 'OBSTETRA ', 'CENTRO DE SALUD SAN FERNANDO ', NULL, NULL),
(3162, 'PILAR FAUSTINA', NULL, 'pilarplasencia62@gmail.com', 'pilarplasencia62@gmail.com', NULL, 'SI', 0, '', NULL, 'PLASENCIA RIVERA', 'Perú', 'LIMA ESTE', NULL, '1', '08335149', NULL, '980874515', NULL, NULL, 'Profecional técnico ', 'Hospital Hermilio Valdizan ', NULL, NULL),
(3163, 'MARCELINA', NULL, 'mporrastineo@gmail.com', 'mporrastineo@gmail.com', NULL, '', 0, 'SI', NULL, 'PORRAS TINEO', 'Perú', 'LIMA CENTRO', NULL, '1', '08388890', NULL, '995653454', NULL, NULL, 'Enfermera', 'Hospital Jose Casimiro Ulloa ', NULL, NULL),
(3164, 'JACINTO', NULL, 'medicoshoy@yahoo.es', 'medicoshoy@yahoo.es', NULL, 'SI', 0, '', NULL, 'ACOSTA MATA', 'Perú', 'LIMA SUR', NULL, '1', '08517407', NULL, '996333111', NULL, NULL, 'Médico ', 'CMI Manuel Barreto ', NULL, NULL),
(3165, 'EDITH', NULL, 'Earanac2004@hotmail.com', 'Earanac2004@hotmail.com', NULL, 'SI', 0, '', NULL, 'ARANA CASTAÑEDA', 'Perú', 'LIMA CENTRO', NULL, '1', '08552973', NULL, '941305630', NULL, NULL, 'Ingeniero de sistemas', 'UTP', NULL, NULL),
(3166, 'MANUELA', NULL, 'mnique@senasa.gob.pe', 'mnique@senasa.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'ÑIQUE RAMOS', 'Perú', 'LIMA CENTRO', NULL, '1', '08581710', NULL, '997096804', NULL, NULL, 'Tecnologo Medico en Laboratorio y Anatomía Patológica', 'SENASA', NULL, NULL),
(3167, 'EMPERATRIZ', NULL, 'emperatrizperu@hotmail.com', 'emperatrizperu@hotmail.com', NULL, 'SI', 0, '', NULL, 'RODRIGUEZ REYES DE SUAREZ', 'Perú', 'LIMA NORTE', NULL, '1', '08598283', NULL, '987722792', NULL, NULL, 'Psicóloga ', 'Hospital Hermilio Valdizan ', NULL, NULL),
(3168, 'GLORIA', NULL, 'gyclab5@yahoo.es', 'gyclab5@yahoo.es', NULL, '', 0, 'SI', NULL, 'YALE CAJAHUANCA', 'Perú', 'LIMA CENTRO', NULL, '1', '08619389', NULL, '971163110', NULL, NULL, 'Medico', 'DIRIS LIMA CENTRO', NULL, NULL),
(3169, 'ESPERANZA', NULL, 'eca2128@gmail.com', 'eca2128@gmail.com', NULL, '', 0, 'SI', NULL, 'CANCHARI AZAÑERO', 'Perú', 'LIMA ESTE', NULL, '1', '08639235', NULL, '990470642', NULL, NULL, 'Laboratorio Clínico ', 'Hospital Hermilio Valdizan ', NULL, NULL),
(3170, 'MILAGROS DALILA', NULL, 'milysan@yahoo.com', 'milysan@yahoo.com', NULL, 'SI', 0, 'SI', NULL, 'SANCHEZ TORREJON', 'Perú', 'LIMA REGION', NULL, '1', '08581474', NULL, '998557087', NULL, NULL, 'Médico especialista ', 'Esaalud', NULL, NULL),
(3171, 'RONY DANTE', NULL, 'rvillalva@natclar.com.pe', 'rvillalva@natclar.com.pe', NULL, '', 0, 'SI', NULL, 'VILLALVA LI', 'Perú', 'LIMA CENTRO', NULL, '1', '08727967', NULL, '997593649', NULL, NULL, 'medico-cirujano', 'S.G. NATCLAR S.A.C.', NULL, NULL),
(3172, 'JUANA FELICITA', NULL, 'juanahuapaya@yshoo.es', 'juanahuapaya@yshoo.es', NULL, '', 0, 'SI', NULL, 'HUAPAYA MARQUEZ', 'Perú', 'LIMA SUR', NULL, '1', '08751575', NULL, '99964150', NULL, NULL, 'medico cirujano', 'CMI MANUEL BARRETO', NULL, NULL),
(3173, 'EDA ANTONIA', NULL, 'Juanahuapaya@yahoo.es', 'Juanahuapaya@yahoo.es', NULL, '', 0, 'SI', NULL, 'GIRIBALDI MEDINA DE BUSTAMANTE', 'Perú', 'LIMA SUR', NULL, '1', '08761675', NULL, '999641350', NULL, NULL, 'Medico Cirujano ', 'CMI Manuel Barreto ', NULL, NULL),
(3174, 'CAROLA ELIANA EYENITH', NULL, 'Digtel099@minsa.gob.pe', 'Digtel099@minsa.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'CUADROS ABANTO', 'Perú', 'LIMA ESTE', NULL, '1', '08784654', NULL, '942991321', NULL, NULL, 'Ingeniero ', 'Minsa', NULL, NULL),
(3175, 'LISBETH', NULL, 'lisbeth.bustamante@gmail.com', 'lisbeth.bustamante@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'BUSTAMANTE ALVAREZ DE CASMA', 'Perú', 'LIMA REGION', NULL, '1', '08801047', NULL, '998435210', NULL, NULL, 'Enfermera ', 'Essalud- Hospital Nacional Guillermo Almenara Irigoyen ', NULL, NULL),
(3176, 'LIRIA MARIA', NULL, 'liriachunga@gmail.com.pe', 'liriachunga@gmail.com.pe', NULL, 'SI', 0, 'SI', NULL, 'CHUNGA SANCHEZ DE CERNA', 'Perú', 'LIMA CENTRO', NULL, '1', '08854348', NULL, '999481590', NULL, NULL, 'PERIODISTA', 'INSN BREÑA', NULL, NULL),
(3177, 'NORIS JENNY', NULL, 'odonjen1@gmail.com', 'odonjen1@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'SANCHEZ CHIPANA', 'Perú', 'LIMA ESTE', NULL, '1', '09535568', NULL, '973968905', NULL, NULL, 'ODONTOPEDIATRA', 'MINSA/LIMA ESTE// RIS SANTA ANITA/C.S. CHANCAS DE ANDAHUAYLAS ', NULL, NULL),
(3178, 'MONICA DEL CARMEN', NULL, 'mchiang69@hotmail.es', 'mchiang69@hotmail.es', NULL, 'SI', 0, 'SI', NULL, 'CHIANG PEREZ DE ALCALA', 'Perú', 'LIMA CENTRO', NULL, '1', '08874123', NULL, '987957357', NULL, NULL, 'LIC. ENFERMERÍA', 'DIRECCIÓN DE INFOSALUD _ MINSA', NULL, NULL),
(3179, 'JESUS', NULL, 'jpardo02@gmail.com', 'jpardo02@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'PARDO MEZA', 'Perú', 'LIMA CENTRO', NULL, '1', '08999203', NULL, '993025505', NULL, NULL, 'Medico', 'INMP', NULL, NULL),
(3180, 'MANUEL AMADOR', NULL, 'mvicuna@hospitalchosica.gob.pe', 'mvicuna@hospitalchosica.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'VICUÑA BOBY', 'Perú', 'LIMA ESTE', NULL, '1', '09048548', NULL, '997203721', NULL, NULL, 'ingeniero de sistemas', 'HOSPITAL JOSE AGURTO TELLO', NULL, NULL),
(3181, 'PATRICIA ELIZABETH YASMINE', NULL, 'patricia_sosa_hem@hotmail.com', 'patricia_sosa_hem@hotmail.com', NULL, 'SI', 0, '', NULL, 'SOSA LUCICH', 'Perú', 'LIMA ESTE', NULL, '1', '09178984', NULL, '933461809', NULL, NULL, 'TÉCNICO EN ENFERMERÍA', 'Hospital \" Hermilio Valdizan\"', NULL, NULL),
(3182, 'LUZ VICTORIA', NULL, 'czluz.68@gmail.com', 'czluz.68@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CASTILLO ZAMORA', 'Perú', 'LIMA ESTE', NULL, '1', '09225370', NULL, '987700948', NULL, NULL, 'Enfermera ', 'Hospital Hermilio Valdizán ', NULL, NULL),
(3183, 'LUZ ROSARIO', NULL, 'charitohidalgo7@gmail.com', 'charitohidalgo7@gmail.com', NULL, '', 0, 'SI', NULL, 'SALAZAR HIDALGO', 'Perú', 'SAN MARTÍN', NULL, '1', '09225988', NULL, '936382538', NULL, NULL, 'ENFERMERA', 'BANCO DE SANGRE REGIONAL SAN MARTIN', NULL, NULL),
(3184, 'IRENE PETRONILA', NULL, 'llontop992002@yahoo.com', 'llontop992002@yahoo.com', NULL, 'SI', 0, 'SI', NULL, 'LLONTOP GUEVARA', 'Perú', 'LIMA SUR', NULL, '1', '09399931', NULL, '996279997', NULL, NULL, 'Medico intensivista', 'Hospital de emergencias  jose casimiro ulloa', NULL, NULL),
(3185, 'GLADYS ROCIO', NULL, 'gladyssalazar148@gmail.com', 'gladyssalazar148@gmail.com', NULL, 'SI', 0, '', NULL, 'SALAZAR CCAHUANCAMA', 'Perú', 'CALLAO', NULL, '1', '09402662', NULL, '999033279', NULL, NULL, 'Cirujano Dentista', 'DIRESA CALLAO', NULL, NULL),
(3186, 'LUIS ENRIQUE', NULL, 'jakecarito@gmail.com', 'jakecarito@gmail.com', NULL, '', 0, 'SI', NULL, 'MEDEROS DOMINGUEZ', 'Perú', 'LIMA SUR', NULL, '1', '09442299', NULL, '970595030', NULL, NULL, 'Licenciada en Enfermería ', 'Hospital de Emergencia José Casimiro Ulloa ', NULL, NULL),
(3187, 'ROBERTO GONZALO', NULL, 'robfelipa@gmail.com', 'robfelipa@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'FELIPA MOQUILLAZA', 'Perú', 'LIMA CENTRO', NULL, '1', '09446013', NULL, '999879936', NULL, NULL, 'Cirujano Dentista', 'Doris Lima centro ', NULL, NULL),
(3188, 'JULIA ROSA', NULL, 'julia_andrea_3@hotmail.com', 'julia_andrea_3@hotmail.com', NULL, '', 0, 'SI', NULL, 'ACUACHE PEREZ DE LA TORRE', 'Perú', 'LIMA CENTRO', NULL, '1', '09457496', NULL, '991431195', NULL, NULL, 'Medico cirujano ', 'Hospital Santa Rosa ', NULL, NULL),
(3189, 'MILUSKA', NULL, 'milu2870@hotmail.com', 'milu2870@hotmail.com', NULL, 'SI', 0, 'SI', NULL, 'ESTACIO WARTON', 'Perú', 'APURIMAC', NULL, '1', '09489116', NULL, '983689151', NULL, NULL, 'lic. enfermera', 'Hospital Guillermo Díaz de la Vega', NULL, NULL),
(3190, 'EFREN', NULL, 'efren.sanchez.sanchez.7@gmail.com', 'efren.sanchez.sanchez.7@gmail.com', NULL, 'SI', 0, '', NULL, 'SANCHEZ', 'México', 'AMAZONAS', NULL, '1', NULL, NULL, '5615712412', NULL, NULL, 'biomedico', 'CENETEC', NULL, NULL),
(3191, 'CATALINA EUGENIA', NULL, 'eugy2023@hotmail.com', 'eugy2023@hotmail.com', NULL, 'SI', 0, '', NULL, 'COCHACHIN QUINTANA DE NAVENTA', 'Perú', 'CALLAO', NULL, '1', '09606954', NULL, '964759197', NULL, NULL, 'Enfermera emergencista', 'INEN', NULL, NULL),
(3192, 'EDGARDO WILLY', NULL, 'berwillyde@hotmail.com', 'berwillyde@hotmail.com', NULL, 'SI', 0, '', NULL, 'BERMEO VILLALOBOS', 'Perú', 'LIMA NORTE', NULL, '1', '09647213', NULL, '948956482', NULL, NULL, 'Cirujano dentista ', 'DIRIS LIMA NORTE', NULL, NULL),
(3193, 'GLORIA MARIA', NULL, 'GLORIA.MARIA.F@GMAIL.COM', 'GLORIA.MARIA.F@GMAIL.COM', NULL, 'SI', 0, '', NULL, 'FERNANDEZ ALVINES', 'Perú', 'LIMA SUR', NULL, '1', '09661646', NULL, '984405362', NULL, NULL, 'NUTRICIONISTA', 'CS PORTADA DE MANCHAY', NULL, NULL),
(3194, 'NORCA JUANA', NULL, 'empresadecharlas@gmail.com', 'empresadecharlas@gmail.com', NULL, 'SI', 0, '', NULL, 'TAFUR CARBAJAL', 'Perú', 'CALLAO', NULL, '1', '09663196', NULL, '994401279', NULL, NULL, 'psicologa', 'hispital hermilio valdizan', NULL, NULL),
(3195, 'LAURA VERÓNICA', NULL, 'Veronicapicon31@gmail.com', 'Veronicapicon31@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'PICÓN CASTILLO DE VERASTEGUI', 'Perú', 'LIMA CENTRO', NULL, '1', '09669720', NULL, '941482574', NULL, NULL, 'MÉDICO CIRUJANO ', 'MINSA,  CS DANIEL ALCIDES CARRIÓN ', NULL, NULL),
(3196, 'GIALINA FLOR VIOLETA', NULL, 'gtoledo@insn.gob.pe', 'gtoledo@insn.gob.pe', NULL, '', 0, 'SI', NULL, 'TOLEDO MENDEZ', 'Perú', 'LIMA REGION', NULL, '1', '09733921', NULL, '943671222', NULL, NULL, 'ESTADISTICO PROFESIONAL CON MAESTRÍA  EN SALUD PUNLICA COM MENCION EN EPIDEMIOLOGIA ', 'INSTITUTO NACIONAL DE SALUD DEL NIÑO- BREÑA ', NULL, NULL),
(3197, 'RUTH ARACELI', NULL, 'Vgruth@gmail.com', 'Vgruth@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'VARGAS GONZALES', 'Perú', 'LA LIBERTAD', NULL, '1', '18149149', NULL, '992255709', NULL, NULL, 'OBSTETRA', 'HOSPITAL BELEN DE TRUJILLO', NULL, NULL),
(3198, 'BLANCA JAQUELINE', NULL, 'blanca.cardenas@upch.pe', 'blanca.cardenas@upch.pe', NULL, 'SI', 0, 'SI', NULL, 'CÁRDENAS LAZO', 'Perú', 'LIMA NORTE', NULL, '1', '9802675', NULL, '999116071 _ 989038409', NULL, 'PÚBLICA', 'Médico Residente AGS', 'HCH - UPCH', NULL, NULL),
(3199, 'ORLANDO', NULL, 'Orlan_tano@hotmail.com', 'Orlan_tano@hotmail.com', NULL, 'SI', 0, '', NULL, 'LOJA ALVA', 'Perú', 'LIMA ESTE', NULL, '1', '09806647', NULL, '993464828', NULL, NULL, 'Tecnico en Enfermería ', 'Hospital Hermilio Valdizan ', NULL, NULL),
(3200, 'SONIA', NULL, 'soni18chuquilin@gmail.com', 'soni18chuquilin@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'CHUQUILIN CHUQUISANA', 'Perú', 'LIMA NORTE', NULL, '1', '09892453', NULL, '939372387', NULL, NULL, 'Psicologa', 'Buen Pastor', NULL, NULL),
(3201, 'ODALIS MARLENE', NULL, 'odmazaar@gmail.com', 'odmazaar@gmail.com', NULL, 'SI', 0, '', NULL, 'ZAVALETA ARISMENDI', 'Perú', 'LIMA NORTE', NULL, '1', '09895841', NULL, '996216209', NULL, NULL, 'TECNICA DE ENFERMERIA', 'C.M.I JUAN PABLO II', NULL, NULL),
(3202, 'ELISA', NULL, 'elisallanqui19@gmail.com', 'elisallanqui19@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'LLANQUI MOLLINEDO', 'Perú', 'LIMA CENTRO', NULL, '1', '09938050', NULL, '953504796', NULL, NULL, 'TECNÓLOGO MEDICO EN FISIOTERAPIA/TÉCNICO EN ENFERMERÍA ', 'HOSPITAL NACIONAL DOS DE MAYO ', NULL, NULL),
(3203, 'MILAGRITOS MARISOL', NULL, 'grimack5@hitmail.com', 'grimack5@hitmail.com', NULL, 'SI', 0, '', NULL, 'CRUZADO LOPEZ', 'Perú', 'LIMA REGION', NULL, '1', '09964511', NULL, '942999217', NULL, NULL, 'Obstetriz', 'Diresa Lima', NULL, NULL),
(3204, 'EDGAR RENE', NULL, 'ellanosc2012@gmail.gob.pe', 'ellanosc2012@gmail.gob.pe', NULL, 'SI', 0, 'SI', NULL, 'LLANOS CABALLERO', 'Perú', 'LIMA NORTE', NULL, '1', '09966327', NULL, '962934776', NULL, NULL, 'ingeniero de sistemas ', 'MINSA', NULL, NULL),
(3205, 'ISAAC', NULL, 'icapillo@gmail.com', 'icapillo@gmail.com', NULL, '', 0, 'SI', NULL, 'CAPILLO ROJAS', 'Perú', 'LIMA REGION', NULL, '1', '09970970', NULL, '992009283', NULL, NULL, 'Jefe de Sistemas', 'Escuela Superior de Salud Complejo Hospitalario San Pablo', NULL, NULL),
(3206, 'NILDA MARLENI', NULL, 'marlebc02@gmail.com', 'marlebc02@gmail.com', NULL, 'SI', 0, '', NULL, 'BECERRA URETA', 'Perú', 'LIMA NORTE', NULL, '1', '09978734', NULL, '959629887', NULL, NULL, 'Enfermera', 'Minsa', NULL, NULL),
(3207, 'BERNARDETTE ISABEL', NULL, 'bernardette.cotrina@essalud.gob.pe', 'bernardette.cotrina@essalud.gob.pe', NULL, 'SI', 0, '', NULL, 'COTRINA URTEAGA', 'Perú', 'LIMA CENTRO', NULL, '1', '', NULL, '999102321', NULL, 'PÚBLICA', 'Director CENATE', 'ESSALUD PERU', NULL, NULL),
(3208, 'MARIA JOSE', NULL, 'mjletelier@minsal.cl', 'mjletelier@minsal.cl', NULL, '', 0, 'SI', NULL, 'LETELIER', 'Chile', 'OTRO', NULL, '1', '12627756-3', NULL, '\'+56997306336', NULL, NULL, 'cirujano dentista', 'Ministerio de Salud', NULL, NULL),
(3209, 'VALERIA ', NULL, 'eattinese@msal.gov.ar', 'eattinese@msal.gov.ar', NULL, '', 0, 'SI', NULL, 'ATTIANESE', 'Argentina', 'AYACUCHO', NULL, '1', '26734329', NULL, '1134017186', NULL, NULL, 'Referente Nacional de Telesalud', 'Ministerio de Salud Nacion', NULL, NULL),
(3210, 'FABIÁN', NULL, 'fabcal03@hotmail.com', 'fabcal03@hotmail.com', NULL, '', 0, 'SI', NULL, 'CALDERÓN', 'España', 'OTRO', NULL, '1', '73164192L', NULL, '681262013', NULL, NULL, 'Técnico en mantenimiento industrial', 'Grupo Jorge', NULL, NULL),
(3211, 'ELIZABETH', NULL, 'rosario-18-96@hotmail.com', 'rosario-18-96@hotmail.com', NULL, 'SI', 0, '', NULL, 'TABOADA LLAMOCA ', 'Perú', 'LA LIBERTAD', NULL, '1', '7406059w', NULL, '978099040', NULL, NULL, 'Lic. Enfermeria ', 'C.s pusac ', NULL, NULL),
(3212, 'SANDY MARÍA ', NULL, 'sandymaria0920@gmail.com', 'sandymaria0920@gmail.com', NULL, 'SI', 0, 'SI', NULL, 'LLALLICO POBIS ', 'Perú', 'JUNÍN', NULL, '1', '42701977', NULL, '922224421', NULL, 'PRIVADA', 'Médico', 'Independiente ', NULL, NULL),
(3213, 'ROCIO EDITH ', NULL, 'rocioealiaga@hotmail.com', 'rocioealiaga@hotmail.com', NULL, 'SI', 0, '', NULL, 'ALIAGA ALIAGA ', 'Perú', 'LIMA SUR', NULL, '1', NULL, NULL, '954400058', NULL, NULL, 'Enfermera ', 'CSMC 12 DE NOVIEMBRE ', NULL, NULL),
(3214, 'TELESALUD', NULL, 'coordinaciontelesaludnacion@gmail.com', 'coordinaciontelesaludnacion@gmail.com', NULL, '', 0, 'SI', NULL, 'NACION', 'Argentina', 'CALLAO', NULL, '1', '37114512', NULL, '1134017186', NULL, NULL, 'Referente TICs', 'Ministerio de Salud de la Nacion ', NULL, NULL),
(3215, 'NANCY LAURA', NULL, 'salinasnancylaura@gmail.com', 'salinasnancylaura@gmail.com', NULL, '', 0, 'SI', NULL, 'SALINAS ESCOBAR', 'Perú', 'LIMA CENTRO', NULL, '1', '25794156', NULL, '989125748', NULL, NULL, 'Licenciada Enfermeria', 'Hospital Arzobispo Loayza', NULL, NULL),
(3216, 'JESSICA LISSETTE', NULL, 'jl-12v.linares@gmail.com', 'jl-12v.linares@gmail.com', NULL, '', 0, 'SI', NULL, 'VILLANUEVA LINARES', 'Perú', 'LIMA SUR', NULL, '1', '75119583', NULL, '933990149', NULL, NULL, 'biologo', 'instituto peruano de metrologia e innovacion ', NULL, NULL),
(3217, 'SARA', NULL, 'smendoza@apropo.org.pe', 'smendoza@apropo.org.pe', NULL, '', 0, 'SI', NULL, 'MENDOZA LAIMES', 'Perú', 'LIMA CENTRO', NULL, '1', NULL, NULL, '949269513', NULL, NULL, 'OBSTETRA', 'APROPO', NULL, NULL),
(3638, 'FRANK', NULL, NULL, 'franksosa.medicina@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SOSA NUÑEZ', NULL, 'APURIMAC', NULL, '1', '48202027', NULL, '918406283', NULL, NULL, NULL, 'CENTRO DE SALUD AHUAYRO', NULL, NULL),
(3639, 'JESUS MIGUEL', NULL, NULL, 'mijespap@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'PAUCAR PRADO', NULL, 'APURIMAC', NULL, '1', '70307582', NULL, '929608188', NULL, NULL, NULL, 'CENTRO DE SALUD AHUAYRO', NULL, NULL),
(3640, 'HAMER ORLANDO', NULL, NULL, 'hamer.albarran@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ALBARRAN VALDERRAMA', NULL, 'HUAURA', NULL, '1', '70975734', NULL, '939861502', NULL, NULL, NULL, 'THE MED UNIVERSE SACS', NULL, NULL),
(3643, 'NATALIA JENNYFER', NULL, NULL, 'nataliasoteroangeles@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SOTERO ANGELES', NULL, 'JUNIN', NULL, '1', '42165014', NULL, '983839830', NULL, NULL, NULL, 'HOSPITAL FELIX MAYIRCA SOTO', NULL, NULL),
(3644, 'MARDA LUZ', NULL, NULL, 'mardaguerrerogonzales@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GUERRERO GONZALES', NULL, 'JUNIN', NULL, '1', '70896947', NULL, '900939109', NULL, NULL, NULL, 'HOSPITAL FELIX MAYIRCA SOTO', NULL, NULL),
(3645, 'KATHERINE PATRICIA', NULL, NULL, 'katherine.penaromero@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'PEÑA ROMERO', NULL, 'JUNIN', NULL, '1', '70444918', NULL, '945886578', NULL, NULL, NULL, 'HOSPITAL FELIX MAYIRCA SOTO', NULL, NULL),
(3646, 'NENE CESAR', NULL, NULL, 'hygcesar@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'HINOSTROZA GUADALUPE', NULL, 'JUNIN', NULL, '1', '21122152', NULL, '952821666', NULL, NULL, NULL, 'HOSPITAL FELIX MAYIRCA SOTO', NULL, NULL),
(3647, 'KIARA MELISSA', NULL, NULL, 'telesalud@hospitaltarapoto.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'CUDEÑA QUINTEROS', NULL, 'SAN MARTIN', NULL, '1', '70237152', NULL, '948636213', NULL, NULL, NULL, 'HOSPITAL II-2 TARAPOTO', NULL, NULL),
(3648, 'JENIFFER', NULL, NULL, 'telesalud@hospitaltarapoto.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'CASTRE RAMIREZ', NULL, 'SAN MARTIN', NULL, '1', '01147083', NULL, '942855963', NULL, NULL, NULL, 'HOSPITAL II-2 TARAPOTO', NULL, NULL),
(3650, 'WILFREDO ANTONIO', NULL, NULL, 'waob63@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'OLAVE BENITEZ', NULL, 'PUNO', NULL, '1', '06438399', NULL, '950429316', NULL, NULL, NULL, 'HOSPITAL CARLOS MONGE MEDRANO DE JULIACA', NULL, NULL),
(3651, 'MARTHA', NULL, NULL, 'NOTIENE', NULL, 'OTRO', 0, NULL, NULL, 'MATUTE SALAS', NULL, 'LIMA SUR', NULL, '1', '07024922', NULL, '942476625', NULL, NULL, NULL, 'CMI SAN GENARO DE VILLA - CHORRILLOS', NULL, NULL),
(3652, 'MARIN', NULL, NULL, 'AYBARVALENCIAMARIN@GMAIL.COM', NULL, 'OTRO', 0, NULL, NULL, 'AYBAR VALENCIA', NULL, 'ICA', NULL, '1', '40803237', NULL, '956287582', NULL, NULL, NULL, 'CENTRO DE SALUD DE SUNAMPE', NULL, NULL),
(3653, 'KARLA MILAGROS', NULL, NULL, 'Teleconsulta.cssunampe@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CHAVEZ QUISPE', NULL, 'ICA', NULL, '1', '43477817', NULL, '918649465', NULL, NULL, NULL, 'CENTRO DE SALUD DE SUNAMPE', NULL, NULL),
(3654, 'LILÍ NATHALÍ', NULL, NULL, 'Teleconsulta.cssunampe@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'PÉREZ ASTORIA', NULL, 'ICA', NULL, '1', '43888231', NULL, '972459157', NULL, NULL, NULL, 'CENTRO DE SALUD DE SUNAMPE', NULL, NULL),
(3655, 'WENDY', NULL, NULL, 'wendypompilioc@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'POMPILIO CANDIOTTI', NULL, 'HUANCAVELICA', NULL, '1', '09443609', NULL, '967990553', NULL, NULL, NULL, 'HOSPITAL DEPARTAMENTAL DE HUANCAVELICA', NULL, NULL),
(3656, 'JAQUELINE KATIA', NULL, NULL, 'kattiajuradolopez@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'JURADO LOPEZ', NULL, 'HUANCAVELICA', NULL, '1', '41485903', NULL, '971363354', NULL, NULL, NULL, 'HOSPITAL DEPARTAMENTAL DE HUANCAVELICA', NULL, NULL),
(3657, 'NOELIA VANESA', NULL, NULL, 'claudia_10184@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'RAMIREZ ZAVALA', NULL, 'CALLAO', NULL, '1', '08891239', NULL, '980555658', NULL, NULL, NULL, 'HOSPITAL DE REHABILITACION DEL CALLAO', NULL, NULL),
(3659, 'JERCY', NULL, NULL, 'jercy7878@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ROBLES CASTILLO', NULL, 'CALLAO', NULL, '1', '10749610', NULL, '986480189', NULL, NULL, NULL, 'HOSPITAL DE REHABILITACION DEL CALLAO', NULL, NULL),
(3660, 'EMILY MILAGROS', NULL, NULL, 'emilyrequenah@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'REQUENA HIDALGO', NULL, 'CALLAO', NULL, '1', '46085712', NULL, '961803381', NULL, NULL, NULL, 'HOSPITAL DE REHABILITACION DEL CALLAO', NULL, NULL),
(3661, 'DENISSE STEPHANI', NULL, NULL, 'stephanitelesalud@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'LLONTOP GOMEZ', NULL, 'CALLAO', NULL, '1', '43394129', NULL, '932528366', NULL, NULL, NULL, 'HOSPITAL DE REHABILITACION DEL CALLAO', NULL, NULL),
(3666, 'MARIA AMPARO', NULL, NULL, 'ampimeza@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'MEZA ORE', NULL, 'HUANCAVELICA', NULL, '1', '72582832', NULL, '903052372', NULL, NULL, NULL, 'CENTRO DE SALUD CHOCLOCOCHA', NULL, NULL),
(3667, 'JORGE ANTONIO', NULL, NULL, 'MYLANYHIREO127@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SANCHEZ RUA', NULL, 'HUANCAVELICA', NULL, '1', '42616462', NULL, '993205345', NULL, NULL, NULL, 'CENTRO DE SALUD CHOCLOCOCHA', NULL, NULL),
(3668, 'FANNY MILAGROS', NULL, NULL, 'juanceras7@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SILVA SILVA', NULL, 'HUANCAVELICA', NULL, '1', '70555926', NULL, '993495574', NULL, NULL, NULL, 'CENTRO DE SALUD CHOCLOCOCHA', NULL, NULL),
(3669, 'MARIELA', NULL, NULL, 'shinay_44@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SANCHEZ FERRUA', NULL, 'HUANCAVELICA', NULL, '1', '46260069', NULL, '943181670', NULL, NULL, NULL, 'CENTRO DE SALUD CHOCLOCOCHA', NULL, NULL),
(3670, 'DEBORA', NULL, NULL, 'deborasifuentes6@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SIFUENTES ACOSTA', NULL, 'UCAYALI', NULL, '1', '46516658', NULL, '956491212', NULL, NULL, NULL, 'C.S CENTRO AMERICA', NULL, NULL),
(3671, 'ANDREA DEL CARMEN', NULL, NULL, 'andreadcbd@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'BARRIA DAVILA', NULL, 'UCAYALI', NULL, '1', '43809723', NULL, '920226686', NULL, NULL, NULL, 'C.S CENTRO AMERICA', NULL, NULL),
(3672, 'LUISA YUZCELINE', NULL, NULL, 'lunaguirre13@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'NINAQUISPE AGUIRRE', NULL, 'UCAYALI', NULL, '1', '44774071', NULL, '916941024', NULL, NULL, NULL, 'C.S CENTRO AMERICA', NULL, NULL),
(3673, 'NESTOR EDUARDO', NULL, NULL, 'nestor.rb@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'RIVERA BUSTAMANTE', NULL, 'UCAYALI', NULL, '1', '46503201', NULL, '998967217', NULL, NULL, NULL, 'C.S CENTRO AMERICA', NULL, NULL),
(3674, 'ISABEL HERMILA', NULL, NULL, 'TELEMEDICINA.HOSPITALHUARALYSBS@GMAIL.COM', NULL, 'OTRO', 0, NULL, NULL, 'VENEGAS DE GUTIERREZ', NULL, 'LIMA REGIÓN', NULL, '1', '15997000', NULL, '951503240', NULL, NULL, NULL, 'HOSPITAL SAN JUAN BAUTISTA HUARAL', NULL, NULL),
(3675, 'KATHERIN ISABEL', NULL, NULL, 'KATHY0325@GMAIL.COM', NULL, 'OTRO', 0, NULL, NULL, 'ROSALES INOCENTE', NULL, 'LIMA REGIÓN', NULL, '1', '74145738', NULL, '987339809', NULL, NULL, NULL, 'HOSPITAL SAN JUAN BAUTISTA HUARAL', NULL, NULL),
(3676, 'GIOVANNA RUFINA', NULL, NULL, 'giovanna.richard.aranibar@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'RICHARD ARANIBAR', NULL, 'SAN MARTIN', NULL, '1', '41153971', NULL, '950176839', NULL, NULL, NULL, 'HOSPITAL RURAL NUEVA CAJAMARCA', NULL, NULL),
(3677, 'CHRISTIAN', NULL, NULL, 'arenasmoraleschristian@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ARENAS MORALES', NULL, 'SAN MARTIN', NULL, '1', '74948306', NULL, '979630527', NULL, NULL, NULL, 'HOSPITAL RURAL NUEVA CAJAMARCA', NULL, NULL),
(3678, 'KAREN PAOLA', NULL, NULL, 'kperez@continental.edu.pe', NULL, 'OTRO', 0, NULL, NULL, 'PEREZ MARAVI', NULL, 'LIMA', NULL, '1', '41854367', NULL, '964797661', NULL, NULL, NULL, 'UNIVERSIDAD CONTINENTAL', NULL, NULL),
(3679, 'GIOVANNA JACQUELINE', NULL, NULL, 'gosorio@continental.edu.pe', NULL, 'OTRO', 0, NULL, NULL, 'OSORIO ROMERO', NULL, 'LIMA', NULL, '1', '41154307', NULL, '997184424', NULL, NULL, NULL, 'UNIVERSIDAD CONTINENTAL', NULL, NULL),
(3680, 'GABRIELA', NULL, NULL, '09986355@continental.edu.pe', NULL, 'OTRO', 0, NULL, NULL, 'TELLO CAMINO', NULL, 'LIMA', NULL, '1', '09986355', NULL, '945006630', NULL, NULL, NULL, 'UNIVERSIDAD CONTINENTAL', NULL, NULL),
(3681, 'GLORIA HAYDEE', NULL, NULL, '20089751@continental.edu.pe', NULL, 'OTRO', 0, NULL, NULL, 'RIVERA VICTORIA', NULL, 'LIMA', NULL, '1', '20089751', NULL, '964550549', NULL, NULL, NULL, 'UNIVERSIDAD CONTINENTAL', NULL, NULL),
(3682, 'ROSMERY', NULL, NULL, 'roosmery876@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'QUISPE SALVATIERRA', NULL, 'MOQUEGUA', NULL, '1', '44358724', NULL, '994331401', NULL, NULL, NULL, 'EJERCITO DEL PERU', NULL, NULL),
(3683, 'HUGO', NULL, NULL, 'hugoortega_33@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ORTEGA FLORES', NULL, 'MOQUEGUA', NULL, '1', '04430729', NULL, '969478514', NULL, NULL, NULL, 'EJERCITO DEL PERU', NULL, NULL),
(3684, 'CLAUDY', NULL, NULL, 'claudyccalahuille@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CCALAHUILLE TORRES', NULL, 'MOQUEGUA', NULL, '1', '43972719', NULL, '971292999', NULL, NULL, NULL, 'EJERCITO DEL PERU', NULL, NULL),
(3688, 'LILIANA VERONICA', NULL, NULL, 'verito7107@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'VASQUEZ ZARATE', NULL, 'LIMA', NULL, '1', '20039273', NULL, '931228208', NULL, NULL, NULL, 'HOSPITAL MARIA AUXILIADORA', NULL, NULL),
(3689, 'ANDY JEFFERSON', NULL, NULL, 'andynawe@hma.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'NAVARRO WEHSLEY', NULL, 'LIMA', NULL, '1', '45469793', NULL, '948055089', NULL, NULL, NULL, 'HOSPITAL MARIA AUXILIADORA', NULL, NULL),
(3690, 'JACKELINE JANINNA', NULL, NULL, 'ninaji19@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CONDORI JIMENEZ', NULL, 'LIMA', NULL, '1', '40380581', NULL, '937711686', NULL, NULL, NULL, 'HOSPITAL MARIA AUXILIADORA', NULL, NULL),
(3697, 'SOLEDAD DEL PILAR', NULL, NULL, 'solecolomap@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'COLOMA PAVEZ DE AMORIN', NULL, 'UCAYALI', NULL, '1', '44086297', NULL, '947879473', NULL, NULL, NULL, 'IPRESS CLAS SHIRAMBARI', NULL, NULL),
(3698, 'GLORI GILMITH', NULL, NULL, 'nesita34@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GONGORA SAURI DE VENEGAS', NULL, 'UCAYALI', NULL, '1', '00129530', NULL, '961605475', NULL, NULL, NULL, 'IPRESS CLAS SHIRAMBARI', NULL, NULL),
(3699, 'NORCA ELDITH', NULL, NULL, 'vicnat2004@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SIU TANGE', NULL, 'UCAYALI', NULL, '1', '45697360', NULL, '929445300', NULL, NULL, NULL, 'IPRESS CLAS SHIRAMBARI', NULL, NULL),
(3700, 'JOSE ANTONIO', NULL, NULL, 'josequevedolopez34@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'QUEVEDO LOPEZ', NULL, 'UCAYALI', NULL, '1', '41778280', NULL, '995868402', NULL, NULL, NULL, 'IPRESS CLAS SHIRAMBARI', NULL, NULL),
(3702, 'BERTHA RUTH', NULL, NULL, 'rut_escalante_1@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ESCALANTE LAZO', NULL, 'CALLAO', NULL, '1', '07912355', NULL, '985032578', NULL, NULL, NULL, 'IPRESS BELLAVISTA PERÚ COREA', NULL, NULL),
(3703, 'LEDI ELITA', NULL, NULL, 'ledigvnut@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GODOY VILCA', NULL, 'TACNA', NULL, '1', '01340038', NULL, '947795706', NULL, NULL, NULL, 'CENTRO DE SALUD LA ESPERANZA', NULL, NULL),
(3704, 'SHEILA ANNJEANET', NULL, NULL, 'sheilaeguiluz20@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'EGUILUZ ZAVALAGA', NULL, 'TACNA', NULL, '1', '00497375', NULL, '940927997', NULL, NULL, NULL, 'CENTRO DE SALUD LA ESPERANZA', NULL, NULL),
(3705, 'RUTH MERCEDES', NULL, NULL, 'escobarbermejo9@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ESCOBAR BERMEJO', NULL, 'TACNA', NULL, '1', '01316035', NULL, '914389699', NULL, NULL, NULL, 'CENTRO DE SALUD LA ESPERANZA', NULL, NULL),
(3709, 'MARIEL LIRIA', NULL, NULL, 'cenate.coordinacion@essalud.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'MARTINEZ SALAZAR', NULL, 'LIMA', NULL, '1', '72421010', NULL, '941378238', NULL, NULL, NULL, 'CENTRO NACIONAL DE TELEMEDICINA - CENATE', NULL, NULL),
(3710, 'GLADYS MARLENEE', NULL, NULL, 'dazmilia@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ALVARADO PAREDES', NULL, 'CUSCO', NULL, '1', '25012691', NULL, '987724806', NULL, NULL, NULL, 'HOSPITAL REGIONAL DEL CUSCO', NULL, NULL),
(3711, 'MABEL CYRIELLE', NULL, NULL, 'gamacyma@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GAMARRA GOMEZ', NULL, 'CUSCO', NULL, '1', '41571242', NULL, '950738111', NULL, NULL, NULL, 'HOSPITAL REGIONAL DEL CUSCO', NULL, NULL),
(3712, 'ANALI', NULL, NULL, 'analigamarraataulluco@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GAMARRA ATAULLUCO', NULL, 'CUSCO', NULL, '1', '46766765', NULL, '952486669', NULL, NULL, NULL, 'HOSPITAL REGIONAL DEL CUSCO', NULL, NULL),
(3713, 'CARMELA TERESA', NULL, NULL, 'cdonayre@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'DONAYRE MUÑANTE DE MORON', NULL, 'CALLAO', NULL, '1', '25458704', NULL, '995126076', NULL, NULL, NULL, 'IPRESS BELLAVISTA PERÚ COREA', NULL, NULL),
(3714, 'MARIA DEL ROSARIO', NULL, NULL, 'rogutica16@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GUTIERREZ CAMPOS', NULL, 'CALLAO', NULL, '1', '07133997', NULL, '999116289', NULL, NULL, NULL, 'IPRESS BELLAVISTA PERÚ COREA', NULL, NULL),
(3715, 'MELISA LUZ', NULL, NULL, 'hualpa.arango@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'HUALPA ARANGO', NULL, 'ICA', NULL, '1', '70106554', NULL, '920714169', NULL, NULL, NULL, 'HOSPITAL REGIONAL DE ICA', NULL, NULL),
(3716, 'HARRY RAUL', NULL, NULL, 'leveau.bartra@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'LEVEAU BARTRA', NULL, 'ICA', NULL, '1', '21407016', NULL, '956608888', NULL, NULL, NULL, 'HOSPITAL REGIONAL DE ICA', NULL, NULL),
(3717, 'ANA MARIA', NULL, NULL, 'farfan.guerra@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'FARFAN GUERRA', NULL, 'ICA', NULL, '1', '21403655', NULL, '952531669', NULL, NULL, NULL, 'HOSPITAL REGIONAL DE ICA', NULL, NULL),
(3718, 'JUAN RUBEN', NULL, NULL, 'sotomayor.linares@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SOTOMAYOR LINARES', NULL, 'ICA', NULL, '1', '45035619', NULL, '999919064', NULL, NULL, NULL, 'HOSPITAL REGIONAL DE ICA', NULL, NULL),
(3719, 'MABEL MELISA', NULL, NULL, 'mabelmed20@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'MONTESINOS CACERES', NULL, 'CUSCO', NULL, '1', '44289398', NULL, '926058054', NULL, NULL, NULL, 'CENTRO DE SALUD CLAS ANTA', NULL, NULL),
(3720, 'DANAE THALIA', NULL, NULL, 'Danathali28@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'VELASCO ESCALANTE', NULL, 'CUSCO', NULL, '1', '70022960', NULL, '935110418', NULL, NULL, NULL, 'CENTRO DE SALUD CLAS ANTA', NULL, NULL),
(3721, 'YAHAIDA', NULL, NULL, 'quispeyahaida1@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'QUISPE CONCHATUPA', NULL, 'CUSCO', NULL, '1', '40326286', NULL, '935110418', NULL, NULL, NULL, 'CENTRO DE SALUD CLAS ANTA', NULL, NULL),
(3723, 'LICURGO', NULL, NULL, 'arajainala@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'JARA ALANIA', NULL, 'Ucayali', NULL, '1', '23164335', NULL, '993842223', NULL, NULL, NULL, 'MICRO RED NUEVA REQUENA', NULL, NULL),
(3724, 'NOHELY', NULL, NULL, 'nohesoto23@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CRISOLO SOTO', NULL, 'Ucayali', NULL, '1', '70064325', NULL, '918838696', NULL, NULL, NULL, 'MICRO RED NUEVA REQUENA', NULL, NULL),
(3725, 'JONATHAN RUDY', NULL, NULL, 'jonalastrasheputt@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'LASTRA SHEPUTT', NULL, 'Ucayali', NULL, '1', '47717490', NULL, '933874756', NULL, NULL, NULL, 'MICRO RED NUEVA REQUENA', NULL, NULL),
(3726, 'SULIANA', NULL, NULL, 'suliperez03@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'PEREZ SINACAY', NULL, 'Ucayali', NULL, '1', '44247301', NULL, '988727361', NULL, NULL, NULL, 'MICRO RED NUEVA REQUENA', NULL, NULL),
(3727, 'HUGO ZENON', NULL, NULL, 'hugoperfect@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'BALTAZAR GARCIA', NULL, 'JUNÍN', NULL, '1', '44591709', NULL, '973972811', NULL, NULL, NULL, 'HOSPITAL REGIONAL DOCENTE MATERNO INFANTIL EL CARMEN', NULL, NULL),
(3728, 'JOSE TONY', NULL, NULL, 'Jtonytorres@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CASTRO TORRES', NULL, 'JUNÍN', NULL, '1', '44018768', NULL, '953911663', NULL, NULL, NULL, 'HOSPITAL REGIONAL DOCENTE MATERNO INFANTIL EL CARMEN', NULL, NULL),
(3729, 'JAIME ENRIQUE', NULL, NULL, 'telesalud.irennorte19@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CRUZ ZARE', NULL, 'LA LIBERTAD', NULL, '1', '80634763', NULL, '942179166', NULL, NULL, NULL, 'INSTITUTO REGIONAL DE ENFERMEDADES NEOPLÁSICAS DR. LUIS PINILLOS GANOZA - IREN NORTE', NULL, NULL),
(3730, 'RUBY MARCELA', NULL, NULL, 'ruby9370@yahoo.es', NULL, 'OTRO', 0, NULL, NULL, 'GARCIA CHUNGA', NULL, 'PIURA', NULL, '1', '02879058', NULL, '969937091', NULL, NULL, NULL, 'ESTABLECIMIENTO DE SALUD I-4 BERNAL', NULL, NULL),
(3731, 'MERY DE LOS MILAGROS', NULL, NULL, 'meryser17@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'SERNAQUE IMAN', NULL, 'PIURA', NULL, '1', '76260749', NULL, '982499465', NULL, NULL, NULL, 'ESTABLECIMIENTO DE SALUD I-4 BERNAL', NULL, NULL),
(3732, 'MARIBEL DEL JESUS', NULL, NULL, 'maribeltc85@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'TRELLES COVEÑAS', NULL, 'PIURA', NULL, '1', '44549067', NULL, '938221369', NULL, NULL, NULL, 'I-4 LA UNIÓN', NULL, NULL),
(3733, 'MERCEDES ELIZABETH', NULL, NULL, 'prin3cipe@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'FIESTAS INFANTAS', NULL, 'PIURA', NULL, '1', '43174876', NULL, '981921910', NULL, NULL, NULL, 'I-4 LA UNIÓN', NULL, NULL),
(3734, 'NADHIA LILIBETH', NULL, NULL, 'nmendozab@diresalalibertad.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'MENDOZA BRIONES', NULL, 'LA LIBERTAD', NULL, '1', '43677356', NULL, '953677500', NULL, NULL, NULL, 'GERESA LA LIBERTAD', NULL, NULL),
(3735, 'DENISSE ISOLINA', NULL, NULL, 'denisse.cspm@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'VASQUEZ URUETA', NULL, 'LIMA', NULL, '1', '10614879', NULL, '980058399', NULL, NULL, NULL, 'CS PORTADA DE MANCHAY', NULL, NULL),
(3736, 'ELDY NORA', NULL, NULL, 'madeleine_26@outlook.com', NULL, 'OTRO', 0, NULL, NULL, 'MEDINA FIERRO', NULL, 'LIMA', NULL, '1', '20723425', NULL, '961633512', NULL, NULL, NULL, 'CS PORTADA DE MANCHAY', NULL, NULL),
(3737, 'ISABEL', NULL, NULL, 'Isabelgonzalesmelo@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GONZALES MELO', NULL, 'LIMA', NULL, '1', '07888396', NULL, '933985099', NULL, NULL, NULL, 'CS PORTADA DE MANCHAY', NULL, NULL),
(3738, 'JULIO CESAR', NULL, NULL, 'jcmr.3479@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'MOGOLLON RODRIGUEZ', NULL, 'LIMA NORTE', NULL, '1', '40760380', NULL, '953257479', NULL, NULL, NULL, 'DIRIS LIMA NORTE', NULL, NULL),
(3739, 'LUZ MELCHORITA', NULL, NULL, 'jcmr.3479@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CARDENAS ACHATA', NULL, 'LIMA NORTE', NULL, '1', '15437432', NULL, '953257479', NULL, NULL, NULL, 'DIRIS LIMA NORTE', NULL, NULL),
(3740, 'JORGE ANTONIO', NULL, NULL, 'rasito1290@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'AREVALO AREVALO', NULL, 'LIMA NORTE', NULL, '1', '72220876', NULL, '936455087', NULL, NULL, NULL, 'DIRIS LIMA NORTE', NULL, NULL),
(3741, 'IRIS CANDY', NULL, NULL, 'candyjoal10@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'RICOPA SHERADER', NULL, 'UCAYALI', NULL, '1', '41637636', NULL, '995594256', NULL, NULL, NULL, 'DIRECCION REGIONAL DE SALUD UCAYALI', NULL, NULL),
(3742, 'HENDRICK LUCIO', NULL, NULL, 'hlucio_15@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'APOLINARIO BARDALES', NULL, 'UCAYALI', NULL, '1', '70380663', NULL, '923040981', NULL, NULL, NULL, 'DIRECCION REGIONAL DE SALUD UCAYALI', NULL, NULL),
(3744, 'CECILIA LORENA', NULL, NULL, 'cconga@dirislimacentro.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'CONGA ROIRO', NULL, 'LIMA CENTRO', NULL, '1', '45922870', NULL, '950062617', NULL, NULL, NULL, 'DIRECCIÓN DE REDES INTEGRADAS DE SALUD LIMA CENTRO', NULL, NULL),
(3746, 'LUCIA MILAGROS', NULL, NULL, 'lucianita.ob@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'FLORES POMA', NULL, 'JUNÍN', NULL, '1', '46771304', NULL, '980481466', NULL, NULL, NULL, 'CENTRO DE SALUD LA LIBERTAD', NULL, NULL),
(3747, 'ISABEL ELVIRA', NULL, NULL, 'icamargo@uroosevelt.edu.pe', NULL, 'OTRO', 0, NULL, NULL, 'CAMARGO CAMPOS', NULL, 'JUNÍN', NULL, '1', '19957802', NULL, '956838318', NULL, NULL, NULL, 'CENTRO DE SALUD LA LIBERTAD', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(3748, 'PATRICIA GUADALUPE', NULL, NULL, 'pattymoli.san@gmail.con', NULL, 'OTRO', 0, NULL, NULL, 'MOLINA RAMIREZ', NULL, 'JUNÍN', NULL, '1', '42036769', NULL, '947985240', NULL, NULL, NULL, 'CENTRO DE SALUD LA LIBERTAD', NULL, NULL),
(3749, 'NELLY ZENOBIA', NULL, NULL, 'Acuariogala1602@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GASPAR LAUREANO', NULL, 'JUNÍN', NULL, '1', '19919339', NULL, '955503391', NULL, NULL, NULL, 'CENTRO DE SALUD LA LIBERTAD', NULL, NULL),
(3750, 'JOSH GILBERTO', NULL, NULL, 'josh_leon19@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ZEGARRA REATEGUI', NULL, 'UCAYALI', NULL, '1', '45836884', NULL, '970981488', NULL, NULL, NULL, 'IPRESS JOSÉ OLAYA', NULL, NULL),
(3751, 'BETSY LISBET', NULL, NULL, 'angelita467@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GUERRA CELIS DE SECAS', NULL, 'UCAYALI', NULL, '1', '43225019', NULL, '934812327', NULL, NULL, NULL, 'IPRESS JOSÉ OLAYA', NULL, NULL),
(3752, 'KATTYA ELIZABETH', NULL, NULL, 'kat_beautiful35@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'VALERA GARCIA', NULL, 'UCAYALI', NULL, '1', '70659906', NULL, '947512517', NULL, NULL, NULL, 'IPRESS JOSÉ OLAYA', NULL, NULL),
(3753, 'JESUS ERIKSON', NULL, NULL, 'ericksonfslin@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'FASABI SALAS', NULL, 'UCAYALI', NULL, '1', '71339536', NULL, '965980755', NULL, NULL, NULL, 'IPRESS JOSÉ OLAYA', NULL, NULL),
(3754, 'ESSY MILAGROS', NULL, NULL, 'emaradiegue@inen.sld.pe', NULL, 'OTRO', 0, NULL, NULL, 'MARADIEGUE CHIRINOS', NULL, 'LIMA', NULL, '1', '06804381', NULL, '958891619', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE ENFERMEDADES NEOPLÁSICAS', NULL, NULL),
(3755, 'SILVIA ESTHER', NULL, NULL, 'ssegura@inen.sld.pe', NULL, 'OTRO', 0, NULL, NULL, 'SEGURA ZULOAGA', NULL, 'LIMA', NULL, '1', '44041414', NULL, '964242914', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE ENFERMEDADES NEOPLÁSICAS', NULL, NULL),
(3756, 'LADY MAGALY', NULL, NULL, 'lvargas@inen.sld.pe', NULL, 'OTRO', 0, NULL, NULL, 'VARGAS TAIPE', NULL, 'LIMA', NULL, '1', '43669831', NULL, '940781431', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE ENFERMEDADES NEOPLÁSICAS', NULL, NULL),
(3757, 'CHRISTIAN CESAR', NULL, NULL, 'cvargasromero7@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'VARGAS ROMERO', NULL, 'TACNA', NULL, '1', '42876729', NULL, '952397407', NULL, NULL, NULL, 'HOSPITAL HIPOLITO UNANUE DE TACNA', NULL, NULL),
(3758, 'NELSON', NULL, NULL, 'ivana@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'PAZ MORE', NULL, 'PIURA', NULL, '1', '44980571', NULL, '942569992', NULL, NULL, NULL, 'I4 CANCHAQUE', NULL, NULL),
(3759, 'GIANELLA STEFANIE', NULL, NULL, 'gianellastefanie20@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'GARCIA FERNANDEZ', NULL, 'PIURA', NULL, '1', '75075230', NULL, '994185592', NULL, NULL, NULL, 'I4 CANCHAQUE', NULL, NULL),
(3760, 'JHON MILTON', NULL, NULL, 'jrivas1412m@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'RIVAS ALACHE', NULL, 'PIURA', NULL, '1', '44803697', NULL, '975767223', NULL, NULL, NULL, 'I4 CANCHAQUE', NULL, NULL),
(3761, 'YASSER CIRO', NULL, NULL, 'ysullcahuaman@inen.sld.pe', NULL, 'OTRO', 0, NULL, NULL, 'SULLCAHUAMAN ALLENDE', NULL, 'LIMA', NULL, '1', '29638861', NULL, '989205548', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE ENFERMEDADES NEOPLÁSICAS', NULL, NULL),
(3762, 'VICTOR ORLANDO', NULL, NULL, 'vcastro@inen.sld.pe', NULL, 'OTRO', 0, NULL, NULL, 'CASTRO OLIDEN', NULL, 'LIMA', NULL, '1', '09446109', NULL, '992783190', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE ENFERMEDADES NEOPLASICAS INEN', NULL, NULL),
(3763, 'GLORIA ELIZABETH', NULL, NULL, 'draelidiaz@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'DIAZ PEREZ', NULL, 'LIMA', NULL, '1', '29616889', NULL, '996656297', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE ENFERMEDADES NEOPLASICAS INEN', NULL, NULL),
(3764, 'ERIKA EUGENIA', NULL, NULL, 'erimen2001@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'MENDOZA GUARDAMINO', NULL, 'LIMA', NULL, '1', '42161713', NULL, '989328129', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE ENFERMEDADES NEOPLASICAS INEN', NULL, NULL),
(3765, 'ESTEBAN', NULL, NULL, 'menesestaipe2023@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'MENESES TAIPE', NULL, 'HUANCAVELICA', NULL, '1', '40114545', NULL, '984196875', NULL, NULL, NULL, 'C.S PAUCARA', NULL, NULL),
(3766, 'JORGE ANTONIO', NULL, NULL, 'jrevattarosas@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'REVATTA ROSAS', NULL, 'HUANCAVELICA', NULL, '1', '70221275', NULL, '918518349', NULL, NULL, NULL, 'C.S PAUCARA', NULL, NULL),
(3767, 'BETHZABE YURFA', NULL, NULL, 'jrevattarosas@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'QUICHCA AGUIRRE', NULL, 'HUANCAVELICA', NULL, '1', '71979279', NULL, '950091268', NULL, NULL, NULL, 'C.S PAUCARA', NULL, NULL),
(3768, 'LIZBETH ESTEFANI', NULL, NULL, 'jrevattarosas@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'VALLADOLID MENDOZA', NULL, 'HUANCAVELICA', NULL, '1', '77281962', NULL, '917539259', NULL, NULL, NULL, 'C.S PAUCARA', NULL, NULL),
(3769, 'SOLEDAD', NULL, NULL, 'hospitalsicuanisis@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ROJAS PACHECO', NULL, 'CUSCO', NULL, '1', '24695982', NULL, '984877540', NULL, NULL, NULL, 'HOSPITAL ALFREDO CALLO RODRIGUEZ - SICUANI', NULL, NULL),
(3770, 'GRISSEL ERIKA', NULL, NULL, 'hospitalsicuanisis@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'MAMANI CCAMA', NULL, 'CUSCO', NULL, '1', '44105304', NULL, '965003002', NULL, NULL, NULL, 'HOSPITAL ALFREDO CALLO RODRIGUEZ - SICUANI', NULL, NULL),
(3771, 'KARLA', NULL, NULL, 'kaelim29@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ZAVALA VARGAS', NULL, 'CUSCO', NULL, '1', '42807942', NULL, '992428989', NULL, NULL, NULL, 'SAMUE CUSCO', NULL, NULL),
(3772, 'LEO ANTHONY', NULL, NULL, '013200712k@uandina.edu.pe', NULL, 'OTRO', 0, NULL, NULL, 'AVILES ABELLANEDA', NULL, 'CUSCO', NULL, '1', '70669879', NULL, '910772940', NULL, NULL, NULL, 'SAMUE CUSCO', NULL, NULL),
(3773, 'DARIO FRANCISCO', NULL, NULL, 'salkarunadario@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'NAVARRO MENDOZA', NULL, 'CUSCO', NULL, '1', '23818189', NULL, '984006770', NULL, NULL, NULL, 'SAMUE CUSCO', NULL, NULL),
(3774, 'HILDA HILARIA', NULL, NULL, 'hildapillco_k@yahoo.es', NULL, 'OTRO', 0, NULL, NULL, 'PILLCO ORTEGA', NULL, 'CUSCO', NULL, '1', '23919197', NULL, '959214566', NULL, NULL, NULL, 'SAMUE CUSCO', NULL, NULL),
(3775, 'CARLOS MARX', NULL, NULL, 'dra.alexandrafloresvillaca@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'FLORES CHURA', NULL, 'TACNA', NULL, '1', '70460327', NULL, '990806383', NULL, NULL, NULL, 'PUESTO DE SALUD \"LAS YARAS\"', NULL, NULL),
(3777, 'CARMEN OLINDA', NULL, NULL, 'caolalva@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ALCALDE VALDIVIA', NULL, 'AMAZONAS', NULL, '1', '16688803', NULL, '958551825', NULL, NULL, NULL, 'DIRECCIÓN REGIONAL DE SALUD AMAZONAS', NULL, NULL),
(3778, 'YLIANA JOSEFINA', NULL, NULL, 'ylianita30@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'AJALCRIÑA VASQUEZ', NULL, 'CUSCO', NULL, '1', '21864144', NULL, '913632931', NULL, NULL, NULL, 'BELENPAMPA', NULL, NULL),
(3779, 'LOURDES VILMA', NULL, NULL, 'loli3737@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CHAIÑA RUELAS', NULL, 'CUSCO', NULL, '1', '00433608', NULL, '943579785', NULL, NULL, NULL, 'BELENPAMPA', NULL, NULL),
(3780, 'ABEL OLIVER', NULL, NULL, 'aodmandujano@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'DAMIAN MANDUJANO', NULL, 'JUNÍN', NULL, '1', '45596751', NULL, '941751674', NULL, NULL, NULL, 'C.S. PUERTO YURINAKI', NULL, NULL),
(3781, 'GERALDINE ESTEPHANY', NULL, NULL, 'gery_26@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'DELGADO ORTEGA', NULL, 'JUNÍN', NULL, '1', '72023734', NULL, '960718978', NULL, NULL, NULL, 'C.S. PUERTO YURINAKI', NULL, NULL),
(3782, 'VANESA DEL PILAR', NULL, NULL, 'vmanriqueal@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'MANRIQUE ALANIA', NULL, 'JUNÍN', NULL, '1', '46550396', NULL, '945366295', NULL, NULL, NULL, 'UNIDAD EJECUTORA SALUD CHUPACA', NULL, NULL),
(3783, 'MARTHA YESSICA', NULL, NULL, 'berrocalyesi123@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'BERROCAL ESCANDON', NULL, 'JUNÍN', NULL, '1', '42656975', NULL, '960369809', NULL, NULL, NULL, 'UNIDAD EJECUTORA SALUD CHUPACA', NULL, NULL),
(3784, 'JHINA ROXANA', NULL, NULL, 'una_rox91@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'PAYTAN LA ROSA', NULL, 'JUNÍN', NULL, '1', '46899986', NULL, '952309428', NULL, NULL, NULL, 'UNIDAD EJECUTORA SALUD CHUPACA', NULL, NULL),
(3785, 'ANA MARIA', NULL, NULL, 'anita1casas@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CASAS ARCOS', NULL, 'JUNÍN', NULL, '1', '43535072', NULL, '965440451', NULL, NULL, NULL, 'UNIDAD EJECUTORA SALUD CHUPACA', NULL, NULL),
(3786, 'SILVIA', NULL, NULL, 'scusichallco@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CUSI CHALLCO', NULL, 'CUSCO', NULL, '1', '10407152', NULL, '984475098', NULL, NULL, NULL, 'PUESTO DE SALUD HUAROCONDO', NULL, NULL),
(3787, 'CARMEN CONSUELO', NULL, NULL, 'carmencifuentesgranados@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'CIFUENTES GRANADOS', NULL, 'LIMA', NULL, '1', '07724913', NULL, '980090067', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE REHABILITACION \"DRA ADRIANA REBAZ', NULL, NULL),
(3788, 'EDINSON ANGEL', NULL, NULL, 'angel.edbaf@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'BACILIO FLORES', NULL, 'LIMA', NULL, '1', '45613498', NULL, '937100984', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE REHABILITACION \"DRA ADRIANA REBAZ', NULL, NULL),
(3798, 'ZOILA MARITZA', NULL, NULL, 'zyanac@insn.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'YANAC REINOSO DE ZAVALA', NULL, 'LIMA', NULL, '1', '06761071', NULL, '998674678', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE SALUD DEL NIÑO', NULL, NULL),
(3799, 'IVAN MANUEL', NULL, NULL, 'igarcilazo@insn.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'GARCILAZO AMBUKKA', NULL, 'LIMA', NULL, '1', '42835112', NULL, '948549633', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE SALUD DEL NIÑO', NULL, NULL),
(3800, 'FRANCISCO ALBERTO', NULL, NULL, 'fdiazm@insn.gob.pe', NULL, 'OTRO', 0, NULL, NULL, 'DIAZ MANTILLA', NULL, 'LIMA', NULL, '1', '41344776', NULL, '986534197', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE SALUD DEL NIÑO', NULL, NULL),
(3801, 'CYNTHIA YESSENIA', NULL, NULL, 'cynthia.yess.22@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'YARANGO SANCHEZ', NULL, 'LAMBAYEQUE', NULL, '1', '44881793', NULL, '991077155', NULL, NULL, NULL, 'INSTITUTO NACIONAL DE SALUD DEL NIÑO', NULL, NULL),
(3802, 'GRIMANESA SADIT', NULL, NULL, 'astrinio_10@hotmail.com', NULL, 'OTRO', 0, NULL, NULL, 'APARICIO ROMERO', NULL, 'HUANCAVELICA', NULL, '1', '47494100', NULL, '917708508', NULL, NULL, NULL, 'GERENCIA REGIONAL DE SALUD LAMBAYEQUE', NULL, NULL),
(3803, 'HULKIECER', NULL, NULL, 'Kiecer22@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'ARECHE ESCOBAR', NULL, 'HUANCAVELICA', NULL, '1', '71812030', NULL, '940080949', NULL, NULL, NULL, 'GERENCIA REGIONAL DE SALUD LAMBAYEQUE', NULL, NULL),
(3804, 'ROSARIO OFELIA', NULL, NULL, 'rosarioprosopio1@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'PROSOPIO LAZO', NULL, 'HUANCAVELICA', NULL, '1', '43384415', NULL, '951515560', NULL, NULL, NULL, 'GERENCIA REGIONAL DE SALUD LAMBAYEQUE', NULL, NULL),
(3805, 'MARISELA GLORIA', NULL, NULL, 'maglu2104@gmail.com', NULL, 'OTRO', 0, NULL, NULL, 'PORTA ATENCIO', NULL, 'HUANCAVELICA', NULL, '1', '20032553', NULL, '996668020', NULL, NULL, NULL, 'GERENCIA REGIONAL DE SALUD LAMBAYEQUE', NULL, NULL),
(4403, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2', '002107016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4404, NULL, NULL, NULL, 'doctordiegopuerta@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2', '002236423', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4405, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2', '003075272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4406, 'JUANA MARTINA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LAQUI MARQUINA', NULL, NULL, NULL, '1', '00403590', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4407, 'ADELAIDA BELINDA', NULL, NULL, 'adelaidamartinez.diresat@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARTINEZ CHIRI', NULL, NULL, NULL, '1', '00419415', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4408, 'MARIA CECILIA', NULL, NULL, 'mariceh.20@gmail.com', NULL, NULL, 0, NULL, NULL, 'HUAMAN ', NULL, NULL, NULL, '1', '00442014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4409, 'JAIME TOMAS', NULL, NULL, 'cristinallosa@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PINTO DELGADO', NULL, NULL, NULL, '1', '00473442', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4411, 'ALVARO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SAAVEDRA AREVALO', NULL, NULL, NULL, '1', '01121951', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4412, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2', '020230228', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4413, 'HAYDEE', NULL, NULL, 'haydee_leo_22@hotmail.com', NULL, NULL, 0, NULL, NULL, 'COAQUIRA HUANCA DE CASTILLO', NULL, NULL, NULL, '1', '02431433', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4414, 'DIEGO ROLANDO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VENEGAS OJEDA', NULL, NULL, NULL, '1', '03692915', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4415, 'JOSE ANTONIO', NULL, NULL, 'arises_vice@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ARISIS VICE', NULL, NULL, NULL, '1', '03698942', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4416, 'GRACIELA ALEJANDRINA', NULL, NULL, 'Graciela.pp@hotmail.com', NULL, NULL, 0, NULL, NULL, 'PESANTES PASTOR', NULL, NULL, NULL, '1', '06251444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4417, 'EMMA DOROTHI', NULL, NULL, 'edqs.emmita@gmail.com', NULL, NULL, 0, NULL, NULL, 'QUINTANA SIERRA', NULL, NULL, NULL, '1', '06913720', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4418, 'MARIA ROSA', NULL, NULL, 'rossyorozco0620@gmail.com', NULL, NULL, 0, NULL, NULL, 'OROZCO PALOMINO', NULL, NULL, NULL, '1', '06970605', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4419, 'OSCAR PEDRO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'DORADO JARAMILLO', NULL, NULL, NULL, '1', '06990453', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4420, 'LUZ DINA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LAURENCIO MIRABAL', NULL, NULL, NULL, '1', '07213582', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4421, 'ROSA VIOLETA', NULL, NULL, 'violetrosa25@gmail.com', NULL, NULL, 0, NULL, NULL, 'MARTINEZ ALARCON', NULL, NULL, NULL, '1', '07261113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4422, 'GABY DEL CARMEN', NULL, NULL, 'gsr_1409@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SOSA ROJAS', NULL, NULL, NULL, '1', '07263546', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4423, 'LAURA RUTH', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BALDEON SALCEDO', NULL, NULL, NULL, '1', '07370204', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4424, 'FELIX ANDRES', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CACERES SOLIS', NULL, NULL, NULL, '1', '07398622', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4425, 'IRENE', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CALLAN MILLA', NULL, NULL, NULL, '1', '07808747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4426, 'SUSANA MARGARITA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LOPEZ BADURELES', NULL, NULL, NULL, '1', '08108426', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4427, 'MARIA ESTHER', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BENAVENTE DIAZ', NULL, NULL, NULL, '1', '08109426', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4428, 'WALTER', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MANRIQUE PACHECO', NULL, NULL, NULL, '1', '08198426', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4429, 'CESAR AUGUSTO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TIPIAN CORONADO', NULL, NULL, NULL, '1', '08246530', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4430, 'FLOR ANATOLIA', NULL, NULL, 'florMiranda.n@gmail.com', NULL, NULL, 0, NULL, NULL, 'MIRANDA NEYRA', NULL, NULL, NULL, '1', '08685298', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4431, 'ALICIA JESUS', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FERNANDEZ GIUSTI VDA DE PELLA', NULL, NULL, NULL, '1', '09137019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4432, 'GRACIELA ROSARIO', NULL, NULL, 'Charo.davilahp@hotmail.com', NULL, NULL, 0, NULL, NULL, 'DAVILA CORREA', NULL, NULL, NULL, '1', '09165511', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4433, 'JUDITH BEATRIZ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TORRES FLORES', NULL, NULL, NULL, '1', '09273637', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4434, 'MARIA ELENA', NULL, NULL, 'mefo32@gmail.com', NULL, NULL, 0, NULL, NULL, 'FLORES OLIVERA', NULL, NULL, NULL, '1', '09333620', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4435, 'MARTHA ELSA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VILCA JARITA', NULL, NULL, NULL, '1', '09411453', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4436, 'CARROL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VICENTE MATUTE', NULL, NULL, NULL, '1', '09442209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4437, 'RICARDO EFRAIN', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SALAS GALLIQUIO', NULL, NULL, NULL, '1', '09605209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4438, 'CARLOS ALBERTO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALVARADO CHICO', NULL, NULL, NULL, '1', '09675648', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4439, 'SARA PAULINA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MENDOZA LAIMES', NULL, NULL, NULL, '1', '09840837', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4440, 'ALFREDO GIOVANI', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BONIFAZ PANTANI', NULL, NULL, NULL, '1', '09887310', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4441, 'MAGDA BEATRIZ', NULL, NULL, 'magdagarro.09@gmail.com', NULL, NULL, 0, NULL, NULL, 'GARRO GONZALES', NULL, NULL, NULL, '1', '10008588', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4442, 'DONATO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MAMANI MAMANI', NULL, NULL, NULL, '1', '10184208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4443, 'MARTHA ANABELA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'QUISPE CONDORI', NULL, NULL, NULL, '1', '10277777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4444, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '105571111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4445, 'MELINA NOELIA', NULL, NULL, 'gerencia@medica.pe', NULL, NULL, 0, NULL, NULL, 'SALAZAR MERINO', NULL, NULL, NULL, '1', '10805659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4446, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1234567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4447, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '12345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4448, NULL, NULL, NULL, '1234678@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1234678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4449, 'FREDDY OCTAVIO', NULL, NULL, 'fobregon.marco@gmail.com', NULL, NULL, 0, NULL, NULL, 'OBREGON MARCO', NULL, NULL, NULL, '1', '15753985', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4450, 'WILFREDO JAVIER', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GONZALES CASTILLO', NULL, NULL, NULL, '1', '15862771', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4451, 'FRANCISCO ENRIQUE MANUEL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BERROSPI ESPINOZA', NULL, NULL, NULL, '1', '17890703', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4452, 'ROXANA JESUS', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MONTENEGRO GORDILLO', NULL, NULL, NULL, '1', '18213065', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4453, 'DANTI MICHAEL', NULL, NULL, 'd.novoa_2014@outlook.com', NULL, NULL, 0, NULL, NULL, 'NOVOA JACOBO', NULL, NULL, NULL, '1', '18222058', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4454, 'MEDARDO RAFAEL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHUCOS ORTIZ', NULL, NULL, NULL, '1', '20084727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4455, 'LIZ GIOVANA', NULL, NULL, 'giovanacaballero13@gmail.com', NULL, NULL, 0, NULL, NULL, 'CABALLERO GARCIA', NULL, NULL, NULL, '1', '20088949', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4456, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2', '20220802', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4457, 'ELIZABETH ELDY', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CASTRO DE LA CRUZ', NULL, NULL, NULL, '1', '20685792', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4458, 'MARIA YOLANDA', NULL, NULL, 'jor2572@yahoo.es', NULL, NULL, 0, NULL, NULL, 'FELIX ALMEYDA', NULL, NULL, NULL, '1', '21846400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4459, 'ANA KARINA', NULL, NULL, 'akgz.saludfamiliar.eva@gmail.com', NULL, NULL, 0, NULL, NULL, 'GUERRERO ZARATE DE SAN MIGUEL', NULL, NULL, NULL, '1', '22102760', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4460, 'JULIAN', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUAMAN SERRANO', NULL, NULL, NULL, '1', '25408342', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4461, 'MOISES ORLANDO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ORE LLANOS', NULL, NULL, NULL, '1', '25597023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4462, 'ROSA', NULL, NULL, 'rosamr24@gmail.com', NULL, NULL, 0, NULL, NULL, 'MORENO ROJAS', NULL, NULL, NULL, '1', '25710264', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4463, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '28860513', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4464, 'ROCSANA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ZAVALA MENGOA', NULL, NULL, NULL, '1', '29268008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4465, 'LUIS ALBERTO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ESCAPA MUÑOZ', NULL, NULL, NULL, '1', '29603943', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4466, 'JUANA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CCAIHUARE ARIAS', NULL, NULL, NULL, '1', '31034834', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4467, 'VICTOR VICENTE', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VERGARAY BAZAN', NULL, NULL, NULL, '1', '32827695', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4468, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '38476384', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4469, 'RICHARD HENRY', NULL, NULL, 'reynakarinace.08@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ PRINCIPE', NULL, NULL, NULL, '1', '40414469', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4470, 'JACK O\'NEAL', NULL, NULL, 'traumapostcanasta@gmail.com', NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ ROQUE', NULL, NULL, NULL, '1', '40448490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4471, 'MILAGROS CECILIA', NULL, NULL, 'Milagritos200x@gmail.com', NULL, NULL, 0, NULL, NULL, 'LOPEZ CORAL DE SILVA', NULL, NULL, NULL, '1', '40558170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4472, 'KATIA IVONNE', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CABALLERO ATENCIO', NULL, NULL, NULL, '1', '40781909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4473, 'JUAN MARTIN', NULL, NULL, 'martinb_18@hotmail.com', NULL, NULL, 0, NULL, NULL, 'BERNUY SALCEDO', NULL, NULL, NULL, '1', '41229553', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4474, 'ANAIDA HOLENCA', NULL, NULL, 'Olenka_s_c@hotmail.com', NULL, NULL, 0, NULL, NULL, 'SARMIENTO CARPIO', NULL, NULL, NULL, '1', '41479065', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4475, 'CAROLINA', NULL, NULL, 'ramirezocarol2407@gmail.com', NULL, NULL, 0, NULL, NULL, 'RAMIREZ OSORES', NULL, NULL, NULL, '1', '41578899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4476, 'MARITZA', NULL, NULL, 'maritzallm@hotmail.com', NULL, NULL, 0, NULL, NULL, 'LLANQUE MOLLINEDO', NULL, NULL, NULL, '1', '41733480', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4477, 'DANMER', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CIEZA DELGADO', NULL, NULL, NULL, '1', '41857129', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4478, 'ELIZABETH BARBARA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BENITES BACA', NULL, NULL, NULL, '1', '41857500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4479, 'LEONARDO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ORDUÑA PAZOS', NULL, NULL, NULL, '1', '42186986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4480, 'MIGUEL SEBASTIAN', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'EGOAVIL AYALA', NULL, NULL, NULL, '1', '42188165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4481, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '42404', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4482, 'DOMITILA PRISILA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHAVEZ AMADO', NULL, NULL, NULL, '1', '42495336', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4483, 'ANGIE CLARA', NULL, NULL, 'angiecpu2019@gmail.com', NULL, NULL, 0, NULL, NULL, 'PACHECO URBINA DE LUPINACCI', NULL, NULL, NULL, '1', '42576936', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4484, 'RAFAEL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'NEYRA AVILES', NULL, NULL, NULL, '1', '42861246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4485, 'FRANCESCA GIULIANA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TARAZONA OBREGON', NULL, NULL, NULL, '1', '42986189', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4486, 'MILAGROS', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ORMACHEA ARAUCO', NULL, NULL, NULL, '1', '43180208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4487, 'DIANA ARGENTINA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SUPO SANCHEZ', NULL, NULL, NULL, '1', '43239095', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4488, 'MARCO ANTONIO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUERTA HUERTA', NULL, NULL, NULL, '1', '43260875', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4489, 'EVELIN GRACIELA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PONCE ARAMBURU', NULL, NULL, NULL, '1', '43327807', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4490, 'ANALI', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RAMOS BAUTISTA', NULL, NULL, NULL, '1', '43914248', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4491, 'ARTURO MANUEL WASHINGTON', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'NUÑEZ CASTILLO', NULL, NULL, NULL, '1', '43920725', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4492, 'FIORELLA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MENDEZ TOLEDO', NULL, NULL, NULL, '1', '44111469', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4493, 'RILA AURELIA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SALDAÑA DELGADO', NULL, NULL, NULL, '1', '44247646', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4494, 'IVANNA DANIELLA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ROMERO LAZO', NULL, NULL, NULL, '1', '44459788', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4495, 'MICHEEL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'OLANO DAGA', NULL, NULL, NULL, '1', '44545661', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4496, 'JENNY MARTHA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHIRINOS SAIRE', NULL, NULL, NULL, '1', '44561082', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4497, 'MAYRA PATRICIA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALVAREZ ECHEGARAY', NULL, NULL, NULL, '1', '44777440', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4498, 'GINA MELISSA', NULL, NULL, 'Yanethgonzaf4@gmail.com', NULL, NULL, 0, NULL, NULL, 'CONDORI CHAVEZ', NULL, NULL, NULL, '1', '44800646', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4499, 'JOSE WILDER', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GARCIA ABAD', NULL, NULL, NULL, '1', '44897031', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4500, 'RICARDO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHOQUEMAQUE CCOLLQUE', NULL, NULL, NULL, '1', '44993347', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4501, 'DIEGO ARTURO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CASTRO GARRO', NULL, NULL, NULL, '1', '45594286', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4502, 'JACKELINE', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ESTELA CORONEL', NULL, NULL, NULL, '1', '45600749', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4503, 'ESTEFANNY MARISELA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BOTIQUIN CURO', NULL, NULL, NULL, '1', '45715550', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4504, 'ALLEN JULIO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ESTELA COTRINA', NULL, NULL, NULL, '1', '46795143', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4505, 'BRUNO ROMAN', NULL, NULL, 'bbravoc1601@gmail.com', NULL, NULL, 0, NULL, NULL, 'BRAVO CABRERA', NULL, NULL, NULL, '1', '46881784', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4506, 'YULIANA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'URETA POMA', NULL, NULL, NULL, '1', '47149719', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4507, 'EDITH YENNYFER', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BARRUETA GARAMENDI', NULL, NULL, NULL, '1', '47220949', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4508, 'JESSE MAX', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SANCHEZ VARGAS', NULL, NULL, NULL, '1', '47343219', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4509, 'CARLOS ENRIQUE', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MESTANZA OSTOLAZA', NULL, NULL, NULL, '1', '47469707', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4510, 'PEDRO ALFONSO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUTIERREZ RAMOS', NULL, NULL, NULL, '1', '47469797', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4511, 'NATALIA ALEJANDRA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SALAS ARIAS', NULL, NULL, NULL, '1', '47527466', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4512, 'KEVIN SANTLY', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MARTEL VASQUEZ', NULL, NULL, NULL, '1', '47958833', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4513, 'MAYRA MILAGROS', NULL, NULL, 'eyusly@gmail.com', NULL, NULL, 0, NULL, NULL, 'CHAMPI DAMIAN', NULL, NULL, NULL, '1', '48165825', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4514, 'SANDRA MELISSA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SANTOS MENDOZA', NULL, NULL, NULL, '1', '48333703', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4515, 'KARINA YENNIFFER', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ CERVANTES', NULL, NULL, NULL, '1', '49001553', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4516, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '49159789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4517, NULL, NULL, NULL, 'linitaff28@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '6338133', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4518, 'FREDY YONY', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUACASI ROQUE', NULL, NULL, NULL, '1', '70062991', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4519, 'OSCAR FRANCISCO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RAMOS PRETEL', NULL, NULL, NULL, '1', '70081536', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4520, 'LUCERO DEL CARMEN', NULL, NULL, 'Lucero_1109@hotmail.com', NULL, NULL, 0, NULL, NULL, 'ESPINOZA LEVANO', NULL, NULL, NULL, '1', '70103150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4521, 'ALESSANDRA KARINNA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MARRO RUIZ', NULL, NULL, NULL, '1', '70143679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4522, 'OMAR ALEXANDER', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PEÑA LAURENCIO', NULL, NULL, NULL, '1', '70675365', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4523, 'NURIA AKEMI', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SHIRAKAWA APAC', NULL, NULL, NULL, '1', '70680130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4524, 'VALERIA FERNANDA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'AUQUI CHAMANA', NULL, NULL, NULL, '1', '71395446', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4525, 'VÍCTOR GABRIEL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ARTEAGA HUANCA', NULL, NULL, NULL, '1', '71434355', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4526, 'HITLER LENIN', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CONTRERAS CARBAJAL', NULL, NULL, NULL, '1', '71453507', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4527, 'ALEJANDRA ROSA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ARANA CHIANG', NULL, NULL, NULL, '1', '71465878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4528, 'CESAR RAI', NULL, NULL, 'ce7ar.jr@gmail.com', NULL, NULL, 0, NULL, NULL, 'CAJACHAGUA ROBLES', NULL, NULL, NULL, '1', '71701807', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4529, 'JOSE ALBERTO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CASTILLO CASTAÑEDA', NULL, NULL, NULL, '1', '71711456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4530, 'MARCO ANTONIO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'URBANO SALVADOR', NULL, NULL, NULL, '1', '72421020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4531, 'MAURICIO DANIEL', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SIFUENTES LLATAS', NULL, NULL, NULL, '1', '72748629', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4532, 'JEAN PIERRE', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VELASQUEZ RODRIGUEZ', NULL, NULL, NULL, '1', '72874366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4533, 'CAROLINA GLORIA', NULL, NULL, 'Lazo.glc07@gmail.com', NULL, NULL, 0, NULL, NULL, 'LAZO CRESPO', NULL, NULL, NULL, '1', '73073646', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4534, 'BRAD EDGAR', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUZMAN CHANCA', NULL, NULL, NULL, '1', '73198810', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4535, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '7399910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4536, 'DIEGO DANILO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GAYOSO LIVIAC', NULL, NULL, NULL, '1', '73999104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4537, 'HILDE GUSTAVO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'REBAZA SANCHEZ', NULL, NULL, NULL, '1', '74048895', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4538, 'JACKELYN YANETH', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ROJAS FLORES', NULL, NULL, NULL, '1', '74347453', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4539, 'JOSE ALFREDO', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'REYES VELASQUEZ', NULL, NULL, NULL, '1', '75075938', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4540, 'XIOMARA NOEMI', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PILLACA ALARCON', NULL, NULL, NULL, '1', '75234320', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4541, 'SANDRA BRILLY', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MEDINA CASTILLO', NULL, NULL, NULL, '1', '75424833', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4542, NULL, NULL, NULL, 'aoshita96@gmail.com', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '75910266', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4543, 'ALEXANDER MARLON', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PAREDES ARELLANO', NULL, NULL, NULL, '1', '76075938', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4544, 'GLOROALDO GERSON', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MARTINEZ SALAZAR', NULL, NULL, NULL, '1', '76593769', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4545, 'JOSEPHIN VALERIA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VASQUEZ ANDRADE', NULL, NULL, NULL, '1', '76806462', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4546, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '945897310', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4547, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '98377', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4548, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '9840837', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4549, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'FONC750904MGRLRR02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4550, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'M59923493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4551, 'BLANCA JAQUELINE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARDENAS LAZO', NULL, NULL, NULL, '1', '09802675', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4552, 'MARIA ESTHER\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SALDAÑA CULQUIMBOZ DE AYESTA', NULL, NULL, NULL, '1', '09479953', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4553, 'GUILLERMO ALFREDO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MURO CABRERA', NULL, NULL, NULL, '1', '45647042', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4554, 'JOSE ANGEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PAMPA MAMANI', NULL, NULL, NULL, '1', '09568537', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4555, 'REGINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MAMANI HUANCA', NULL, NULL, NULL, '1', '42663662', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4556, 'LUIS GERMAN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORDERO MUÑOZ', NULL, NULL, NULL, '1', '07232783', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4557, 'SOLEDAD\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHUSI CONDORI', NULL, NULL, NULL, '1', '47541212', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4558, 'NAYARA ISABEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ROMERO VELA', NULL, NULL, NULL, '1', '72924388', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4559, 'GLEEN MARELIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'IZQUIERDO INFANTE', NULL, NULL, NULL, '1', '70088954', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4560, 'LUCIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'QUISPE HILASACA', NULL, NULL, NULL, '1', '02391620', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4561, 'MERIDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SANTOS CHAFALOTE', NULL, NULL, NULL, '1', '10312437', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4562, 'LUIS MANUEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHUQUIHUARA TORIBIO', NULL, NULL, NULL, '1', '42193316', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4563, 'BENJAMIN JIUSMAR\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'JIMENEZ COLQUEHUANCA', NULL, NULL, NULL, '1', '70420479', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4564, 'JEAN FRANCO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHAVEZ SILVA', NULL, NULL, NULL, '1', '74758153', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4565, 'JORGE LUIS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RUIZ PAYANO', NULL, NULL, NULL, '1', '08356173', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4566, 'CYNTIA MAGGIE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LLACSA MERMA', NULL, NULL, NULL, '1', '46740840', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4567, 'YAMPIER ALCIBIADES\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PATIÑO SANCHEZ', NULL, NULL, NULL, '1', '43705850', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4568, 'OLGA NILA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ROSAS SALVADOR', NULL, NULL, NULL, '1', '47120893', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4569, 'OLGA CRISTINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ARCE IÑIGO', NULL, NULL, NULL, '1', '23275078', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4570, 'RUTH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUZMAN ORE', NULL, NULL, NULL, '1', '41260666', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4571, 'BELIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'JIHUALLANCA HUANCA', NULL, NULL, NULL, '1', '43797459', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4572, 'JORGE LUIS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'IPARRAGUIRRE CHERRE', NULL, NULL, NULL, '1', '70017278', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4573, 'WILLIAM JOEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'QUISPE MEZA', NULL, NULL, NULL, '1', '20679004', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4574, 'ALISSON GIANELLI\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PAREDES CRUZADO', NULL, NULL, NULL, '1', '73964158', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4575, 'ROGER LINO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MERCADO ROJAS', NULL, NULL, NULL, '1', '44198397', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4576, 'ROSIO DEL ROSARIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ZEGARRA CARO', NULL, NULL, NULL, '1', '16636718', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4577, 'LYDIA ISABEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PARIONA QUINCHUA', NULL, NULL, NULL, '1', '09424336', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4578, 'VIRGINIA MARIANELA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ARONI MEJIA', NULL, NULL, NULL, '1', '15619121', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4579, 'CLAUDIA MIRELLA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'DIAZ PINEDO', NULL, NULL, NULL, '1', '46318122', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4580, 'LUIS CERVANDO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RIVAS PATIÑO', NULL, NULL, NULL, '1', '46608397', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4581, 'ALEXANDRA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SEQUEIROS ROJAS', NULL, NULL, NULL, '1', '72677920', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4582, 'ARMIDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'APAZA QUISPE', NULL, NULL, NULL, '1', '45568790', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4583, 'ELIZABETH ROCIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORREA COLONIO', NULL, NULL, NULL, '1', '41781876', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4584, 'ARTURO ELIAS ALEXEI\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'EGOCHEAGA DIAZ', NULL, NULL, NULL, '1', '41511135', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4585, 'ERIKA YNES\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MARRUJO BAYLON', NULL, NULL, NULL, '1', '41397563', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4586, 'CARLA JIMENA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CASTRO GOMERO', NULL, NULL, NULL, '1', '70450629', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4587, 'MARYORI DE YANIRA FIDELA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TERRY RODRIGUEZ', NULL, NULL, NULL, '1', '47919033', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4588, 'ROSA VICTORIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'JUAREZ YACTAYO', NULL, NULL, NULL, '1', '23004698', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4589, 'HEATHER DAPHNE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RODRIGUEZ SEGUIN', NULL, NULL, NULL, '1', '72704424', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4590, 'GLORIA CASANDRA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ZEVALLOS HUARHUA', NULL, NULL, NULL, '1', '70865392', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4591, 'DANIEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BLACIDO CESPEDES', NULL, NULL, NULL, '1', '40266448', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4592, 'DORIS JOSEFINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORTEZ JUNCHAYA', NULL, NULL, NULL, '1', '25692190', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4593, 'LUIS ALBERTO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARDOZA CASTRO', NULL, NULL, NULL, '1', '06141198', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4594, 'SONIA MARGARITA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ROJAS MARIN', NULL, NULL, NULL, '1', '08082091', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4595, 'NATALI CRISTINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARDOZA ROJAS', NULL, NULL, NULL, '1', '70587182', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4596, 'LUIS ANGEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARDOZA ROJAS', NULL, NULL, NULL, '1', '71729616', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4597, 'ROLANDO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARDOZA CASTRO', NULL, NULL, NULL, '1', '17891240', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4598, 'PEDRO FRANCISCO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MENDOZA SAUÑI', NULL, NULL, NULL, '1', '41606262', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4599, 'MICHAEL BORIS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'DIAZ QUISPE', NULL, NULL, NULL, '1', '43316497', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4600, 'ROSARIO ISABEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'JIMENEZ MINAYA', NULL, NULL, NULL, '1', '40679260', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4601, 'ANGELICA KATHERINE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SILVA QUISPE', NULL, NULL, NULL, '1', '45842240', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4602, 'LESLIE YESENIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CRUZ PRECIADO', NULL, NULL, NULL, '1', '45843202', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4603, 'THOMAS PERCY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BALLON HENDERSON', NULL, NULL, NULL, '1', '07794070', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4604, 'GLADYS MILAGROS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUZMAN GONZALES', NULL, NULL, NULL, '1', '45969864', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4605, 'CLAUDIA FIORELLA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CERVERA DOMINGUEZ', NULL, NULL, NULL, '1', '43364256', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4606, 'ANIE MILAGROS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MARTINEZ LLAMOCA', NULL, NULL, NULL, '1', '70973730', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4607, 'SHIRLEY YESENIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FLORES VELASQUEZ', NULL, NULL, NULL, '1', '70373466', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4608, 'ROSA DE GUADALUPE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BEDOYA SANDOVAL', NULL, NULL, NULL, '1', '09329323', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4609, 'DIANA ISABEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RIOS MAMANI', NULL, NULL, NULL, '1', '46449009', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4610, 'ANTONIO ALFREDO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VALDEZ FOLCO', NULL, NULL, NULL, '1', '41773286', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4611, 'ROSA MARIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MAMANI CRUZ', NULL, NULL, NULL, '1', '29364017', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4612, 'MARCOS JULIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SAAVEDRA MUÑOZ', NULL, NULL, NULL, '1', '08475050', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4613, 'ADU GRAY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GARAMENDI AYALA', NULL, NULL, NULL, '1', '40406164', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4614, 'CLORINDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LACHIRA SANDOVAL', NULL, NULL, NULL, '1', '03892313', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4615, 'MARTHA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CAPANI PAITAN', NULL, NULL, NULL, '1', '41733840', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32');
INSERT INTO `users` (`id`, `name`, `nombre_pila`, `email`, `correo_invitado`, `email_verified_at`, `password`, `is_superadmin`, `remember_token`, `id_tipo_user`, `apellidos`, `pais`, `region`, `foto_perfil`, `tipo_documento`, `nro_documento`, `sexo`, `celular`, `fecha_nacimiento`, `institucion_publica_privada`, `profesion`, `institucion`, `created_at`, `updated_at`) VALUES
(4616, 'DAYANA SODERLAN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GALVEZ ORMEÑO', NULL, NULL, NULL, '1', '77691359', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4617, 'AUREA AGRIPINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PEREZ CUBAS', NULL, NULL, NULL, '1', '08177712', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4618, 'GEOVANNA NEYDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PACHECO GARIBALDI', NULL, NULL, NULL, '1', '40899510', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4619, 'DARMA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CCOÑISLLA ZAVALA', NULL, NULL, NULL, '1', '06251689', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4620, 'PEDRO JONEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RIPALDA RAMIREZ', NULL, NULL, NULL, '1', '42754240', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4621, 'MAFFER CORAYMA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PEÑA SALAZAR', NULL, NULL, NULL, '1', '74040592', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4622, 'YOBANA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CAÑARI LATORRE', NULL, NULL, NULL, '1', '48427631', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4623, 'JESUS BRUNO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SIMON TRUYENQUE', NULL, NULL, NULL, '1', '43603556', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4624, 'EDVI CHRISTIAN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GAMBOA QUISPE', NULL, NULL, NULL, '1', '46416947', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4625, 'FABIOLA PATRICIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HO MONSALVE', NULL, NULL, NULL, '1', '47187915', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4626, 'SUHAM YOLANDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HURTADO HORTA', NULL, NULL, NULL, '1', '71931847', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4627, 'MARITZA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CAPCHA ROJAS', NULL, NULL, NULL, '1', '09788104', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4628, 'ANGEL MIGUEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GARCIA BALLESTEROS', NULL, NULL, NULL, '1', '07446971', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4629, 'JONATHAN HEDER\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SANCHEZ CHAVEZ', NULL, NULL, NULL, '1', '43172701', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4630, 'MONICA ALEXANDRA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORDOVA LINARES', NULL, NULL, NULL, '1', '08169970', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4631, 'MARIBEL CRISTINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'QUISPIALAYA COSME', NULL, NULL, NULL, '1', '45188832', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4632, 'YSABEL TERESA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'NEYRA CACERES', NULL, NULL, NULL, '1', '42379573', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4633, 'KARINA SANDY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MEGO AQUIJE', NULL, NULL, NULL, '1', '46078840', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4634, 'KARINA IVETTE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'YAÑEZ ARICA DE CORDOVA', NULL, NULL, NULL, '1', '25789515', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4635, 'MARIA CRISTINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARRILLO HORQQUE', NULL, NULL, NULL, '1', '10379641', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4636, 'FLOR BEMILDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARRASCO NEIRA', NULL, NULL, NULL, '1', '43186265', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4637, 'ROSA AMELIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TUESTA TAFUR', NULL, NULL, NULL, '1', '47456004', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4638, 'PIERO LEONARDO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FERNANDEZ CUELLAR', NULL, NULL, NULL, '1', '41550548', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4639, 'VIRGINIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SILVA JARA', NULL, NULL, NULL, '1', '06712886', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4640, 'NORMA LUZ\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GOMEZ LOPEZ', NULL, NULL, NULL, '1', '09844440', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4641, 'THALIA YOSSELYN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PUJAY JARA', NULL, NULL, NULL, '1', '47547409', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4642, 'HELMWARICK MARCO EMERSON\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FLORES CALLE', NULL, NULL, NULL, '1', '73759256', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4643, 'DORIS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALARCON OCHOA DE ORTIZ', NULL, NULL, NULL, '1', '44369749', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4644, 'XIOMARA ROCIO ANTONELLA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TOVAR MALASQUEZ', NULL, NULL, NULL, '1', '72890914', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4645, 'JEAN FRANCOIS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MALDONADO SANCHEZ', NULL, NULL, NULL, '1', '46730175', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4646, 'MARTIN ALBERTO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MUÑOZ SUAREZ', NULL, NULL, NULL, '1', '22088563', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4647, 'ERWIN FRANKLIN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TEJADA SANCHEZ', NULL, NULL, NULL, '1', '44728290', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4648, 'DAVID ARNALDO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'DURAND VELASQUEZ', NULL, NULL, NULL, '1', '40692865', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4649, 'TEODOCIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ORTEGA ZEGARRA', NULL, NULL, NULL, '1', '29515615', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4650, 'LUISA TERESA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PISCONTE PEÑA', NULL, NULL, NULL, '1', '21425618', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4651, 'MARLENE CORALI\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARDENAS CANALES', NULL, NULL, NULL, '1', '25778549', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4652, 'GEORGINA ELIZABETH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'QUINTANA DAVILA', NULL, NULL, NULL, '1', '25752854', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4653, 'CRISTINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CUYAN FERNANDEZ', NULL, NULL, NULL, '1', '40600414', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4654, 'MARIA ELENA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUAROCC MEDINA', NULL, NULL, NULL, '1', '70432221', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4655, 'CINTHIA DEL SOCORRO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'NAVARRO SANCHEZ', NULL, NULL, NULL, '1', '41594078', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4656, 'NARDA EUDOCIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GARATE SOTO', NULL, NULL, NULL, '1', '01222177', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4657, 'KAREM PATRICIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SALINAS CAMUS DE ADAM', NULL, NULL, NULL, '1', '10303107', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4658, 'JOSE ANTONIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORONADO DIAZ', NULL, NULL, NULL, '1', '40669988', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4659, 'ZULMA ANA FLAVIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'JUAREZ ALVARADO', NULL, NULL, NULL, '1', '70275312', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4660, 'HAYDEE VIOLETA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TARRILLO VEGA', NULL, NULL, NULL, '1', '40522088', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4661, 'NELLY MILUSKA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CASTILLO SEVILLA', NULL, NULL, NULL, '1', '40662132', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4662, 'LARRY IVAN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'DEL RIO ALTAMIRANO', NULL, NULL, NULL, '1', '21877118', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4663, 'RUTH ALEJANDRINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORREA HUAYAN', NULL, NULL, NULL, '1', '18053749', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4664, 'MARIA MAGALY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ONCOY TOLEDO', NULL, NULL, NULL, '1', '40231534', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4665, 'MIRELLI KARINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VALDIVIA OCHOA', NULL, NULL, NULL, '1', '71578727', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4666, 'BERNARDINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ANTEZANA PACCORI', NULL, NULL, NULL, '1', '23561184', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4667, 'LUIS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALVITES QUISPE', NULL, NULL, NULL, '1', '21529617', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4668, 'MARITZA LIDUVINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TASAYCO MUÑOZ', NULL, NULL, NULL, '1', '21780121', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4669, 'JOSEPH CARLOS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VARGAS TORRES', NULL, NULL, NULL, '1', '43687819', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4670, 'KAREN GIOVANNA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BRICEÑO CARPIO DE NUÑEZ', NULL, NULL, NULL, '1', '09612007', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4671, 'ALBERTO ENRIQUE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CAYAN MARROQUIN', NULL, NULL, NULL, '1', '18131855', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4672, 'CARMEN MIRIELA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SANCHEZ ANDRADE', NULL, NULL, NULL, '1', '41243494', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4673, 'RICARDO VIRGILIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GARCIA AQUINO', NULL, NULL, NULL, '1', '16154887', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4674, 'JOSE RAMIRO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MENDOZA ZEVALLOS', NULL, NULL, NULL, '1', '10475459', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4675, 'MIRIAM YOLA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COILA HUARICALLO', NULL, NULL, NULL, '1', '44119424', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4676, 'NEPHTALI VENANCIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HOLGADO FRISANCHO', NULL, NULL, NULL, '1', '06441275', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4677, 'KAYLI NOELIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SANTAMARIA PENADILLO', NULL, NULL, NULL, '1', '70155560', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4678, 'CARMEN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ROJAS JULIAN', NULL, NULL, NULL, '1', '10714468', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4679, 'YOSHY IRINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'REYES TORREJON', NULL, NULL, NULL, '1', '41468090', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4680, 'MARIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUAMANI CISNEROS', NULL, NULL, NULL, '1', '28308970', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4681, 'WALTER DAVID\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'COSME RAMOS', NULL, NULL, NULL, '1', '41850301', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4682, 'GROVER MARCO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MACHACUAY DOMINGUEZ', NULL, NULL, NULL, '1', '44429314', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4683, 'CARMEN ELIZABETH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PÉREZ GÓMEZ', NULL, NULL, NULL, '1', '73482721', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4684, 'DARWIN FEDERICO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'QUEVEDO QUENECHE', NULL, NULL, NULL, '1', '80226687', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4685, 'SONIA ELISABETH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VASQUEZ GUERRA', NULL, NULL, NULL, '1', '08569696', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4686, 'JULIO CESAR\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CANCHIS GUZMAN', NULL, NULL, NULL, '1', '08402662', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4687, 'DANIEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BERRU AGUILAR', NULL, NULL, NULL, '1', '42274091', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4688, 'SANDRA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARO MERCADO', NULL, NULL, NULL, '1', '44418567', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4689, 'ANGIE MADELAINE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GARCIA HANCCO', NULL, NULL, NULL, '1', '48051287', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4690, 'LIZBETH VIOLETA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LUJAN MEDINA', NULL, NULL, NULL, '1', '40282426', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4691, 'EDGAR ELLIOT\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALFARO MALDONADO', NULL, NULL, NULL, '1', '42226093', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4692, 'CYNTHIA ANAHI\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'APAZA PALOMINO', NULL, NULL, NULL, '1', '45654447', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4693, 'JHONNY ORLANDO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TELLO QUICHE', NULL, NULL, NULL, '1', '44063747', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4694, 'EDWARD CHRISTIAN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ORTIZ CHAGUA', NULL, NULL, NULL, '1', '41465066', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4695, 'JETZABEL ALITHU\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ZEGARRA REGALADO', NULL, NULL, NULL, '1', '48475968', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4696, 'IVAN ELIAS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUTIERREZ EVARISTO', NULL, NULL, NULL, '1', '10628216', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4697, 'CHIRLEY ESTEFANIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'NAVARRO MORALES', NULL, NULL, NULL, '1', '75336135', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4698, 'YOLANDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ANCCO CONDORI', NULL, NULL, NULL, '1', '41046666', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4699, 'CLEVER\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HERRERA CAMPOS', NULL, NULL, NULL, '1', '46173465', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4700, 'LUIS WALTER\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'XAVIER ROJAS', NULL, NULL, NULL, '1', '08761575', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4701, 'OBSALON\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MANCO MALPICA', NULL, NULL, NULL, '1', '15374379', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4702, 'ASUNTA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CESPEDES AYALA', NULL, NULL, NULL, '1', '09348143', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4703, 'HELEA SOLANGE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ZUÑIGA CANCHIHUAMAN', NULL, NULL, NULL, '1', '47137755', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4704, 'RENE JAIME\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GARGUREVICH BORDA', NULL, NULL, NULL, '1', '70524618', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4705, 'JOSE ANTONIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ARBAIZA RUECKNER', NULL, NULL, NULL, '1', '09396859', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4706, 'LIZ AMPARO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BULLON MATOS', NULL, NULL, NULL, '1', '20030248', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4707, 'BEATRIZ\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALDERETE JULCA', NULL, NULL, NULL, '1', '45440266', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4708, 'ALMENDRA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALVARADO MOLINA', NULL, NULL, NULL, '1', '47372274', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4709, 'HIPOLITA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BACA HUAMANI', NULL, NULL, NULL, '1', '23975761', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4710, 'NILA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MENA BARBOZA', NULL, NULL, NULL, '1', '07343083', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4711, 'PATRICIA KATHERINE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SANCHEZ MUNARES', NULL, NULL, NULL, '1', '07492951', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4712, 'NORMA ESTEFANIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'NIEVES LA TORRE', NULL, NULL, NULL, '1', '74759240', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4713, 'JANET BELU\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHICLOTE FERNANDEZ', NULL, NULL, NULL, '1', '06932237', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4714, 'DAILY STHER\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ARANDA CRUZ', NULL, NULL, NULL, '1', '70246994', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4715, 'MARIANO GUSTAVO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ROMAN CORTEZ', NULL, NULL, NULL, '1', '75976411', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4716, 'CARMEN RAQUEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MENDOZA SAAVEDRA', NULL, NULL, NULL, '1', '47276409', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4717, 'SHEILLA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'REYES FARIAS', NULL, NULL, NULL, '1', '42434622', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4718, 'MIGUEL ANGEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORREA HERRERA', NULL, NULL, NULL, '1', '07457519', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4719, 'LUISA HELEN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALCÁNTARA SALAZAR', NULL, NULL, NULL, '1', '43137995', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4720, 'ROCIO DEL PILAR\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CALIXTO SALAZAR', NULL, NULL, NULL, '1', '42822048', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4721, 'ROCIO EDITH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALIAGA ALIAGA', NULL, NULL, NULL, '1', '04073672', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4722, 'CRISTHOPER STEVEN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PEÑA CAMACHO', NULL, NULL, NULL, '1', '43736869', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4723, 'HUMBERTO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LIRA VELIZ', NULL, NULL, NULL, '1', '20018104', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4724, 'ROSALINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SALINAS SAENZ', NULL, NULL, NULL, '1', '25591659', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4725, 'INDIRA NATALY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MOLINA CCANTO', NULL, NULL, NULL, '1', '47450280', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4726, 'MARVI\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SEGUNDO VILLAFUERTE', NULL, NULL, NULL, '1', '43815454', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4727, 'OSCAR FAUSTO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MUNARES GARCIA', NULL, NULL, NULL, '1', '07493051', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4728, 'JOEL IVAN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SALAZAR GERONIMO', NULL, NULL, NULL, '1', '41247762', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4729, 'ADELA DORA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LEON DOMINGUEZ', NULL, NULL, NULL, '1', '25542424', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4730, 'CAROLINA DEL CARMEN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CHICATA BARRIGA', NULL, NULL, NULL, '1', '73440872', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4731, 'CAROLINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ESCANDON CUEVA', NULL, NULL, NULL, '1', '04080979', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4732, 'ANGELICA OLGA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PATRICIO CASTILLO', NULL, NULL, NULL, '1', '45457270', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4733, 'DIANA ARACELY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'REYNALTE QUISPE', NULL, NULL, NULL, '1', '72692665', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4734, 'ELIZABETH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'AGUILAR CERVANTES', NULL, NULL, NULL, '1', '10136842', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4735, 'MARIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SANTANDER NAVEROS', NULL, NULL, NULL, '1', '08040074', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4736, 'GISSELA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORDOVA VARGAS', NULL, NULL, NULL, '1', '42200999', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4737, 'MARISOL AMPARO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PINTO FLORES', NULL, NULL, NULL, '1', '29712691', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4738, 'ELISBAN\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'KCACHA DAZA', NULL, NULL, NULL, '1', '47623803', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4739, 'JASMIN YESSENIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUZMAN RAMOS', NULL, NULL, NULL, '1', '47297960', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4740, 'MILTON JEREMIAS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BASILIO BAJONERO', NULL, NULL, NULL, '1', '41032744', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4741, 'GIULIANA SILVIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LAURA VERASTEGUI', NULL, NULL, NULL, '1', '08387121', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4742, 'ALBERTO SIMEON\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CORI CORDOVA', NULL, NULL, NULL, '1', '04431165', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4743, 'DULA MARIBEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GONZALES HENOSTROZA', NULL, NULL, NULL, '1', '32942674', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4744, 'YULEYDY ELIZABETH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FABIAN FLORES', NULL, NULL, NULL, '1', '71472974', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4745, 'HANS NICOLAS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUAMAN LOPEZ', NULL, NULL, NULL, '1', '04078995', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4746, 'LUCILA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'REVOLLEDO SANTIAGO', NULL, NULL, NULL, '1', '45255927', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4747, 'JENY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CAJAHUANCA CAPCHA', NULL, NULL, NULL, '1', '04078310', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4748, 'NOELIA ISABEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MARTINEZ INCHE', NULL, NULL, NULL, '1', '04070205', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4749, 'JESSICA JEANETT\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUZMAN CAMPOS', NULL, NULL, NULL, '1', '44068265', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4750, 'JANETH ROCIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'AVELINO CASQUERO', NULL, NULL, NULL, '1', '04063728', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4751, 'DULA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ÑAÑA SOLDEVILLA', NULL, NULL, NULL, '1', '23271253', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4752, 'MARYORI INDIRA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'TORRES VILLANUEVA', NULL, NULL, NULL, '1', '77506493', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4753, 'KATIA LISSETH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'AQUIJE VASQUEZ', NULL, NULL, NULL, '1', '70085562', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4754, 'GENOVEVA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUERTA SANTA CRUZ', NULL, NULL, NULL, '1', '41269632', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4755, 'HUGO MARCELINO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FERNANDEZ BALBIN', NULL, NULL, NULL, '1', '06578616', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4756, 'KETTY CRISTINA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FARRO ABANTO DE ZUÑIGA', NULL, NULL, NULL, '1', '27718075', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4757, 'LILIAN FIORELLA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'YALICO MARCHAND', NULL, NULL, NULL, '1', '45207019', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4758, 'GLADYS MARY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ALE ROQUE', NULL, NULL, NULL, '1', '06195959', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4759, 'TERESA HERMELINDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BAYONA SALAZAR', NULL, NULL, NULL, '1', '02896160', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4760, 'CYNTHIA PAMELA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ZUÑIGA FARRO', NULL, NULL, NULL, '1', '43813235', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4761, 'SARELA YOLANDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HERRERA DIONISIO', NULL, NULL, NULL, '1', '41105934', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4762, 'JESUS ANGEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GUZMAN MORALES', NULL, NULL, NULL, '1', '40042704', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4763, 'ELIZABETH\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CAVERO CAIRO', NULL, NULL, NULL, '1', '10808563', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4764, 'NELLY MERCEDES\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUATUCO GOZAR', NULL, NULL, NULL, '1', '10818948', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4765, 'YELCY ZONIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SOBRADO SANCHEZ', NULL, NULL, NULL, '1', '45629448', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4766, 'MARITZA MARLENE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CUADRA CORTEZ', NULL, NULL, NULL, '1', '10361297', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4767, 'GILDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HINOJOSA FLORES', NULL, NULL, NULL, '1', '40055769', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4768, 'JOVANNY SOLEDAD\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'AGUILAR VALIENTE', NULL, NULL, NULL, '1', '33261976', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4769, 'CRISTHIAMS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'GOMEZ RAMOS', NULL, NULL, NULL, '1', '70874887', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4770, 'JOSE LUIS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'NUÑEZ BARRERA', NULL, NULL, NULL, '1', '10796468', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4771, 'YSABEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RAMOS SIGÜEÑAS', NULL, NULL, NULL, '1', '06080452', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4772, 'MONICA IRMA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VIDAL INFANTAS', NULL, NULL, NULL, '1', '23861568', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4773, 'JENIFFER GABRIELA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VALQUI SAMAN', NULL, NULL, NULL, '1', '76723122', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4774, 'DAYANE ISABEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ULLOA ORDAYA', NULL, NULL, NULL, '1', '70941234', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4775, 'MIGUEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARRASCO CASTREJON', NULL, NULL, NULL, '1', '26603710', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4776, 'EDITH MARLENE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARBAJAL MAYHUA', NULL, NULL, NULL, '1', '04080854', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4777, 'AUGUSTO VICTOR\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'DURAN ARTEAGA', NULL, NULL, NULL, '1', '25670046', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4778, 'JIMMY PAOLO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MINAYA VALDIVIA', NULL, NULL, NULL, '1', '43651522', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4779, 'ROSA ELENA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CAPRISTAN CARHUAPOMA', NULL, NULL, NULL, '1', '27154198', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4780, 'GIOVANNI MANUEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MARTINEZ ALEGRIA', NULL, NULL, NULL, '1', '25794256', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4781, 'INES MONICA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'URBINA ESPINAL', NULL, NULL, NULL, '1', '04085392', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4782, 'LUIS JOEL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FIGUEROA ALVARADO', NULL, NULL, NULL, '1', '40813440', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4783, 'BETSABE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ORTIZ SILVERA', NULL, NULL, NULL, '1', '41616722', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4784, 'MARCIA LOURDES\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LARICO BERNABE', NULL, NULL, NULL, '1', '43078281', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4785, 'RUTH MARILU\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ARCE VENTURA', NULL, NULL, NULL, '1', '70842408', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4786, 'MARIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CARI MAMANI', NULL, NULL, NULL, '1', '24705186', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4787, 'LUISA OFELIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ARCE LIPE', NULL, NULL, NULL, '1', '73622399', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4788, 'JEANETTE CAROLL\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'VALDEZ PISCOYA', NULL, NULL, NULL, '1', '07620036', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4789, 'CARLOS JAVIER\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ZARATE COZ', NULL, NULL, NULL, '1', '09849560', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4790, 'VIANCA OFELIA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FLORES QUINTO', NULL, NULL, NULL, '1', '43584224', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4791, 'FRANCK\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'HUAMAN QUISPE', NULL, NULL, NULL, '1', '45311451', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4792, 'AYDEE\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FRETEL CARHUARICRA', NULL, NULL, NULL, '1', '21124457', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4793, 'ABEL DAVID\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'SOVERO QUISPE', NULL, NULL, NULL, '1', '41983272', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4794, 'EVELYN ROSS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CUSIHUAMAN YUCA', NULL, NULL, NULL, '1', '43081544', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4795, 'MARIA DEL ROSARIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BRAVO GONZALEZ', NULL, NULL, NULL, '1', '46441933', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4796, 'SONIA BRIGIDA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CASTILLON CHAMBERGO', NULL, NULL, NULL, '1', '06051421', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4797, 'DANIEL WILFREDO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ZAPATA RAMOS', NULL, NULL, NULL, '1', '04400225', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4798, 'ANDREA JUANA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LUQUE LOPEZ', NULL, NULL, NULL, '1', '72360436', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4799, 'BETTY\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MANTARI ROJAS', NULL, NULL, NULL, '1', '21553273', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4800, 'SHIRLEY EVANS\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PUGA AVILES', NULL, NULL, NULL, '1', '43440105', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4801, 'WALTER ANTONIO\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'NAVEROS REYES', NULL, NULL, NULL, '1', '40226615', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4802, 'YENY LILIAM\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ORDOÑEZ CASTILLO', NULL, NULL, NULL, '1', '40218626', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4803, 'HENRY WILBER\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'MORALES PEÑA', NULL, NULL, NULL, '1', '40284980', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4804, 'YELKA TANYA\r', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CERVELLINI BARRIOS', NULL, NULL, NULL, '1', '45055142', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-10 16:55:32', '2024-07-10 16:55:32'),
(4810, 'AIDEE INFANTAS CASTRO', NULL, NULL, 'cenate.servicios@essalud.gob.pe', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '23994548', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 22:45:49', '2024-07-16 22:45:49'),
(4811, 'GERALDINE STEPHANIE ZAVALA VELASQUEZ', NULL, NULL, 'claudia_10184@hotmail.com', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '45530528', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 22:45:49', '2024-07-16 22:45:49'),
(4812, 'NARYTHY1626390NEYRTHYT', NULL, 'cfcvcdlj@ronaldofmail.com', NULL, NULL, '$2y$12$qpcI4EsHOEYFPs.xNosHxedJhB6Ajp20Dk/cPPaI72wmqb6uAMfIi', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-15 07:52:10', '2025-09-15 07:52:10'),
(4813, 'nuevo', NULL, 'nuevo@nuevo.com', NULL, NULL, '$2y$12$lrr9tYzxvlXgqNU5AI3g8.qHT6/Nh8Iukc3fDwmw/i/vSA1RaHlqC', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-31 12:21:18', '2025-10-31 12:21:18'),
(4814, 'Diego Alvis', NULL, NULL, NULL, NULL, '$2y$12$bzrlFWuBinFaVn8SBXqI/OKXhj/WU0tD.z.wJUPCvus6cAQJ16x.6', 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '74999960', 'M', NULL, NULL, NULL, NULL, NULL, '2025-12-20 01:50:52', '2025-12-20 01:50:52'),
(4815, 'Jorge Alejandro Barrenechea Rosas', NULL, NULL, NULL, NULL, '$2y$12$yh.g.sAmdYbnJ9gJfSXeGOaveKvFcXq.QQrGxUohkx/DL6BAHPz2i', 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '70114024', 'M', NULL, NULL, NULL, NULL, NULL, '2025-12-20 02:56:41', '2025-12-20 02:56:41'),
(4816, 'César Condor Palacios', NULL, NULL, NULL, NULL, '$2y$12$7vQ5qhXEAWpoZoTZAjl.DOF5Xgaq9a7xHuGSOJoCMFJL2sp/CfSFu', 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', '48124631', 'M', NULL, NULL, NULL, NULL, NULL, '2025-12-20 03:14:39', '2025-12-20 03:14:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `E_actividades`
--
ALTER TABLE `E_actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Eact_eventodia` (`evento_dia_id`),
  ADD KEY `fk_Eact_grupo` (`id_grupo_dirigido`),
  ADD KEY `fk_Eact_user_create` (`id_user_create`);

--
-- Indexes for table `E_actividad_grupos`
--
ALTER TABLE `E_actividad_grupos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_actividad_grupo` (`actividad_id`,`grupo_id`),
  ADD KEY `fk_actividad_grupo_grupo` (`grupo_id`);

--
-- Indexes for table `E_actividad_personas`
--
ALTER TABLE `E_actividad_personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_E_act_usuario` (`actividad_id`,`usuario_id`),
  ADD KEY `fk_Eap_usuario` (`usuario_id`),
  ADD KEY `fk_Eap_tipo` (`tipo_participante_id`),
  ADD KEY `fk_Eap_user_create` (`id_user_create`);

--
-- Indexes for table `E_asistencias_actividad`
--
ALTER TABLE `E_asistencias_actividad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_E_asact` (`actividad_id`,`usuario_id`),
  ADD KEY `fk_Easact_user` (`usuario_id`),
  ADD KEY `fk_Easact_user_create` (`id_user_create`);

--
-- Indexes for table `E_asistencias_dia`
--
ALTER TABLE `E_asistencias_dia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_E_asdia` (`evento_dia_id`,`usuario_id`),
  ADD KEY `fk_Easdia_user` (`usuario_id`),
  ADD KEY `fk_Easdia_user_create` (`id_user_create`);

--
-- Indexes for table `E_certificados`
--
ALTER TABLE `E_certificados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_E_cert_event_user` (`evento_id`,`usuario_id`),
  ADD KEY `fk_Ecert_user` (`usuario_id`),
  ADD KEY `fk_Ecert_regla` (`regla_certificado_id`),
  ADD KEY `fk_Ecert_user_create` (`id_user_create`);

--
-- Indexes for table `E_encuestas`
--
ALTER TABLE `E_encuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `E_encuestas_evento_id_foreign` (`evento_id`),
  ADD KEY `E_encuestas_id_user_foreign` (`id_user`);

--
-- Indexes for table `E_encuesta_opciones`
--
ALTER TABLE `E_encuesta_opciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `E_encuesta_opciones_encuesta_id_foreign` (`encuesta_id`),
  ADD KEY `E_encuesta_opciones_id_user_foreign` (`id_user`);

--
-- Indexes for table `E_encuesta_votos`
--
ALTER TABLE `E_encuesta_votos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `encuesta_opcion_usuario_ronda_unique` (`encuesta_id`,`opcion_id`,`usuario_id`,`ronda`),
  ADD KEY `E_encuesta_votos_encuesta_id_foreign` (`encuesta_id`),
  ADD KEY `E_encuesta_votos_opcion_id_foreign` (`opcion_id`),
  ADD KEY `E_encuesta_votos_usuario_id_foreign` (`usuario_id`),
  ADD KEY `E_encuesta_votos_id_user_foreign` (`id_user`);

--
-- Indexes for table `E_entidades`
--
ALTER TABLE `E_entidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Eent_user_create` (`id_user_create`);

--
-- Indexes for table `E_entidad_usuarios`
--
ALTER TABLE `E_entidad_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_E_entidad_usuario` (`entidad_id`,`usuario_id`),
  ADD KEY `fk_Eentusu_user` (`usuario_id`),
  ADD KEY `fk_Eentusu_rol` (`rol_entidad_id`),
  ADD KEY `fk_Eentusu_user_create` (`id_user_create`);

--
-- Indexes for table `E_eventos`
--
ALTER TABLE `E_eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Eevent_entidad` (`entidad_id`),
  ADD KEY `fk_Eevent_user_create` (`id_user_create`);

--
-- Indexes for table `E_evento_dias`
--
ALTER TABLE `E_evento_dias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_E_evento_fecha` (`evento_id`,`fecha`),
  ADD KEY `fk_Ediasevento_user_create` (`id_user_create`);

--
-- Indexes for table `E_evento_grupos`
--
ALTER TABLE `E_evento_grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_evento_grupo_evento` (`evento_id`),
  ADD KEY `fk_evento_grupo_user_create` (`id_user_create`);

--
-- Indexes for table `E_evento_grupo_usuarios`
--
ALTER TABLE `E_evento_grupo_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_evento_grupo_usuario` (`evento_grupo_id`,`usuario_id`),
  ADD KEY `fk_evento_grupo_usuario_user` (`usuario_id`),
  ADD KEY `fk_evento_grupo_usuario_create` (`id_user_create`);

--
-- Indexes for table `E_grupos_entidad`
--
ALTER TABLE `E_grupos_entidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Egrupo_entidad` (`entidad_id`),
  ADD KEY `fk_Egrupo_user_create` (`id_user_create`);

--
-- Indexes for table `E_grupo_usuarios`
--
ALTER TABLE `E_grupo_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_E_grupo_usuario` (`grupo_id`,`usuario_id`),
  ADD KEY `fk_Egrupous_user` (`usuario_id`),
  ADD KEY `fk_Egrupous_user_create` (`id_user_create`);

--
-- Indexes for table `E_perfiles_usuarios`
--
ALTER TABLE `E_perfiles_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD KEY `fk_Eperf_user_create` (`id_user_create`);

--
-- Indexes for table `E_reglas_certificado`
--
ALTER TABLE `E_reglas_certificado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Eregla_evento` (`evento_id`),
  ADD KEY `fk_Eregla_user_create` (`id_user_create`);

--
-- Indexes for table `E_roles_entidad`
--
ALTER TABLE `E_roles_entidad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_entidad_codigo` (`entidad_id`,`codigo`),
  ADD KEY `fk_Erolent_user_create` (`id_user_create`),
  ADD KEY `fk_Erolent_entidad` (`entidad_id`);

--
-- Indexes for table `e_rostros_usuarios`
--
ALTER TABLE `e_rostros_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `E_tipos_participante`
--
ALTER TABLE `E_tipos_participante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Etipopart_user_create` (`id_user_create`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `E_actividades`
--
ALTER TABLE `E_actividades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `E_actividad_grupos`
--
ALTER TABLE `E_actividad_grupos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `E_actividad_personas`
--
ALTER TABLE `E_actividad_personas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `E_asistencias_actividad`
--
ALTER TABLE `E_asistencias_actividad`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `E_asistencias_dia`
--
ALTER TABLE `E_asistencias_dia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `E_certificados`
--
ALTER TABLE `E_certificados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `E_encuestas`
--
ALTER TABLE `E_encuestas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `E_encuesta_opciones`
--
ALTER TABLE `E_encuesta_opciones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `E_encuesta_votos`
--
ALTER TABLE `E_encuesta_votos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT for table `E_entidades`
--
ALTER TABLE `E_entidades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `E_entidad_usuarios`
--
ALTER TABLE `E_entidad_usuarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `E_eventos`
--
ALTER TABLE `E_eventos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `E_evento_dias`
--
ALTER TABLE `E_evento_dias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `E_evento_grupos`
--
ALTER TABLE `E_evento_grupos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `E_evento_grupo_usuarios`
--
ALTER TABLE `E_evento_grupo_usuarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `E_grupos_entidad`
--
ALTER TABLE `E_grupos_entidad`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `E_grupo_usuarios`
--
ALTER TABLE `E_grupo_usuarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `E_perfiles_usuarios`
--
ALTER TABLE `E_perfiles_usuarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `E_reglas_certificado`
--
ALTER TABLE `E_reglas_certificado`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `E_roles_entidad`
--
ALTER TABLE `E_roles_entidad`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `e_rostros_usuarios`
--
ALTER TABLE `e_rostros_usuarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `E_tipos_participante`
--
ALTER TABLE `E_tipos_participante`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4817;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `E_actividades`
--
ALTER TABLE `E_actividades`
  ADD CONSTRAINT `fk_Eact_eventodia` FOREIGN KEY (`evento_dia_id`) REFERENCES `E_evento_dias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Eact_grupo` FOREIGN KEY (`id_grupo_dirigido`) REFERENCES `E_grupos_entidad` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_Eact_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_actividad_grupos`
--
ALTER TABLE `E_actividad_grupos`
  ADD CONSTRAINT `fk_actividad_grupo_actividad` FOREIGN KEY (`actividad_id`) REFERENCES `E_actividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_actividad_grupo_grupo` FOREIGN KEY (`grupo_id`) REFERENCES `E_grupos_entidad` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_actividad_personas`
--
ALTER TABLE `E_actividad_personas`
  ADD CONSTRAINT `fk_Eap_actividad` FOREIGN KEY (`actividad_id`) REFERENCES `E_actividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Eap_tipo` FOREIGN KEY (`tipo_participante_id`) REFERENCES `E_tipos_participante` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_Eap_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Eap_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_asistencias_actividad`
--
ALTER TABLE `E_asistencias_actividad`
  ADD CONSTRAINT `fk_Easact_actividad` FOREIGN KEY (`actividad_id`) REFERENCES `E_actividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Easact_user` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Easact_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_asistencias_dia`
--
ALTER TABLE `E_asistencias_dia`
  ADD CONSTRAINT `fk_Easdia_dia` FOREIGN KEY (`evento_dia_id`) REFERENCES `E_evento_dias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Easdia_user` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Easdia_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_certificados`
--
ALTER TABLE `E_certificados`
  ADD CONSTRAINT `fk_Ecert_evento` FOREIGN KEY (`evento_id`) REFERENCES `E_eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Ecert_regla` FOREIGN KEY (`regla_certificado_id`) REFERENCES `E_reglas_certificado` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_Ecert_user` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Ecert_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_encuestas`
--
ALTER TABLE `E_encuestas`
  ADD CONSTRAINT `E_encuestas_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `E_eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `E_encuestas_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `E_encuesta_opciones`
--
ALTER TABLE `E_encuesta_opciones`
  ADD CONSTRAINT `E_encuesta_opciones_encuesta_id_foreign` FOREIGN KEY (`encuesta_id`) REFERENCES `E_encuestas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `E_encuesta_opciones_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `E_encuesta_votos`
--
ALTER TABLE `E_encuesta_votos`
  ADD CONSTRAINT `E_encuesta_votos_encuesta_id_foreign` FOREIGN KEY (`encuesta_id`) REFERENCES `E_encuestas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `E_encuesta_votos_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `E_encuesta_votos_opcion_id_foreign` FOREIGN KEY (`opcion_id`) REFERENCES `E_encuesta_opciones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `E_encuesta_votos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `E_entidades`
--
ALTER TABLE `E_entidades`
  ADD CONSTRAINT `fk_Eent_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_entidad_usuarios`
--
ALTER TABLE `E_entidad_usuarios`
  ADD CONSTRAINT `fk_Eentusu_entidad` FOREIGN KEY (`entidad_id`) REFERENCES `E_entidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Eentusu_rol` FOREIGN KEY (`rol_entidad_id`) REFERENCES `E_roles_entidad` (`id`),
  ADD CONSTRAINT `fk_Eentusu_user` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Eentusu_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_eventos`
--
ALTER TABLE `E_eventos`
  ADD CONSTRAINT `fk_Eevent_entidad` FOREIGN KEY (`entidad_id`) REFERENCES `E_entidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Eevent_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_evento_dias`
--
ALTER TABLE `E_evento_dias`
  ADD CONSTRAINT `fk_Ediasevento_evento` FOREIGN KEY (`evento_id`) REFERENCES `E_eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Ediasevento_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_evento_grupos`
--
ALTER TABLE `E_evento_grupos`
  ADD CONSTRAINT `fk_evento_grupo_evento` FOREIGN KEY (`evento_id`) REFERENCES `E_eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_evento_grupo_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_evento_grupo_usuarios`
--
ALTER TABLE `E_evento_grupo_usuarios`
  ADD CONSTRAINT `fk_evento_grupo_usuario_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_evento_grupo_usuario_grupo` FOREIGN KEY (`evento_grupo_id`) REFERENCES `E_evento_grupos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_evento_grupo_usuario_user` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_grupos_entidad`
--
ALTER TABLE `E_grupos_entidad`
  ADD CONSTRAINT `fk_Egrupo_entidad` FOREIGN KEY (`entidad_id`) REFERENCES `E_entidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Egrupo_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_grupo_usuarios`
--
ALTER TABLE `E_grupo_usuarios`
  ADD CONSTRAINT `fk_Egrupous_grupo` FOREIGN KEY (`grupo_id`) REFERENCES `E_grupos_entidad` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Egrupous_user` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Egrupous_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_perfiles_usuarios`
--
ALTER TABLE `E_perfiles_usuarios`
  ADD CONSTRAINT `fk_Eperf_user` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Eperf_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_reglas_certificado`
--
ALTER TABLE `E_reglas_certificado`
  ADD CONSTRAINT `fk_Eregla_evento` FOREIGN KEY (`evento_id`) REFERENCES `E_eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Eregla_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_roles_entidad`
--
ALTER TABLE `E_roles_entidad`
  ADD CONSTRAINT `fk_Erolent_entidad` FOREIGN KEY (`entidad_id`) REFERENCES `E_entidades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Erolent_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `e_rostros_usuarios`
--
ALTER TABLE `e_rostros_usuarios`
  ADD CONSTRAINT `e_rostros_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `E_tipos_participante`
--
ALTER TABLE `E_tipos_participante`
  ADD CONSTRAINT `fk_Etipopart_user_create` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
