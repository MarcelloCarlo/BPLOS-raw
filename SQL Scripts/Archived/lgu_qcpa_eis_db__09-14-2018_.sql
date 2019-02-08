-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2018 at 04:50 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lgu_qcpa_eis_db`
--
DROP DATABASE IF EXISTS `lgu_qcpa_eis_db`;
CREATE DATABASE `lgu_qcpa_eis_db`;
USE `lgu_qcpa_eis_db`;

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_attachments`
--
-- Creation: Sep 05, 2018 at 11:00 PM
--

DROP TABLE IF EXISTS `lgu_r_attachments`;
CREATE TABLE IF NOT EXISTS `lgu_r_attachments` (
  `AT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AT_UNIFIED_FILE` longblob NOT NULL,
  `AT_UNIFIED_FILE_NAME` text NOT NULL,
  `AT_BRGY_CLEARANCE` enum('Pass','Fail') DEFAULT NULL,
  `AT_DTI_REGISTRATION` enum('Pass','Fail') DEFAULT NULL,
  `AT_SEC_REGISTRATION` enum('Pass','Fail') DEFAULT NULL,
  `AT_TITLE_TO_PROPERTY` enum('Pass','Fail') DEFAULT NULL,
  `AT_TAX_DECLARATION` enum('Pass','Fail') DEFAULT NULL,
  `AT_CONTRACT_OF_LEASE` enum('Pass','Fail') DEFAULT NULL,
  `AT_LESSORS_BP` enum('Pass','Fail') DEFAULT NULL,
  `AT_AUTHORIZATION` enum('Pass','Fail') DEFAULT NULL,
  `AT_LOCATIONAL_CLR` enum('Pass','Fail') DEFAULT NULL,
  `AT_SANITARY_HEALTH_CERT` enum('Pass','Fail') DEFAULT NULL,
  `AT_BUILDING_PERMIT` enum('Pass','Fail') DEFAULT NULL,
  `AT_POLLUTION_CLR` enum('Pass','Fail') DEFAULT NULL,
  `AT_MECHANICAL_PERMIT` enum('Pass','Fail') DEFAULT NULL,
  `AT_ELECTRICAL_INSP` enum('Pass','Fail') DEFAULT NULL,
  `AT_POLICE_CLEARANCE` enum('Pass','Fail') DEFAULT NULL,
  `AT_CTAO_CLEARANCE_CERT` enum('Pass','Fail') DEFAULT NULL,
  `AT_FSIC` enum('Pass','Fail') DEFAULT NULL,
  `AT_PREV_BP` enum('Pass','Fail') DEFAULT NULL,
  `AT_TAX_BILL` enum('Pass','Fail') DEFAULT NULL,
  `AT_OFFICIAL_RECEIPT` enum('Pass','Fail') DEFAULT NULL,
  `AT_PCAB_LICENSE` enum('Pass','Fail') DEFAULT NULL,
  `AT_LIQUOR_LICENSE` enum('Pass','Fail') DEFAULT NULL,
  `AT_MISC_DOCUMENTS` enum('Pass','Fail') DEFAULT NULL,
  `AP_Remarks` text,
  `AP_ID` int(11) DEFAULT NULL,
  `RT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AT_ID`),
  KEY `lgu_r_attachments_fk_bp_application` (`AP_ID`),
  KEY `lgu_r_attachments_fk_req_type` (`RT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_attachments`:
--   `AP_ID`
--       `lgu_r_bp_application` -> `AP_ID`
--   `RT_ID`
--       `lgu_r_req_type` -> `RT_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_authorize_rep`
--
-- Creation: Sep 10, 2018 at 06:05 AM
--

DROP TABLE IF EXISTS `lgu_r_authorize_rep`;
CREATE TABLE IF NOT EXISTS `lgu_r_authorize_rep` (
  `AR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AR_FNAME` varchar(50) NOT NULL,
  `AR_MNAME` varchar(50) DEFAULT NULL,
  `AR_LNAME` varchar(50) DEFAULT NULL,
  `AR_POSITION` varchar(50) DEFAULT NULL,
  `AR_HOME_ADDRESS` varchar(300) NOT NULL,
  PRIMARY KEY (`AR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_authorize_rep`:
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_bp_application`
--
-- Creation: Sep 03, 2018 at 03:26 PM
--

DROP TABLE IF EXISTS `lgu_r_bp_application`;
CREATE TABLE IF NOT EXISTS `lgu_r_bp_application` (
  `AP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AP_REFERENCE_NO` varchar(15) NOT NULL,
  `AP_DATE` date NOT NULL,
  `AP_TYPE` enum('New','Renew') NOT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  `U_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AP_ID`),
  UNIQUE KEY `UK_AP_REFERENCE_NO` (`AP_REFERENCE_NO`) USING BTREE,
  KEY `lgu_r_bp_application_fk_business` (`BU_ID`),
  KEY `lgu_r_bp_application_fk_user` (`U_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_bp_application`:
--   `BU_ID`
--       `lgu_r_business` -> `BU_ID`
--   `U_ID`
--       `lgu_r_user` -> `U_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_business`
--
-- Creation: Sep 03, 2018 at 06:23 AM
--

DROP TABLE IF EXISTS `lgu_r_business`;
CREATE TABLE IF NOT EXISTS `lgu_r_business` (
  `BU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BU_NAME` varchar(200) NOT NULL,
  `BU_PRESIDENT` varchar(100) DEFAULT NULL,
  `BU_LOCATION` varchar(300) NOT NULL,
  `BU_PROPERTY_INDEX_NO` varchar(35) NOT NULL,
  `BU_LOT_BLOCK_NO` varchar(35) NOT NULL,
  `BU_FAX_NO` char(11) DEFAULT NULL,
  `BU_CONTACT` char(11) NOT NULL,
  `SB_AREA` float DEFAULT NULL,
  `DTI_REG_NO` int(11) DEFAULT NULL,
  `DTI_DATE` date DEFAULT NULL,
  `SEC_REG_NO` int(11) DEFAULT NULL,
  `SEC_DATE` date DEFAULT NULL,
  `BU_EMP_NO` int(5) DEFAULT NULL,
  `BU_UNIT_NO` int(11) NOT NULL,
  `BU_AREA` float DEFAULT NULL,
  `BU_CAPITALIZATION` float DEFAULT NULL,
  `BN_ID` int(11) DEFAULT NULL,
  `TP_ID` int(11) DEFAULT NULL,
  `OT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BU_ID`),
  KEY `lgu_r_business_fk_business_nature` (`BN_ID`),
  KEY `lgu_r_business_fk_taxpayer` (`TP_ID`),
  KEY `lgu_r_business_fk_ownership_type` (`OT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_business`:
--   `BN_ID`
--       `lgu_r_business_nature` -> `BN_ID`
--   `OT_ID`
--       `lgu_r_ownership_type` -> `OT_ID`
--   `TP_ID`
--       `lgu_r_taxpayer` -> `TP_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_business_nature`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_business_nature`;
CREATE TABLE IF NOT EXISTS `lgu_r_business_nature` (
  `BN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BN_NAME` varchar(100) NOT NULL,
  `BN_CLASSIFICATION` enum('S','L') DEFAULT NULL,
  PRIMARY KEY (`BN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_business_nature`:
--

--
-- Dumping data for table `lgu_r_business_nature`
--

INSERT INTO `lgu_r_business_nature` (`BN_NAME`, `BN_CLASSIFICATION`) VALUES
('Accounting Services', 'S'),
('Administrative Office', 'S'),
('Building Maintenance', 'S'),
('Carinderias', 'S'),
('Consultancy Firms', 'S'),
('Deep Well Drilling Office', 'S'),
('Engineering Services', 'S'),
('General Building Contractor', 'S'),
('General Engineering Office', 'S'),
('Graphic Arts Design Firms','S'),
('Installation of Wall Coverings','S'),
('Landscaping','S'),
('Law Offices','S'),
('Lessor /Apartment (upt ot 3 doors)','S'),
('Liaison Offices','S'),
('Management Consultancy','S'),
('Marketing Consultancy','S'),
('Merchandise Brokerage','S'),
('Messengers Services','S'),
('Non-Life Insurance Agency','S'),
('Real Estate Brokers','S'),
('Real Estate Developers','S'),
('Retailers','S'),
('Wholesalers','S'),
('Retail Peddlers','S'),
('Sari-sari Stores','S'),
('Travel Agency','S'),
('Watch Repair Shops','S'),
('Water Refilling Stations','S'),
('Shopping Malls','L'),
('Hotels','L'),
('Motels','L'),
('Apartelles','L'),
('Inns','L'),
('Dormitories','L'),
('Theaters','L'),
('Auditoriums','L'),
('Cockpit Arenas','L'),
('Boxing Arenas','L'),
('Firing Ranges','L'),
('Convention Halls','L'),
('Concert Halls','L'),
('Hospitals','L'),
('Laboratories','L'),
('Gasoline Stations','L'),
('Cooking Gas Outlets','L'),
('LPG Refilling Stations','L'),
('Schools','L'),
('BPO/Call Centers','L'),
('Manufacturing Plants','L'),
('Assembly Plants','L'),
('Distilleries and Breweries','L'),
('Compound Mixing Plants','L'),
('Chemicals','L'),
('Warehouses','L'),
('Night Clubs','L'),
('Sauna Bath Houses','L'),
('Beer Houses','L'),
('KTV Bars','L'),
('Disco Houses','L'),
('Cocktail Lounges','L'),
('Transport Services','L'),
('And other similar Establishments','L');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_business_permit`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_business_permit`;
CREATE TABLE IF NOT EXISTS `lgu_r_business_permit` (
  `BP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BP_NUMBER` int(11) NOT NULL,
  `BP_ISSUED_DATE` date NOT NULL,
  `BP_VALID_YEARS` int(3) DEFAULT NULL,
  `BP_REMARKS` varchar(300) NOT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  `AP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BP_ID`),
  KEY `lgu_r_business_permit_fk_business` (`BU_ID`),
  KEY `lgu_r_business_permit_fk_bp_application` (`AP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_business_permit`:
--   `AP_ID`
--       `lgu_r_bp_application` -> `AP_ID`
--   `BU_ID`
--       `lgu_r_business` -> `BU_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_bu_ar`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_bu_ar`;
CREATE TABLE IF NOT EXISTS `lgu_r_bu_ar` (
  `AR_ID` int(11) DEFAULT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  KEY `lgu_r_bu_ar_fk_business` (`BU_ID`),
  KEY `lgu_r_bu_ar_fk_authorize_rep` (`AR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_bu_ar`:
--   `AR_ID`
--       `lgu_r_authorize_rep` -> `AR_ID`
--   `BU_ID`
--       `lgu_r_business` -> `BU_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_division`
--
-- Creation: Sep 14, 2018 at 03:29 AM
--

DROP TABLE IF EXISTS `lgu_r_division`;
CREATE TABLE IF NOT EXISTS `lgu_r_division` (
  `DIV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIV_CODE` varchar(10) NOT NULL,
  `DIV_NAME` varchar(50) NOT NULL,
  `DIV_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`DIV_ID`),
  UNIQUE KEY `UNQ_DIV_CODE` (`DIV_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_division`:
--

--
-- Dumping data for table `lgu_r_division`
--

INSERT INTO `lgu_r_division` (`DIV_ID`, `DIV_CODE`, `DIV_NAME`, `DIV_DESC`) VALUES
(1, 'DIV-EV', 'Evaluation', ''),
(2, 'DIV-INS', 'Inspection', ''),
(3, 'DIV-INV', 'Investigation', '');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_employee_profile`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_employee_profile`;
CREATE TABLE IF NOT EXISTS `lgu_r_employee_profile` (
  `EP_ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `DIV_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EP_ID`),
  KEY `lgu_r_employee_profile_fk_division` (`DIV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_employee_profile`:
--   `DIV_ID`
--       `lgu_r_division` -> `DIV_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_is_rented`
--
-- Creation: Sep 03, 2018 at 05:51 AM
--

DROP TABLE IF EXISTS `lgu_r_is_rented`;
CREATE TABLE IF NOT EXISTS `lgu_r_is_rented` (
  `RENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RENT_DATE_STARTED` date NOT NULL,
  `RENT_MONTHLY_RENTAL` float NOT NULL,
  `RENT_LESSOR` varchar(100) NOT NULL,
  PRIMARY KEY (`RENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_is_rented`:
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_module`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_module`;
CREATE TABLE IF NOT EXISTS `lgu_r_module` (
  `MOD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MOD_NAME` varchar(50) NOT NULL,
  `MOD_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`MOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_module`:
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_ot_req`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_ot_req`;
CREATE TABLE IF NOT EXISTS `lgu_r_ot_req` (
  `OT_ID` int(11) DEFAULT NULL,
  `RT_ID` int(11) DEFAULT NULL,
  KEY `lgu_r_ot_req_fk_ownership_type` (`OT_ID`),
  KEY `lgu_r_ot_req_fk_req_type` (`RT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_ot_req`:
--   `OT_ID`
--       `lgu_r_ownership_type` -> `OT_ID`
--   `RT_ID`
--       `lgu_r_req_type` -> `RT_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_ownership_type`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_ownership_type`;
CREATE TABLE IF NOT EXISTS `lgu_r_ownership_type` (
  `OT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OT_NAME` varchar(50) NOT NULL,
  `OT_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`OT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_ownership_type`:
--

--
-- Dumping data for table `lgu_r_ownership_type`
--

INSERT INTO `lgu_r_ownership_type` (`OT_ID`, `OT_NAME`, `OT_DESC`) VALUES
(1, 'Single Propreitorship', 'Single Owner of the Business'),
(2, 'Partnership/Corporation', 'Multiple Owner Business');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_req_type`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_req_type`;
CREATE TABLE IF NOT EXISTS `lgu_r_req_type` (
  `RT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RT_NAME` varchar(50) NOT NULL,
  `RT_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`RT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_req_type`:
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_role`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_role`;
CREATE TABLE IF NOT EXISTS `lgu_r_role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(50) NOT NULL,
  `ROLE_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_role`:
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_role_mod`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_role_mod`;
CREATE TABLE IF NOT EXISTS `lgu_r_role_mod` (
  `MOD_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  KEY `lgu_r_role_mod_fk_module` (`MOD_ID`),
  KEY `lgu_r_role_mod_fk_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_role_mod`:
--   `MOD_ID`
--       `lgu_r_module` -> `MOD_ID`
--   `ROLE_ID`
--       `lgu_r_role` -> `ROLE_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_taxpayer`
--
-- Creation: Sep 10, 2018 at 06:07 AM
--

DROP TABLE IF EXISTS `lgu_r_taxpayer`;
CREATE TABLE IF NOT EXISTS `lgu_r_taxpayer` (
  `TP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TP_FNAME` varchar(50) NOT NULL,
  `TP_MNAME` varchar(50) DEFAULT NULL,
  `TP_LNAME` varchar(50) DEFAULT NULL,
  `TP_NATIONALITY` varchar(50) DEFAULT 'Filipino',
  `TP_HOME_ADDRESS` varchar(300) DEFAULT NULL,
  `TP_TIN` varchar(20) NOT NULL,
  `TP_SSS_NO` varchar(20) DEFAULT NULL,
  `TP_STATUS` varchar(10) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`TP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_taxpayer`:
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_user`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_user`;
CREATE TABLE IF NOT EXISTS `lgu_r_user` (
  `U_ID` int(11) NOT NULL AUTO_INCREMENT,
  `U_USERNAME` varchar(25) NOT NULL,
  `U_PASSWORD` varchar(150) NOT NULL,
  `U_TYPE` varchar(30) NOT NULL,
  `U_STATUS` varchar(10) NOT NULL DEFAULT 'Active',
  `EP_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`U_ID`),
  KEY `lgu_r_user_fk_employee_profile` (`EP_ID`),
  KEY `lgu_r_user_fk_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_user`:
--   `EP_ID`
--       `lgu_r_employee_profile` -> `EP_ID`
--   `ROLE_ID`
--       `lgu_r_role` -> `ROLE_ID`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_applicationforms`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_applicationforms`;
CREATE TABLE IF NOT EXISTS `view_applicationforms` (
`BU_NAME` varchar(200)
,`BU_PRESIDENT` varchar(100)
,`TAX_PAYERNAME` varchar(152)
,`BU_LOCATION` varchar(300)
,`BU_CONTACT` char(11)
,`AUTH_REPNAME` varchar(152)
,`AR_HOME_ADDRESS` varchar(300)
,`BN_NAME` varchar(100)
,`OT_NAME` varchar(50)
,`AP_TYPE` enum('New','Renew')
,`AP_DATE` date
,`AT_UNIFIED_FILE_NAME` text
,`AP_ID` int(11)
,`AT_ID` int(11)
,`AT_BRGY_CLEARANCE` enum('Pass','Fail')
,`AT_DTI_REGISTRATION` enum('Pass','Fail')
,`AT_SEC_REGISTRATION` enum('Pass','Fail')
,`AT_TITLE_TO_PROPERTY` enum('Pass','Fail')
,`AT_TAX_DECLARATION` enum('Pass','Fail')
,`AT_CONTRACT_OF_LEASE` enum('Pass','Fail')
,`AT_LESSORS_BP` enum('Pass','Fail')
,`AT_AUTHORIZATION` enum('Pass','Fail')
,`AT_LOCATIONAL_CLR` enum('Pass','Fail')
,`AT_SANITARY_HEALTH_CERT` enum('Pass','Fail')
,`AT_BUILDING_PERMIT` enum('Pass','Fail')
,`AT_POLLUTION_CLR` enum('Pass','Fail')
,`AT_MECHANICAL_PERMIT` enum('Pass','Fail')
,`AT_ELECTRICAL_INSP` enum('Pass','Fail')
,`AT_POLICE_CLEARANCE` enum('Pass','Fail')
,`AT_CTAO_CLEARANCE_CERT` enum('Pass','Fail')
,`AT_FSIC` enum('Pass','Fail')
,`AT_PREV_BP` enum('Pass','Fail')
,`AT_TAX_BILL` enum('Pass','Fail')
,`AT_OFFICIAL_RECEIPT` enum('Pass','Fail')
,`AT_PCAB_LICENSE` enum('Pass','Fail')
,`AT_LIQUOR_LICENSE` enum('Pass','Fail')
,`AT_MISC_DOCUMENTS` enum('Pass','Fail')
,`AP_Remarks` text
);

-- --------------------------------------------------------

--
-- Structure for view `view_applicationforms`
--
DROP TABLE IF EXISTS `view_applicationforms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationforms`  AS  select `bus`.`BU_NAME` AS `BU_NAME`,`bus`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`tp`.`TP_FNAME`,' ',coalesce(`tp`.`TP_MNAME`,' '),' ',coalesce(`tp`.`TP_LNAME`,' ')) AS `TAX_PAYERNAME`,`bus`.`BU_LOCATION` AS `BU_LOCATION`,`bus`.`BU_CONTACT` AS `BU_CONTACT`,concat(`ar`.`AR_FNAME`,' ',coalesce(`ar`.`AR_MNAME`,' '),' ',coalesce(`ar`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`ar`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`bn`.`BN_NAME` AS `BN_NAME`,`ot`.`OT_NAME` AS `OT_NAME`,`ap`.`AP_TYPE` AS `AP_TYPE`,`ap`.`AP_DATE` AS `AP_DATE`,`atc`.`AT_UNIFIED_FILE_NAME` AS `AT_UNIFIED_FILE_NAME`,`ap`.`AP_ID` AS `AP_ID`,`atc`.`AT_ID` AS `AT_ID`,`atc`.`AT_BRGY_CLEARANCE` AS `AT_BRGY_CLEARANCE`,`atc`.`AT_DTI_REGISTRATION` AS `AT_DTI_REGISTRATION`,`atc`.`AT_SEC_REGISTRATION` AS `AT_SEC_REGISTRATION`,`atc`.`AT_TITLE_TO_PROPERTY` AS `AT_TITLE_TO_PROPERTY`,`atc`.`AT_TAX_DECLARATION` AS `AT_TAX_DECLARATION`,`atc`.`AT_CONTRACT_OF_LEASE` AS `AT_CONTRACT_OF_LEASE`,`atc`.`AT_LESSORS_BP` AS `AT_LESSORS_BP`,`atc`.`AT_AUTHORIZATION` AS `AT_AUTHORIZATION`,`atc`.`AT_LOCATIONAL_CLR` AS `AT_LOCATIONAL_CLR`,`atc`.`AT_SANITARY_HEALTH_CERT` AS `AT_SANITARY_HEALTH_CERT`,`atc`.`AT_BUILDING_PERMIT` AS `AT_BUILDING_PERMIT`,`atc`.`AT_POLLUTION_CLR` AS `AT_POLLUTION_CLR`,`atc`.`AT_MECHANICAL_PERMIT` AS `AT_MECHANICAL_PERMIT`,`atc`.`AT_ELECTRICAL_INSP` AS `AT_ELECTRICAL_INSP`,`atc`.`AT_POLICE_CLEARANCE` AS `AT_POLICE_CLEARANCE`,`atc`.`AT_CTAO_CLEARANCE_CERT` AS `AT_CTAO_CLEARANCE_CERT`,`atc`.`AT_FSIC` AS `AT_FSIC`,`atc`.`AT_PREV_BP` AS `AT_PREV_BP`,`atc`.`AT_TAX_BILL` AS `AT_TAX_BILL`,`atc`.`AT_OFFICIAL_RECEIPT` AS `AT_OFFICIAL_RECEIPT`,`atc`.`AT_PCAB_LICENSE` AS `AT_PCAB_LICENSE`,`atc`.`AT_MISC_DOCUMENTS` AS `AT_MISC_DOCUMENTS`,`atc`.`AP_Remarks` AS `AP_Remarks` from (((((((`lgu_r_business` `bus` join `lgu_r_business_nature` `bn` on((`bn`.`BN_ID` = `bus`.`BN_ID`))) join `lgu_r_ownership_type` `ot` on((`ot`.`OT_ID` = `bus`.`OT_ID`))) join `lgu_r_bp_application` `ap` on((`ap`.`BU_ID` = `bus`.`BU_ID`))) join `lgu_r_taxpayer` `tp` on((`tp`.`TP_ID` = `bus`.`TP_ID`))) join `lgu_r_bu_ar` `buxar` on((`buxar`.`BU_ID` = `bus`.`BU_ID`))) join `lgu_r_authorize_rep` `ar` on((`ar`.`AR_ID` = `buxar`.`AR_ID`))) join `lgu_r_attachments` `atc` on((`atc`.`AP_ID` = `ap`.`AP_ID`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lgu_r_attachments`
--
ALTER TABLE `lgu_r_attachments`
  ADD CONSTRAINT `lgu_r_attachments_fk_bp_application` FOREIGN KEY (`AP_ID`) REFERENCES `lgu_r_bp_application` (`AP_ID`),
  ADD CONSTRAINT `lgu_r_attachments_fk_req_type` FOREIGN KEY (`RT_ID`) REFERENCES `lgu_r_req_type` (`RT_ID`);

--
-- Constraints for table `lgu_r_bp_application`
--
ALTER TABLE `lgu_r_bp_application`
  ADD CONSTRAINT `lgu_r_bp_application_fk_business` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`),
  ADD CONSTRAINT `lgu_r_bp_application_fk_user` FOREIGN KEY (`U_ID`) REFERENCES `lgu_r_user` (`U_ID`);

--
-- Constraints for table `lgu_r_business`
--
ALTER TABLE `lgu_r_business`
  ADD CONSTRAINT `lgu_r_business_fk_business_nature` FOREIGN KEY (`BN_ID`) REFERENCES `lgu_r_business_nature` (`BN_ID`),
  ADD CONSTRAINT `lgu_r_business_fk_ownership_type` FOREIGN KEY (`OT_ID`) REFERENCES `lgu_r_ownership_type` (`OT_ID`),
  ADD CONSTRAINT `lgu_r_business_fk_taxpayer` FOREIGN KEY (`TP_ID`) REFERENCES `lgu_r_taxpayer` (`TP_ID`);

--
-- Constraints for table `lgu_r_business_permit`
--
ALTER TABLE `lgu_r_business_permit`
  ADD CONSTRAINT `lgu_r_business_permit_fk_bp_application` FOREIGN KEY (`AP_ID`) REFERENCES `lgu_r_bp_application` (`AP_ID`),
  ADD CONSTRAINT `lgu_r_business_permit_fk_business` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`);

--
-- Constraints for table `lgu_r_bu_ar`
--
ALTER TABLE `lgu_r_bu_ar`
  ADD CONSTRAINT `lgu_r_bu_ar_fk_authorize_rep` FOREIGN KEY (`AR_ID`) REFERENCES `lgu_r_authorize_rep` (`AR_ID`),
  ADD CONSTRAINT `lgu_r_bu_ar_fk_business` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`);

--
-- Constraints for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_employee_profile`
  ADD CONSTRAINT `lgu_r_employee_profile_fk_division` FOREIGN KEY (`DIV_ID`) REFERENCES `lgu_r_division` (`DIV_ID`);

--
-- Constraints for table `lgu_r_ot_req`
--
ALTER TABLE `lgu_r_ot_req`
  ADD CONSTRAINT `lgu_r_ot_req_fk_ownership_type` FOREIGN KEY (`OT_ID`) REFERENCES `lgu_r_ownership_type` (`OT_ID`),
  ADD CONSTRAINT `lgu_r_ot_req_fk_req_type` FOREIGN KEY (`RT_ID`) REFERENCES `lgu_r_req_type` (`RT_ID`);

--
-- Constraints for table `lgu_r_role_mod`
--
ALTER TABLE `lgu_r_role_mod`
  ADD CONSTRAINT `lgu_r_role_mod_fk_module` FOREIGN KEY (`MOD_ID`) REFERENCES `lgu_r_module` (`MOD_ID`),
  ADD CONSTRAINT `lgu_r_role_mod_fk_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `lgu_r_role` (`ROLE_ID`);

--
-- Constraints for table `lgu_r_user`
--
ALTER TABLE `lgu_r_user`
  ADD CONSTRAINT `lgu_r_user_fk_employee_profile` FOREIGN KEY (`EP_ID`) REFERENCES `lgu_r_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `lgu_r_user_fk_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `lgu_r_role` (`ROLE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
