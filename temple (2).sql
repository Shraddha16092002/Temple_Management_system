-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 04:36 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `temple`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Username` varchar(12) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Username`, `Password`) VALUES
('Admin1', 'Admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `charity`
--

CREATE TABLE `charity` (
  `CID` int(10) NOT NULL,
  `Date_of_Donation` date NOT NULL,
  `Amount` bigint(11) NOT NULL,
  `Trans_Id` varchar(30) NOT NULL,
  `SRNO` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `charity`
--

INSERT INTO `charity` (`CID`, `Date_of_Donation`, `Amount`, `Trans_Id`, `SRNO`) VALUES
(1, '2023-05-27', 30000, 'GGTTThh666', 9),
(3, '2023-05-29', 11000, 'TID322344566', 11),
(4, '2023-05-30', 5100, 'GGTTThh666', 14),
(5, '2023-05-30', 51000, 'TID322349005', 15),
(6, '2023-05-30', 11000, 'GGTTThh111', 16);

-- --------------------------------------------------------

--
-- Table structure for table `darshan`
--

CREATE TABLE `darshan` (
  `DID` int(11) NOT NULL,
  `Date_of_Visit` date NOT NULL,
  `No_Members` int(10) NOT NULL,
  `Payment` int(10) NOT NULL,
  `Transaction_Id` varchar(20) NOT NULL,
  `SRNO` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `darshan`
--

INSERT INTO `darshan` (`DID`, `Date_of_Visit`, `No_Members`, `Payment`, `Transaction_Id`, `SRNO`) VALUES
(4, '2023-05-28', 4, 400, 'GGTTThh999', 7),
(5, '2023-05-29', 5, 500, 'TID322349006', 8),
(6, '2023-05-31', 3, 300, 'GGTTThg555', 12),
(7, '2023-05-31', 4, 400, 'TID322344512', 13),
(8, '2023-05-31', 2, 200, 'TID322349116', 17);

-- --------------------------------------------------------

--
-- Table structure for table `devotees1`
--

CREATE TABLE `devotees1` (
  `SRNO` int(11) NOT NULL,
  `Aadhar` bigint(12) NOT NULL,
  `Name` char(30) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `City` char(15) NOT NULL,
  `State` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devotees1`
--

INSERT INTO `devotees1` (`SRNO`, `Aadhar`, `Name`, `Email`, `City`, `State`) VALUES
(7, 345536773788, 'Radha', 'radha@gmail.com', 'Nashik', 'Maharashtra'),
(8, 123443211234, 'shradha', 'shradha@gmail.com', 'chalisgaon', 'Maharashtra'),
(9, 349898773788, 'Aditi', 'aditipawar108@gmail.com', 'Pune', 'Maharashtra'),
(11, 349898773788, 'Neha Pawar', 'neha@gmail.com', 'Mumbai', 'Maharashtra'),
(12, 123412344321, 'Ananya', 'ananya@gmail.com', 'Aurangabad', 'Maharashtra'),
(13, 345536773711, 'Shravani', 'shravani@gmail.com', 'Nashik', 'Maharashtra'),
(14, 123412344391, 'Ravi', 'ravi@gmail.com', 'Mumbai', 'Maharashtra'),
(15, 349898773711, 'Priya', 'priya@gmail.com', 'Pune', 'Maharashtra'),
(16, 345536773723, 'Harsh', 'harsh@gmail.com', 'Pune', 'Maharashtra'),
(17, 345536773122, 'Tanvi', 'tanvi@gmail.com', 'Aurangabad', 'Maharashtra');

-- --------------------------------------------------------

--
-- Table structure for table `devotees2`
--

CREATE TABLE `devotees2` (
  `SRNO` int(11) NOT NULL,
  `Phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devotees2`
--

INSERT INTO `devotees2` (`SRNO`, `Phone`) VALUES
(7, 9576858484),
(7, 6666506789),
(8, 9876054321),
(8, 2345623456),
(9, 1234512345),
(9, 1234506789),
(11, 9233392333),
(11, 9877798777),
(12, 9754697546),
(13, 9576859797),
(14, 9576853434),
(15, 9576857878),
(16, 9576852323),
(17, 9576851212);

-- --------------------------------------------------------

--
-- Table structure for table `xyz`
--

CREATE TABLE `xyz` (
  `SRNO` varchar(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `xyz`
--

INSERT INTO `xyz` (`SRNO`, `Name`) VALUES
('C0', 'A');

--
-- Triggers `xyz`
--
DELIMITER $$
CREATE TRIGGER `t1` BEFORE INSERT ON `xyz` FOR EACH ROW BEGIN
set new.srno = concat("C", last_insert_id());
end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `charity`
--
ALTER TABLE `charity`
  ADD PRIMARY KEY (`CID`),
  ADD KEY `c2` (`SRNO`);

--
-- Indexes for table `darshan`
--
ALTER TABLE `darshan`
  ADD PRIMARY KEY (`DID`),
  ADD KEY `c1` (`SRNO`);

--
-- Indexes for table `devotees1`
--
ALTER TABLE `devotees1`
  ADD PRIMARY KEY (`SRNO`);

--
-- Indexes for table `devotees2`
--
ALTER TABLE `devotees2`
  ADD KEY `c3` (`SRNO`);

--
-- Indexes for table `xyz`
--
ALTER TABLE `xyz`
  ADD PRIMARY KEY (`SRNO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `charity`
--
ALTER TABLE `charity`
  MODIFY `CID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `darshan`
--
ALTER TABLE `darshan`
  MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `devotees1`
--
ALTER TABLE `devotees1`
  MODIFY `SRNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charity`
--
ALTER TABLE `charity`
  ADD CONSTRAINT `c2` FOREIGN KEY (`SRNO`) REFERENCES `devotees1` (`SRNO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `darshan`
--
ALTER TABLE `darshan`
  ADD CONSTRAINT `c1` FOREIGN KEY (`SRNO`) REFERENCES `devotees1` (`SRNO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `devotees2`
--
ALTER TABLE `devotees2`
  ADD CONSTRAINT `c3` FOREIGN KEY (`SRNO`) REFERENCES `devotees1` (`SRNO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
