-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 10, 2023 at 08:15 AM
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

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `date`, `email`, `firstname`, `name`, `origine_id`) VALUES
(24, '2023-02-09 08:55:30', 'alfred.dupont@gmail.com', 'Alfred', 'Alfred', NULL),
(25, '2023-02-09 08:55:30', 'b.lav@hotmail.fr', 'Bertrand', 'Bertrand', NULL),
(26, '2023-02-09 08:55:30', 'sarahlamine@gmail.com', 'Sarah', 'Sarah', NULL),
(27, '2023-02-09 08:55:30', 'mo78@laposte.net', 'Mohamed', 'Mohamed', NULL),
(28, '2023-02-09 09:57:12', 'saturn-solar@outlook.com', 'olivier', 'garnier', 3),
(29, '2023-02-09 09:57:15', 'saturn-solar@outlook.com', 'olivier', 'garnier', 4),
(30, '2023-02-09 15:23:31', 'saturn-solar@outlook.com', 'olivier', 'garnier', 4),
(31, '2023-02-09 15:51:11', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 3),
(32, '2023-02-09 15:51:11', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 3),
(33, '2023-02-09 15:51:16', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(34, '2023-02-09 15:51:16', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(35, '2023-02-09 15:55:31', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(36, '2023-02-09 15:56:35', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(37, '2023-02-09 15:56:35', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(38, '2023-02-09 15:56:54', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(39, '2023-02-09 15:56:54', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(40, '2023-02-09 15:57:41', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(41, '2023-02-09 15:57:41', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(42, '2023-02-09 15:58:54', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(43, '2023-02-09 15:58:54', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(44, '2023-02-09 16:00:23', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(45, '2023-02-09 16:00:23', 'mr.ogarnier@gmail.com', 'olivier', 'Garnier', 4),
(46, '2023-02-09 16:00:45', 'saturn-solar@outlook.com', 'olivier', 'garnier', 2),
(47, '2023-02-09 16:00:45', 'saturn-solar@outlook.com', 'olivier', 'garnier', 2),
(48, '2023-02-09 16:03:58', 'saturn-solar@outlook.com', 'olivier', 'garnier', 2),
(49, '2023-02-09 16:03:58', 'saturn-solar@outlook.com', 'olivier', 'garnier', 2),
(50, '2023-02-09 16:08:14', 'saturn-solar@outlook.com', 'olivier', 'garnier', 2),
(51, '2023-02-09 16:08:14', 'saturn-solar@outlook.com', 'olivier', 'garnier', 2),
(52, '2023-02-09 16:08:54', 'saturn-solar@outlook.com', 'olivier', 'garnier', 2),
(53, '2023-02-09 16:08:54', 'saturn-solar@outlook.com', 'olivier', 'garnier', 2),
(54, '2023-02-09 16:09:00', 'saturn-solar@outlook.com', 'olivier', 'garnier', 4),
(55, '2023-02-09 16:09:00', 'saturn-solar@outlook.com', 'olivier', 'garnier', 4),
(56, '2023-02-10 09:12:38', 'saturn-solar@outlook.com', 'Olivier', 'Garnier', 2),
(57, '2023-02-10 09:12:38', 'saturn-solar@outlook.com', 'Olivier', 'Garnier', 2);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers_interests`
--

CREATE TABLE `subscribers_interests` (
  `subscribers_id` int NOT NULL,
  `interests_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscribers_interests`
--

INSERT INTO `subscribers_interests` (`subscribers_id`, `interests_id`) VALUES
(50, 8),
(50, 7),
(52, 8),
(52, 7),
(54, 8),
(54, 7),
(56, 9),
(56, 1);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
