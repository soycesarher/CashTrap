-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2022 a las 03:43:11
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
(1, 'Análisis Fundamental', 'cuerpo-activo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac erat ut mauris egestas molestie. Integer nisi neque, fermentum id rutrum varius, eleifend non sem. Sed sed maximus velit, eget finibus ante.', 'fas fa-user-graduate', 'purple', '2022-05-01 05:44:04'),
(2, 'Análisis Técnico', 'mente-sana', 'Nulla euismod pellentesque lacus. Nunc dictum, orci eget congue tempus, leo purus rhoncus dui, sit amet accumsan dui mi eu sapien.', 'fas fa-rocket', 'info', '2022-05-01 05:47:12'),
(3, 'Estrategias de Inversión', 'espiritu-libre', 'Maecenas sit amet urna lacus. Cras imperdiet, urna eget laoreet viverra, neque velit fringilla metus, nec consequat mauris magna in risus.', 'fas fa-money-bill', 'primary', '2022-05-01 05:47:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_uninivel`
--

CREATE TABLE `pagos_uninivel` (
  `id_pago` int(11) NOT NULL,
  `id_pago_paypal` text DEFAULT NULL,
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
(5, NULL, 1, '2022-04-20 a 2022-04-21', 10, 10, '2022-04-22 21:08:45'),
(6, '83TEPJXBQJXZE', 27, '2022-03-21 a 2022-04-21', 4, 10, '2022-04-22 21:08:47');

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
(4, 27, 'cashtrap-afiliado', 10, 10, '2022-04-22 21:08:48'),
(5, 28, NULL, 4, 10, '2022-04-22 21:08:48'),
(6, 29, 'cesar-hernandez-27', 4, 10, '2022-05-01 20:10:31');

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
(1, 'admin', 'Cashtrap', 'admin@cashtrap.com', 'admin', 1, NULL, NULL, '2022-04-22', 1, NULL, 'vistas/img/usuarios/1/843.jpg', 'cashtrap-afiliado', NULL, 'sb-04sxl15100009@personal.example.com', 'United States', 'US', '+1 (212) 324-4152', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"145\" height=\"43\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 14 2 c 2.28 0.46 127.7 25.72 130 26 c 0.9 0.11 -32.15 -11.34 -49 -16 c -15.07 -4.17 -29.96 -7.53 -45 -10 c -7.19 -1.18 -18.42 -3.91 -22 -1 c -4.68 3.8 -9.24 20.92 -10 27 c -0.21 1.65 3.91 3.88 6 5 c 1.95 1.05 4.7 1.65 7 2 c 1.89 0.29 4.32 0.63 6 0 c 5.62 -2.11 12.88 -5.74 18 -9 c 1.63 -1.04 2.53 -3.53 4 -5 c 1.47 -1.47 3.69 -2.46 5 -4 c 2.21 -2.61 5.86 -7.58 6 -9 c 0.07 -0.67 -3.43 -1.14 -5 -1 c -5.63 0.49 -12.21 1.47 -18 3 c -5.43 1.44 -10.65 3.81 -16 6 c -2.1 0.86 -4.22 1.73 -6 3 c -5.1 3.65 -10.47 7.66 -15 12 l -9 11\"/></svg>', '2022-04-22', '2022-04-14 18:55:23'),
(27, 'usuario', 'Cesar Hernandez', 'imcesar@gmail.com', '123456', 1, 'I-35W0EREPJ9NC', 1, '2022-05-22', 1, 'd46dc768540910fb47a39d5f32cbef5b', 'vistas/img/usuarios/27/308.jpg', 'cesar-hernandez-27', 'cashtrap-afiliado', 'sb-04sxl15100009@personal.example.com', 'United States', 'US', '+1 (212) 324-4152', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"145\" height=\"43\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 14 2 c 2.28 0.46 127.7 25.72 130 26 c 0.9 0.11 -32.15 -11.34 -49 -16 c -15.07 -4.17 -29.96 -7.53 -45 -10 c -7.19 -1.18 -18.42 -3.91 -22 -1 c -4.68 3.8 -9.24 20.92 -10 27 c -0.21 1.65 3.91 3.88 6 5 c 1.95 1.05 4.7 1.65 7 2 c 1.89 0.29 4.32 0.63 6 0 c 5.62 -2.11 12.88 -5.74 18 -9 c 1.63 -1.04 2.53 -3.53 4 -5 c 1.47 -1.47 3.69 -2.46 5 -4 c 2.21 -2.61 5.86 -7.58 6 -9 c 0.07 -0.67 -3.43 -1.14 -5 -1 c -5.63 0.49 -12.21 1.47 -18 3 c -5.43 1.44 -10.65 3.81 -16 6 c -2.1 0.86 -4.22 1.73 -6 3 c -5.1 3.65 -10.47 7.66 -15 12 l -9 11\"/></svg>', '2022-04-22', '2022-04-22 18:45:09'),
(28, 'usuario', 'Andrea Lopez', 'imandrea@gmail.com', '123456', 1, 'I-L0N8N9H4KC5D', 1, '2022-05-22', 1, '31f6650277d792c6069be1a6ff41f349', 'vistas/img/usuarios/28/828.jpg', 'andrea-lopez-28', 'cesar-hernandez-27', 'sb-04sxl15100009@personal.example.com', 'United States', 'US', '+1 (272) 456-1221', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"132\" height=\"38\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 131 21 c -0.89 -0.16 -33.93 -7.76 -51 -9 c -24.07 -1.75 -57.99 -3.42 -73 0 c -3.9 0.89 -7.89 15.58 -6 18 c 2.45 3.13 15.85 3.86 24 5 c 8.67 1.21 17.24 1.81 26 2 c 6.72 0.15 13.8 0.21 20 -1 c 5.29 -1.03 10.78 -3.71 16 -6 c 3.14 -1.38 6.13 -3.16 9 -5 c 1.78 -1.15 3.89 -2.38 5 -4 c 3.56 -5.22 6.66 -13.22 10 -18 c 0.73 -1.04 2.9 -2 4 -2 c 1.1 0 3.06 1.06 4 2 l 6 8\"/></svg>', '2022-04-22', '2022-04-22 18:49:13'),
(29, 'usuario', 'Yuced Davila', 'imyuced@gmail.com', '123456', 1, 'I-BKPWHPHK2TMK', 1, '2022-06-01', 1, '88c295caef063d7bf3bd2f45bf33410d', 'vistas/img/usuarios/29/898.jpg', 'yuced-davila-29', 'cesar-hernandez-27', 'sb-04sxl15100009@personal.example.com', 'United States', 'US', '+1 (888) 888-8888', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"131\" height=\"57\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 55 39 c 0.3 0 11.54 0.56 17 0 c 3.97 -0.41 7.99 -1.75 12 -3 c 6.87 -2.15 13.59 -4.1 20 -7 c 7.58 -3.43 15.9 -7.78 22 -12 c 1.76 -1.22 4.69 -4.96 4 -6 c -1.6 -2.4 -9.29 -7.98 -14 -9 c -9.07 -1.97 -21.08 -1.23 -32 -1 c -21.17 0.45 -42.94 0.24 -62 3 c -7.02 1.01 -17.91 5.03 -21 9 c -2.43 3.13 -1.07 12.81 0 18 c 0.75 3.61 3.7 7.74 6 11 c 1.56 2.21 3.71 4.93 6 6 c 6.84 3.19 16.28 6.13 24 8 c 2.75 0.67 5.91 0.12 9 0 c 5.84 -0.22 11.97 0.3 17 -1 c 4.62 -1.19 10.15 -4.07 14 -7 c 4.01 -3.05 7.04 -8.38 11 -12 c 3.65 -3.33 11.6 -6.98 12 -9 c 0.29 -1.46 -5.91 -5.27 -9 -6 c -7.16 -1.69 -16.4 -1.7 -25 -2 c -20.91 -0.73 -61 -1 -61 -1\"/></svg>', '2022-05-01', '2022-05-01 00:06:55'),
(30, 'usuario', 'Alison Martinez', 'imalison@gmail.com', '123456', 0, NULL, NULL, NULL, 1, '73e0e0b1627ebbe64e660dfd456aa6b8', 'vistas/img/usuarios/30/764.jpg', NULL, 'yuced-davila-29', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-01 20:15:56');

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
(1, 1, 'Análisis Fundamental', 'Aprende y analiza de forma correcta las noticias que mueven los mercados financieros.', 'vistas/videos/cuerpo-activo/01-video/01-video.m3u8', 'vistas/videos/cuerpo-activo/01-video.mp4', 'vistas/img/cuerpo-activo/01-imagen.jpg', 1, '2022-05-01 18:13:27'),
(2, 1, 'La bolsa de valores', 'Conoce los diferentes mercados que existen en el mundo y sácales provecho.', 'vistas/videos/cuerpo-activo/02-video/02-video.m3u8', 'vistas/videos/cuerpo-activo/02-video.mp4', 'vistas/img/cuerpo-activo/02-imagen.jpg', 1, '2022-05-01 18:13:16'),
(3, 1, 'La inflación', 'La inflación, en economía, es el aumento generalizado y sostenido de los precios de los bienes y servicios existentes en el mercado durante un determinado período de tiempo.', 'vistas/videos/cuerpo-activo/03-video/03-video.m3u8', 'vistas/videos/cuerpo-activo/03-video.mp4', 'vistas/img/cuerpo-activo/03-imagen.jpg', 1, '2022-05-01 18:13:49'),
(4, 1, 'Los CFDs', 'Un contrato por diferencia es un contrato entre dos partes, el comprador y el vendedor, que estipula que el vendedor pagará al comprador la diferencia entre su valor actual.', 'vistas/videos/cuerpo-activo/04-video/04-video.m3u8', 'vistas/videos/cuerpo-activo/04-video.mp4', 'vistas/img/cuerpo-activo/04-imagen.jpg', 0, '2022-05-01 18:14:06'),
(5, 1, 'Dividendos - parte 1', 'Un dividendo es una distribución de ganancias de una corporación a sus accionistas.', 'vistas/videos/cuerpo-activo/05-video/05-video.m3u8', 'vistas/videos/cuerpo-activo/05-video.mp4', 'vistas/img/cuerpo-activo/05-imagen.jpg', 0, '2022-05-01 18:14:27'),
(6, 1, 'Dividendos - parte 2', 'Cuando una corporación obtiene una ganancia o un superávit, puede pagar una parte de la ganancia como dividendo a los accionistas.', 'vistas/videos/cuerpo-activo/06-video/06-video.m3u8', 'vistas/videos/cuerpo-activo/06-video.mp4', 'vistas/img/cuerpo-activo/06-imagen.jpg', 0, '2022-05-01 18:14:37'),
(7, 2, 'Análisis técnico', 'El estudio de la acción del mercado, principalmente a través del uso de gráficas, con el propósito de anticipar, con mayor probabilidad cambios en la estructura del mercado.', 'vistas/videos/mente-sana/01-video/01-video.m3u8', 'vistas/videos/mente-sana/01-video.mp4', 'vistas/img/mente-sana/01-imagen.jpg', 1, '2022-05-01 18:18:19'),
(8, 2, 'Líneas de Tendencia', 'La línea de tendencia es la recta que une los mínimos crecientes que forman una tendencia alcista o los máximos decrecientes que forman una tendencia bajista.', 'vistas/videos/mente-sana/02-video/02-video.m3u8', 'vistas/videos/mente-sana/02-video.mp4', 'vistas/img/mente-sana/02-imagen.jpg', 1, '2022-05-01 18:18:33'),
(9, 2, 'Velas Japonesas', 'En Economía, el gráfico de velas o velas japonesas es un tipo de gráfico muy utilizado en el análisis técnico bursátil. ', 'vistas/videos/mente-sana/03-video/03-video.m3u8', 'vistas/videos/mente-sana/03-video.mp4', 'vistas/img/mente-sana/03-imagen.jpg', 1, '2022-05-01 18:18:46'),
(10, 2, 'Forex', 'El mercado de divisas o mercado cambiario, también conocido como Forex, FX o Currency Market, es un mercado mundial y descentralizado en el que se negocian divisas. ', 'vistas/videos/mente-sana/04-video/04-video.m3u8', 'vistas/videos/mente-sana/04-video.mp4', 'vistas/img/mente-sana/04-imagen.jpg', 0, '2022-05-01 18:19:00'),
(11, 2, 'Medias móviles ', 'En estadística, una media móvil es un cálculo utilizado para analizar un conjunto de datos en modo de puntos para crear series de promedios.', 'vistas/videos/mente-sana/05-video/05-video.m3u8', 'vistas/videos/mente-sana/05-video.mp4', 'vistas/img/mente-sana/05-imagen.jpg', 0, '2022-05-01 18:19:12'),
(12, 2, 'Fibonacci', 'Dentro del análisis técnico, los retrocesos de Fibonacci se refieren a la posibilidad de que el precio de un activo financiero retroceda una porción considerable del movimiento original.', 'vistas/videos/mente-sana/06-video/06-video.m3u8', 'vistas/videos/mente-sana/06-video.mp4', 'vistas/img/mente-sana/06-imagen.jpg', 0, '2022-05-01 18:19:25'),
(13, 3, 'Plan de trading', 'El plan de trading es una herramienta que sirve para que el trader pueda organizar sus inversiones. ', 'vistas/videos/espiritu-libre/01-video/01-video.m3u8', 'vistas/videos/espiritu-libre/01-video.mp4', 'vistas/img/espiritu-libre/01-imagen.jpg', 1, '2022-05-01 18:22:46'),
(14, 3, 'Gestión de riesgo', 'La gestión de riesgos es un enfoque estructurado para manejar la incertidumbre relativa a una amenaza a través de una secuencia de actividades humanas.', 'vistas/videos/espiritu-libre/02-video/02-video.m3u8', 'vistas/videos/mente-sana/02-video.mp4', 'vistas/img/espiritu-libre/02-imagen.jpg', 1, '2022-05-01 18:25:27'),
(15, 3, 'Social trading', 'El Social trading es una estrategia de trading, en la cual un usuario replica las operaciones de expertos en los mercados financieros.', 'vistas/videos/espiritu-libre/03-video/03-video.m3u8', 'vistas/videos/mente-sana/03-video.mp4', 'vistas/img/espiritu-libre/03-imagen.jpg', 1, '2022-05-01 18:25:13'),
(16, 3, 'Aprovecha las crisis ', 'Crisis económica es la fase de un ciclo económico en la que se da un período de escasez en la producción, comercialización o consumo de productos y servicios.', 'vistas/videos/espiritu-libre/04-video/04-video.m3u8', 'vistas/videos/mente-sana/04-video.mp4', 'vistas/img/espiritu-libre/04-imagen.jpg', 0, '2022-05-01 18:24:22'),
(17, 3, 'Invierte en estas acciones', 'Una acción es un título emitido por una Sociedad Anónima o Sociedad comanditaria por acciones que representa el valor de una de las fracciones iguales en que se divide su capital social.', 'vistas/videos/espiritu-libre/05-video/05-video.m3u8', 'vistas/videos/mente-sana/05-video.mp4', 'vistas/img/espiritu-libre/05-imagen.jpg', 0, '2022-05-01 18:23:42'),
(18, 3, 'El bitcoin ', 'Bitcoin es una moneda virtual o un medio de intercambio electrónico que sirve para adquirir productos y servicios como cualquier otra moneda.', 'vistas/videos/espiritu-libre/06-video/06-video.m3u8', 'vistas/videos/mente-sana/06-video.mp4', 'vistas/img/espiritu-libre/06-imagen.jpg', 0, '2022-05-01 18:23:58');

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
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
