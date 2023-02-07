-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 07, 2023 at 01:50 PM
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
(1, 'Comment avez-vous connu la galerie ?'),
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

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `date`, `email`, `firstname`, `name`, `origine_id`) VALUES
(1, '2023-02-03 13:16:20', 'alfred.dupont@gmail.com', 'Alfred', 'Alfred', NULL),
(2, '2023-02-03 13:16:20', 'b.lav@hotmail.fr', 'Bertrand', 'Bertrand', NULL),
(3, '2023-02-03 13:16:20', 'sarahlamine@gmail.com', 'Sarah', 'Sarah', NULL),
(4, '2023-02-03 13:16:20', 'mo78@laposte.net', 'Mohamed', 'Mohamed', NULL),
(5, '2023-02-03 15:52:09', 'saturn-solar@outlook.com', 'olivier', 'garnier', 3),
(6, '2023-02-07 13:47:58', 'alfred.dupont@gmail.com', 'Alfred', 'Alfred', NULL),
(7, '2023-02-07 13:47:58', 'b.lav@hotmail.fr', 'Bertrand', 'Bertrand', NULL),
(8, '2023-02-07 13:47:58', 'sarahlamine@gmail.com', 'Sarah', 'Sarah', NULL),
(9, '2023-02-07 13:47:58', 'mo78@laposte.net', 'Mohamed', 'Mohamed', NULL);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `origines`
--
ALTER TABLE `origines`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `fksubscibers` FOREIGN KEY (`origine_id`) REFERENCES `origines` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
