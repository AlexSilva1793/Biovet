-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-03-2020 a las 21:53:08
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Biovet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Agenda`
--

CREATE TABLE `Agenda` (
  `idAgenda` int(11) NOT NULL,
  `fechaAgenda` datetime NOT NULL,
  `fkServicio` int(11) NOT NULL,
  `fkMascota` int(11) NOT NULL,
  `fkEstadoAgenda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ConsultaMedica`
--

CREATE TABLE `ConsultaMedica` (
  `idConsulta` int(11) NOT NULL,
  `motivoConsulta` varchar(45) NOT NULL,
  `fechaConsulta` timestamp NULL DEFAULT current_timestamp(),
  `descripcionConsulta` varchar(200) NOT NULL,
  `peso` float NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fkHistoriaClinica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ConsultaMedica_has_Examen`
--

CREATE TABLE `ConsultaMedica_has_Examen` (
  `fkConsulta` int(11) NOT NULL,
  `fkExamen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ConsultaMedica_has_ProcedimientoQuirurgico`
--

CREATE TABLE `ConsultaMedica_has_ProcedimientoQuirurgico` (
  `fkConsulta` int(11) NOT NULL,
  `fkProcedimientoQuirurgico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ConsultaMedica_has_Vacuna`
--

CREATE TABLE `ConsultaMedica_has_Vacuna` (
  `fkConsulta` int(11) NOT NULL,
  `fkVacuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Especie`
--

CREATE TABLE `Especie` (
  `idEspecie` int(11) NOT NULL,
  `tipoEspecie` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Especie`
--

INSERT INTO `Especie` (`idEspecie`, `tipoEspecie`) VALUES
(1, 'Canino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoAgenda`
--

CREATE TABLE `estadoAgenda` (
  `idestadoAgenda` int(11) NOT NULL,
  `nombreEstado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Examen`
--

CREATE TABLE `Examen` (
  `idExamen` int(11) NOT NULL,
  `tipoExamen` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Genero`
--

CREATE TABLE `Genero` (
  `idGenero` int(11) NOT NULL,
  `tipoSexo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Genero`
--

INSERT INTO `Genero` (`idGenero`, `tipoSexo`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `HistoriaClinica`
--

CREATE TABLE `HistoriaClinica` (
  `idHistoriaClinica` int(11) NOT NULL,
  `fechaApertura` timestamp NULL DEFAULT current_timestamp(),
  `fkMascota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `HistoriaClinica`
--

INSERT INTO `HistoriaClinica` (`idHistoriaClinica`, `fechaApertura`, `fkMascota`) VALUES
(2, '2020-03-10 23:43:30', 1),
(3, '2020-03-10 23:43:30', 4);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listarMascota`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `listarMascota` (
`idMascota` int(11)
,`nombreMascota` varchar(100)
,`fechaNacimiento` date
,`nombreUsuario` varchar(100)
,`tipoRaza` varchar(45)
,`tipoSexo` varchar(45)
,`ColorMascota` varchar(60)
,`estadoMascota` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mascota`
--

CREATE TABLE `Mascota` (
  `idMascota` int(11) NOT NULL,
  `nombreMascota` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fkUsuario` int(11) NOT NULL,
  `fkRaza` int(11) NOT NULL,
  `fkGenero` int(11) NOT NULL,
  `ColorMascota` varchar(60) NOT NULL,
  `estadoMascota` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Mascota`
--

INSERT INTO `Mascota` (`idMascota`, `nombreMascota`, `fechaNacimiento`, `fkUsuario`, `fkRaza`, `fkGenero`, `ColorMascota`, `estadoMascota`) VALUES
(1, 'Max', '2020-02-11', 1, 1, 1, 'Negro', 1),
(2, 'Kira', '2020-02-03', 2, 2, 2, 'Cafe', 1),
(3, 'Rita', '2020-02-11', 1, 1, 2, 'Blanca', 1),
(4, 'mascotaprueba', '2020-02-11', 5, 1, 1, 'rojo', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mascotaUsuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mascotaUsuario` (
`idMascota` int(11)
,`nombreMascota` varchar(100)
,`fechaNacimiento` date
,`fkUsuario` int(11)
,`tipoRaza` varchar(45)
,`tipoSexo` varchar(45)
,`ColorMascota` varchar(60)
,`estadoMascota` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ProcedimientoQuirurgico`
--

CREATE TABLE `ProcedimientoQuirurgico` (
  `idProcedimientoQuirurgico` int(11) NOT NULL,
  `tipoProcedimientoQuirurgico` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Raza`
--

CREATE TABLE `Raza` (
  `idRaza` int(11) NOT NULL,
  `tipoRaza` varchar(45) NOT NULL,
  `fkEspecie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Raza`
--

INSERT INTO `Raza` (`idRaza`, `tipoRaza`, `fkEspecie`) VALUES
(1, 'Labrador', 1),
(2, 'Pitbull', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rol`
--

CREATE TABLE `Rol` (
  `idRol` int(11) NOT NULL,
  `tipoRol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Rol`
--

INSERT INTO `Rol` (`idRol`, `tipoRol`) VALUES
(1, 'Administrador'),
(2, 'Usuario'),
(3, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Servicio`
--

CREATE TABLE `Servicio` (
  `idServicio` int(11) NOT NULL,
  `descripcionServicio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoDocumento`
--

CREATE TABLE `TipoDocumento` (
  `idTipoDocu` int(11) NOT NULL,
  `tipoDocu` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TipoDocumento`
--

INSERT INTO `TipoDocumento` (`idTipoDocu`, `tipoDocu`) VALUES
(1, 'Cedula de Ciudadania'),
(2, 'Cedula de Extranjeria'),
(3, 'NIT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `idUsuario` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombreUsuario` varchar(100) NOT NULL,
  `apellidoUsuario` varchar(100) NOT NULL,
  `contraseñaUsuario` varchar(12) NOT NULL,
  `direcciòn` varchar(100) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `telefonoFijo` varchar(11) DEFAULT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `estadoUsuario` tinyint(1) NOT NULL,
  `fkTipoDocu` int(11) NOT NULL,
  `fkRol` int(11) NOT NULL,
  `fkGenero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`idUsuario`, `cedula`, `nombreUsuario`, `apellidoUsuario`, `contraseñaUsuario`, `direcciòn`, `celular`, `telefonoFijo`, `correoUsuario`, `estadoUsuario`, `fkTipoDocu`, `fkRol`, `fkGenero`) VALUES
(1, '1014246133', 'Alex', 'Silva', '1234', NULL, NULL, NULL, 'aaa@gmail.com', 1, 1, 1, NULL),
(2, '1032412490', 'Fabiàn', 'Jimènez', '123', NULL, NULL, NULL, 'fj@mail.com', 1, 1, 1, 1),
(4, 'sadas', 'sdada', 'asdasd', 'sadasd', 'Direcciòn', 'Celular', 'Telefono', 'sadas@gmail.com', 1, 1, 2, 4),
(5, 'prueba', 'prueba', 'prueba', 'prueba', 'Direcciòn', 'Celular', 'Telefono', 'prueba@gmail.com', 1, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vacuna`
--

CREATE TABLE `Vacuna` (
  `idVacuna` int(11) NOT NULL,
  `tipoVacuna` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura para la vista `listarMascota`
--
DROP TABLE IF EXISTS `listarMascota`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listarMascota`  AS  select `M`.`idMascota` AS `idMascota`,`M`.`nombreMascota` AS `nombreMascota`,`M`.`fechaNacimiento` AS `fechaNacimiento`,`U`.`nombreUsuario` AS `nombreUsuario`,`R`.`tipoRaza` AS `tipoRaza`,`G`.`tipoSexo` AS `tipoSexo`,`M`.`ColorMascota` AS `ColorMascota`,`M`.`estadoMascota` AS `estadoMascota` from (((`Mascota` `M` join `Usuario` `U` on(`M`.`fkUsuario` = `U`.`idUsuario`)) join `Raza` `R` on(`M`.`fkRaza` = `R`.`idRaza`)) join `Genero` `G` on(`M`.`fkGenero` = `G`.`idGenero`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mascotaUsuario`
--
DROP TABLE IF EXISTS `mascotaUsuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mascotaUsuario`  AS  select `Mascota`.`idMascota` AS `idMascota`,`Mascota`.`nombreMascota` AS `nombreMascota`,`Mascota`.`fechaNacimiento` AS `fechaNacimiento`,`Mascota`.`fkUsuario` AS `fkUsuario`,`Raza`.`tipoRaza` AS `tipoRaza`,`Genero`.`tipoSexo` AS `tipoSexo`,`Mascota`.`ColorMascota` AS `ColorMascota`,`Mascota`.`estadoMascota` AS `estadoMascota` from ((`Mascota` join `Raza` on(`Mascota`.`fkRaza` = `Raza`.`idRaza`)) join `Genero` on(`Mascota`.`fkGenero` = `Genero`.`idGenero`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Agenda`
--
ALTER TABLE `Agenda`
  ADD PRIMARY KEY (`idAgenda`),
  ADD KEY `fk_Agenda_Servicio1_idx` (`fkServicio`),
  ADD KEY `fk_Agenda_Mascota1_idx` (`fkMascota`),
  ADD KEY `fk_Agenda_estadoAgenda1_idx` (`fkEstadoAgenda`);

--
-- Indices de la tabla `ConsultaMedica`
--
ALTER TABLE `ConsultaMedica`
  ADD PRIMARY KEY (`idConsulta`),
  ADD KEY `fk_MotivoConsulta_HistoriaClinica1_idx` (`fkHistoriaClinica`);

--
-- Indices de la tabla `ConsultaMedica_has_Examen`
--
ALTER TABLE `ConsultaMedica_has_Examen`
  ADD PRIMARY KEY (`fkConsulta`,`fkExamen`),
  ADD KEY `fk_ConsultaMedica_has_Examen_Examen1_idx` (`fkExamen`),
  ADD KEY `fk_ConsultaMedica_has_Examen_ConsultaMedica1_idx` (`fkConsulta`);

--
-- Indices de la tabla `ConsultaMedica_has_ProcedimientoQuirurgico`
--
ALTER TABLE `ConsultaMedica_has_ProcedimientoQuirurgico`
  ADD PRIMARY KEY (`fkConsulta`,`fkProcedimientoQuirurgico`),
  ADD KEY `fk_ConsultaMedica_has_ProcedimientoQuirurgico_Procedimiento_idx` (`fkProcedimientoQuirurgico`),
  ADD KEY `fk_ConsultaMedica_has_ProcedimientoQuirurgico_ConsultaMedic_idx` (`fkConsulta`);

--
-- Indices de la tabla `ConsultaMedica_has_Vacuna`
--
ALTER TABLE `ConsultaMedica_has_Vacuna`
  ADD PRIMARY KEY (`fkConsulta`,`fkVacuna`),
  ADD KEY `fk_ConsultaMedica_has_Vacuna_Vacuna1_idx` (`fkVacuna`),
  ADD KEY `fk_ConsultaMedica_has_Vacuna_ConsultaMedica1_idx` (`fkConsulta`);

--
-- Indices de la tabla `Especie`
--
ALTER TABLE `Especie`
  ADD PRIMARY KEY (`idEspecie`);

--
-- Indices de la tabla `estadoAgenda`
--
ALTER TABLE `estadoAgenda`
  ADD PRIMARY KEY (`idestadoAgenda`);

--
-- Indices de la tabla `Examen`
--
ALTER TABLE `Examen`
  ADD PRIMARY KEY (`idExamen`);

--
-- Indices de la tabla `Genero`
--
ALTER TABLE `Genero`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `HistoriaClinica`
--
ALTER TABLE `HistoriaClinica`
  ADD PRIMARY KEY (`idHistoriaClinica`),
  ADD KEY `fk_HistoriaClinica_Mascota1_idx` (`fkMascota`);

--
-- Indices de la tabla `Mascota`
--
ALTER TABLE `Mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `fk_Mascota_Usuario1_idx` (`fkUsuario`),
  ADD KEY `fk_Mascota_Raza1_idx` (`fkRaza`),
  ADD KEY `fk_Mascota_Sexo1_idx` (`fkGenero`);

--
-- Indices de la tabla `ProcedimientoQuirurgico`
--
ALTER TABLE `ProcedimientoQuirurgico`
  ADD PRIMARY KEY (`idProcedimientoQuirurgico`);

--
-- Indices de la tabla `Raza`
--
ALTER TABLE `Raza`
  ADD PRIMARY KEY (`idRaza`),
  ADD KEY `fk_Raza_Especie1_idx` (`fkEspecie`);

--
-- Indices de la tabla `Rol`
--
ALTER TABLE `Rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `Servicio`
--
ALTER TABLE `Servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `TipoDocumento`
--
ALTER TABLE `TipoDocumento`
  ADD PRIMARY KEY (`idTipoDocu`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_TipoDocumento_idx` (`fkTipoDocu`),
  ADD KEY `fk_Usuario_Rol1_idx` (`fkRol`),
  ADD KEY `fk_Usuario_Sexo1_idx` (`fkGenero`);

--
-- Indices de la tabla `Vacuna`
--
ALTER TABLE `Vacuna`
  ADD PRIMARY KEY (`idVacuna`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Agenda`
--
ALTER TABLE `Agenda`
  MODIFY `idAgenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ConsultaMedica`
--
ALTER TABLE `ConsultaMedica`
  MODIFY `idConsulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Especie`
--
ALTER TABLE `Especie`
  MODIFY `idEspecie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Genero`
--
ALTER TABLE `Genero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `HistoriaClinica`
--
ALTER TABLE `HistoriaClinica`
  MODIFY `idHistoriaClinica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `Mascota`
--
ALTER TABLE `Mascota`
  MODIFY `idMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Raza`
--
ALTER TABLE `Raza`
  MODIFY `idRaza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
