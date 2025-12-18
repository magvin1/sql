-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2025 at 06:05 PM
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
-- Database: `gestione_corsi`
--
CREATE DATABASE IF NOT EXISTS `gestione_corsi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestione_corsi`;

-- --------------------------------------------------------

--
-- Table structure for table `aule`
--

DROP TABLE IF EXISTS `aule`;
CREATE TABLE `aule` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `capienza` int(11) NOT NULL,
  `numero` char(3) NOT NULL,
  `sede_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aule`
--

INSERT INTO `aule` (`id`, `nome`, `capienza`, `numero`, `sede_id`) VALUES
(1, 'Aula Magna', 100, 'A01', 1),
(2, 'Laboratorio', 30, 'L02', 2),
(3, 'Aula Standard', 50, 'S03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certificazioni`
--

DROP TABLE IF EXISTS `certificazioni`;
CREATE TABLE `certificazioni` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_certificazione` date NOT NULL,
  `punteggio_minimo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `corsi`
--

DROP TABLE IF EXISTS `corsi`;
CREATE TABLE `corsi` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `durata_ore` int(11) NOT NULL,
  `costo` decimal(8,2) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corsi`
--

INSERT INTO `corsi` (`id`, `nome`, `descrizione`, `durata_ore`, `costo`, `data_inizio`, `data_fine`) VALUES
(1, 'SQL Base', 'Corso introduttivo a SQL', 40, 300.00, '2023-04-01', '2023-04-30'),
(2, 'MySQL Avanzato', 'Approfondimenti su MySQL', 60, 450.50, '2023-05-01', '2023-06-15'),
(3, 'Programmazione PHP', 'Corso di programmazione con PHP', 50, 350.75, '2023-06-01', '2023-06-30'),
(4, 'Microsoft Excel', 'Excel livello intermedio', 16, 150.00, '2025-10-14', '2025-12-08'),
(5, 'eccel livello base', NULL, 16, 145.00, '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `corsisti`
--

DROP TABLE IF EXISTS `corsisti`;
CREATE TABLE `corsisti` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_nascita` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corsisti`
--

INSERT INTO `corsisti` (`id`, `nome`, `cognome`, `data_nascita`, `email`, `telefono`) VALUES
(1, 'Mario', 'Rossi', '1985-04-15', 'mario.rossi@example.com', '1234567890'),
(2, 'Anna', 'Bianchi', '1990-07-20', 'anna.bianchi@example.com', '0987654321'),
(3, 'Luca', 'Verdi', '1988-11-30', 'luca.verdi@example.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `corsi_frequentati`
--

DROP TABLE IF EXISTS `corsi_frequentati`;
CREATE TABLE `corsi_frequentati` (
  `id` int(11) NOT NULL,
  `corsista_id` int(11) NOT NULL,
  `corso_id` int(11) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  `voto_finale` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corsi_frequentati`
--

INSERT INTO `corsi_frequentati` (`id`, `corsista_id`, `corso_id`, `data_inizio`, `data_fine`, `voto_finale`) VALUES
(1, 1, 1, '2025-10-12', '2025-11-30', NULL),
(2, 2, 1, '2025-10-12', '2025-11-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `docenti`
--

DROP TABLE IF EXISTS `docenti`;
CREATE TABLE `docenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_assunzione` date NOT NULL,
  `stipendio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sedi`
--

DROP TABLE IF EXISTS `sedi`;
CREATE TABLE `sedi` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `localita` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sedi`
--

INSERT INTO `sedi` (`id`, `nome`, `indirizzo`, `localita`) VALUES
(1, '', 'principale', 'Rimini'),
(2, '', 'secondaria', 'Riccione');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aule`
--
ALTER TABLE `aule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sede_id_idx` (`sede_id`);

--
-- Indexes for table `certificazioni`
--
ALTER TABLE `certificazioni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corsisti`
--
ALTER TABLE `corsisti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `corsi_frequentati`
--
ALTER TABLE `corsi_frequentati`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_corsista_id_idx` (`corsista_id`),
  ADD KEY `fk_corso_id_idx` (`corso_id`);

--
-- Indexes for table `docenti`
--
ALTER TABLE `docenti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sedi`
--
ALTER TABLE `sedi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nome_idx` (`nome`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aule`
--
ALTER TABLE `aule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `certificazioni`
--
ALTER TABLE `certificazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `corsi`
--
ALTER TABLE `corsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `corsisti`
--
ALTER TABLE `corsisti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `corsi_frequentati`
--
ALTER TABLE `corsi_frequentati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `docenti`
--
ALTER TABLE `docenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sedi`
--
ALTER TABLE `sedi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aule`
--
ALTER TABLE `aule`
  ADD CONSTRAINT `fk_aule_sedi` FOREIGN KEY (`sede_id`) REFERENCES `sedi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `corsi_frequentati`
--
ALTER TABLE `corsi_frequentati`
  ADD CONSTRAINT `fk_corsista_id` FOREIGN KEY (`corsista_id`) REFERENCES `corsisti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_corso_id` FOREIGN KEY (`corso_id`) REFERENCES `corsi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
