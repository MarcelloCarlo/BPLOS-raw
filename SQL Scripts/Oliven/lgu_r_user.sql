-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2018 at 01:02 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lgu_paeis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_user`
--

CREATE TABLE `lgu_r_user` (
  `U_ID` int(11) NOT NULL,
  `U_EMPLOYID` varchar(30) DEFAULT NULL,
  `U_FIRSTNAME` varchar(100) NOT NULL,
  `U_MIDDLENAME` varchar(100) NOT NULL,
  `U_LASTNAME` varchar(100) NOT NULL,
  `U_TYPE` varchar(30) NOT NULL,
  `U_ROLE` varchar(30) NOT NULL,
  `U_PHONE` int(15) DEFAULT NULL DEFAULT '0',
  `U_EMAIL` varchar(100) DEFAULT NULL DEFAULT 'NULL',
  `U_ADDRESS` varchar(100) NOT NULL,
  `U_USERNAME` varchar(100) NOT NULL,
  `U_PASSWORD` blob NOT NULL,
  `U_STATUS` varchar(10) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_user`
--

INSERT INTO `lgu_r_user` (`U_ID`, `U_EMPLOYID`, `U_FIRSTNAME`, `U_MIDDLENAME`, `U_LASTNAME`, `U_TYPE`, `U_ROLE`, `U_PHONE`, `U_EMAIL`, `U_ADDRESS`, `U_USERNAME`, `U_PASSWORD`, `U_STATUS`) VALUES
(4, NULL, 'System', 'Users', 'Admin', 'Admin', 'System Admin', 0, 'NULL', 'System', 'SAdmin', 0x686170707961646d696e, 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lgu_r_user`
--
ALTER TABLE `lgu_r_user`
  ADD PRIMARY KEY (`U_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lgu_r_user`
--
ALTER TABLE `lgu_r_user`
  MODIFY `U_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
