-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2022 a las 22:33:21
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
-- Estructura de tabla para la tabla `pagos_uninivel`
--

CREATE TABLE `pagos_uninivel` (
  `id_pago` int(11) NOT NULL,
  `id_pago_paypal` text NOT NULL,
  `usuario_pago` int(11) NOT NULL,
  `periodo` text NOT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos_uninivel`
--

INSERT INTO `pagos_uninivel` (`id_pago`, `id_pago_paypal`, `usuario_pago`, `periodo`, `periodo_comision`, `periodo_venta`, `fecha_pago`) VALUES
(4, '83TEPJXBQJXZE', 27, '2022-03-21 a 2022-04-21', 4, 10, '2022-04-22 20:32:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_uninivel`
--

CREATE TABLE `red_uninivel` (
  `id_uninivel` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `patrocinador_red` text DEFAULT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_uninivel` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `red_uninivel`
--

INSERT INTO `red_uninivel` (`id_uninivel`, `usuario_red`, `patrocinador_red`, `periodo_comision`, `periodo_venta`, `fecha_uninivel`) VALUES
(4, 27, 'cashtrap-afiliado', 10, 10, '2022-04-22 18:47:57'),
(5, 28, NULL, 4, 10, '2022-04-22 20:32:24');

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
(27, 'usuario', 'Cesar Hernandez', 'imcesar@gmail.com', '123456', 1, 'I-35W0EREPJ9NC', 1, '2022-05-22', 1, 'd46dc768540910fb47a39d5f32cbef5b', NULL, 'cesar-hernandez-27', 'cashtrap-afiliado', 'sb-04sxl15100009@personal.example.com', 'United States', 'US', '+1 (212) 324-4152', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"145\" height=\"43\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 14 2 c 2.28 0.46 127.7 25.72 130 26 c 0.9 0.11 -32.15 -11.34 -49 -16 c -15.07 -4.17 -29.96 -7.53 -45 -10 c -7.19 -1.18 -18.42 -3.91 -22 -1 c -4.68 3.8 -9.24 20.92 -10 27 c -0.21 1.65 3.91 3.88 6 5 c 1.95 1.05 4.7 1.65 7 2 c 1.89 0.29 4.32 0.63 6 0 c 5.62 -2.11 12.88 -5.74 18 -9 c 1.63 -1.04 2.53 -3.53 4 -5 c 1.47 -1.47 3.69 -2.46 5 -4 c 2.21 -2.61 5.86 -7.58 6 -9 c 0.07 -0.67 -3.43 -1.14 -5 -1 c -5.63 0.49 -12.21 1.47 -18 3 c -5.43 1.44 -10.65 3.81 -16 6 c -2.1 0.86 -4.22 1.73 -6 3 c -5.1 3.65 -10.47 7.66 -15 12 l -9 11\"/></svg>', '2022-04-22', '2022-04-22 18:45:09'),
(28, 'usuario', 'Andrea Lopez', 'imandrea@gmail.com', '123456', 1, 'I-L0N8N9H4KC5D', 1, '2022-05-22', 1, '31f6650277d792c6069be1a6ff41f349', NULL, 'andrea-lopez-28', 'cesar-hernandez-27', 'sb-04sxl15100009@personal.example.com', 'United States', 'US', '+1 (272) 456-1221', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"132\" height=\"38\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 131 21 c -0.89 -0.16 -33.93 -7.76 -51 -9 c -24.07 -1.75 -57.99 -3.42 -73 0 c -3.9 0.89 -7.89 15.58 -6 18 c 2.45 3.13 15.85 3.86 24 5 c 8.67 1.21 17.24 1.81 26 2 c 6.72 0.15 13.8 0.21 20 -1 c 5.29 -1.03 10.78 -3.71 16 -6 c 3.14 -1.38 6.13 -3.16 9 -5 c 1.78 -1.15 3.89 -2.38 5 -4 c 3.56 -5.22 6.66 -13.22 10 -18 c 0.73 -1.04 2.9 -2 4 -2 c 1.1 0 3.06 1.06 4 2 l 6 8\"/></svg>', '2022-04-22', '2022-04-22 18:49:13');

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
-- Indices de la tabla `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  ADD PRIMARY KEY (`id_pago`);

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
-- AUTO_INCREMENT de la tabla `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
