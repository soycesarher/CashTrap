-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2022 a las 03:46:48
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
-- Estructura de tabla para la tabla `red_uninivel`
--

CREATE TABLE `red_uninivel` (
  `id_uninivel` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `patrocinador_red` text NOT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_uninivel` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `red_uninivel`
--

INSERT INTO `red_uninivel` (`id_uninivel`, `usuario_red`, `patrocinador_red`, `periodo_comision`, `periodo_venta`, `fecha_uninivel`) VALUES
(1, 23, 'cashtrap-afiliado', 10, 10, '2022-04-21 19:14:51'),
(2, 24, 'cesar-hernandez-23', 10, 10, '2022-04-21 19:18:55'),
(3, 26, 'cesar-hernandez-23', 10, 10, '2022-04-22 01:44:38');

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
(23, 'usuario', 'Cesar Hernandez', 'imcesar@gmail.com', '123456', 1, 'I-9WD8R2T6BT1U', 1, '2022-05-21', 1, 'd46dc768540910fb47a39d5f32cbef5b', NULL, 'cesar-hernandez-23', 'cashtrap-afiliado', 'sb-04sxl15100009@personal.example.com', 'Israel', 'IL', '+972 (333) 333-3333', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"217\" height=\"49\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 1 c 0.4 0.05 15.16 1.62 23 3 c 21.34 3.77 40.67 7.33 62 12 c 37.11 8.12 70.44 16 107 25 c 8 1.97 23 7 23 7\"/></svg>', '2022-04-21', '2022-04-21 19:13:12'),
(24, 'usuario', 'Andrea Lopez', 'imandrea@gmail.com', '123456', 1, 'I-CHT5M064B1XN', 1, '2022-05-21', 1, '31f6650277d792c6069be1a6ff41f349', NULL, 'andrea-lopez-24', 'cesar-hernandez-23', 'sb-04sxl15100009@personal.example.com', 'Israel', 'IL', '+972 (222) 222-2222', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"191\" height=\"57\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 2 56 c 0.77 -0.33 28.9 -13.91 44 -19 c 16.58 -5.58 33.48 -9.06 51 -13 c 9.8 -2.2 19.12 -3.62 29 -5 c 4.71 -0.66 9.2 -0.9 14 -1 c 11.63 -0.24 23.06 -0.87 34 0 c 5.31 0.42 16.29 4 16 4 c -0.74 0 -27.64 -2.15 -42 -4 c -17.57 -2.27 -33.37 -5.83 -51 -8 c -29.87 -3.68 -57.52 -6.24 -87 -9 l -9 0\"/></svg>', '2022-04-21', '2022-04-21 19:16:32'),
(25, 'usuario', 'Yuced Davila', 'imyuced@gmail.com', '123456', 0, NULL, NULL, NULL, 1, '88c295caef063d7bf3bd2f45bf33410d', NULL, NULL, 'cashtrap-afiliado', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-21 23:12:06'),
(26, 'usuario', 'Litzy Lopez', 'imlitzy@gmail.com', '123456', 1, 'I-6EN33RW6R2Y1', 1, '2022-05-22', 1, '28ac8fcf0f1930d336b2eb96fc83caed', NULL, 'litzy-lopez-26', 'cesar-hernandez-23', 'sb-04sxl15100009@personal.example.com', 'Mexico', 'MX', '+52 (722) 565-6768', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"99\" height=\"39\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 7 36 c 1.59 -0.3 84.08 -14.17 91 -17 c 1.74 -0.71 -13.15 -10.31 -20 -12 c -15.66 -3.86 -35.99 -5.56 -53 -6 c -7.76 -0.2 -25.18 2.38 -24 4 c 2.95 4.04 51 33 51 33\"/></svg>', '2022-04-22', '2022-04-22 01:41:05');

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
-- Indices de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  ADD PRIMARY KEY (`id_uninivel`);

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
-- AUTO_INCREMENT de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
