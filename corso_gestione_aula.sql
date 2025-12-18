-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2025 at 06:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `corso_gestione_aula`
--
CREATE DATABASE IF NOT EXISTS `corso_gestione_aula` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `corso_gestione_aula`;

-- --------------------------------------------------------

--
-- Table structure for table `corsisti`
--

DROP TABLE IF EXISTS `corsisti`;
CREATE TABLE `corsisti` (
  `id` int(11) NOT NULL,
  `codice_fiscale` char(16) DEFAULT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `mail` tinytext DEFAULT NULL,
  `cellulare` varchar(20) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `localita_residenza` varchar(80) DEFAULT NULL,
  `cap` varchar(45) DEFAULT NULL,
  `provincia` varchar(2) DEFAULT NULL,
  `corsisticol` varchar(5) DEFAULT NULL,
  `genere` enum('M','F','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iscrizioni`
--

DROP TABLE IF EXISTS `iscrizioni`;
CREATE TABLE `iscrizioni` (
  `corsista_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moduli`
--

DROP TABLE IF EXISTS `moduli`;
CREATE TABLE `moduli` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `numero_ore` smallint(6) DEFAULT NULL,
  `unita_formativa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provincie`
--

DROP TABLE IF EXISTS `provincie`;
CREATE TABLE `provincie` (
  `id` int(11) NOT NULL COMMENT 'è la chiave primaria',
  `nome` varchar(50) DEFAULT NULL,
  `sigla` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unita_formative`
--

DROP TABLE IF EXISTS `unita_formative`;
CREATE TABLE `unita_formative` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `numero_ore` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `unita_formative`
--

INSERT INTO `unita_formative` (`id`, `nome`, `numero_ore`) VALUES
(1, 'UF1', 100),
(2, 'UF2', 80),
(3, 'UF3', 110),
(4, 'UF4', 115);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `corsisti`
--
ALTER TABLE `corsisti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codice_fiscale_UNIQUE` (`codice_fiscale`);

--
-- Indexes for table `iscrizioni`
--
ALTER TABLE `iscrizioni`
  ADD PRIMARY KEY (`corsista_id`,`modulo_id`),
  ADD KEY `fk_corsisti_has_moduli_moduli1_idx` (`modulo_id`),
  ADD KEY `fk_corsisti_has_moduli_corsisti1_idx` (`corsista_id`);

--
-- Indexes for table `moduli`
--
ALTER TABLE `moduli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_moduli_unita_formative_idx` (`unita_formativa_id`);

--
-- Indexes for table `provincie`
--
ALTER TABLE `provincie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sigla_province_unique` (`sigla`),
  ADD KEY `nome_province_index` (`nome`);

--
-- Indexes for table `unita_formative`
--
ALTER TABLE `unita_formative`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idunita_formative_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `corsisti`
--
ALTER TABLE `corsisti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moduli`
--
ALTER TABLE `moduli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provincie`
--
ALTER TABLE `provincie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'è la chiave primaria';

--
-- AUTO_INCREMENT for table `unita_formative`
--
ALTER TABLE `unita_formative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `iscrizioni`
--
ALTER TABLE `iscrizioni`
  ADD CONSTRAINT `fk_corsisti_has_moduli_corsisti1` FOREIGN KEY (`corsista_id`) REFERENCES `corsisti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_corsisti_has_moduli_moduli1` FOREIGN KEY (`modulo_id`) REFERENCES `moduli` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `moduli`
--
ALTER TABLE `moduli`
  ADD CONSTRAINT `fk_moduli_unita_formative` FOREIGN KEY (`unita_formativa_id`) REFERENCES `unita_formative` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
