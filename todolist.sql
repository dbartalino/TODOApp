-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2019 at 10:33 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `addtask`
--

CREATE TABLE `addtask` (
  `NTASKID` int(11) NOT NULL,
  `STASKNAME` varchar(255) NOT NULL,
  `NUSERID` int(11) NOT NULL,
  `DTCREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addtask`
--

INSERT INTO `addtask` (`NTASKID`, `STASKNAME`, `NUSERID`, `DTCREATED`) VALUES
(1, 'Go to school', 1, '2019-01-12 15:31:14'),
(2, 'Swing around town', 1, '2019-01-12 15:32:25'),
(3, 'Take pictures', 1, '2019-01-12 15:32:37'),
(4, 'Go to work', 1, '2019-01-12 15:33:49'),
(5, 'Draw new costume', 1, '2019-01-12 20:16:16'),
(6, 'Call Tony', 1, '2019-01-12 20:16:27'),
(7, 'Visit Peter', 2, '2019-01-12 20:18:02'),
(8, 'Study for exam', 1, '2019-01-13 13:00:33'),
(9, 'Attend class.', 2, '2019-01-13 17:18:21'),
(10, 'Fight villains', 1, '2019-01-13 17:36:10'),
(11, 'Fill out application', 1, '2019-01-13 17:36:43'),
(12, 'Meet with AM', 1, '2019-01-14 16:25:50');

-- --------------------------------------------------------

--
-- Table structure for table `deletetask`
--

CREATE TABLE `deletetask` (
  `NTASKID` int(11) NOT NULL,
  `BTASKDELETED` tinyint(1) NOT NULL DEFAULT '0',
  `DTCREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DTCHANGEDON` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deletetask`
--

INSERT INTO `deletetask` (`NTASKID`, `BTASKDELETED`, `DTCREATED`, `DTCHANGEDON`) VALUES
(1, 0, '2019-01-12 15:31:14', '2019-01-12 18:01:46'),
(2, 0, '2019-01-12 15:32:25', '2019-01-13 12:58:45'),
(3, 0, '2019-01-12 15:32:37', '2019-01-13 12:58:39'),
(4, 0, '2019-01-12 15:33:49', '2019-01-13 12:58:45'),
(5, 0, '2019-01-12 20:16:16', '2019-01-12 20:16:16'),
(6, 0, '2019-01-12 20:16:27', '2019-01-12 20:16:27'),
(7, 0, '2019-01-12 20:18:02', '2019-01-13 17:18:09'),
(8, 0, '2019-01-13 13:00:33', '2019-01-13 13:00:33'),
(9, 0, '2019-01-13 17:18:22', '2019-01-13 17:18:22'),
(10, 0, '2019-01-13 17:36:10', '2019-01-13 17:41:03'),
(11, 0, '2019-01-13 17:36:43', '2019-01-13 20:01:17'),
(12, 0, '2019-01-14 16:25:51', '2019-01-14 16:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `NUSERID` int(11) NOT NULL,
  `SUSERNAME` varchar(20) NOT NULL,
  `DTCREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`NUSERID`, `SUSERNAME`, `DTCREATED`) VALUES
(1, 'Peter', '2019-01-11 20:05:40'),
(2, 'MJ', '2019-01-11 20:06:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addtask`
--
ALTER TABLE `addtask`
  ADD PRIMARY KEY (`NTASKID`),
  ADD KEY `NUSERID` (`NUSERID`);

--
-- Indexes for table `deletetask`
--
ALTER TABLE `deletetask`
  ADD PRIMARY KEY (`NTASKID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`NUSERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addtask`
--
ALTER TABLE `addtask`
  MODIFY `NTASKID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `deletetask`
--
ALTER TABLE `deletetask`
  MODIFY `NTASKID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `NUSERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
