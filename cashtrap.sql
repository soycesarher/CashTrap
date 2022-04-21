-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-04-2022 a las 19:03:56
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cashtrap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` text NOT NULL,
  `ruta_categoria` text NOT NULL,
  `descripcion_categoria` text NOT NULL,
  `icono_categoria` text NOT NULL,
  `color_categoria` text NOT NULL,
  `fecha_categoria` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `ruta_categoria`, `descripcion_categoria`, `icono_categoria`, `color_categoria`, `fecha_categoria`) VALUES
(1, 'Cuerpo Activo', 'cuerpo-activo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac erat ut mauris egestas molestie. Integer nisi neque, fermentum id rutrum varius, eleifend non sem. Sed sed maximus velit, eget finibus ante.', 'fas fa-heart', 'purple', '2022-04-19 17:07:01'),
(2, 'Mente Sana', 'mente-sana', 'Nulla euismod pellentesque lacus. Nunc dictum, orci eget congue tempus, leo purus rhoncus dui, sit amet accumsan dui mi eu sapien.', 'fas fa-puzzle-piece', 'info', '2022-04-19 17:07:01'),
(3, 'Espíritu Libre', 'espiritu-libre', 'Maecenas sit amet urna lacus. Cras imperdiet, urna eget laoreet viverra, neque velit fringilla metus, nec consequat mauris magna in risus.', 'fas fa-wind', 'primary', '2022-04-19 17:07:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `perfil` text NOT NULL,
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `suscripcion` int(11) NOT NULL,
  `id_suscripcion` text DEFAULT NULL,
  `ciclo_pago` int(11) DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `verificacion` int(11) NOT NULL,
  `email_encriptado` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `enlace_afiliado` text DEFAULT NULL,
  `patrocinador` text DEFAULT NULL,
  `paypal` text DEFAULT NULL,
  `pais` text DEFAULT NULL,
  `codigo_pais` text DEFAULT NULL,
  `telefono_movil` text DEFAULT NULL,
  `firma` text DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `perfil`, `nombre`, `email`, `password`, `suscripcion`, `id_suscripcion`, `ciclo_pago`, `vencimiento`, `verificacion`, `email_encriptado`, `foto`, `enlace_afiliado`, `patrocinador`, `paypal`, `pais`, `codigo_pais`, `telefono_movil`, `firma`, `fecha_contrato`, `fecha`) VALUES
(1, 'admin', 'cashtrap', 'admin@cashtrap.com', 'admin', 1, NULL, NULL, NULL, 1, NULL, NULL, 'cashtrap-afiliado', NULL, 'soycesarher@gmail.com', NULL, NULL, NULL, NULL, NULL, '2022-04-14 18:55:23'),
(4, 'usuario', 'Cesar', 'imcesarher@gmail.com', '123456', 0, 'I-PNENBCYR4419', NULL, '2022-05-18', 1, '5c1bce851e34b54f1480da216a7d384c', 'vistas/img/usuarios/4/450.jpg', 'cesar-4', 'cashtrap-afiliado', 'sb-04sxl15100009@personal.example.com', 'Israel', 'IL', '+972 (444) 444-4444', NULL, NULL, '2022-04-14 19:55:11'),
(5, 'usuario', 'Andy', 'imandrea@gmail.com', '123456', 0, NULL, NULL, NULL, 1, '31f6650277d792c6069be1a6ff41f349', 'vistas/img/usuarios/5/839.jpg', NULL, 'cashtrap-afiliado', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 20:05:50'),
(17, 'usuario', 'Antonio', 'imantonio@gmail.com', '123456', 0, NULL, NULL, NULL, 0, 'f1b3cda9f25632af80ece263847d6c13', NULL, NULL, 'cashtrap-afiliado', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-16 17:25:09'),
(18, 'usuario', 'Maria del mar', 'immaria@gmail.com', '123456', 0, NULL, NULL, NULL, 1, '4617bb753ce0f032a92a7222d9f98662', NULL, NULL, 'cesar-4', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 06:02:23'),
(19, 'usuario', 'Martha Morales', 'immartha@gmail.com', '123456', 0, NULL, NULL, NULL, 1, '19273465974bc04ae9e1a6bd9f4cc97a', NULL, NULL, 'cesar-4', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 18:40:51'),
(20, 'usuario', 'Clark Ken', 'imsuperman@gmail.com', '123456', 0, NULL, NULL, NULL, 1, '78fd4a1a8246ba067a441da5585c9d03', NULL, NULL, 'cashtrap-afiliado', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 18:46:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `id_video` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `titulo_video` text NOT NULL,
  `descripcion_video` text NOT NULL,
  `medios_video` text NOT NULL,
  `medios_video_mp4` text NOT NULL,
  `imagen_video` text NOT NULL,
  `vista_gratuita` int(11) NOT NULL,
  `fecha_video` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`id_video`, `id_cat`, `titulo_video`, `descripcion_video`, `medios_video`, `medios_video_mp4`, `imagen_video`, `vista_gratuita`, `fecha_video`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed sagittis diam eu pharetra elementum', 'vistas/videos/cuerpo-activo/01-video/01-video.m3u8', 'vistas/videos/cuerpo-activo/01-video.mp4', 'vistas/img/cuerpo-activo/01-imagen.jpg', 1, '2022-04-21 16:59:25'),
(2, 1, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/cuerpo-activo/02-video/02-video.m3u8', 'vistas/videos/cuerpo-activo/02-video.mp4', 'vistas/img/cuerpo-activo/02-imagen.jpg', 1, '2022-04-21 17:00:03'),
(3, 1, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/cuerpo-activo/03-video/03-video.m3u8', 'vistas/videos/cuerpo-activo/03-video.mp4', 'vistas/img/cuerpo-activo/03-imagen.jpg', 1, '2022-04-21 17:00:11'),
(4, 1, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/cuerpo-activo/04-video/04-video.m3u8', 'vistas/videos/cuerpo-activo/04-video.mp4', 'vistas/img/cuerpo-activo/04-imagen.jpg', 0, '2022-04-21 17:00:20'),
(5, 1, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/cuerpo-activo/05-video/05-video.m3u8', 'vistas/videos/cuerpo-activo/05-video.mp4', 'vistas/img/cuerpo-activo/05-imagen.jpg', 0, '2022-04-21 17:00:27'),
(6, 1, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/cuerpo-activo/06-video/06-video.m3u8', 'vistas/videos/cuerpo-activo/06-video.mp4', 'vistas/img/cuerpo-activo/06-imagen.jpg', 0, '2022-04-21 17:00:38'),
(7, 2, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/mente-sana/01-video/01-video.m3u8', 'vistas/videos/mente-sana/01-video.mp4', 'vistas/img/mente-sana/01-imagen.jpg', 1, '2022-04-21 17:01:06'),
(8, 2, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/mente-sana/02-video/02-video.m3u8', 'vistas/videos/mente-sana/02-video.mp4', 'vistas/img/mente-sana/02-imagen.jpg', 1, '2022-04-21 17:01:14'),
(9, 2, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/mente-sana/03-video/03-video.m3u8', 'vistas/videos/mente-sana/03-video.mp4', 'vistas/img/mente-sana/03-imagen.jpg', 1, '2022-04-21 17:01:24'),
(10, 2, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/mente-sana/04-video/04-video.m3u8', 'vistas/videos/mente-sana/04-video.mp4', 'vistas/img/mente-sana/04-imagen.jpg', 0, '2022-04-21 17:01:35'),
(11, 2, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/mente-sana/05-video/05-video.m3u8', 'vistas/videos/mente-sana/05-video.mp4', 'vistas/img/mente-sana/05-imagen.jpg', 0, '2022-04-21 17:01:42'),
(12, 2, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/mente-sana/06-video/06-video.m3u8', 'vistas/videos/mente-sana/06-video.mp4', 'vistas/img/mente-sana/06-imagen.jpg', 0, '2022-04-21 17:01:51'),
(13, 3, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/espiritu-libre/01-video/01-video.m3u8', 'vistas/videos/espiritu-libre/01-video.mp4', 'vistas/img/espiritu-libre/01-imagen.jpg', 1, '2022-04-21 17:02:13'),
(14, 3, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/espiritu-libre/02-video/02-video.m3u8', 'vistas/videos/mente-sana/02-video.mp4', 'vistas/img/espiritu-libre/02-imagen.jpg', 1, '2022-04-21 17:02:22'),
(15, 3, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/espiritu-libre/03-video/03-video.m3u8', 'vistas/videos/mente-sana/03-video.mp4', 'vistas/img/espiritu-libre/03-imagen.jpg', 1, '2022-04-21 17:02:29'),
(16, 3, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/espiritu-libre/04-video/04-video.m3u8', 'vistas/videos/mente-sana/04-video.mp4', 'vistas/img/espiritu-libre/04-imagen.jpg', 0, '2022-04-21 17:02:39'),
(17, 3, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/espiritu-libre/05-video/05-video.m3u8', 'vistas/videos/mente-sana/05-video.mp4', 'vistas/img/espiritu-libre/05-imagen.jpg', 0, '2022-04-21 17:02:47'),
(18, 3, 'Lorem ipsum dolor sit amet', 'Donec maximus nulla a aliquam sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'vistas/videos/espiritu-libre/06-video/06-video.m3u8', 'vistas/videos/mente-sana/06-video.mp4', 'vistas/img/espiritu-libre/06-imagen.jpg', 0, '2022-04-21 17:02:56');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
