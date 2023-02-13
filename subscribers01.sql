-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 13, 2023 at 09:37 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `subscribers01`
--

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `id_interest` int NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`id_interest`, `label`) VALUES
(1, 'Peinture'),
(3, 'Sculpture'),
(5, 'Photographie'),
(6, 'Art contemporain'),
(7, 'Films'),
(8, 'Art Numérique'),
(9, 'Installations');

-- --------------------------------------------------------

--
-- Table structure for table `origines`
--

CREATE TABLE `origines` (
  `id` int NOT NULL,
  `origine_label` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `origines`
--

INSERT INTO `origines` (`id`, `origine_label`) VALUES
(2, 'Un ami m’en a parlé\r\n\r\n'),
(3, 'Recherche sur internet\r\n'),
(4, 'Publicité dans un magazine\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `origine_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers_interests`
--

CREATE TABLE `subscribers_interests` (
  `subscribers_id` int NOT NULL,
  `interests_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`id_interest`);

--
-- Indexes for table `origines`
--
ALTER TABLE `origines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fksubscibers` (`origine_id`);

--
-- Indexes for table `subscribers_interests`
--
ALTER TABLE `subscribers_interests`
  ADD KEY `fk_subscriber_id` (`subscribers_id`),
  ADD KEY `fk_interests_id` (`interests_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
  MODIFY `id_interest` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `origines`
--
ALTER TABLE `origines`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `fksubscibers` FOREIGN KEY (`origine_id`) REFERENCES `origines` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `subscribers_interests`
--
ALTER TABLE `subscribers_interests`
  ADD CONSTRAINT `fk_interests_id` FOREIGN KEY (`interests_id`) REFERENCES `interest` (`id_interest`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_subscriber_id` FOREIGN KEY (`subscribers_id`) REFERENCES `subscribers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
