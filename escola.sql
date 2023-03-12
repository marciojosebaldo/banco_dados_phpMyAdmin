-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 12, 2023 at 10:48 AM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 7.3.33-10+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escola`
--

-- --------------------------------------------------------

--
-- Table structure for table `academico`
--

CREATE TABLE `academico` (
  `ra` varchar(50) NOT NULL,
  `cd_curso` mediumint NOT NULL,
  `nm_academico` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `academico`
--

INSERT INTO `academico` (`ra`, `cd_curso`, `nm_academico`) VALUES
('DI-2112', 2, 'Roberta Marques Gouveia'),
('DI-2113', 2, 'Vitor Sousa Baptista'),
('DI-2114', 2, 'Mateus Novaes'),
('SI-15536', 1, 'Aluísio Lima'),
('SI-15537', 1, 'Bruno Rodrigues'),
('SI-15538', 1, 'Manuella Carvalho Silva');

-- --------------------------------------------------------

--
-- Table structure for table `avaliacao`
--

CREATE TABLE `avaliacao` (
  `ra` varchar(50) DEFAULT NULL,
  `cd_avaliacao` mediumint NOT NULL,
  `cd_disc` mediumint DEFAULT NULL,
  `nr_nota` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `avaliacao`
--

INSERT INTO `avaliacao` (`ra`, `cd_avaliacao`, `cd_disc`, `nr_nota`) VALUES
('SI-15536', 1, 1, 5.5),
('SI-15536', 2, 1, 3.5),
('SI-15537', 3, 1, 7),
('SI-15537', 4, 1, 5),
('SI-15536', 5, 1, 6),
('SI-15538', 6, 1, 3.8),
('SI-15536', 7, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `cd_curso` mediumint NOT NULL,
  `nm_curso` varchar(30) DEFAULT NULL,
  `turno` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`cd_curso`, `nm_curso`, `turno`) VALUES
(1, 'Sistemas de Informação', 'S'),
(2, 'Direito', 'A'),
(3, 'Administração', 'A'),
(4, 'Sistemas para Internet', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `disciplina`
--

CREATE TABLE `disciplina` (
  `cd_disc` mediumint NOT NULL,
  `nm_disc` varchar(50) DEFAULT NULL,
  `nr_carg` mediumint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `disciplina`
--

INSERT INTO `disciplina` (`cd_disc`, `nm_disc`, `nr_carg`) VALUES
(1, 'Modelagem de Ontologias', 6),
(2, 'Banco de Dados não convencionais', 4),
(3, 'OQL', 4),
(4, 'Direito Penal I', 6),
(5, 'Direito Processual I', 4),
(6, 'Direito Civil', 4);

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `nr_aula` mediumint NOT NULL,
  `nr_dia` mediumint DEFAULT NULL,
  `cd_curso` mediumint DEFAULT NULL,
  `cd_disc` mediumint DEFAULT NULL,
  `cd_professor` mediumint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `horario`
--

INSERT INTO `horario` (`nr_aula`, `nr_dia`, `cd_curso`, `cd_disc`, `cd_professor`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 1, 1),
(3, 1, 1, 2, 2),
(4, 1, 1, 2, 2),
(5, 2, 1, 3, 3),
(6, 2, 1, 3, 3),
(7, 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `cd_professor` mediumint NOT NULL,
  `nm_professor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`cd_professor`, `nm_professor`) VALUES
(1, 'Francisco Ruiz'),
(2, 'Horacio Leone'),
(3, 'Renata Vieira'),
(4, 'Rosario Girardi'),
(5, 'Ana Paula Ambrosio'),
(6, 'Giancarlo Guizzardi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academico`
--
ALTER TABLE `academico`
  ADD PRIMARY KEY (`ra`),
  ADD KEY `fk_cd_curso` (`cd_curso`);

--
-- Indexes for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`cd_avaliacao`),
  ADD KEY `fk_avaliacao` (`cd_disc`),
  ADD KEY `fk_ra` (`ra`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cd_curso`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`cd_disc`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`nr_aula`),
  ADD KEY `fk_cd_disc` (`cd_disc`),
  ADD KEY `fk_cd_professor` (`cd_professor`),
  ADD KEY `fk_cd_curso1` (`cd_curso`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`cd_professor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `cd_curso` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `cd_disc` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `horario`
--
ALTER TABLE `horario`
  MODIFY `nr_aula` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `cd_professor` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academico`
--
ALTER TABLE `academico`
  ADD CONSTRAINT `fk_cd_curso` FOREIGN KEY (`cd_curso`) REFERENCES `curso` (`cd_curso`) ON DELETE CASCADE;

--
-- Constraints for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_avaliacao` FOREIGN KEY (`cd_disc`) REFERENCES `disciplina` (`cd_disc`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ra` FOREIGN KEY (`ra`) REFERENCES `academico` (`ra`);

--
-- Constraints for table `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_cd_curso1` FOREIGN KEY (`cd_curso`) REFERENCES `curso` (`cd_curso`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cd_disc` FOREIGN KEY (`cd_disc`) REFERENCES `disciplina` (`cd_disc`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cd_professor` FOREIGN KEY (`cd_professor`) REFERENCES `professor` (`cd_professor`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
