-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2021 at 06:44 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

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
(2, '19102A0032', 'admin1', 'approved'),
(3, '19102A0032', 'admin2', 'approved'),
(4, '19102A0010', 'admin3', 'approved'),
(5, '19102A0010', 'admin4', 'approved'),
(6, '19102A0029', 'admin5', 'approved'),
(7, '19102A0029', 'admin6', 'approved'),
(8, '19102A0006', 'admin7', 'approved'),
(9, '19102A0006', 'admin7', 'approved');

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
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9);

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
  `filepath` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain_doc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documentload`
--

INSERT INTO `documentload` (`docid`, `docname`, `description`, `version`, `author`, `size`, `createdon`, `status`, `filepath`, `domain_doc`, `branch`) VALUES
(2, 'Algo', '1', 1, '19102A0032', 60415, '2021-05-04', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0032Algo1doc.pdf', 'Algorithm', 'CMPN'),
(3, 'App', '1', 1, '19102A0032', 60415, '2021-05-04', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0032App1doc.pdf', 'App Development', 'CMPN'),
(4, 'AI', '1', 1, '19102A0010', 60415, '2021-05-04', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0010AI1doc.pdf', 'Artificial Intelligence', 'CMPN'),
(5, 'Bigdata', 'BD', 1, '19102A0010', 60415, '2021-05-04', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0010Bigdata1doc.pdf', 'Big Data', 'CMPN'),
(6, 'Blockchain', 'blockchain', 1, '19102A0029', 60415, '2021-05-04', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0029Blockchain1doc.pdf', 'Blockchain', 'CMPN'),
(7, 'Cyber', 'cyber', 1, '19102A0029', 60415, '2021-05-04', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0029Cyber1doc.pdf', 'Cyber Security', 'CMPN'),
(8, 'Data mining', 'data', 1, '19102A0006', 60415, '2021-05-04', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0006Data mining1doc.pdf', 'Data Mining', 'CMPN'),
(9, 'Data Science', 'Data', 1, '19102A0006', 60415, '2021-05-04', 'created', 'C:\\Users\\pc\\Documents\\NetBeansProjects\\Document\\web\\uploads\\19102A0006Data Science1doc.pdf', 'Data Science', 'CMPN');

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

-- --------------------------------------------------------

--
-- Table structure for table `domain`
--

CREATE TABLE `domain` (
  `domain_n` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domain`
--

INSERT INTO `domain` (`domain_n`) VALUES
('Algorithm'),
('App Development'),
('Artificial Intelligence'),
('Big Data'),
('Blockchain'),
('Cyber Security'),
('Data Mining'),
('Data Science'),
('Embedded System'),
('IOT'),
('Machine Learning'),
('Virtual Reality'),
('Web Technology');

-- --------------------------------------------------------

--
-- Table structure for table `domain_expertise`
--

CREATE TABLE `domain_expertise` (
  `faculty` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_n` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domain_expertise`
--

INSERT INTO `domain_expertise` (`faculty`, `domain_n`) VALUES
('admin1', 'Algorithm'),
('admin1', 'App Development'),
('admin1', 'Artificial Intelligence'),
('admin1', 'Big Data'),
('admin1', 'Data Science'),
('admin2', 'Cyber Security'),
('admin2', 'Data Mining'),
('admin3', 'IOT'),
('admin3', 'Web Technology'),
('admin4', 'Algorithm'),
('admin4', 'Blockchain'),
('admin5', 'Algorithm'),
('admin5', 'App Development'),
('admin5', 'Data Science'),
('admin5', 'IOT'),
('admin6', 'Virtual Reality'),
('admin6', 'Web Technology'),
('admin7', 'Big Data'),
('admin7', 'Cyber Security'),
('admin8', 'Artificial Intelligence'),
('admin8', 'Data Science'),
('admin9', 'Blockchain'),
('admin9', 'Virtual Reality');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `f_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
('faculty1', 'ad', 'admin1', 'admin1', 'admin1@vit.edu.in', 'CMPN', 'Mumbai', '9876726699', 'enabled'),
('faculty10', 'ad', 'admin10', 'admin10', 'admin10@vit.edu.in', 'CMPN', '', '', 'enabled'),
('faculty2', '', 'admin2', 'admin2', 'admin@vit.edu.in', 'INFT', 'Mumbai', '9768678567', 'enabled'),
('faculty3', '', 'admin3', 'admin3', 'admin@vit.edu.in', 'CMPN', 'Mumbai', '7865656565', 'enabled'),
('faculty4', '', 'admin4', 'admin4', 'admin4@vit.edu.in', 'EXTC', 'Mumbai', '8787665653', 'enabled'),
('faculty5', 'ad', 'admin5', 'admin5', 'admin5@vit.edu.in', 'MMS', 'Mumbai', '98775675675', 'enabled'),
('faculty6', 'ad', 'admin6', 'admin6', 'admin6@vit.edu.in', 'ETRX', 'Mumbai', '8787665653', 'enabled'),
('faculty7', 'ad', 'admin7', 'admin7', 'admin7@vit.edu.in', 'CMPN', 'Mumbai', '8964348864', 'enabled'),
('faculty8', 'ad', 'admin8', 'admin8', 'admin8@vit.edu.in', 'INFT', 'Mumbai', '7865656565', 'enabled'),
('faculty9', 'ad', 'admin9', 'admin9', 'admin9@vit.edu.in', 'CMPN', 'Mumbai', '9656554545', 'enabled');

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
(1, 2, 'Approved', 'Your document titled \'Algo\' is approved', 'admin1', '19102A0032', '2021-05-04 15:51:10', 'enabled'),
(2, 3, 'Approved', 'Your document titled \'App\' is approved', 'admin2', '19102A0032', '2021-05-04 15:51:26', 'enabled'),
(3, 4, 'Approved', 'Your document titled \'AI\' is approved', 'admin3', '19102A0010', '2021-05-04 15:51:58', 'enabled'),
(4, 5, 'Approved', 'Your document titled \'Bigdata\' is approved', 'admin4', '19102A0010', '2021-05-04 15:52:23', 'enabled'),
(5, 6, 'Approved', 'Your document titled \'Blockchain\' is approved', 'admin5', '19102A0029', '2021-05-04 15:52:40', 'enabled'),
(6, 7, 'Approved', 'Your document titled \'Cyber\' is approved', 'admin6', '19102A0029', '2021-05-04 15:52:58', 'enabled'),
(7, 8, 'Approved', 'Your document titled \'Data mining\' is approved', 'admin7', '19102A0006', '2021-05-04 15:53:18', 'enabled'),
(8, 9, 'Approved', 'Your document titled \'Data Science\' is approved', 'admin7', '19102A0006', '2021-05-04 15:53:19', 'enabled');

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
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'enabled',
  `batch` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`f_name`, `l_name`, `s_id`, `password`, `email`, `branch`, `city`, `mobile`, `status`, `batch`) VALUES
('Mukesh', 'Choudhari', '19102A0006', 'mukesh', 'mukesh@vit.ed.in', 'CMPN', 'Kalyan', '7786545555', 'enabled', 2023),
('Kaustubh', 'Chile', '19102A0010', 'kaustubh', 'kaustubh@vit.edu.in', 'CMPN', 'Mumbai', '9868575766', 'enabled', 2023),
('Pratik', 'Bhoir', '19102A0029', 'pratik', 'pratik@vit.edu.in', 'CMPN', 'Kalyan', '9984375485', 'enabled', 2023),
('Akash', 'Samaleti', '19102A0032', 'akash', 'akash@vit.edu.in', 'CMPN', 'Bhiwandi', '9876474633', 'enabled', 2023),
('fn1', 'ln1', '19102A1', '19102A1', '', 'INFT', '', '', 'enabled', 2023),
('fn2', 'ln2', '19102A2', '19102A2', '', 'INFT', '', '', 'enabled', 2023),
('fn3', 'ln3', '19102A3', '19102A3', '', 'INFT', '', '', 'enabled', 2023),
('fn4', 'ln4', '19102A4', '19102A4', '', 'INFT', '', '', 'enabled', 2023);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(20) NOT NULL,
  `year` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guide` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mem1` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mem2` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mem3` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mem4` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `year`, `branch`, `domain`, `guide`, `mem1`, `mem2`, `mem3`, `mem4`) VALUES
