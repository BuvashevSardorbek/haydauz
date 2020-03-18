-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 17, 2020 at 05:53 PM
-- Server version: 10.3.15-MariaDB-1
-- PHP Version: 7.3.8-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `haydauz`
--

-- --------------------------------------------------------

--
-- Table structure for table `haydovchi`
--

CREATE TABLE `haydovchi` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `carNumber` varchar(255) NOT NULL,
  `car` text NOT NULL,
  `data` datetime NOT NULL,
  `band` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `haydovchi`
--

INSERT INTO `haydovchi` (`id`, `first_name`, `last_name`, `phone`, `carNumber`, `car`, `data`, `band`) VALUES
(1, 'Xasanov', 'Navruzbek', 991234567, '40F414FF', 'Oq rangli Nexia 3', '2020-03-04 14:23:32', '1'),
(2, 'Otajonov', 'Dostonbek', 12346878, '60P756MP', 'Mokriy Spark', '2020-03-03 06:47:32', '0'),
(3, 'test', 'test', 12346547, '30S757AA', 'ssa dsf sdvsdfdsfsd sdv', '2020-03-25 08:29:13', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mijoz`
--

CREATE TABLE `mijoz` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `adress` text DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `createData` datetime DEFAULT NULL,
  `haydovchiId` int(11) DEFAULT NULL,
  `briktirildi` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mijoz`
--

INSERT INTO `mijoz` (`id`, `first_name`, `last_name`, `phone`, `adress`, `data`, `createData`, `haydovchiId`, `briktirildi`) VALUES
(1, 'Sardorbek', 'Buavshev', 936439414, 'Farg\'onadan - Toshkentga', '2020-03-06 12:36:00', '2020-03-05 21:03:23', 2, '1'),
(7, 'Muhiddinov', 'Navruzbek', 999996609, 'Farg\'ona - Toshkent', '2020-03-21 09:11:30', '2020-03-07 16:40:46', 2, '1'),
(8, 'Xasanov', 'Sardor', 945566334, 'Farg\'ona - Qo\'qon', '2020-03-18 07:36:23', '2020-03-12 07:20:00', 1, '1'),
(25, 'test', 'test', 999996699, 'test - test', '2020-03-11 08:30:00', '2020-03-10 19:15:01', 3, '1'),
(26, 'isxoqjon', 'axmedov', 1112233, 'farg\'ona - oltinko\'l\r\n', NULL, NULL, NULL, '0'),
(27, 'testtert', 'ertret', 998469414, 'sdfdsfsdfsdhgsdfh dfg', NULL, NULL, 3, '1'),
(28, 'sadsadasd', 'asdasdasdsad', 12321312, 'asddddddddddddddddddddd', NULL, NULL, 2, '1'),
(29, 'iuhihi', 'hjbhb', 998469414, 'jsdnfj jdsfnjkn jfkdsbf', NULL, NULL, 2, '1'),
(30, 'test', 'test', 998469414, 'estest', NULL, NULL, NULL, '0'),
(31, 'test', 'test', 998469414, 'fargona - toshkent', NULL, NULL, 3, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `haydovchi`
--
ALTER TABLE `haydovchi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mijoz`
--
ALTER TABLE `mijoz`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `haydovchi`
--
ALTER TABLE `haydovchi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mijoz`
--
ALTER TABLE `mijoz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
