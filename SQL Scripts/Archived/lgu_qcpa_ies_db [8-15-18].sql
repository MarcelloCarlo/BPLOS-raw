-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2018 at 06:03 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

DROP DATABASE IF EXISTS `lgu_qcpa_eis_db`;
CREATE DATABASE `lgu_qcpa_eis_db`;
USE `lgu_qcpa_eis_db`;
--
-- Database: `lgu_qcpa_eis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_module`
--

CREATE TABLE `lgu_r_module` (
  `MOD_ID` int(11) NOT NULL,
  `MOD_NAME` varchar(50) NOT NULL,
  `MOD_DESC` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_module`
--

-- INSERT INTO `lgu_r_module` (`MOD_ID`, `MOD_NAME`, `MOD_DESC`) VALUES
-- (1, 'DIV_1', 'DIV DESCRIPTION'),
-- (2, 'DIV_2', 'DIV_2 DESCRIPTION');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_role`
--

CREATE TABLE `lgu_r_role` (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(50) NOT NULL,
  `ROLE_DESC` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_role`
--

-- INSERT INTO `lgu_r_role` (`ROLE_ID`, `ROLE_NAME`, `ROLE_DESC`) VALUES
-- (1, 'DIV_1', 'DIV DESCRIPTION'),
-- (2, 'DIV_2', 'DIV_2 DESCRIPTION');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_role_mod`
--

CREATE TABLE `lgu_r_role_mod` (
  `MOD_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_role_mod`
--

-- INSERT INTO `lgu_r_role_mod` (`MOD_ID`, `ROLE_ID`) VALUES
-- (1, 'DIV_1', 'DIV DESCRIPTION'),
-- (2, 'DIV_2', 'DIV_2 DESCRIPTION');

-- --------------------------------------------------------
--
-- Table structure for table `lgu_r_division`
--

CREATE TABLE `lgu_r_division` (
  `DIV_ID` int(11) NOT NULL,
  `DIV_NAME` varchar(50) NOT NULL,
  `DIV_DESC` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_division`
--

-- INSERT INTO `lgu_r_division` (`DIV_ID`, `DIV_NAME`, `DIV_DESC`,) VALUES
-- (1, 'DIV_1', 'DIV DESCRIPTION'),
-- (2, 'DIV_2', 'DIV_2 DESCRIPTION');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_employee_profile`
--

CREATE TABLE `lgu_r_employee_profile` (
  `EP_ID` int(11) NOT NULL,
  `EP_FNAME` varchar(50) NOT NULL,
  `EP_MNAME` varchar(50) DEFAULT NULL,
  `EP_LNAME` varchar(50) NOT NULL,
  `EP_GENDER` varchar(10) NOT NULL,
  `EP_CONTACT_NO` char(11) NOT NULL,
  `EP_EMAIL` varchar(75) NOT NULL,
  `EP_BIRTHDATE` date NOT NULL,
  `EP_ADDRESS` varchar(500) NOT NULL,
  `EP_JOB_DESC` varchar(150) NOT NULL,
  `EP_STATUS` varchar(10) NOT NULL DEFAULT 'Active',
  `DIV_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_employee_profile`
--

-- INSERT INTO `lgu_r_employee_profile` (`EP_ID`, `EP_FNAME`, `EP_MNAME`, `EP_LNAME`, `EP_GENDER`, `EP_MOBILE`, `EP_EMAIL`, `EP_BIRTHDATE`, `EP_HOME_ADDRESS`, `EP_TYPE`, `EP_TYPE_DESC`, `EP_STATUS`) VALUES
-- (1, 'Alyana', NULL, 'Apo', 'Female', '09123456789', 'ayano.desu22.com', '1999-11-22', 'sample address', 'System Administrator', 'Administrator of system', 'Active'),
-- (2, 'Jennifer', NULL, 'Sanchez', 'Female', NULL, NULL, '2018-05-09', NULL, 'Staff', 'Responsible for managing the application process', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_user`
--

CREATE TABLE `lgu_r_user` (
  `U_ID` int(11) NOT NULL,
  `U_USERNAME` varchar(25) NOT NULL,
  `U_PASSWORD` varchar(150) NOT NULL,
  `U_TYPE` varchar(30) NOT NULL,
  `U_STATUS` varchar(10) NOT NULL DEFAULT 'Active',
  `EP_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_user`
--

-- INSERT INTO `lgu_r_user` (`U_ID`, `U_USERNAME`, `U_PASSWORD`, `U_TYPE`, `U_STATUS`, `EP_ID`, `ROLE_ID`) VALUES
-- (1, 'admin', 'password', 'SysAd', 'Active', 1),
-- (2, 'staff', 'password', 'Staff', 'Active', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_bp_application`
--

CREATE TABLE `lgu_r_bp_application` (
  `AP_ID` int(11) NOT NULL,
  `AP_REFERENCE_NO` int(11) DEFAULT NULL,
  `AP_DATE` date NOT NULL,
  `AP_TYPE` varchar(10) NOT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  `U_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_bp_application`
--

-- INSERT INTO `lgu_r_bp_application` ( `AP_ID`, `AP_REFERENCE_NO`, `AP_DATE`, `AP_TYPE`, `BU_ID`, `U_ID`) VALUES
-- (1, 'Alyana MAe Apo', 'usiness blocation', 'PIN-65656', 'LOT 5 BLOCK 9', NULL, NULL, '1', '1', NULL, NULL),
-- (2, 'Jennifer Sanchez', 'business location', 'FemalPIN-8989e', 'LOT 1 BLOCK 9', NULL, NULL, '2', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_attachments`
--

CREATE TABLE `lgu_r_attachments` (
  `AT_ID` int(11) NOT NULL,
  `AT_BRGY_CLEARANCE` varchar(300) DEFAULT NULL,
  `AT_DTI_REGISTRATION` varchar(300) DEFAULT NULL,
  `AT_SEC_REGISTRATION` varchar(300) DEFAULT NULL,
  `AT_TITLE_TO_PROPERTY` varchar(300) DEFAULT NULL,
  `AT_TAX_DECLARATION` varchar(300) DEFAULT NULL,
  `AT_CONTRACT_OF_LEASE` varchar(300) DEFAULT NULL,
  `AT_LESSORS_BP` varchar(300) DEFAULT NULL,
  `AT_AUTHORIZATION` varchar(300) DEFAULT NULL,
  `AT_LOCATIONAL_CLR` varchar(300) DEFAULT NULL,
  `AT_SANITARY_HEALTH_CERT` varchar(300) DEFAULT NULL,
  `AT_BUILDING_PERMIT` varchar(300) DEFAULT NULL,
  `AT_POLLUTION_CLR` varchar(300) DEFAULT NULL,
  `AT_MECHANICAL_PERMIT` varchar(300) DEFAULT NULL,
  `AT_ELECTRICAL_INSP` varchar(300) DEFAULT NULL,
  `AT_POLICE_CLEARANCE` varchar(300) DEFAULT NULL,
  `AT_CTAO_CLEARANCE_CERT` varchar(300) DEFAULT NULL,
  `AT_FSIC` varchar(300) DEFAULT NULL,
  `AT_PREV_BP` varchar(300) DEFAULT NULL,
  `AT_TAX_BILL` varchar(300) DEFAULT NULL,
  `AT_OFFICIAL_RECEIPT` varchar(300) DEFAULT NULL,
  `AT_PCAB_LICENSE` varchar(300) DEFAULT NULL,
  `AP_ID` int(11) NOT NULL,
  `RT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_attachments`
--

-- INSERT INTO `lgu_r_attachments` (`BU_ID`, `BU_PRESIDENT`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_SIGN_BOARD`, `SB_AREA`, `KN_ID`, `DTI_ID`, `SEC_ID`, `RT_ID`) VALUES
-- (1, 'Alyana MAe Apo', 'usiness blocation', 'PIN-65656', 'LOT 5 BLOCK 9', NULL, NULL, '1', '1', NULL, NULL),
-- (2, 'Jennifer Sanchez', 'business location', 'FemalPIN-8989e', 'LOT 1 BLOCK 9', NULL, NULL, '2', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_ownership_type`
--

CREATE TABLE `lgu_r_ownership_type` (
  `OT_ID` int(11) NOT NULL,
  `OT_NAME` varchar(50) NOT NULL,
  `OT_DESC` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_ownership_type`
--

-- INSERT INTO `lgu_r_ownership_type` (`BU_ID`, `BU_PRESIDENT`, `BU_LOCATION`) VALUES
-- (1, 'Alyana MAe Apo', 'usiness blocation', 'PIN-65656', 'LOT 5 BLOCK 9', NULL, NULL, '1', '1', NULL, NULL),
-- (2, 'Jennifer Sanchez', 'business location', 'FemalPIN-8989e', 'LOT 1 BLOCK 9', NULL, NULL, '2', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_req_type`
--

CREATE TABLE `lgu_r_req_type` (
  `RT_ID` int(11) NOT NULL,
  `RT_NAME` varchar(50) NOT NULL,
  `RT_DESC` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_req_type`
--

-- INSERT INTO `lgu_r_req_type` (`BU_ID`, `BU_PRESIDENT`, `BU_LOCATION`) VALUES
-- (1, 'Alyana MAe Apo', 'usiness blocation', 'PIN-65656', 'LOT 5 BLOCK 9', NULL, NULL, '1', '1', NULL, NULL),
-- (2, 'Jennifer Sanchez', 'business location', 'FemalPIN-8989e', 'LOT 1 BLOCK 9', NULL, NULL, '2', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_ot_req`
--

CREATE TABLE `lgu_r_ot_req` (
  `OT_ID` int(11) NOT NULL,
  `RT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_ot_req`
--

-- INSERT INTO `lgu_r_ot_req` (`BU_ID`, `BU_PRESIDENT`) VALUES
-- (1, 'Alyana MAe Apo', 'usiness blocation', 'PIN-65656', 'LOT 5 BLOCK 9', NULL, NULL, '1', '1', NULL, NULL),
-- (2, 'Jennifer Sanchez', 'business location', 'FemalPIN-8989e', 'LOT 1 BLOCK 9', NULL, NULL, '2', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_business_nature`
--

CREATE TABLE `lgu_r_business_nature` (
  `BN_ID` int(11) NOT NULL,
  `BN_NAME` varchar(100) NOT NULL,
  `BN_CLASSIFICATION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_kind_nature`
--

-- INSERT INTO `lgu_r_kind_nature` (`KN_ID`, `KN_NAME`, `KN_CLASSIFICATION`) VALUES
-- (1, 'Sari-sari Store', 'Low Scale Business'),
-- (2, 'Gas Staion', 'High Scale Business');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_business`
--

CREATE TABLE `lgu_r_business` (
  `BU_ID` int(11) NOT NULL,
  `BU_NAME` varchar(200) NOT NULL,
  `BU_PRESIDENT` varchar(100) NOT NULL,
  `BU_LOCATION` varchar(300) NOT NULL,
  `BU_PROPERTY_INDEX_NO` varchar(35) NOT NULL,
  `BU_LOT_BLOCK_NO` varchar(35) NOT NULL,
  `SB_AREA` decimal(5,3) DEFAULT NULL,
  `DTI_REG_NO` int(11) DEFAULT NULL,
  `DTI_DATE` date DEFAULT NULL,
  `SEC_REG_NO` int(11) DEFAULT NULL,
  `SEC_DATE` date DEFAULT NULL,
  `BN_ID` int(11) NOT NULL,
  `TP_ID` int(11) NOT NULL,
  `OT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_business`
--

-- INSERT INTO `lgu_r_business` (`BU_ID`, `BU_PRESIDENT`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_SIGN_BOARD`, `SB_AREA`, `KN_ID`, `DTI_ID`, `SEC_ID`, `RT_ID`) VALUES
-- (1, 'Alyana MAe Apo', 'usiness blocation', 'PIN-65656', 'LOT 5 BLOCK 9', NULL, NULL, '1', '1', NULL, NULL),
-- (2, 'Jennifer Sanchez', 'business location', 'FemalPIN-8989e', 'LOT 1 BLOCK 9', NULL, NULL, '2', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_taxpayer`
--

CREATE TABLE `lgu_r_taxpayer` (
  `TP_ID` int(11) NOT NULL,
  `TP_FNAME` varchar(50) NOT NULL,
  `TP_MNAME` varchar(50) DEFAULT NULL,
  `TP_LNAME` varchar(50) NOT NULL,
  `TP_CONTACT` char(11) NOT NULL,
  `TP_NATIONALITY` varchar(50) NOT NULL,
  `TP_FAX_NO` char(11) DEFAULT NULL,
  `TP_HOME_ADDRESS` varchar(300) NOT NULL,
  `TP_TIN` varchar(20) NOT NULL,
  `TP_SSS_NO` varchar(20) DEFAULT NULL,
  `TP_STATUS` varchar(10) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_taxpayer`
--

-- INSERT INTO `lgu_r_taxpayer` (`TP_ID`, `TP_FNAME`, `TP_MNAME`, `TP_LNAME`, `TP_CONTACT`, `TP_NATIONALITY`, `TP_FAX_NO`, `TP_HOME_ADDRESS`, `TP_TIN`, `TP_SSS_NO`, `TP_OWNERSHIP_TYPE`, `TP_STATUS`, `BU_ID`, `BP_ID`, `AR_ID`) VALUES
-- (1, 'Alyana', NULL, 'Apo', '87000', 'Filipino', 'FAX-647364', 'T.SORA, QC', 'TIN-1234', 'SSS-98989', 'SINGLE PROPRIETORSHIP', 'Active', '1', NULL, NULL),
-- (2, 'Jennifer', NULL, 'Sanchez', 'Filipino', '55555', 'FAX-667364', 'EAST AVE, QC', 'TIN-1235', 'SSS-98979', 'PARTNERSHIP', 'Active', '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_bu_ar`
--

CREATE TABLE `lgu_r_bu_ar` (
  `AR_ID` int(11) NOT NULL,
  `BU_ID` int(11) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_bu_ar`
--

-- INSERT INTO `lgu_r_bu_ar` (`AR_ID`, `AR_FNAME`, `AR_MNAME`, `AR_LNAME`, `AR_POSITION`, `AR_HOME_ADDRESS`) VALUES
-- (1, 'Alyana', NULL, 'Apo', 'Vice President', 'T.SORA, QC'),
-- (2, 'Jennifer', NULL, 'Sanchez', 'Secretary', 'EAST AVE, QC');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_representative`
--

CREATE TABLE `lgu_r_authorize_rep` (
  `AR_ID` int(11) NOT NULL,
  `AR_FNAME` varchar(50) NOT NULL,
  `AR_MNAME` varchar(50) DEFAULT NULL,
  `AR_LNAME` varchar(50) NOT NULL,
  `AR_POSITION` varchar(50) NOT NULL,
  `AR_CONTACT_NO` char(11) NOT NULL,
  `AR_HOME_ADDRESS` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_representative`
--

-- INSERT INTO `lgu_r_representative` (`AR_ID`, `AR_FNAME`, `AR_MNAME`, `AR_LNAME`, `AR_POSITION`, `AR_HOME_ADDRESS`) VALUES
-- (1, 'Alyana', NULL, 'Apo', 'Vice President', 'T.SORA, QC'),
-- (2, 'Jennifer', NULL, 'Sanchez', 'Secretary', 'EAST AVE, QC');

-- --------------------------------------------------------


--
-- Table structure for table `lgu_r_bp_application`
--

CREATE TABLE `lgu_r_business_permit` (
  `BP_ID` int(11) DEFAULT NULL,
  `BP_NUMBER` int(11) NOT NULL,
  `BP_ISSUED_DATE` date NOT NULL,
  `BP_VALID_YEARS` int(3) DEFAULT NULL,
  `BP_REMARKS` varchar(300) NOT NULL,
  `BU_ID` int(11) NOT NULL,
  `AP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_business`
--

-- INSERT INTO `lgu_r_business` (`BU_ID`, `BU_PRESIDENT`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_SIGN_BOARD`, `SB_AREA`, `KN_ID`, `DTI_ID`, `SEC_ID`, `RT_ID`) VALUES
-- (1, 'Alyana MAe Apo', 'usiness blocation', 'PIN-65656', 'LOT 5 BLOCK 9', NULL, NULL, '1', '1', NULL, NULL),
-- (2, 'Jennifer Sanchez', 'business location', 'FemalPIN-8989e', 'LOT 1 BLOCK 9', NULL, NULL, '2', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_is_rented`
--

CREATE TABLE `lgu_r_is_rented` (
  `RENT_ID` int(11) NOT NULL,
  `RENT_DATE_STARTED` date NOT NULL,
  `RENT_MONTHLY_RENTAL` decimal(5,3) NOT NULL,
  `RENT_LESSOR` varchar(100) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lgu_r_is_rented`
--

-- INSERT INTO `lgu_r_is_rented` (`RT_ID`, `RT_DATE_STARTED`, `RT_MONTHLY_RENTAL`, `RT_LESSOR`) VALUES
-- (1, '2016-11-22', '15000', 'Jennifer Sanchez'),
-- (2, '2017-1-22', '4000', 'Alyana Apo');

-- --------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lgu_r_approving_person`
--
ALTER TABLE `lgu_r_module`
  ADD PRIMARY KEY (`MOD_ID`);

--
-- Indexes for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_role`
  ADD PRIMARY KEY (`ROLE_ID`);
  
--
-- Indexes for table `lgu_r_user`
--
-- ALTER TABLE `lgu_r_role_mod`
--   ADD PRIMARY KEY (`MOD_ID`),
--   ADD PRIMARY KEY  (`ROLE_ID`);

--
-- Indexes for table `lgu_r_approving_person`
--
ALTER TABLE `lgu_r_division`
  ADD PRIMARY KEY (`DIV_ID`);

--
-- Indexes for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_employee_profile`
  ADD PRIMARY KEY (`EP_ID`);
  
--
-- Indexes for table `lgu_r_user`
--
ALTER TABLE `lgu_r_user`
  ADD PRIMARY KEY (`U_ID`);

--
-- Indexes for table `lgu_r_approving_person`
--
ALTER TABLE `lgu_r_bp_application`
  ADD PRIMARY KEY (`AP_ID`);

--
-- Indexes for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_req_type`
  ADD PRIMARY KEY (`RT_ID`);
  
--
-- Indexes for table `lgu_r_user`
--
-- ALTER TABLE `lgu_r_ot_req`
  -- ADD PRIMARY KEY (`OT_ID`),
  -- ADD PRIMARY KEY (`RT_ID`);

--
-- Indexes for table `lgu_r_user`
--
ALTER TABLE `lgu_r_business_nature`
  ADD PRIMARY KEY (`BN_ID`);

--
-- Indexes for table `lgu_r_user`
--
ALTER TABLE `lgu_r_business`
  ADD PRIMARY KEY (`BU_ID`);

--
-- Indexes for table `lgu_r_approving_person`
--
ALTER TABLE `lgu_r_taxpayer`
  ADD PRIMARY KEY (`TP_ID`);

--
-- Indexes for table `lgu_r_employee_profile`
--
-- ALTER TABLE `lgu_r_bu_ar`
--   ADD PRIMARY KEY (`BU_ID`),
--   ADD PRIMARY KEY (`AR_ID`);
  
--
-- Indexes for table `lgu_r_user`
--
ALTER TABLE `lgu_r_authorize_rep`
  ADD PRIMARY KEY (`AR_ID`);

--
-- Indexes for table `lgu_r_approving_person`
--
ALTER TABLE `lgu_r_business_permit`
  ADD PRIMARY KEY (`BP_ID`);

--
-- Indexes for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_is_rented`
  ADD PRIMARY KEY (`RENT_ID`);

--
-- Indexes for table `lgu_r_user`
--
ALTER TABLE `lgu_r_attachments`
  ADD PRIMARY KEY (`AT_ID`);

--
-- Indexes for table `lgu_r_approving_person`
--
ALTER TABLE `lgu_r_ownership_type`
  ADD PRIMARY KEY (`OT_ID`);

 
-- ------------------------------------------------------------------------------------------------------------------------
--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lgu_r_approving_person`
--
ALTER TABLE `lgu_r_module`
  MODIFY `MOD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_role`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_user`
--
ALTER TABLE `lgu_r_division`
  MODIFY `DIV_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_taxpayer`
--
ALTER TABLE `lgu_r_employee_profile`
  MODIFY `EP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_user`
  MODIFY `U_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_user`
--
ALTER TABLE `lgu_r_bp_application`
  MODIFY `AP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_req_type`
  MODIFY `RT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_user`
--
ALTER TABLE `lgu_r_business_nature`
  MODIFY `BN_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_approving_person`
--
ALTER TABLE `lgu_r_business`
  MODIFY `BU_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_is_rented`
  MODIFY `RENT_ID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `lgu_r_taxpayer`
--
ALTER TABLE `lgu_r_taxpayer`
  MODIFY `TP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_authorize_rep`
  MODIFY `AR_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgu_r_user`
--
ALTER TABLE `lgu_r_business_permit`
  MODIFY `BP_ID` int(11) NOT NULL AUTO_INCREMENT;

-- -----------------------------------------------------------------------------------------------------------------------------

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pso_r_user`
--
ALTER TABLE `lgu_r_role_mod`
  ADD CONSTRAINT `lgu_r_role_mod_fk_1` FOREIGN KEY (`MOD_ID`) REFERENCES `lgu_r_module` (`MOD_ID`),
  ADD CONSTRAINT `lgu_r_role_mod_fk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `lgu_r_role` (`ROLE_ID`);

--
-- Constraints for table `lgu_r_taxpayer`
--
ALTER TABLE `lgu_r_employee_profile`
  ADD CONSTRAINT `lgu_r_employee_profile_fk_1` FOREIGN KEY (`DIV_ID`) REFERENCES `lgu_r_division` (`DIV_ID`);

--
-- Constraints for table `lgu_r_business`
-- 
ALTER TABLE `lgu_r_bp_application`
  ADD CONSTRAINT `lgu_r_bp_application_fk_1` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`),
  ADD CONSTRAINT `lgu_r_bp_application_fk_2` FOREIGN KEY (`U_ID`) REFERENCES `lgu_r_user` (`U_ID`);

--
-- Constraints for table `ams_t_ics_sub`
--
ALTER TABLE `lgu_r_attachments`
  ADD CONSTRAINT `lgu_r_attachments_fk_1` FOREIGN KEY (`AP_ID`) REFERENCES `lgu_r_bp_application` (`AP_ID`),
  ADD CONSTRAINT `lgu_r_attachments_fk_2` FOREIGN KEY (`RT_ID`) REFERENCES `lgu_r_req_type` (`RT_ID`);

--
-- Constraints for table `pso_r_user`
--
ALTER TABLE `lgu_r_ot_req`
  ADD CONSTRAINT `lgu_r_ot_req_fk_1` FOREIGN KEY (`OT_ID`) REFERENCES `lgu_r_ownership_type` (`OT_ID`),
  ADD CONSTRAINT `lgu_r_ot_req_fk_2` FOREIGN KEY (`RT_ID`) REFERENCES `lgu_r_req_type` (`RT_ID`);

--
-- Constraints for table `lgu_r_business`
-- 
ALTER TABLE `lgu_r_business`
  ADD CONSTRAINT `lgu_r_business_fk_1` FOREIGN KEY (`BN_ID`) REFERENCES `lgu_r_business_nature` (`BN_ID`),
  ADD CONSTRAINT `lgu_r_business_fk_2` FOREIGN KEY (`TP_ID`) REFERENCES `lgu_r_taxpayer` (`TP_ID`),
  ADD CONSTRAINT `lgu_r_business_fk_3` FOREIGN KEY (`OT_ID`) REFERENCES `lgu_r_ownership_type` (`OT_ID`);

--
-- Constraints for table `ams_t_ics_sub`
--
ALTER TABLE `lgu_r_bu_ar`
  ADD CONSTRAINT `lgu_r_bu_ar_fk_1` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`),
  ADD CONSTRAINT `lgu_r_bu_ar_fk_2` FOREIGN KEY (`AR_ID`) REFERENCES `lgu_r_authorize_rep` (`AR_ID`);

--
-- Constraints for table `ams_t_ics_sub`
--
ALTER TABLE `lgu_r_business_permit`
  ADD CONSTRAINT `lgu_r_business_permit_fk_1` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`),
  ADD CONSTRAINT `lgu_r_business_permit_fk_2` FOREIGN KEY (`AP_ID`) REFERENCES `lgu_r_bp_application` (`AP_ID`);

--
-- Constraints for table `pso_r_user`
--
ALTER TABLE `lgu_r_user`
  ADD CONSTRAINT `lgu_r_user_fk_1` FOREIGN KEY (`EP_ID`) REFERENCES `lgu_r_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `lgu_r_user_fk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `lgu_r_role` (`ROLE_ID`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;