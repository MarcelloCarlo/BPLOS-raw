-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2018 at 10:53 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

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
CREATE DATABASE IF NOT EXISTS `lgu_paeis_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lgu_paeis_db`;

-- --------------------------------------------------------

--
-- Table structure for table `bpls_r_business_nature`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_r_business_nature`;
CREATE TABLE IF NOT EXISTS `bpls_r_business_nature` (
  `BN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BN_NAME` varchar(100) NOT NULL,
  `BN_CLASSIFICATION` enum('S','L') NOT NULL,
  PRIMARY KEY (`BN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_r_business_nature`:
--

--
-- Dumping data for table `bpls_r_business_nature`
--

INSERT INTO `bpls_r_business_nature` (`BN_ID`, `BN_NAME`, `BN_CLASSIFICATION`) VALUES
(1, 'Accounting Services', 'S'),
(2, 'Administrative Office', 'S'),
(3, 'Building Maintenance', 'S'),
(4, 'Carinderias', 'S'),
(5, 'Consultancy Firms', 'S'),
(6, 'Deep Well Drilling Office', 'S'),
(7, 'Engineering Services', 'S'),
(8, 'General Building Contractor', 'S'),
(9, 'General Engineering Office', 'S'),
(10, 'Graphic Arts Design Firms', 'S'),
(11, 'Installation of Wall Coverings', 'S'),
(12, 'Landscaping', 'S'),
(13, 'Law Offices', 'S'),
(14, 'Lessor /Apartment (upt ot 3 doors)', 'S'),
(15, 'Liaison Offices', 'S'),
(16, 'Management Consultancy', 'S'),
(17, 'Marketing Consultancy', 'S'),
(18, 'Merchandise Brokerage', 'S'),
(19, 'Messengers Services', 'S'),
(20, 'Non-Life Insurance Agency', 'S'),
(21, 'Real Estate Brokers', 'S'),
(22, 'Real Estate Developers', 'S'),
(23, 'Retailers', 'S'),
(24, 'Wholesalers', 'S'),
(25, 'Retail Peddlers', 'S'),
(26, 'Sari-sari Stores', 'S'),
(27, 'Travel Agency', 'S'),
(28, 'Watch Repair Shops', 'S'),
(29, 'Water Refilling Stations', 'S'),
(30, 'Shopping Malls', 'L'),
(31, 'Hotels', 'L'),
(32, 'Motels', 'L'),
(33, 'Apartelles', 'L'),
(34, 'Inns', 'L'),
(35, 'Dormitories', 'L'),
(36, 'Theaters', 'L'),
(37, 'Auditoriums', 'L'),
(38, 'Cockpit Arenas', 'L'),
(39, 'Boxing Arenas', 'L'),
(40, 'Firing Ranges', 'L'),
(41, 'Convention Halls', 'L'),
(42, 'Concert Halls', 'L'),
(43, 'Hospitals', 'L'),
(44, 'Laboratories', 'L'),
(45, 'Gasoline Stations', 'L'),
(46, 'Cooking Gas Outlets', 'L'),
(47, 'LPG Refilling Stations', 'L'),
(48, 'Schools', 'L'),
(49, 'BPO/Call Centers', 'L'),
(50, 'Manufacturing Plants', 'L'),
(51, 'Assembly Plants', 'L'),
(52, 'Distilleries and Breweries', 'L'),
(53, 'Compound Mixing Plants', 'L'),
(54, 'Chemicals', 'L'),
(55, 'Warehouses', 'L'),
(56, 'Night Clubs', 'L'),
(57, 'Sauna Bath Houses', 'L'),
(58, 'Beer Houses', 'L'),
(59, 'KTV Bars', 'L'),
(60, 'Disco Houses', 'L'),
(61, 'Cocktail Lounges', 'L'),
(62, 'Transport Services', 'L'),
(63, 'And other similar Establishments', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `bpls_r_bu_ar`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_r_bu_ar`;
CREATE TABLE IF NOT EXISTS `bpls_r_bu_ar` (
  `AR_ID` int(11) DEFAULT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  KEY `bu_ar_fk_bu` (`BU_ID`) USING BTREE,
  KEY `bu_ar_fk_ar` (`AR_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_r_bu_ar`:
--   `AR_ID`
--       `bpls_t_authorize_rep` -> `AR_ID`
--   `BU_ID`
--       `bpls_t_business` -> `BU_ID`
--

--
-- Dumping data for table `bpls_r_bu_ar`
--

INSERT INTO `bpls_r_bu_ar` (`AR_ID`, `BU_ID`) VALUES
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 6),
(13, 7),
(14, 8),
(15, 9),
(16, 10),
(17, 11),
(18, 12),
(19, 13),
(20, 14),
(21, 15),
(22, 16),
(23, 17),
(24, 18),
(25, 19),
(26, 20),
(27, 21),
(28, 22),
(29, 23),
(30, 24),
(31, 25),
(32, 26),
(36, 27),
(37, 28),
(38, 29),
(39, 30);

-- --------------------------------------------------------

--
-- Table structure for table `bpls_r_division`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_r_division`;
CREATE TABLE IF NOT EXISTS `bpls_r_division` (
  `DIV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIV_CODE` varchar(10) NOT NULL,
  `DIV_NAME` varchar(50) NOT NULL,
  `DIV_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`DIV_ID`),
  UNIQUE KEY `UNQ_DIV_CODE` (`DIV_CODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_r_division`:
--

--
-- Dumping data for table `bpls_r_division`
--

INSERT INTO `bpls_r_division` (`DIV_ID`, `DIV_CODE`, `DIV_NAME`, `DIV_DESC`) VALUES
(1, 'DIV-EV', 'Evaluation', ''),
(2, 'DIV-INS', 'Inspection', ''),
(3, 'DIV-INV', 'Investigation', ''),
(4, 'DIV-TRE', 'Treasury', ''),
(5, 'DIV-REL', 'Releasing', ''),
(6, 'DIV-SYSAD', 'System Admin', ''),
(7, 'END', 'Finished', '');

-- --------------------------------------------------------

--
-- Table structure for table `bpls_r_fee_list`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_r_fee_list`;
CREATE TABLE IF NOT EXISTS `bpls_r_fee_list` (
  `FL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FL_NAME` varchar(100) NOT NULL,
  `FL_AMOUNT` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`FL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_r_fee_list`:
--

--
-- Dumping data for table `bpls_r_fee_list`
--

INSERT INTO `bpls_r_fee_list` (`FL_ID`, `FL_NAME`, `FL_AMOUNT`) VALUES
(1, 'Mayors Permit', '100.00'),
(2, 'City Tax', '10000.00'),
(3, 'Garbage Fee', '260.00'),
(4, 'Sanitary Fee', '450.00'),
(5, 'Building Insp_Fee', '50.00'),
(6, 'Electrical Insp Fee', '20.00'),
(7, 'Plumbing Insp Fee', '7.00'),
(8, 'Signbooard', '50.00'),
(9, 'Fire Insp Fee', '300.00'),
(10, 'New Registration Plate/ Sticker', '250.00'),
(11, 'Zoning Fee', '545.00'),
(12, 'Penalty Interest', '0.00'),
(13, 'Tourism', '1000.00'),
(14, 'QCBRD', '100.00'),
(15, 'Adjustment', '0.00'),
(16, 'Discount', '0.00'),
(17, 'Penalty for Delinquency', '0.00'),
(18, 'Adjustment for Tourism', '0.00'),
(19, 'Special Permit', '0.00'),
(20, 'Additional Fees', '0.00'),
(21, 'CTC', '1690.00');

-- --------------------------------------------------------

--
-- Table structure for table `bpls_r_ot_bn_req`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_r_ot_bn_req`;
CREATE TABLE IF NOT EXISTS `bpls_r_ot_bn_req` (
  `OT_ID` int(11) DEFAULT NULL,
  `BN_ID` int(11) DEFAULT NULL,
  `RT_ID` int(11) NOT NULL,
  `REQ_GRP_ID` int(11) NOT NULL,
  PRIMARY KEY (`REQ_GRP_ID`),
  KEY `ot_bn_req_fk_ot` (`OT_ID`) USING BTREE,
  KEY `ot_bn_req_fk_bn` (`BN_ID`) USING BTREE,
  KEY `ot_bn_req_fk_rt` (`RT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_r_ot_bn_req`:
--   `BN_ID`
--       `bpls_r_business_nature` -> `BN_ID`
--   `OT_ID`
--       `bpls_r_ownership_type` -> `OT_ID`
--   `RT_ID`
--       `bpls_r_req_type` -> `RT_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_r_ownership_type`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_r_ownership_type`;
CREATE TABLE IF NOT EXISTS `bpls_r_ownership_type` (
  `OT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OT_CODE` varchar(10) DEFAULT NULL,
  `OT_NAME` varchar(50) NOT NULL,
  `OT_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`OT_ID`),
  UNIQUE KEY `OT_CODE` (`OT_CODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_r_ownership_type`:
--

--
-- Dumping data for table `bpls_r_ownership_type`
--

INSERT INTO `bpls_r_ownership_type` (`OT_ID`, `OT_CODE`, `OT_NAME`, `OT_DESC`) VALUES
(1, 'OT-SIN', 'Single Propreitorship', 'Single Owner of the Business'),
(2, 'OT-PRT', 'Partnership/Corporation', 'Multiple Owner Business');

-- --------------------------------------------------------

--
-- Table structure for table `bpls_r_req_type`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_r_req_type`;
CREATE TABLE IF NOT EXISTS `bpls_r_req_type` (
  `RT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RT_NAME` varchar(50) NOT NULL,
  `RT_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`RT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_r_req_type`:
--

--
-- Dumping data for table `bpls_r_req_type`
--

INSERT INTO `bpls_r_req_type` (`RT_ID`, `RT_NAME`, `RT_DESC`) VALUES
(1, 'Brgy Clearance', 'Brgy Clearance'),
(2, 'DTI Registration', 'DTI Registration'),
(3, 'SEC Registration', 'SEC Registration'),
(4, 'Title to Property', 'Title to Property'),
(5, 'Tax Declaretion', 'Tax Declaretion'),
(6, 'Contract of Lease', 'Contract of Lease'),
(7, 'Lessors Business Permit', 'Lessors Business Permit'),
(8, 'Authorization Letter', 'Authorization Letter'),
(9, 'Locational Clearance', 'Locational Clearance'),
(10, 'Sanitary Health Cert', 'Sanitary Health Cert'),
(11, 'Building Permit', 'Building Permit'),
(12, 'Pollution Clearance', 'Pollution Clearance'),
(13, 'Mechanical Permit', 'Mechanical Permit'),
(14, 'Electrical Inspection', 'Electrical Inspection'),
(15, 'CTAO Clearance', 'CTAO Clearance'),
(16, 'FSIC', 'Fire Safety Inspection Certificate'),
(17, 'Previous Business Permit', ''),
(18, 'Tax Bill', 'Tax Bill'),
(19, 'Official Receipt', 'Official Receipt'),
(20, 'PCAB License', 'Philippine Contractors Accreditation Board'),
(21, 'Liqour License', 'Liqour License'),
(22, 'Miscellaneous Documents', 'Miscellaneous Documents'),
(23, 'Police Clearance', 'Police Clearance');

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_attachments`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_attachments`;
CREATE TABLE IF NOT EXISTS `bpls_t_attachments` (
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
  `AT_LIQUOR_LIC` enum('Pass','Fail') DEFAULT NULL,
  `AT_MISC_DOCUMENTS` enum('Pass','Fail') DEFAULT NULL,
  `AP_Remarks` text,
  `AP_ID` int(11) DEFAULT NULL,
  `REQ_GRP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AT_ID`),
  KEY `attachments_fk_ap` (`AP_ID`) USING BTREE,
  KEY `attachments_fk_rt` (`REQ_GRP_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_attachments`:
--   `AP_ID`
--       `bpls_t_bp_application` -> `AP_ID`
--   `REQ_GRP_ID`
--       `bpls_r_req_type` -> `RT_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_authorize_rep`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_authorize_rep`;
CREATE TABLE IF NOT EXISTS `bpls_t_authorize_rep` (
  `AR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AR_FNAME` varchar(50) NOT NULL,
  `AR_MNAME` varchar(50) DEFAULT NULL,
  `AR_LNAME` varchar(50) DEFAULT NULL,
  `AR_POSITION` varchar(50) DEFAULT NULL,
  `AR_HOME_ADDRESS` varchar(300) NOT NULL,
  PRIMARY KEY (`AR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_authorize_rep`:
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_bp_application`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_bp_application`;
CREATE TABLE IF NOT EXISTS `bpls_t_bp_application` (
  `AP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AP_REFERENCE_NO` varchar(20) NOT NULL,
  `AP_DATE` date NOT NULL,
  `AP_TYPE` enum('New','Renew') NOT NULL,
  `AP_STATUS` enum('Pending','Terminated','Success','Assess') NOT NULL DEFAULT 'Pending',
  `AP_DIV_CODE_TO` varchar(10) DEFAULT NULL,
  `AP_DIV_CODE_FROM` varchar(10) DEFAULT NULL,
  `AP_DATE_ACCESSED` date DEFAULT NULL,
  `AP_DATE_RE_INS` date DEFAULT NULL,
  `AP_RE_INS_DEAD` date DEFAULT NULL,
  `AP_REMARKS` text,
  `BU_ID` int(11) DEFAULT NULL,
  `TB_ID` int(11) DEFAULT NULL,
  `U_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AP_ID`),
  UNIQUE KEY `UK_AP_REFERENCE_NO` (`AP_REFERENCE_NO`) USING BTREE,
  KEY `bp_application_fk_bu` (`BU_ID`) USING BTREE,
  KEY `bp_application_fk_u` (`U_ID`) USING BTREE,
  KEY `bp_application_fk_tb` (`TB_ID`) USING BTREE,
  KEY `application_fk_divto` (`AP_DIV_CODE_TO`) USING BTREE,
  KEY `application_fk_divfro` (`AP_DIV_CODE_FROM`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_bp_application`:
--   `BU_ID`
--       `bpls_t_business` -> `BU_ID`
--   `AP_DIV_CODE_FROM`
--       `bpls_r_division` -> `DIV_CODE`
--   `AP_DIV_CODE_TO`
--       `bpls_r_division` -> `DIV_CODE`
--   `TB_ID`
--       `bpls_t_taxbill` -> `TB_ID`
--   `U_ID`
--       `bpls_t_user` -> `U_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_business`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_business`;
CREATE TABLE IF NOT EXISTS `bpls_t_business` (
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
  `OT_CODE` varchar(10) DEFAULT NULL,
  `RENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BU_ID`),
  KEY `business_fk_bn` (`BN_ID`) USING BTREE,
  KEY `business_fk_tp` (`TP_ID`) USING BTREE,
  KEY `business_fk_otcode` (`OT_CODE`) USING BTREE,
  KEY `business_fk_rent` (`RENT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_business`:
--   `BN_ID`
--       `bpls_r_business_nature` -> `BN_ID`
--   `OT_CODE`
--       `bpls_r_ownership_type` -> `OT_CODE`
--   `RENT_ID`
--       `bpls_t_is_rented` -> `RENT_ID`
--   `TP_ID`
--       `bpls_t_taxpayer` -> `TP_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_business_permit`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_business_permit`;
CREATE TABLE IF NOT EXISTS `bpls_t_business_permit` (
  `BP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BP_NUMBER` varchar(20) NOT NULL,
  `BP_ISSUED_DATE` date NOT NULL,
  `BP_VALID_YEARS` date DEFAULT NULL,
  `BP_REMARKS` varchar(300) NOT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  `AP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BP_ID`),
  UNIQUE KEY `BP_NUMBER` (`BP_NUMBER`),
  KEY `buspermit_fk_bu` (`BU_ID`) USING BTREE,
  KEY `buspermit_fk_ap` (`AP_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_business_permit`:
--   `AP_ID`
--       `bpls_t_bp_application` -> `AP_ID`
--   `BU_ID`
--       `bpls_t_business` -> `BU_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_employee_profile`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_employee_profile`;
CREATE TABLE IF NOT EXISTS `bpls_t_employee_profile` (
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
  `EP_STATUS` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `DIV_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EP_ID`),
  KEY `employee_profile_fk_div` (`DIV_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_employee_profile`:
--   `DIV_ID`
--       `bpls_r_division` -> `DIV_ID`
--

--
-- Dumping data for table `bpls_t_employee_profile`
--

INSERT INTO `bpls_t_employee_profile` (`EP_ID`, `EP_FNAME`, `EP_MNAME`, `EP_LNAME`, `EP_GENDER`, `EP_CONTACT_NO`, `EP_EMAIL`, `EP_BIRTHDATE`, `EP_ADDRESS`, `EP_JOB_DESC`, `EP_STATUS`, `DIV_ID`) VALUES
(1, 'John Carlo', 'Villar', 'Gutierrez', 'Other', '785442', 'jcgutierrez@gg.ph', '1999-03-01', '132 Gremville Subdivision', 'QC-Treasury', 'Active', 4);

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_fl_tb`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_fl_tb`;
CREATE TABLE IF NOT EXISTS `bpls_t_fl_tb` (
  `TB_ID` int(11) NOT NULL,
  `FL_ID` int(11) NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL,
  KEY `fl_tb_fk_fl` (`FL_ID`) USING BTREE,
  KEY `fl_tb_fk_tb` (`TB_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_fl_tb`:
--   `FL_ID`
--       `bpls_r_fee_list` -> `FL_ID`
--   `TB_ID`
--       `bpls_t_taxbill` -> `TB_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_inspections`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_inspections`;
CREATE TABLE IF NOT EXISTS `bpls_t_inspections` (
  `INS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INS_AP_REFERENCE_NO` varchar(20) NOT NULL,
  `ZONING_INS` enum('Pass','Fail') NOT NULL,
  `FIRE_INS` enum('Pass','Fail') NOT NULL,
  `HEALTH_SANITATION_INS` enum('Pass','Fail') NOT NULL,
  `BUILDING_INS` enum('Pass','Fail') NOT NULL,
  `LABOR_INS` enum('Pass','Fail') NOT NULL,
  `MISC_INS` enum('Pass','Fail') NOT NULL,
  `INS_REMARKS` text,
  PRIMARY KEY (`INS_ID`),
  UNIQUE KEY `INS_AP_REFERENCE_NO` (`INS_AP_REFERENCE_NO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_inspections`:
--   `INS_AP_REFERENCE_NO`
--       `bpls_t_bp_application` -> `AP_REFERENCE_NO`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_is_rented`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_is_rented`;
CREATE TABLE IF NOT EXISTS `bpls_t_is_rented` (
  `RENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RENT_DATE_STARTED` date NOT NULL,
  `RENT_MONTHLY_RENTAL` float NOT NULL,
  `RENT_LESSOR` varchar(100) NOT NULL,
  PRIMARY KEY (`RENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_is_rented`:
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_official_receipt`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_official_receipt`;
CREATE TABLE IF NOT EXISTS `bpls_t_official_receipt` (
  `OR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OR_DATE` date NOT NULL,
  `OR_PYMT_TYPE` enum('Cash','Treasury Warrant','Check','Money Order') NOT NULL,
  `OR_TW_CH_MO_NO` varchar(20) DEFAULT NULL,
  `OR_TW_CH_MO_DATE` date DEFAULT NULL,
  `OIC_CITY_TREASURER` int(11) NOT NULL,
  `TB_ID` int(11) NOT NULL,
  PRIMARY KEY (`OR_ID`),
  KEY `official_receipt_fk_tb` (`TB_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_official_receipt`:
--   `TB_ID`
--       `bpls_t_taxbill` -> `TB_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_taxbill`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_taxbill`;
CREATE TABLE IF NOT EXISTS `bpls_t_taxbill` (
  `TB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TB_BILL_NO` varchar(30) NOT NULL,
  `TB_DATE_BILLED` date NOT NULL,
  `ASSESSED_BY` int(11) NOT NULL,
  `VERIFIED_BY` int(11) NOT NULL,
  `REC_APPROVAL_BY` int(11) NOT NULL,
  `APPROVED_BY` int(11) NOT NULL,
  PRIMARY KEY (`TB_ID`),
  KEY `taxbill_fk_assessed` (`ASSESSED_BY`) USING BTREE,
  KEY `taxbill_fk_verified` (`VERIFIED_BY`) USING BTREE,
  KEY `taxbill_fk_reccom` (`REC_APPROVAL_BY`) USING BTREE,
  KEY `taxbill_fk_approved` (`APPROVED_BY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_taxbill`:
--   `APPROVED_BY`
--       `bpls_t_employee_profile` -> `EP_ID`
--   `ASSESSED_BY`
--       `bpls_t_employee_profile` -> `EP_ID`
--   `REC_APPROVAL_BY`
--       `bpls_t_employee_profile` -> `EP_ID`
--   `VERIFIED_BY`
--       `bpls_t_employee_profile` -> `EP_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_taxpayer`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_taxpayer`;
CREATE TABLE IF NOT EXISTS `bpls_t_taxpayer` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_taxpayer`:
--

-- --------------------------------------------------------

--
-- Table structure for table `bpls_t_user`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `bpls_t_user`;
CREATE TABLE IF NOT EXISTS `bpls_t_user` (
  `U_ID` int(11) NOT NULL AUTO_INCREMENT,
  `U_USERNAME` varchar(25) NOT NULL,
  `U_PASSWORD` blob NOT NULL,
  `U_STATUS` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `U_ROLE` varchar(10) DEFAULT NULL,
  `EP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`U_ID`),
  UNIQUE KEY `U_ROLE_ID` (`U_ROLE`) USING BTREE,
  KEY `user_fk_ep` (`EP_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `bpls_t_user`:
--   `U_ROLE`
--       `bpls_r_division` -> `DIV_CODE`
--   `EP_ID`
--       `bpls_t_employee_profile` -> `EP_ID`
--

--
-- Dumping data for table `bpls_t_user`
--

INSERT INTO `bpls_t_user` (`U_ID`, `U_USERNAME`, `U_PASSWORD`, `U_STATUS`, `U_ROLE`, `EP_ID`) VALUES
(1, 'sysadmin', 0x73797361646d696e, 'Active', 'DIV-EV', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_r_employee`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_r_employee`;
CREATE TABLE IF NOT EXISTS `oc_r_employee` (
  `EP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EP_FNAME` varchar(50) NOT NULL,
  `EP_MNAME` varchar(50) DEFAULT NULL,
  `EP_LNAME` varchar(50) NOT NULL,
  `EP_SEX` char(1) NOT NULL,
  `EP_CONTACT_NO` char(11) NOT NULL,
  `EP_EMAIL` varchar(50) NOT NULL,
  `EP_BIRTHDATE` date NOT NULL,
  `EP_ADDRESS` varchar(500) NOT NULL,
  `EP_JOB_DESC` varchar(150) NOT NULL,
  `EP_CIVIL_STATUS` char(1) NOT NULL,
  `EP_STATUS` int(1) NOT NULL DEFAULT '1',
  `UR_ID` int(11) NOT NULL,
  `EP_USERNAME` varchar(50) NOT NULL,
  `EP_PASSWORD` varchar(50) NOT NULL,
  PRIMARY KEY (`EP_ID`),
  KEY `ep_fk_ur` (`UR_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_r_employee`:
--   `UR_ID`
--       `oc_r_user_roles` -> `UR_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_r_job_desc`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_r_job_desc`;
CREATE TABLE IF NOT EXISTS `oc_r_job_desc` (
  `JD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `JD_NAME` varchar(100) NOT NULL,
  `JD_FEE` int(5) NOT NULL,
  PRIMARY KEY (`JD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_r_job_desc`:
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_r_requirements`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_r_requirements`;
CREATE TABLE IF NOT EXISTS `oc_r_requirements` (
  `REQ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REQ_NBI_POLICE_CLR` varchar(300) DEFAULT NULL,
  `REQ_HEALTH_CERT` varchar(300) DEFAULT NULL,
  `REQ_CEDULA_CTC` varchar(300) DEFAULT NULL,
  `REQ_PARENTAL_CONSENT` varchar(300) DEFAULT NULL,
  `REQ_AEP` varchar(300) DEFAULT NULL,
  `REQ_AFFIDAVIT_WAIVER` varchar(300) DEFAULT NULL,
  `REQ_ID_PIC` varchar(300) DEFAULT NULL,
  `OAF_ID` int(11) NOT NULL,
  `EP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`REQ_ID`),
  KEY `req_fk_oaf` (`OAF_ID`) USING BTREE,
  KEY `req_fk_ep` (`EP_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_r_requirements`:
--   `EP_ID`
--       `oc_r_employee` -> `EP_ID`
--   `OAF_ID`
--       `oc_t_application_frm` -> `OAF_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_r_user_roles`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_r_user_roles`;
CREATE TABLE IF NOT EXISTS `oc_r_user_roles` (
  `UR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UR_TYPE` varchar(50) NOT NULL,
  `UR_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`UR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_r_user_roles`:
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_applicant`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_t_applicant`;
CREATE TABLE IF NOT EXISTS `oc_t_applicant` (
  `OA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OA_NAME` varchar(100) NOT NULL,
  `OA_COMP_NAME` varchar(50) DEFAULT NULL,
  `OA_ADDRESS` varchar(300) NOT NULL,
  `OA_SEX` char(1) NOT NULL,
  `OA_POSITION` varchar(100) NOT NULL,
  `OA_EMAIL` varchar(50) NOT NULL,
  `OA_CONTACT_NO` char(11) NOT NULL,
  `OA_DATE` date NOT NULL,
  PRIMARY KEY (`OA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_t_applicant`:
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_application_frm`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_t_application_frm`;
CREATE TABLE IF NOT EXISTS `oc_t_application_frm` (
  `OAF_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OAF_FNAME` varchar(50) NOT NULL,
  `OAF_MNAME` varchar(50) DEFAULT NULL,
  `OAF_LNAME` varchar(50) NOT NULL,
  `OAF_ADDRESS` varchar(300) NOT NULL,
  `OAF_BIRTHDATE` date NOT NULL,
  `OAF_SEX` char(1) NOT NULL,
  `OAF_CIVIL_STATUS` char(1) NOT NULL,
  `OAF_COMPANY` varchar(100) NOT NULL,
  `OAF_PLC_ASSIGNED` varchar(300) NOT NULL DEFAULT 'Quezon City',
  `OAF_CEDULA_NO` varchar(50) NOT NULL,
  `OAF_NBI_POLICE_CLR` varchar(50) NOT NULL,
  `OAF_HEALTH_RCPT_NO` varchar(50) NOT NULL,
  `OAF_CONTACT_NO` char(11) NOT NULL,
  `OAF_DATE` date NOT NULL,
  `AP_ID` int(11) NOT NULL,
  `JD_ID` int(11) NOT NULL,
  `OAF_UNIFIED_FILE` longblob NOT NULL,
  `OAF_UNIFIED_FILE_NAME` text NOT NULL,
  PRIMARY KEY (`OAF_ID`),
  KEY `oaf_fk_ap` (`AP_ID`) USING BTREE,
  KEY `oaf_fk_jd` (`JD_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_t_application_frm`:
--   `AP_ID`
--       `oc_t_applicant` -> `OA_ID`
--   `JD_ID`
--       `oc_r_job_desc` -> `JD_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_occupational_permit`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_t_occupational_permit`;
CREATE TABLE IF NOT EXISTS `oc_t_occupational_permit` (
  `OCP_ID` varchar(20) NOT NULL,
  `OAF_ID` int(11) NOT NULL,
  `REQ_ID` int(11) NOT NULL,
  `OCP_VALID_DATE` date NOT NULL,
  `OR_ID` varchar(20) NOT NULL,
  `EP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OCP_ID`),
  KEY `ocp_fk_oaf` (`OAF_ID`) USING BTREE,
  KEY `ocp_fk_req` (`REQ_ID`) USING BTREE,
  KEY `ocp_fk_or` (`OR_ID`) USING BTREE,
  KEY `ocp_fk_ep` (`EP_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_t_occupational_permit`:
--   `EP_ID`
--       `oc_r_employee` -> `EP_ID`
--   `OAF_ID`
--       `oc_t_application_frm` -> `OAF_ID`
--   `OR_ID`
--       `oc_t_official_receipt` -> `OR_ID`
--   `REQ_ID`
--       `oc_r_requirements` -> `REQ_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_official_receipt`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_t_official_receipt`;
CREATE TABLE IF NOT EXISTS `oc_t_official_receipt` (
  `OR_ID` varchar(20) NOT NULL,
  `OP_ID` varchar(20) NOT NULL,
  `OR_AMT_PAID` double(5,2) NOT NULL,
  `OP_DATE` date NOT NULL,
  `EP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OR_ID`),
  KEY `or_fk_op` (`OP_ID`) USING BTREE,
  KEY `or_fk_ep` (`EP_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_t_official_receipt`:
--   `EP_ID`
--       `oc_r_employee` -> `EP_ID`
--   `OP_ID`
--       `oc_t_order_pymnt` -> `OP_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_order_pymnt`
--
-- Creation: Oct 10, 2018 at 02:40 AM
--

DROP TABLE IF EXISTS `oc_t_order_pymnt`;
CREATE TABLE IF NOT EXISTS `oc_t_order_pymnt` (
  `OP_ID` varchar(20) NOT NULL,
  `OP_IDPIC_FEE` int(5) NOT NULL DEFAULT '20',
  `OP_RATE_FEE` int(5) NOT NULL,
  `OP_DATE` date NOT NULL,
  `OAF_ID` int(11) NOT NULL,
  PRIMARY KEY (`OP_ID`),
  KEY `op_fk_oaf` (`OAF_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `oc_t_order_pymnt`:
--   `OAF_ID`
--       `oc_t_application_frm` -> `OAF_ID`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_applicationformsev`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_applicationformsev`;
CREATE TABLE IF NOT EXISTS `view_applicationformsev` (
`AP_REFERENCE_NO` varchar(20)
,`BU_NAME` varchar(200)
,`BU_PRESIDENT` varchar(100)
,`TAX_PAYERNAME` varchar(152)
,`BU_LOCATION` varchar(300)
,`BU_CONTACT` char(11)
,`AUTH_REPNAME` varchar(152)
,`AR_HOME_ADDRESS` varchar(300)
,`BN_NAME` varchar(100)
,`BN_CLASSIFICATION` enum('S','L')
,`OT_NAME` varchar(50)
,`OT_CODE` varchar(10)
,`AP_TYPE` enum('New','Renew')
,`AP_DATE` date
,`AT_UNIFIED_FILE_NAME` text
,`AP_ID` int(11)
,`AP_STATUS` enum('Pending','Terminated','Success','Assess')
,`AP_DIV_CODE_TO` varchar(10)
,`AP_DIV_CODE_FROM` varchar(10)
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
,`AT_MISC_DOCUMENTS` enum('Pass','Fail')
,`AP_Remarks` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_applicationformsip`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_applicationformsip`;
CREATE TABLE IF NOT EXISTS `view_applicationformsip` (
`AP_REFERENCE_NO` varchar(20)
,`BU_NAME` varchar(200)
,`BU_PRESIDENT` varchar(100)
,`TAX_PAYERNAME` varchar(152)
,`BU_LOCATION` varchar(300)
,`BU_CONTACT` char(11)
,`AUTH_REPNAME` varchar(152)
,`AR_HOME_ADDRESS` varchar(300)
,`BN_NAME` varchar(100)
,`BN_CLASSIFICATION` enum('S','L')
,`OT_NAME` varchar(50)
,`OT_CODE` varchar(10)
,`AP_TYPE` enum('New','Renew')
,`AP_DATE` date
,`AP_ID` int(11)
,`AP_STATUS` enum('Pending','Terminated','Success','Assess')
,`AP_DIV_CODE_TO` varchar(10)
,`AP_DIV_CODE_FROM` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_applicationformsiv`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_applicationformsiv`;
CREATE TABLE IF NOT EXISTS `view_applicationformsiv` (
`AP_REFERENCE_NO` varchar(20)
,`BU_NAME` varchar(200)
,`BU_PRESIDENT` varchar(100)
,`TAX_PAYERNAME` varchar(152)
,`BU_LOCATION` varchar(300)
,`BU_CONTACT` char(11)
,`AUTH_REPNAME` varchar(152)
,`AR_HOME_ADDRESS` varchar(300)
,`BN_NAME` varchar(100)
,`BN_CLASSIFICATION` enum('S','L')
,`OT_NAME` varchar(50)
,`OT_CODE` varchar(10)
,`AP_TYPE` enum('New','Renew')
,`AP_DATE` date
,`AP_ID` int(11)
,`AP_STATUS` enum('Pending','Terminated','Success','Assess')
,`AP_DIV_CODE_TO` varchar(10)
,`AP_DIV_CODE_FROM` varchar(10)
,`ZONING_INS` enum('Pass','Fail')
,`FIRE_INS` enum('Pass','Fail')
,`HEALTH_SANITATION_INS` enum('Pass','Fail')
,`BUILDING_INS` enum('Pass','Fail')
,`LABOR_INS` enum('Pass','Fail')
,`MISC_INS` enum('Pass','Fail')
,`INS_REMARKS` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_applicationformsrel`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_applicationformsrel`;
CREATE TABLE IF NOT EXISTS `view_applicationformsrel` (
`AP_REFERENCE_NO` varchar(20)
,`BU_NAME` varchar(200)
,`BN_NAME` varchar(100)
,`TP_NAME` varchar(152)
,`TP_HOME_ADDRESS` varchar(300)
,`TB_ID` int(11)
,`TB_DATE_BILLED` date
,`EMP_NAME` varchar(152)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_applicationformstre`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_applicationformstre`;
CREATE TABLE IF NOT EXISTS `view_applicationformstre` (
`AP_REFERENCE_NO` varchar(20)
,`BU_NAME` varchar(200)
,`BN_NAME` varchar(100)
,`TP_NAME` varchar(152)
,`TP_HOME_ADDRESS` varchar(300)
,`TB_ID` int(11)
,`TB_DATE_BILLED` date
,`EMP_NAME` varchar(152)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_routeslip`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_routeslip`;
CREATE TABLE IF NOT EXISTS `view_routeslip` (
`AP_REFERENCE_NO` varchar(20)
,`AP_TYPE` enum('New','Renew')
,`AP_STATUS` enum('Pending','Terminated','Success','Assess')
,`AP_DIV_CODE_TO` varchar(10)
,`AP_DATE_ACCESSED` date
,`AP_REMARKS` text
,`BU_NAME` varchar(200)
,`BU_PRESIDENT` varchar(100)
,`BU_LOCATION` varchar(300)
,`BU_CONTACT` char(11)
,`TP_FNAME` varchar(50)
,`TP_MNAME` varchar(50)
,`TP_LNAME` varchar(50)
,`TP_HOME_ADDRESS` varchar(300)
,`BN_NAME` varchar(100)
,`BN_CLASSIFICATION` enum('S','L')
,`DIV_NAME` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_terminatedap`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_terminatedap`;
CREATE TABLE IF NOT EXISTS `view_terminatedap` (
`BU_NAME` varchar(200)
,`AP_DATE_ACCESSED` date
,`AP_REMARKS` text
,`AP_DIV_CODE_TO` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsev`
--
DROP TABLE IF EXISTS `view_applicationformsev`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsev`  AS  select `ap`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`bus`.`BU_NAME` AS `BU_NAME`,`bus`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`tp`.`TP_FNAME`,' ',coalesce(`tp`.`TP_MNAME`,' '),' ',coalesce(`tp`.`TP_LNAME`,' ')) AS `TAX_PAYERNAME`,`bus`.`BU_LOCATION` AS `BU_LOCATION`,`bus`.`BU_CONTACT` AS `BU_CONTACT`,concat(`ar`.`AR_FNAME`,' ',coalesce(`ar`.`AR_MNAME`,' '),' ',coalesce(`ar`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`ar`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`bn`.`BN_NAME` AS `BN_NAME`,`bn`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`ot`.`OT_NAME` AS `OT_NAME`,`ot`.`OT_CODE` AS `OT_CODE`,`ap`.`AP_TYPE` AS `AP_TYPE`,`ap`.`AP_DATE` AS `AP_DATE`,`atc`.`AT_UNIFIED_FILE_NAME` AS `AT_UNIFIED_FILE_NAME`,`ap`.`AP_ID` AS `AP_ID`,`ap`.`AP_STATUS` AS `AP_STATUS`,`ap`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`ap`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM`,`atc`.`AT_ID` AS `AT_ID`,`atc`.`AT_BRGY_CLEARANCE` AS `AT_BRGY_CLEARANCE`,`atc`.`AT_DTI_REGISTRATION` AS `AT_DTI_REGISTRATION`,`atc`.`AT_SEC_REGISTRATION` AS `AT_SEC_REGISTRATION`,`atc`.`AT_TITLE_TO_PROPERTY` AS `AT_TITLE_TO_PROPERTY`,`atc`.`AT_TAX_DECLARATION` AS `AT_TAX_DECLARATION`,`atc`.`AT_CONTRACT_OF_LEASE` AS `AT_CONTRACT_OF_LEASE`,`atc`.`AT_LESSORS_BP` AS `AT_LESSORS_BP`,`atc`.`AT_AUTHORIZATION` AS `AT_AUTHORIZATION`,`atc`.`AT_LOCATIONAL_CLR` AS `AT_LOCATIONAL_CLR`,`atc`.`AT_SANITARY_HEALTH_CERT` AS `AT_SANITARY_HEALTH_CERT`,`atc`.`AT_BUILDING_PERMIT` AS `AT_BUILDING_PERMIT`,`atc`.`AT_POLLUTION_CLR` AS `AT_POLLUTION_CLR`,`atc`.`AT_MECHANICAL_PERMIT` AS `AT_MECHANICAL_PERMIT`,`atc`.`AT_ELECTRICAL_INSP` AS `AT_ELECTRICAL_INSP`,`atc`.`AT_POLICE_CLEARANCE` AS `AT_POLICE_CLEARANCE`,`atc`.`AT_CTAO_CLEARANCE_CERT` AS `AT_CTAO_CLEARANCE_CERT`,`atc`.`AT_FSIC` AS `AT_FSIC`,`atc`.`AT_PREV_BP` AS `AT_PREV_BP`,`atc`.`AT_TAX_BILL` AS `AT_TAX_BILL`,`atc`.`AT_OFFICIAL_RECEIPT` AS `AT_OFFICIAL_RECEIPT`,`atc`.`AT_PCAB_LICENSE` AS `AT_PCAB_LICENSE`,`atc`.`AT_MISC_DOCUMENTS` AS `AT_MISC_DOCUMENTS`,`atc`.`AP_Remarks` AS `AP_Remarks` from ((((((((`bpls_t_business` `bus` join `bpls_r_business_nature` `bn` on((`bn`.`BN_ID` = `bus`.`BN_ID`))) join `bpls_r_ownership_type` `ot` on((`ot`.`OT_CODE` = `bus`.`OT_CODE`))) join `bpls_t_bp_application` `ap` on((`ap`.`BU_ID` = `bus`.`BU_ID`))) join `bpls_t_taxpayer` `tp` on((`tp`.`TP_ID` = `bus`.`TP_ID`))) join `bpls_r_bu_ar` `buxar` on((`buxar`.`BU_ID` = `bus`.`BU_ID`))) join `bpls_t_authorize_rep` `ar` on((`ar`.`AR_ID` = `buxar`.`AR_ID`))) join `bpls_t_attachments` `atc` on((`atc`.`AP_ID` = `ap`.`AP_ID`))) join `bpls_r_division` `divs` on((`divs`.`DIV_CODE` = `ap`.`AP_DIV_CODE_TO`))) where ((`ap`.`AP_DIV_CODE_TO` = 'DIV-EV') and ((`ap`.`AP_STATUS` = 'Pending') or (`ap`.`AP_STATUS` = 'Assess'))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsip`
--
DROP TABLE IF EXISTS `view_applicationformsip`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsip`  AS  select `ap`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`bus`.`BU_NAME` AS `BU_NAME`,`bus`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`tp`.`TP_FNAME`,' ',coalesce(`tp`.`TP_MNAME`,' '),' ',coalesce(`tp`.`TP_LNAME`,' ')) AS `TAX_PAYERNAME`,`bus`.`BU_LOCATION` AS `BU_LOCATION`,`bus`.`BU_CONTACT` AS `BU_CONTACT`,concat(`ar`.`AR_FNAME`,' ',coalesce(`ar`.`AR_MNAME`,' '),' ',coalesce(`ar`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`ar`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`bn`.`BN_NAME` AS `BN_NAME`,`bn`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`ot`.`OT_NAME` AS `OT_NAME`,`ot`.`OT_CODE` AS `OT_CODE`,`ap`.`AP_TYPE` AS `AP_TYPE`,`ap`.`AP_DATE` AS `AP_DATE`,`ap`.`AP_ID` AS `AP_ID`,`ap`.`AP_STATUS` AS `AP_STATUS`,`ap`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`ap`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM` from (((((((`bpls_t_business` `bus` join `bpls_r_business_nature` `bn` on((`bn`.`BN_ID` = `bus`.`BN_ID`))) join `bpls_r_ownership_type` `ot` on((`ot`.`OT_CODE` = `bus`.`OT_CODE`))) join `bpls_t_bp_application` `ap` on((`ap`.`BU_ID` = `bus`.`BU_ID`))) join `bpls_t_taxpayer` `tp` on((`tp`.`TP_ID` = `bus`.`TP_ID`))) join `bpls_r_bu_ar` `buxar` on((`buxar`.`BU_ID` = `bus`.`BU_ID`))) join `bpls_t_authorize_rep` `ar` on((`ar`.`AR_ID` = `buxar`.`AR_ID`))) join `bpls_r_division` `divs` on((`divs`.`DIV_CODE` = `ap`.`AP_DIV_CODE_TO`))) where (`ap`.`AP_DIV_CODE_TO` = 'DIV-INS') ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsiv`
--
DROP TABLE IF EXISTS `view_applicationformsiv`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsiv`  AS  select `ap`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`bus`.`BU_NAME` AS `BU_NAME`,`bus`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`tp`.`TP_FNAME`,' ',coalesce(`tp`.`TP_MNAME`,' '),' ',coalesce(`tp`.`TP_LNAME`,' ')) AS `TAX_PAYERNAME`,`bus`.`BU_LOCATION` AS `BU_LOCATION`,`bus`.`BU_CONTACT` AS `BU_CONTACT`,concat(`ar`.`AR_FNAME`,' ',coalesce(`ar`.`AR_MNAME`,' '),' ',coalesce(`ar`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`ar`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`bn`.`BN_NAME` AS `BN_NAME`,`bn`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`ot`.`OT_NAME` AS `OT_NAME`,`ot`.`OT_CODE` AS `OT_CODE`,`ap`.`AP_TYPE` AS `AP_TYPE`,`ap`.`AP_DATE` AS `AP_DATE`,`ap`.`AP_ID` AS `AP_ID`,`ap`.`AP_STATUS` AS `AP_STATUS`,`ap`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`ap`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM`,`ins`.`ZONING_INS` AS `ZONING_INS`,`ins`.`FIRE_INS` AS `FIRE_INS`,`ins`.`HEALTH_SANITATION_INS` AS `HEALTH_SANITATION_INS`,`ins`.`BUILDING_INS` AS `BUILDING_INS`,`ins`.`LABOR_INS` AS `LABOR_INS`,`ins`.`MISC_INS` AS `MISC_INS`,`ins`.`INS_REMARKS` AS `INS_REMARKS` from ((((((((`bpls_t_business` `bus` join `bpls_r_business_nature` `bn` on((`bn`.`BN_ID` = `bus`.`BN_ID`))) join `bpls_r_ownership_type` `ot` on((`ot`.`OT_CODE` = `bus`.`OT_CODE`))) join `bpls_t_bp_application` `ap` on((`ap`.`BU_ID` = `bus`.`BU_ID`))) join `bpls_t_taxpayer` `tp` on((`tp`.`TP_ID` = `bus`.`TP_ID`))) join `bpls_r_bu_ar` `buxar` on((`buxar`.`BU_ID` = `bus`.`BU_ID`))) join `bpls_t_authorize_rep` `ar` on((`ar`.`AR_ID` = `buxar`.`AR_ID`))) join `bpls_t_inspections` `ins` on((`ins`.`INS_AP_REFERENCE_NO` = `ap`.`AP_REFERENCE_NO`))) join `bpls_r_division` `divs` on((`divs`.`DIV_CODE` = `ap`.`AP_DIV_CODE_TO`))) where (`ap`.`AP_DIV_CODE_TO` = 'DIV-INV') ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsrel`
--
DROP TABLE IF EXISTS `view_applicationformsrel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsrel`  AS  select `bpa`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`bu`.`BU_NAME` AS `BU_NAME`,`nt`.`BN_NAME` AS `BN_NAME`,concat(`tx`.`TP_FNAME`,' ',`tx`.`TP_MNAME`,' ',`tx`.`TP_LNAME`) AS `TP_NAME`,`tx`.`TP_HOME_ADDRESS` AS `TP_HOME_ADDRESS`,`t`.`TB_ID` AS `TB_ID`,`t`.`TB_DATE_BILLED` AS `TB_DATE_BILLED`,concat(`emp`.`EP_FNAME`,' ',`emp`.`EP_MNAME`,' ',`emp`.`EP_LNAME`) AS `EMP_NAME` from (((((`bpls_t_bp_application` `bpa` join `bpls_t_business` `bu` on((`bpa`.`BU_ID` = `bu`.`BU_ID`))) join `bpls_t_taxpayer` `tx` on((`bu`.`TP_ID` = `tx`.`TP_ID`))) join `bpls_t_taxbill` `t` on((`bpa`.`TB_ID` = `t`.`TB_ID`))) join `bpls_r_business_nature` `nt` on((`bu`.`BN_ID` = `nt`.`BN_ID`))) join `bpls_t_employee_profile` `emp` on((`t`.`ASSESSED_BY` = `emp`.`EP_ID`))) where (`bpa`.`AP_DIV_CODE_TO` = 'DIV-REL') ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformstre`
--
DROP TABLE IF EXISTS `view_applicationformstre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformstre`  AS  select `bpa`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`bu`.`BU_NAME` AS `BU_NAME`,`nt`.`BN_NAME` AS `BN_NAME`,concat(`tx`.`TP_FNAME`,' ',`tx`.`TP_MNAME`,' ',`tx`.`TP_LNAME`) AS `TP_NAME`,`tx`.`TP_HOME_ADDRESS` AS `TP_HOME_ADDRESS`,`t`.`TB_ID` AS `TB_ID`,`t`.`TB_DATE_BILLED` AS `TB_DATE_BILLED`,concat(`emp`.`EP_FNAME`,' ',`emp`.`EP_MNAME`,' ',`emp`.`EP_LNAME`) AS `EMP_NAME` from (((((`bpls_t_bp_application` `bpa` join `bpls_t_business` `bu` on((`bpa`.`BU_ID` = `bu`.`BU_ID`))) join `bpls_t_taxpayer` `tx` on((`bu`.`TP_ID` = `tx`.`TP_ID`))) join `bpls_t_taxbill` `t` on((`bpa`.`TB_ID` = `t`.`TB_ID`))) join `bpls_r_business_nature` `nt` on((`bu`.`BN_ID` = `nt`.`BN_ID`))) join `bpls_t_employee_profile` `emp` on((`t`.`ASSESSED_BY` = `emp`.`EP_ID`))) where (`bpa`.`AP_DIV_CODE_TO` = 'DIV-TRE') ;

-- --------------------------------------------------------

--
-- Structure for view `view_routeslip`
--
DROP TABLE IF EXISTS `view_routeslip`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_routeslip`  AS  select `bp`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`bp`.`AP_TYPE` AS `AP_TYPE`,`bp`.`AP_STATUS` AS `AP_STATUS`,`bp`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`bp`.`AP_DATE_ACCESSED` AS `AP_DATE_ACCESSED`,`bp`.`AP_REMARKS` AS `AP_REMARKS`,`bu`.`BU_NAME` AS `BU_NAME`,`bu`.`BU_PRESIDENT` AS `BU_PRESIDENT`,`bu`.`BU_LOCATION` AS `BU_LOCATION`,`bu`.`BU_CONTACT` AS `BU_CONTACT`,`t`.`TP_FNAME` AS `TP_FNAME`,`t`.`TP_MNAME` AS `TP_MNAME`,`t`.`TP_LNAME` AS `TP_LNAME`,`t`.`TP_HOME_ADDRESS` AS `TP_HOME_ADDRESS`,`bn`.`BN_NAME` AS `BN_NAME`,`bn`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`dv`.`DIV_NAME` AS `DIV_NAME` from ((((`bpls_t_bp_application` `bp` join `bpls_t_business` `bu` on((`bp`.`BU_ID` = `bu`.`BU_ID`))) join `bpls_r_business_nature` `bn` on((`bu`.`BN_ID` = `bn`.`BN_ID`))) join `bpls_t_taxpayer` `t` on((`bu`.`TP_ID` = `t`.`TP_ID`))) join `bpls_r_division` `dv` on((`bp`.`AP_DIV_CODE_TO` = `dv`.`DIV_CODE`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_terminatedap`
--
DROP TABLE IF EXISTS `view_terminatedap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_terminatedap`  AS  select `bus`.`BU_NAME` AS `BU_NAME`,`bp`.`AP_DATE_ACCESSED` AS `AP_DATE_ACCESSED`,`bp`.`AP_REMARKS` AS `AP_REMARKS`,`bp`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO` from (`bpls_t_bp_application` `bp` join `bpls_t_business` `bus` on((`bus`.`BU_ID` = `bp`.`BU_ID`))) where (`bp`.`AP_STATUS` = 'Terminated') ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bpls_r_bu_ar`
--
ALTER TABLE `bpls_r_bu_ar`
  ADD CONSTRAINT `bu_ar_fk_ar` FOREIGN KEY (`AR_ID`) REFERENCES `bpls_t_authorize_rep` (`AR_ID`),
  ADD CONSTRAINT `bu_ar_fk_bu` FOREIGN KEY (`BU_ID`) REFERENCES `bpls_t_business` (`BU_ID`);

--
-- Constraints for table `bpls_r_ot_bn_req`
--
ALTER TABLE `bpls_r_ot_bn_req`
  ADD CONSTRAINT `ot_bn_req_fk_bn` FOREIGN KEY (`BN_ID`) REFERENCES `bpls_r_business_nature` (`BN_ID`),
  ADD CONSTRAINT `ot_bn_req_fk_ot` FOREIGN KEY (`OT_ID`) REFERENCES `bpls_r_ownership_type` (`OT_ID`),
  ADD CONSTRAINT `ot_bn_req_fk_rt` FOREIGN KEY (`RT_ID`) REFERENCES `bpls_r_req_type` (`RT_ID`);

--
-- Constraints for table `bpls_t_attachments`
--
ALTER TABLE `bpls_t_attachments`
  ADD CONSTRAINT `attachments_fk_ap` FOREIGN KEY (`AP_ID`) REFERENCES `bpls_t_bp_application` (`AP_ID`),
  ADD CONSTRAINT `attachments_fk_rt` FOREIGN KEY (`REQ_GRP_ID`) REFERENCES `bpls_r_req_type` (`RT_ID`);

--
-- Constraints for table `bpls_t_bp_application`
--
ALTER TABLE `bpls_t_bp_application`
  ADD CONSTRAINT `application_fk_bu` FOREIGN KEY (`BU_ID`) REFERENCES `bpls_t_business` (`BU_ID`),
  ADD CONSTRAINT `application_fk_divfro` FOREIGN KEY (`AP_DIV_CODE_FROM`) REFERENCES `bpls_r_division` (`DIV_CODE`),
  ADD CONSTRAINT `application_fk_divto` FOREIGN KEY (`AP_DIV_CODE_TO`) REFERENCES `bpls_r_division` (`DIV_CODE`),
  ADD CONSTRAINT `application_fk_tb` FOREIGN KEY (`TB_ID`) REFERENCES `bpls_t_taxbill` (`TB_ID`),
  ADD CONSTRAINT `application_fk_u` FOREIGN KEY (`U_ID`) REFERENCES `bpls_t_user` (`U_ID`);

--
-- Constraints for table `bpls_t_business`
--
ALTER TABLE `bpls_t_business`
  ADD CONSTRAINT `business_fk_bn` FOREIGN KEY (`BN_ID`) REFERENCES `bpls_r_business_nature` (`BN_ID`),
  ADD CONSTRAINT `business_fk_otcode` FOREIGN KEY (`OT_CODE`) REFERENCES `bpls_r_ownership_type` (`OT_CODE`),
  ADD CONSTRAINT `business_fk_rent` FOREIGN KEY (`RENT_ID`) REFERENCES `bpls_t_is_rented` (`RENT_ID`),
  ADD CONSTRAINT `business_fk_tp` FOREIGN KEY (`TP_ID`) REFERENCES `bpls_t_taxpayer` (`TP_ID`);

--
-- Constraints for table `bpls_t_business_permit`
--
ALTER TABLE `bpls_t_business_permit`
  ADD CONSTRAINT `buspermit_fk_ap` FOREIGN KEY (`AP_ID`) REFERENCES `bpls_t_bp_application` (`AP_ID`),
  ADD CONSTRAINT `buspermit_fk_bu` FOREIGN KEY (`BU_ID`) REFERENCES `bpls_t_business` (`BU_ID`);

--
-- Constraints for table `bpls_t_employee_profile`
--
ALTER TABLE `bpls_t_employee_profile`
  ADD CONSTRAINT `employee_fk_div` FOREIGN KEY (`DIV_ID`) REFERENCES `bpls_r_division` (`DIV_ID`);

--
-- Constraints for table `bpls_t_fl_tb`
--
ALTER TABLE `bpls_t_fl_tb`
  ADD CONSTRAINT `fl_tb_fk_fl` FOREIGN KEY (`FL_ID`) REFERENCES `bpls_r_fee_list` (`FL_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fl_tb_fk_tb` FOREIGN KEY (`TB_ID`) REFERENCES `bpls_t_taxbill` (`TB_ID`) ON DELETE CASCADE;

--
-- Constraints for table `bpls_t_inspections`
--
ALTER TABLE `bpls_t_inspections`
  ADD CONSTRAINT `insp_fk_refno` FOREIGN KEY (`INS_AP_REFERENCE_NO`) REFERENCES `bpls_t_bp_application` (`AP_REFERENCE_NO`);

--
-- Constraints for table `bpls_t_official_receipt`
--
ALTER TABLE `bpls_t_official_receipt`
  ADD CONSTRAINT `official_receipt_fk_tb` FOREIGN KEY (`TB_ID`) REFERENCES `bpls_t_taxbill` (`TB_ID`);

--
-- Constraints for table `bpls_t_taxbill`
--
ALTER TABLE `bpls_t_taxbill`
  ADD CONSTRAINT `taxbill_fk_approved_by` FOREIGN KEY (`APPROVED_BY`) REFERENCES `bpls_t_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `taxbill_fk_assessed_by` FOREIGN KEY (`ASSESSED_BY`) REFERENCES `bpls_t_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `taxbill_fk_rec_approval` FOREIGN KEY (`REC_APPROVAL_BY`) REFERENCES `bpls_t_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `taxbill_fk_verified_by` FOREIGN KEY (`VERIFIED_BY`) REFERENCES `bpls_t_employee_profile` (`EP_ID`);

--
-- Constraints for table `bpls_t_user`
--
ALTER TABLE `bpls_t_user`
  ADD CONSTRAINT `user_fk_divcode` FOREIGN KEY (`U_ROLE`) REFERENCES `bpls_r_division` (`DIV_CODE`),
  ADD CONSTRAINT `user_fk_ep` FOREIGN KEY (`EP_ID`) REFERENCES `bpls_t_employee_profile` (`EP_ID`);

--
-- Constraints for table `oc_r_employee`
--
ALTER TABLE `oc_r_employee`
  ADD CONSTRAINT `ep_fk_ur` FOREIGN KEY (`UR_ID`) REFERENCES `oc_r_user_roles` (`UR_ID`);

--
-- Constraints for table `oc_r_requirements`
--
ALTER TABLE `oc_r_requirements`
  ADD CONSTRAINT `req_fk_ep` FOREIGN KEY (`EP_ID`) REFERENCES `oc_r_employee` (`EP_ID`),
  ADD CONSTRAINT `req_fk_oaf` FOREIGN KEY (`OAF_ID`) REFERENCES `oc_t_application_frm` (`OAF_ID`);

--
-- Constraints for table `oc_t_application_frm`
--
ALTER TABLE `oc_t_application_frm`
  ADD CONSTRAINT `oaf_fk_ap` FOREIGN KEY (`AP_ID`) REFERENCES `oc_t_applicant` (`OA_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `oaf_fk_jd` FOREIGN KEY (`JD_ID`) REFERENCES `oc_r_job_desc` (`JD_ID`) ON DELETE CASCADE;

--
-- Constraints for table `oc_t_occupational_permit`
--
ALTER TABLE `oc_t_occupational_permit`
  ADD CONSTRAINT `ocp_fk_ep` FOREIGN KEY (`EP_ID`) REFERENCES `oc_r_employee` (`EP_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `ocp_fk_oaf` FOREIGN KEY (`OAF_ID`) REFERENCES `oc_t_application_frm` (`OAF_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `ocp_fk_or` FOREIGN KEY (`OR_ID`) REFERENCES `oc_t_official_receipt` (`OR_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `ocp_fk_req` FOREIGN KEY (`REQ_ID`) REFERENCES `oc_r_requirements` (`REQ_ID`) ON DELETE CASCADE;

--
-- Constraints for table `oc_t_official_receipt`
--
ALTER TABLE `oc_t_official_receipt`
  ADD CONSTRAINT `or_fk_ep` FOREIGN KEY (`EP_ID`) REFERENCES `oc_r_employee` (`EP_ID`),
  ADD CONSTRAINT `or_fk_op` FOREIGN KEY (`OP_ID`) REFERENCES `oc_t_order_pymnt` (`OP_ID`);

--
-- Constraints for table `oc_t_order_pymnt`
--
ALTER TABLE `oc_t_order_pymnt`
  ADD CONSTRAINT `op_fk_oaf` FOREIGN KEY (`OAF_ID`) REFERENCES `oc_t_application_frm` (`OAF_ID`);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table bpls_r_business_nature
--

--
-- Metadata for table bpls_r_bu_ar
--

--
-- Metadata for table bpls_r_division
--

--
-- Metadata for table bpls_r_fee_list
--

--
-- Metadata for table bpls_r_ot_bn_req
--

--
-- Metadata for table bpls_r_ownership_type
--

--
-- Metadata for table bpls_r_req_type
--

--
-- Metadata for table bpls_t_attachments
--

--
-- Metadata for table bpls_t_authorize_rep
--

--
-- Metadata for table bpls_t_bp_application
--

--
-- Metadata for table bpls_t_business
--

--
-- Metadata for table bpls_t_business_permit
--

--
-- Metadata for table bpls_t_employee_profile
--

--
-- Metadata for table bpls_t_fl_tb
--

--
-- Metadata for table bpls_t_inspections
--

--
-- Metadata for table bpls_t_is_rented
--

--
-- Metadata for table bpls_t_official_receipt
--

--
-- Metadata for table bpls_t_taxbill
--

--
-- Metadata for table bpls_t_taxpayer
--

--
-- Metadata for table bpls_t_user
--

--
-- Metadata for table oc_r_employee
--

--
-- Metadata for table oc_r_job_desc
--

--
-- Metadata for table oc_r_requirements
--

--
-- Metadata for table oc_r_user_roles
--

--
-- Metadata for table oc_t_applicant
--

--
-- Metadata for table oc_t_application_frm
--

--
-- Metadata for table oc_t_occupational_permit
--

--
-- Metadata for table oc_t_official_receipt
--

--
-- Metadata for table oc_t_order_pymnt
--

--
-- Metadata for table view_applicationformsev
--

--
-- Metadata for table view_applicationformsip
--

--
-- Metadata for table view_applicationformsiv
--

--
-- Metadata for table view_applicationformsrel
--

--
-- Metadata for table view_applicationformstre
--

--
-- Metadata for table view_routeslip
--

--
-- Metadata for table view_terminatedap
--

--
-- Metadata for database lgu_paeis_db
--

DELIMITER $$
--
-- Events
--
DROP EVENT `reinspectionduration`$$
CREATE DEFINER=`root`@`localhost` EVENT `reinspectionduration` ON SCHEDULE EVERY 2 MINUTE STARTS '2018-10-10 04:53:35' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE bpls_t_bp_application
            SET AP_DIV_CODE_TO = 'DIV-INS'
            WHERE DATEDIFF(AP_DATE_RE_INS, CURRENT_TIMESTAMP) < 1$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