(1, '\0\0\0S\0\0\0E', '\0\0\0C\0\0\0M\0\0\0P\0\0\0N', '\0\0\0W\0\0\0e\0\0\0b\0\0\0 \0\0\0T\0\0\0e\0\0\0c\0\0\0h\0\0\0n\0\0\0o\0\0\0l\0\0\0o\0\0\0g\0\0\0y', '\0\0\0a\0\0\0d\0\0\0m\0\0\0i\0\0\0n\0\0\01', '\0\0\01\0\0\09\0\0\01\0\0\00\0\0\02\0\0\0A\0\0\00\0\0\00\0\0\03\0\0\02', '\0\0\01\0\0\09\0\0\01\0\0\00\0\0\02\0\0\0A\0\0\00\0\0\00\0\0\01\0\0\00', '\0\0\01\0\0\09\0\0\01\0\0\00\0\0\02\0\0\0A\0\0\00\0\0\00\0\0\00\0\0\06', '\0\0\01\0\0\09\0\0\01\0\0\00\0\0\02\0\0\0A\0\0\00\0\0\00\0\0\02\0\0\09');

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
  ADD PRIMARY KEY (`docid`),
  ADD KEY `author` (`author`),
  ADD KEY `domain_doc` (`domain_doc`);

--
-- Indexes for table `domain`
--
ALTER TABLE `domain`
  ADD PRIMARY KEY (`domain_n`);

--
-- Indexes for table `domain_expertise`
--
ALTER TABLE `domain_expertise`
  ADD PRIMARY KEY (`faculty`,`domain_n`),
  ADD KEY `domain_n` (`domain_n`);

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
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `guide` (`guide`),
  ADD KEY `domain` (`domain`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documentload`
--
ALTER TABLE `documentload`
  MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  ADD CONSTRAINT `approval_ibfk_1` FOREIGN KEY (`approvalby`) REFERENCES `faculty` (`f_id`),
  ADD CONSTRAINT `approval_ibfk_2` FOREIGN KEY (`approvalby`) REFERENCES `faculty` (`f_id`);

--
-- Constraints for table `documentload`
--
ALTER TABLE `documentload`
  ADD CONSTRAINT `documentload_ibfk_1` FOREIGN KEY (`author`) REFERENCES `student` (`s_id`),
  ADD CONSTRAINT `documentload_ibfk_2` FOREIGN KEY (`domain_doc`) REFERENCES `domain` (`domain_n`);

--
-- Constraints for table `domain_expertise`
--
ALTER TABLE `domain_expertise`
  ADD CONSTRAINT `domain_expertise_ibfk_1` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`f_id`),
  ADD CONSTRAINT `domain_expertise_ibfk_2` FOREIGN KEY (`domain_n`) REFERENCES `domain` (`domain_n`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`guide`) REFERENCES `faculty` (`f_id`),
  ADD CONSTRAINT `team_ibfk_2` FOREIGN KEY (`domain`) REFERENCES `domain` (`domain_n`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
