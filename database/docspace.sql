-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2021 at 02:46 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docspace`
--

-- --------------------------------------------------------

--
-- Table structure for table `approval`
--

CREATE TABLE `approval` (
  `docid` int(11) NOT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `approval`
--

INSERT INTO `approval` (`docid`, `author`, `approvalby`, `status`) VALUES
(1, '19102A0032', 'admin3', 'pending'),
(2, '19102A0032', 'admin3', 'pending'),
(3, '19102A0032', 'admin1', 'approved'),
(4, '19102A0032', 'admin1', 'approved'),
(5, '19102A0010', 'admin1', 'pending'),
(6, '19102A0010', 'admin1', 'approved'),
(7, '19102A0010', 'admin4', 'pending'),
(8, '19102A0006', 'admin4', 'pending'),
(9, '19102A0006', 'admin2', 'approved'),
(10, '19102A0032', 'admin2', 'pending'),
(11, '19102A0032', 'admin4', 'pending'),
(12, '19102A0032', 'admin3', 'pending'),
(13, '19102A0032', 'admin4', 'pending'),
(14, '19102A0032', 'admin3', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `docids`
--

CREATE TABLE `docids` (
  `docid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `docids`
--

INSERT INTO `docids` (`docid`) VALUES
(0),
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14);

-- --------------------------------------------------------

--
-- Table structure for table `documentload`
--

CREATE TABLE `documentload` (
  `docid` int(11) NOT NULL,
  `docname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` float DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filepath` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentload`
--

INSERT INTO `documentload` (`docid`, `docname`, `description`, `version`, `author`, `size`, `createdon`, `status`, `filepath`) VALUES
(1, 'db', '1', 1, '19102A0032', 60416, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0032db1dbms.pdf'),
(2, 'db', '2', 2, '19102A0032', 60423, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0032db2dbms - Copy.pdf'),
(3, 'mp', '1', 1, '19102A0032', 60427, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0032mp1dbms - Copy (2).pdf'),
(4, 'em', '1', 1, '19102A0032', 60427, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0032em1dbms - Copy (3).pdf'),
(5, 'aoa', '1', 1, '19102A0010', 60427, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0010aoa1dbms - Copy (5).pdf'),
(6, 'sql', '1', 1, '19102A0010', 60427, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0010sql1dbms - Copy (6).pdf'),
(7, 'sql', '2', 2, '19102A0010', 60427, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0010sql2dbms - Copy (7).pdf'),
(8, 'java', '1', 1, '19102A0006', 60427, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0006java1dbms - Copy (8).pdf'),
(9, 'python', '1', 1, '19102A0006', 60427, '2021-04-18', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0006python1dbms - Copy (5).pdf'),
(10, 'qwert', 'asdfg', 12, '19102A0032', 69913, '2021-04-23', 'created', '19102A0032qwert1219102A0032 Expt5 (1).pdf'),
(11, 'hgdhdchhb', 'dddsdsdg', 556, '19102A0032', 69887, '2021-04-23', 'created', '19102A0032hgdhdchhb55619102A0032 Expt5.pdf'),
(12, 'tyure', 'tyeu', 4, '19102A0032', 69913, '2021-04-23', 'created', '19102A0032tyure419102A0032 Expt5 (1).pdf'),
(13, 'vdgg', 'vsytf', 8, '19102A0032', 69887, '2021-04-23', 'created', '19102A0032vdgg819102A0032 Expt5.pdf'),
(14, 'eeeeeeeeeeee', 'eeeeeeeeeeee', 14, '19102A0032', 69887, '2021-04-23', 'created', '19102A0032eeeeeeeeeeee1419102A0032 Expt5.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `documentshared`
--

CREATE TABLE `documentshared` (
  `docid` int(11) DEFAULT NULL,
  `sharedto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sharedby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shared_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentshared`
--

INSERT INTO `documentshared` (`docid`, `sharedto`, `sharedby`, `shared_on`) VALUES
(2, '19102A0010', '19102A0032', '2021-04-19 13:41:21'),
(4, '19102A0010', '19102A0032', '2021-04-19 13:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `f_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dept` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'enabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`f_name`, `l_name`, `f_id`, `password`, `email`, `dept`, `city`, `mobile`, `status`) VALUES
('admin1', '', 'admin1', 'admin1', 'admin1@vit.edu.in', 'CMPN', 'Mumbai', '9876726699', 'enabled'),
('admin2', '', 'admin2', 'admin2', 'admin@vit.edu.in', 'INFT', 'Mumbai', '9768678567', 'enabled'),
('admin3', '', 'admin3', 'admin3', 'admin@vit.edu.in', 'CMPN', 'Mumbai', '7865656565', 'enabled'),
('admin4', '', 'admin4', 'admin4', 'admin4@vit.edu.in', 'EXTC', 'Mumbai', '8787665653', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `mid` int(11) NOT NULL,
  `docid` int(11) DEFAULT NULL,
  `sub` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'enabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`mid`, `docid`, `sub`, `msg`, `sender`, `receiver`, `sent_on`, `status`) VALUES
(1, NULL, 'First Broadcast', 'First Msg', 'admin2', '19102A0010', '2021-04-19 11:12:18', 'broadcast'),
(2, NULL, 'First Broadcast', 'First Msg', 'admin2', '19102A0029', '2021-04-19 11:12:18', 'broadcast'),
(3, NULL, 'First Broadcast', 'First Msg', 'admin2', '19102A0032', '2021-04-19 11:12:18', 'broadcast'),
(4, NULL, 'First Broadcast', 'First Msg', 'admin2', 'admin1', '2021-04-19 11:12:18', 'broadcast'),
(5, NULL, 'First Broadcast', 'First Msg', 'admin2', 'admin2', '2021-04-19 11:12:18', 'broadcast'),
(6, NULL, 'First Broadcast', 'First Msg', 'admin2', '19102A0032', '2021-04-19 11:29:26', 'enabled'),
(7, NULL, 'First Broadcast', 'First Msg', 'admin2', 'admin4', '2021-04-19 11:46:20', 'enabled'),
(8, NULL, 'First Broadcast', 'First Msg', 'admin2', 'admin4', '2021-04-19 11:48:00', 'deleted');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `f_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'enabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`f_name`, `l_name`, `s_id`, `password`, `email`, `branch`, `city`, `mobile`, `status`) VALUES
('Mukesh', 'Choudhari', '19102A0006', 'mukesh', 'mukesh@vit.ed.in', 'CMPN', 'Kalyan', '7786545555', 'enabled'),
('Kaustubh', 'Chile', '19102A0010', 'kaustubh', 'kaustubh@vit.edu.in', 'EXTC', 'Mumbai', '9868575766', 'enabled'),
('Pratik', 'Bhoir', '19102A0029', 'pratik', 'pratik@vit.edu.in', 'INFT', 'Kalyan', '9984375485', 'enabled'),
('Akash', 'Samaleti', '19102A0032', 'akash', 'akash@vit.edu.in', 'CMPN', 'Bhiwandi', '9876474633', 'enabled');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approval`
--
ALTER TABLE `approval`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `approvalby` (`approvalby`);

--
-- Indexes for table `docids`
--
ALTER TABLE `docids`
  ADD PRIMARY KEY (`docid`);

--
-- Indexes for table `documentload`
--
ALTER TABLE `documentload`
  ADD PRIMARY KEY (`docid`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documentload`
--
ALTER TABLE `documentload`
  MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approval`
--
ALTER TABLE `approval`
  ADD CONSTRAINT `approval_ibfk_1` FOREIGN KEY (`approvalby`) REFERENCES `faculty` (`f_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
