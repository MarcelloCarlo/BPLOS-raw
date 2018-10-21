-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 20, 2018 at 10:52 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

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
-- Table structure for table `mtops_r_fee_list`
--
-- Creation: Oct 11, 2018 at 12:55 PM
--

DROP TABLE IF EXISTS `mtops_r_fee_list`;
CREATE TABLE IF NOT EXISTS `mtops_r_fee_list` (
  `FL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FL_NAME` varchar(100) NOT NULL,
  `FL_AMOUNT` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`FL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_r_fee_list`:
--

--
-- Dumping data for table `mtops_r_fee_list`
--

INSERT INTO `mtops_r_fee_list` (`FL_ID`, `FL_NAME`, `FL_AMOUNT`) VALUES
(1, 'Filing Fee', '50.00'),
(2, 'Inspection Fee', '20.00'),
(3, 'Provisional Permit Fee', '75.00'),
(4, 'Franchise Fee', '3000.00'),
(5, 'Fare Adjustment Fee', '20.00'),
(6, 'Filing Fee or MTOP Amendment', '50.00'),
(7, 'Filing Fee for opposition and/or petitions', '50.00'),
(8, 'Regulatory Fee', '100.00'),
(9, 'Fire Insp Fee', '300.00');

-- --------------------------------------------------------

--
-- Table structure for table `mtops_r_req_type`
--
-- Creation: Oct 11, 2018 at 12:55 PM
--

DROP TABLE IF EXISTS `mtops_r_req_type`;
CREATE TABLE IF NOT EXISTS `mtops_r_req_type` (
  `RT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RT_NAME` varchar(50) NOT NULL,
  `RT_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`RT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_r_req_type`:
--

--
-- Dumping data for table `mtops_r_req_type`
--

INSERT INTO `mtops_r_req_type` (`RT_ID`, `RT_NAME`, `RT_DESC`) VALUES
(1, 'Community Tax Certificate', 'Community Tax Certificate'),
(2, 'Certificate of Registration from LTO (original and photocopy)', 'Certificate of Registration from LTO (original and photocopy)'),
(3, 'Proof of Purchase or Official Receipt of Purchased Tricycle Unit (original and photocopy)', 'Proof of Purchase or Official Receipt of Purchased Tricycle Unit (original and photocopy)'),
(4, 'Barangay Clearance that indicates Residency', 'Barangay Clearance that indicates Residency'),
(5, 'Certificate or letter of reference from TODA
Photocopy copy of driver’s licence', 'Certificate or letter of reference from TODA
Photocopy copy of driver’s licence'),
(6, 'Two (2) copies of 2×2 colored ID picture', 'Two (2) copies of 2×2 colored ID picture');

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_ap_history`
--
-- Creation: Oct 12, 2018 at 01:01 AM
--

DROP TABLE IF EXISTS `mtops_t_ap_history`;
CREATE TABLE IF NOT EXISTS `mtops_t_ap_history` (
  `TL_HIST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TL_AP_NO` varchar(20) NOT NULL,
  `TL_DIV_CODE` varchar(10) NOT NULL,
  `TL_DIV_NAME` varchar(50) NOT NULL,
  `TL_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TL_REMARKS` text,
  PRIMARY KEY (`TL_HIST_ID`),
  KEY `TL_AP_NO` (`TL_AP_NO`),
  KEY `TL_DIV_CODE` (`TL_DIV_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_ap_history`:
--   `TL_AP_NO`
--       `mtops_t_bp_application` -> `AP_REFERENCE_NO`
--   `TL_DIV_CODE`
--       `mtops_r_division` -> `DIV_CODE`
--

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_attachments`
--
-- Creation: Oct 11, 2018 at 12:56 PM
--

DROP TABLE IF EXISTS `mtops_t_attachments`;
CREATE TABLE IF NOT EXISTS `mtops_t_attachments` (
  `AT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AT_UNIFIED_FILE` longblob NOT NULL,
  `AT_UNIFIED_FILE_NAME` text NOT NULL,
  `AT_COMM_TAX_CERT` enum('Pass','Fail') DEFAULT NULL,
  `AT_LTO_REG_CERT` enum('Pass','Fail') DEFAULT NULL,
  `AT_TRICUNIT_PURCH` enum('Pass','Fail') DEFAULT NULL,
  `AT_BRGY_CLEAR` enum('Pass','Fail') DEFAULT NULL,
  `AT_TODA_LTR_CERT` enum('Pass','Fail') DEFAULT NULL,
  `AT_ID_PIC` enum('Pass','Fail') DEFAULT NULL,
  `AP_Remarks` text,
  `AP_ID` int(11) DEFAULT NULL,
  `REQ_GRP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AT_ID`),
  KEY `attachments_fk_ap` (`AP_ID`) USING BTREE,
  KEY `attachments_fk_rt` (`REQ_GRP_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_attachments`:
--   `AP_ID`
--       `mtops_t_bp_application` -> `AP_ID`
--   `REQ_GRP_ID`
--       `mtops_r_req_type` -> `RT_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_authorize_rep`
--
-- Creation: Oct 11, 2018 at 12:55 PM
--

DROP TABLE IF EXISTS `mtops_t_authorize_rep`;
CREATE TABLE IF NOT EXISTS `mtops_t_authorize_rep` (
  `AR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AR_FNAME` varchar(50) NOT NULL,
  `AR_MNAME` varchar(50) DEFAULT NULL,
  `AR_LNAME` varchar(50) DEFAULT NULL,
  `AR_SEX` varchar(50) DEFAULT NULL,
  `AR_HOME_ADDRESS` varchar(300) NOT NULL,
  `AR_BIRTHDATE` date NOT NULL,
  `AR_EMAIL` varchar(300) NOT NULL,
  `AR_PHONE NUMBER` varchar(300) NOT NULL,
  PRIMARY KEY (`AR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_authorize_rep`:
--

--
-- Dumping data for table `mtops_t_authorize_rep`
--

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_bp_application`
--
-- Creation: Oct 11, 2018 at 12:56 PM
--

DROP TABLE IF EXISTS `mtops_t_bp_application`;
CREATE TABLE IF NOT EXISTS `mtops_t_bp_application` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_bp_application`:
--   `BU_ID`
--       `mtops_t_registration` -> `BU_ID`
--   `AP_DIV_CODE_FROM`
--       `mtops_r_division` -> `DIV_CODE`
--   `AP_DIV_CODE_TO`
--       `mtops_r_division` -> `DIV_CODE`
--   `TB_ID`
--       `mtops_t_taxbill` -> `TB_ID`
--   `U_ID`
--       `mtops_t_user` -> `U_ID`
--

--
-- Dumping data for table `mtops_t_bp_application`
--

INSERT INTO `mtops_t_bp_application` (`AP_ID`, `AP_REFERENCE_NO`, `AP_DATE`, `AP_TYPE`, `AP_STATUS`, `AP_DIV_CODE_TO`, `AP_DIV_CODE_FROM`, `AP_DATE_ACCESSED`, `AP_DATE_RE_INS`, `AP_RE_INS_DEAD`, `AP_REMARKS`, `BU_ID`, `TB_ID`, `U_ID`) VALUES
(1, '111-181011', '2018-10-11', 'New', 'Success', 'END', 'DIV-REL', '2018-10-13', NULL, NULL, 'OK', 1, 1, 1),
(2, '233-181012', '2018-10-12', 'New', 'Terminated', 'DIV-EV', NULL, '2018-10-12', NULL, NULL, 'Duplicate', 2, NULL, NULL),
(3, '344-181012', '2018-10-12', 'New', 'Success', 'END', 'DIV-REL', '2018-10-13', NULL, NULL, 'DONE', 3, 2, 1),
(4, '455-181012', '2018-10-12', 'New', 'Success', 'END', 'DIV-REL', '2018-10-13', NULL, NULL, 'DONE', 4, 3, 1),
(5, '566-181012', '2018-10-12', 'Renew', 'Pending', 'DIV-EV', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(6, '699-181013', '2018-10-13', 'Renew', 'Pending', 'DIV-EV', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(7, '71010-181013', '2018-10-13', 'New', 'Assess', 'DIV-TRE', 'DIV-EV', '2018-10-13', NULL, NULL, 'Building Concerns', 7, 4, NULL),
(8, '81111-181013', '2018-10-13', 'New', 'Assess', 'DIV-AS', 'DIV-INV', '2018-10-18', NULL, NULL, 'DONE', 8, NULL, NULL),
(9, '91212-181021', '2018-10-21', 'New', 'Pending', 'DIV-EV', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_registration`
--
-- Creation: Oct 14, 2018 at 12:10 PM
--

DROP TABLE IF EXISTS `mtops_t_registration`;
CREATE TABLE IF NOT EXISTS `mtops_t_registration` (
  `BU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BU_NAME` varchar(200) NOT NULL,
  `BU_PRESIDENT` varchar(100) DEFAULT NULL,
  `BU_LOCATION` varchar(300) NOT NULL,
  `BU_PROPERTY_INDEX_NO` varchar(35) NOT NULL,
  `BU_LOT_BLOCK_NO` varchar(35) NOT NULL,
  `BU_FAX_NO` char(11) DEFAULT NULL,
  `BU_CONTACT` char(11) NOT NULL,
  `SB_AREA` float DEFAULT NULL,
  `DTI_REG_NO` varchar(20) DEFAULT NULL,
  `DTI_DATE` date DEFAULT NULL,
  `SEC_REG_NO` varchar(20) DEFAULT NULL,
  `SEC_DATE` date DEFAULT NULL,
  `BU_EMP_NO` int(5) DEFAULT NULL,
  `BU_UNIT_NO` float NOT NULL,
  `BU_AREA` float DEFAULT NULL,
  `BU_CAPITALIZATION` float DEFAULT NULL,
  `BU_CLASSIFICATION` enum('L','S') DEFAULT NULL,
  `BN_ID` int(11) DEFAULT NULL,
  `AP_ID` int(11) DEFAULT NULL,
  `OT_CODE` varchar(10) DEFAULT NULL,
  `RENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BU_ID`),
  KEY `registration_fk_bn` (`BN_ID`) USING BTREE,
  KEY `registration_fk_tp` (`AP_ID`) USING BTREE,
  KEY `registration_fk_otcode` (`OT_CODE`) USING BTREE,
  KEY `registration_fk_rent` (`RENT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_registration`:
--   `BN_ID`
--       `mtops_r_registration_nature` -> `BN_ID`
--   `OT_CODE`
--       `mtops_r_ownership_type` -> `OT_CODE`
--   `RENT_ID`
--       `mtops_t_is_rented` -> `RENT_ID`
--   `AP_ID`
--       `mtops_t_applicant` -> `AP_ID`
--

--
-- Dumping data for table `mtops_t_registration`
--

INSERT INTO `mtops_t_registration` (`BU_ID`, `BU_NAME`, `BU_PRESIDENT`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_FAX_NO`, `BU_CONTACT`, `SB_AREA`, `DTI_REG_NO`, `DTI_DATE`, `SEC_REG_NO`, `SEC_DATE`, `BU_EMP_NO`, `BU_UNIT_NO`, `BU_AREA`, `BU_CAPITALIZATION`, `BU_CLASSIFICATION`, `BN_ID`, `AP_ID`, `OT_CODE`, `RENT_ID`) VALUES
(1, 'VR Transpo', NULL, '(Office) 2nd Floor, RR Buildings 234 Ilang Ilang St. Bagumbayan', '57543522', '57544', '472211', '754522', 34.22, '75324721', '2018-01-29', NULL, NULL, 24, 3444, 4344, 342555, NULL, 62, 1, 'OT-SIN', 1),
(2, 'Teatro Pilipino', NULL, '463 344 Malaya St. Tandang Sora', '54455545421', '45452111', '45452121', '454512122', 47.8, '8764564152', '2018-07-29', NULL, NULL, 24, 12, 53, 45533, NULL, 36, 3, 'OT-SIN', 3),
(3, 'Teatro Pilipino', NULL, '463 344 Malaya St. Tandang Sora', '54455545421', '45452111', '45452121', '454512122', 47.8, '8764564152', '2018-07-29', NULL, NULL, 24, 12, 53, 45533, NULL, 36, 4, 'OT-SIN', 4),
(4, 'Aspen Warehousing', NULL, 'Block 675 342 Selena St. Tandang Sora', '75412685425437', '421 125', '985522', '965526', 34.24, '59841267', '2018-09-30', NULL, NULL, 23, 23, 45, 45533, NULL, 55, 5, 'OT-SIN', 5),
(5, 'North West Dormitory', NULL, '#553 556 Lansones St. Mapalad', '75451522554', '4545 1212', '97855222', '9666204', 23.56, '98741256512', '2018-08-26', NULL, NULL, 25, 25, 34.7, 65544, NULL, 35, 6, 'OT-SIN', 6),
(6, 'Ligaya\'s Carenderia', NULL, 'Block 34 #45 Ilang-Ilang Tandang Sora', '54521210', '54521121', '485222', '4562888', 34.24, '75542', '2018-07-29', NULL, NULL, 13, 43.34, 23, 24000, NULL, 4, 9, 'OT-SIN', 9),
(7, 'Woodblock Assembly', NULL, 'Blk 346 74 Solana St. Bagumbayan', '874556122', '3512333', '6654233', '966551', 23.9, '87544542', '2018-07-29', NULL, NULL, 13, 12, 50, 700000, NULL, 51, 10, 'OT-SIN', 10),
(8, 'Li\'s Warehousing', NULL, 'Bl 86 510 Cecilia St. Tandang Sora', '65412795842351', '895 Bl 344', '9547123', '962254', 25, '12486275', '2018-09-30', NULL, NULL, 35, 12, 23, 70600, NULL, 55, 11, 'OT-SIN', 11),
(9, 'Tina\'s Carenderia', NULL, 'Luxy Bldg 684 Rizal St. Commonwealth', '89076453', '489567390', '5334564563', '54634564', 13, '657347733', '2018-08-26', NULL, NULL, 12, 455, 45, 4533, NULL, 4, 12, 'OT-SIN', 12);

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_registration_permit`
--
-- Creation: Oct 11, 2018 at 12:56 PM
--

DROP TABLE IF EXISTS `mtops_t_registration_permit`;
CREATE TABLE IF NOT EXISTS `mtops_t_registration_permit` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_registration_permit`:
--   `AP_ID`
--       `mtops_t_bp_application` -> `AP_ID`
--   `BU_ID`
--       `mtops_t_registration` -> `BU_ID`
--

--
-- Dumping data for table `mtops_t_registration_permit`
--

INSERT INTO `mtops_t_registration_permit` (`BP_ID`, `BP_NUMBER`, `BP_ISSUED_DATE`, `BP_VALID_YEARS`, `BP_REMARKS`, `BU_ID`, `AP_ID`) VALUES
(3, '1-20181013', '2018-10-13', '2019-10-13', 'OK', 1, 1),
(4, '2-20181013', '2018-10-13', '2019-10-13', 'DONE', 3, 3),
(5, '3-20181013', '2018-10-13', '2019-10-13', 'DONE', 4, 4);

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_fl_tb`
--
-- Creation: Oct 11, 2018 at 12:56 PM
--

DROP TABLE IF EXISTS `mtops_t_fl_tb`;
CREATE TABLE IF NOT EXISTS `mtops_t_fl_tb` (
  `TB_ID` int(11) NOT NULL,
  `FL_ID` int(11) NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL,
  KEY `fl_tb_fk_fl` (`FL_ID`) USING BTREE,
  KEY `fl_tb_fk_tb` (`TB_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_fl_tb`:
--   `FL_ID`
--       `mtops_r_fee_list` -> `FL_ID`
--   `TB_ID`
--       `mtops_t_taxbill` -> `TB_ID`
--

--
-- Dumping data for table `mtops_t_fl_tb`
--

INSERT INTO `mtops_t_fl_tb` (`TB_ID`, `FL_ID`, `AMOUNT`) VALUES
(1, 1, '100.00'),
(1, 2, '10000.00'),
(1, 3, '260.00'),
(1, 4, '450.00'),
(1, 5, '50.00'),
(1, 6, '20.00'),
(1, 7, '7.00'),
(1, 8, '50.00'),
(1, 9, '300.00'),
(1, 10, '250.00'),
(1, 11, '545.00'),
(1, 12, '0.00'),
(1, 13, '1000.00'),
(1, 14, '100.00'),
(1, 15, '0.00'),
(1, 16, '0.00'),
(1, 17, '0.00'),
(1, 18, '0.00'),
(1, 19, '0.00'),
(1, 20, '0.00'),
(1, 21, '1690.00'),
(2, 1, '100.00'),
(2, 2, '10000.00'),
(2, 3, '260.00'),
(2, 4, '450.00'),
(2, 5, '50.00'),
(2, 6, '20.00'),
(2, 7, '7.00'),
(2, 8, '50.00'),
(2, 9, '300.00'),
(2, 10, '250.00'),
(2, 11, '545.00'),
(2, 12, '0.00'),
(2, 13, '1000.00'),
(2, 14, '100.00'),
(2, 15, '0.00'),
(2, 16, '0.00'),
(2, 17, '0.00'),
(2, 18, '0.00'),
(2, 19, '0.00'),
(2, 20, '0.00'),
(2, 21, '1690.00'),
(3, 1, '100.00'),
(3, 2, '10000.00'),
(3, 3, '260.00'),
(3, 4, '450.00'),
(3, 5, '50.00'),
(3, 6, '20.00'),
(3, 7, '7.00'),
(3, 8, '50.00'),
(3, 9, '300.00'),
(3, 10, '250.00'),
(3, 11, '545.00'),
(3, 12, '0.00'),
(3, 13, '1000.00'),
(3, 14, '100.00'),
(3, 15, '0.00'),
(3, 16, '0.00'),
(3, 17, '0.00'),
(3, 18, '0.00'),
(3, 19, '0.00'),
(3, 20, '0.00'),
(3, 21, '1690.00'),
(4, 1, '100.00'),
(4, 6, '20.00'),
(4, 12, '0.00'),
(4, 13, '1000.00'),
(4, 14, '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_inspections`
--
-- Creation: Oct 11, 2018 at 12:56 PM
--

DROP TABLE IF EXISTS `mtops_t_inspections`;
CREATE TABLE IF NOT EXISTS `mtops_t_inspections` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_inspections`:
--   `INS_AP_REFERENCE_NO`
--       `mtops_t_bp_application` -> `AP_REFERENCE_NO`
--

--
-- Dumping data for table `mtops_t_inspections`
--

INSERT INTO `mtops_t_inspections` (`INS_ID`, `INS_AP_REFERENCE_NO`, `ZONING_INS`, `FIRE_INS`, `HEALTH_SANITATION_INS`, `BUILDING_INS`, `LABOR_INS`, `MISC_INS`, `INS_REMARKS`) VALUES
(1, '111-181011', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', ''),
(2, '344-181012', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', ''),
(3, '455-181012', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Passed!'),
(4, '71010-181013', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Building Concerns'),
(5, '81111-181013', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'DONE');

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_official_receipt`
--
-- Creation: Oct 12, 2018 at 11:01 AM
--

DROP TABLE IF EXISTS `mtops_t_official_receipt`;
CREATE TABLE IF NOT EXISTS `mtops_t_official_receipt` (
  `OR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OR_DATE` date NOT NULL,
  `OR_PYMT_TYPE` enum('Cash','Treasury Warrant','Check','Money Order') NOT NULL,
  `OR_TW_CH_MO_NO` varchar(20) DEFAULT NULL,
  `OR_TOTAL_AMOUNT` decimal(10,2) DEFAULT NULL,
  `OR_TW_CH_MO_DATE` date DEFAULT NULL,
  `OIC_CITY_TREASURER` int(11) NOT NULL,
  `TB_ID` int(11) NOT NULL,
  PRIMARY KEY (`OR_ID`),
  KEY `official_receipt_fk_tb` (`TB_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_official_receipt`:
--   `TB_ID`
--       `mtops_t_taxbill` -> `TB_ID`
--

--
-- Dumping data for table `mtops_t_official_receipt`
--

INSERT INTO `mtops_t_official_receipt` (`OR_ID`, `OR_DATE`, `OR_PYMT_TYPE`, `OR_TW_CH_MO_NO`, `OR_TOTAL_AMOUNT`, `OR_TW_CH_MO_DATE`, `OIC_CITY_TREASURER`, `TB_ID`) VALUES
(1, '2018-10-12', 'Cash', 'CH-20181012', '14882.00', '2018-10-12', 1, 1),
(2, '2018-10-12', 'Cash', 'CH-20181012', '14882.00', '2018-10-12', 1, 2),
(3, '2018-10-13', 'Check', 'CK-20181013', '14822.00', '2018-10-13', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_taxbill`
--
-- Creation: Oct 11, 2018 at 12:56 PM
--

DROP TABLE IF EXISTS `mtops_t_taxbill`;
CREATE TABLE IF NOT EXISTS `mtops_t_taxbill` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_taxbill`:
--   `APPROVED_BY`
--       `mtops_t_employee_profile` -> `EP_ID`
--   `ASSESSED_BY`
--       `mtops_t_employee_profile` -> `EP_ID`
--   `REC_APPROVAL_BY`
--       `mtops_t_employee_profile` -> `EP_ID`
--   `VERIFIED_BY`
--       `mtops_t_employee_profile` -> `EP_ID`
--

--
-- Dumping data for table `mtops_t_taxbill`
--

INSERT INTO `mtops_t_taxbill` (`TB_ID`, `TB_BILL_NO`, `TB_DATE_BILLED`, `ASSESSED_BY`, `VERIFIED_BY`, `REC_APPROVAL_BY`, `APPROVED_BY`) VALUES
(1, '00111181011', '2018-10-12', 1, 1, 1, 1),
(2, '00344181012', '2018-10-12', 1, 1, 1, 1),
(3, '00455181012', '2018-10-13', 1, 1, 1, 1),
(4, '0071010181013', '2018-10-13', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_applicant`
--
-- Creation: Oct 11, 2018 at 12:55 PM
--

DROP TABLE IF EXISTS `mtops_t_applicant`;
CREATE TABLE IF NOT EXISTS `mtops_t_applicant` (
  `AP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AP_FNAME` varchar(50) NOT NULL,
  `AP_MNAME` varchar(50) DEFAULT NULL,
  `AP_LNAME` varchar(50) DEFAULT NULL,
  `AP_SEX` varchar(50) DEFAULT NULL,
  `AP_HOME_ADDRESS` varchar(300) DEFAULT NULL,
  `AP_TELEPHONE` varchar(50) DEFAULT NULL,
  `AP_MAILING_ADDRESS` varchar(300) DEFAULT NULL,
  `AP_EMAIL` varchar(50) DEFAULT NULL,
  `AP_PLATE NUMBER` varchar(50) DEFAULT NULL,
  `AP_TODA` varchar(50) DEFAULT NULL,
  `AP_TIN` varchar(20) NOT NULL,
  `AP_DRIVER_LICENCE` varchar(50) DEFAULT NULL,
  `AP_STATUS` varchar(10) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`AP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- RELATIONSHIPS FOR TABLE `mtops_t_applicant`:
--

--
-- Dumping data for table `mtops_t_applicant`
--


-- --------------------------------------------------------

--
-- Table structure for table `mtops_t_user`
--
-- Creation: Oct 11, 2018 at 12:56 PM
--



--
-- Stand-in structure for view `view_applicationformsas`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_applicationformsas`;
CREATE TABLE IF NOT EXISTS `view_applicationformsas` (
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
,`AP_NAME` varchar(152)
,`AP_HOME_ADDRESS` varchar(300)
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
,`AP_NAME` varchar(152)
,`AP_HOME_ADDRESS` varchar(300)
,`TB_ID` int(11)
,`TB_DATE_BILLED` date
,`EMP_NAME` varchar(152)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_bussperm`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_bussperm`;
CREATE TABLE IF NOT EXISTS `view_bussperm` (
`BP_NUMBER` varchar(20)
,`BP_ISSUED_DATE` date
,`AP_NATIONALITY` varchar(50)
,`BU_NAME` varchar(200)
,`AR_NAME` varchar(152)
,`BU_PRESIDENT` varchar(100)
,`BU_LOCATION` varchar(300)
,`BP_VALID_YEARS` date
,`BN_NAME` varchar(100)
,`BN_CLASSIFICATION` enum('S','L')
,`BU_CAPITALIZATION` float
,`BP_REMARKS` varchar(300)
,`BU_EMP_NO` int(5)
,`AP_SSS_NO` varchar(20)
,`AP_TIN` varchar(20)
,`BU_AREA` float
,`TB_ID` int(11)
,`TB_DATE_BILLED` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_routeslip`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_routeslip`;
CREATE TABLE IF NOT EXISTS `view_routeslip` (
`TL_DATE` timestamp
,`TL_REMARKS` text
,`TL_DIV_NAME` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_terminatedap`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_terminatedap`;
CREATE TABLE IF NOT EXISTS `view_terminatedap` (
`AP_ID` int(11)
,`AP_REFERENCE_NO` varchar(20)
,`AP_DATE` date
,`AP_TYPE` enum('New','Renew')
,`AP_STATUS` enum('Pending','Terminated','Success','Assess')
,`AP_DIV_CODE_TO` varchar(10)
,`AP_DIV_CODE_FROM` varchar(10)
,`AP_DATE_ACCESSED` date
,`AP_DATE_RE_INS` date
,`AP_RE_INS_DEAD` date
,`AP_REMARKS` text
,`BU_ID` int(11)
,`TB_ID` int(11)
,`U_ID` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsas`
--
DROP TABLE IF EXISTS `view_applicationformsas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsas`  AS  select `AP`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`BUS`.`BU_NAME` AS `BU_NAME`,`BUS`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`TP`.`AP_FNAME`,' ',coalesce(`TP`.`AP_MNAME`,' '),' ',coalesce(`TP`.`AP_LNAME`,' ')) AS `TAX_PAYERNAME`,`BUS`.`BU_LOCATION` AS `BU_LOCATION`,`BUS`.`BU_CONTACT` AS `BU_CONTACT`,concat(`AR`.`AR_FNAME`,' ',coalesce(`AR`.`AR_MNAME`,' '),' ',coalesce(`AR`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`AR`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`BN`.`BN_NAME` AS `BN_NAME`,`BN`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`OT`.`OT_NAME` AS `OT_NAME`,`OT`.`OT_CODE` AS `OT_CODE`,`AP`.`AP_TYPE` AS `AP_TYPE`,`AP`.`AP_DATE` AS `AP_DATE`,`AP`.`AP_ID` AS `AP_ID`,`AP`.`AP_STATUS` AS `AP_STATUS`,`AP`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`AP`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM` from (((((((`mtops_t_registration` `BUS` join `mtops_r_registration_nature` `BN` on((`BN`.`BN_ID` = `BUS`.`BN_ID`))) join `mtops_r_ownership_type` `OT` on((`OT`.`OT_CODE` = `BUS`.`OT_CODE`))) join `mtops_t_bp_application` `AP` on((`AP`.`BU_ID` = `BUS`.`BU_ID`))) join `mtops_t_applicant` `TP` on((`TP`.`AP_ID` = `BUS`.`AP_ID`))) join `mtops_r_bu_ar` `BUxAR` on((`BUxAR`.`BU_ID` = `BUS`.`BU_ID`))) join `mtops_t_authorize_rep` `AR` on((`AR`.`AR_ID` = `BUxAR`.`AR_ID`))) join `mtops_r_division` `DIVS` on((`DIVS`.`DIV_CODE` = `AP`.`AP_DIV_CODE_TO`))) where ((`AP`.`AP_DIV_CODE_TO` = 'DIV-AS') and (`AP`.`AP_STATUS` = 'Assess') and (`AP`.`AP_STATUS` <> 'Terminated')) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsev`
--
DROP TABLE IF EXISTS `view_applicationformsev`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsev`  AS  select `AP`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`BUS`.`BU_NAME` AS `BU_NAME`,`BUS`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`TP`.`AP_FNAME`,' ',coalesce(`TP`.`AP_MNAME`,' '),' ',coalesce(`TP`.`AP_LNAME`,' ')) AS `TAX_PAYERNAME`,`BUS`.`BU_LOCATION` AS `BU_LOCATION`,`BUS`.`BU_CONTACT` AS `BU_CONTACT`,concat(`AR`.`AR_FNAME`,' ',coalesce(`AR`.`AR_MNAME`,' '),' ',coalesce(`AR`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`AR`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`BN`.`BN_NAME` AS `BN_NAME`,`BN`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`OT`.`OT_NAME` AS `OT_NAME`,`OT`.`OT_CODE` AS `OT_CODE`,`AP`.`AP_TYPE` AS `AP_TYPE`,`AP`.`AP_DATE` AS `AP_DATE`,`ATC`.`AT_UNIFIED_FILE_NAME` AS `AT_UNIFIED_FILE_NAME`,`AP`.`AP_ID` AS `AP_ID`,`AP`.`AP_STATUS` AS `AP_STATUS`,`AP`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`AP`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM`,`ATC`.`AT_ID` AS `AT_ID`,`ATC`.`AT_BRGY_CLEARANCE` AS `AT_BRGY_CLEARANCE`,`ATC`.`AT_DTI_REGISTRATION` AS `AT_DTI_REGISTRATION`,`ATC`.`AT_SEC_REGISTRATION` AS `AT_SEC_REGISTRATION`,`ATC`.`AT_TITLE_TO_PROPERTY` AS `AT_TITLE_TO_PROPERTY`,`ATC`.`AT_TAX_DECLARATION` AS `AT_TAX_DECLARATION`,`ATC`.`AT_CONTRACT_OF_LEASE` AS `AT_CONTRACT_OF_LEASE`,`ATC`.`AT_LESSORS_BP` AS `AT_LESSORS_BP`,`ATC`.`AT_AUTHORIZATION` AS `AT_AUTHORIZATION`,`ATC`.`AT_LOCATIONAL_CLR` AS `AT_LOCATIONAL_CLR`,`ATC`.`AT_SANITARY_HEALTH_CERT` AS `AT_SANITARY_HEALTH_CERT`,`ATC`.`AT_BUILDING_PERMIT` AS `AT_BUILDING_PERMIT`,`ATC`.`AT_POLLUTION_CLR` AS `AT_POLLUTION_CLR`,`ATC`.`AT_MECHANICAL_PERMIT` AS `AT_MECHANICAL_PERMIT`,`ATC`.`AT_ELECTRICAL_INSP` AS `AT_ELECTRICAL_INSP`,`ATC`.`AT_POLICE_CLEARANCE` AS `AT_POLICE_CLEARANCE`,`ATC`.`AT_CTAO_CLEARANCE_CERT` AS `AT_CTAO_CLEARANCE_CERT`,`ATC`.`AT_FSIC` AS `AT_FSIC`,`ATC`.`AT_PREV_BP` AS `AT_PREV_BP`,`ATC`.`AT_TAX_BILL` AS `AT_TAX_BILL`,`ATC`.`AT_OFFICIAL_RECEIPT` AS `AT_OFFICIAL_RECEIPT`,`ATC`.`AT_PCAB_LICENSE` AS `AT_PCAB_LICENSE`,`ATC`.`AT_MISC_DOCUMENTS` AS `AT_MISC_DOCUMENTS`,`ATC`.`AP_Remarks` AS `AP_Remarks` from ((((((((`mtops_t_registration` `BUS` join `mtops_r_registration_nature` `BN` on((`BN`.`BN_ID` = `BUS`.`BN_ID`))) join `mtops_r_ownership_type` `OT` on((`OT`.`OT_CODE` = `BUS`.`OT_CODE`))) join `mtops_t_bp_application` `AP` on((`AP`.`BU_ID` = `BUS`.`BU_ID`))) join `mtops_t_applicant` `TP` on((`TP`.`AP_ID` = `BUS`.`AP_ID`))) join `mtops_r_bu_ar` `BUxAR` on((`BUxAR`.`BU_ID` = `BUS`.`BU_ID`))) join `mtops_t_authorize_rep` `AR` on((`AR`.`AR_ID` = `BUxAR`.`AR_ID`))) join `mtops_t_attachments` `ATC` on((`ATC`.`AP_ID` = `AP`.`AP_ID`))) join `mtops_r_division` `DIVS` on((`DIVS`.`DIV_CODE` = `AP`.`AP_DIV_CODE_TO`))) where (((`AP`.`AP_DIV_CODE_TO` = 'DIV-EV') or (`AP`.`AP_DIV_CODE_TO` = 'DIV-REV')) and (`AP`.`AP_STATUS` = 'Pending') and (`AP`.`AP_STATUS` <> 'Terminated')) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsip`
--
DROP TABLE IF EXISTS `view_applicationformsip`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsip`  AS  select `AP`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`BUS`.`BU_NAME` AS `BU_NAME`,`BUS`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`TP`.`AP_FNAME`,' ',coalesce(`TP`.`AP_MNAME`,' '),' ',coalesce(`TP`.`AP_LNAME`,' ')) AS `TAX_PAYERNAME`,`BUS`.`BU_LOCATION` AS `BU_LOCATION`,`BUS`.`BU_CONTACT` AS `BU_CONTACT`,concat(`AR`.`AR_FNAME`,' ',coalesce(`AR`.`AR_MNAME`,' '),' ',coalesce(`AR`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`AR`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`BN`.`BN_NAME` AS `BN_NAME`,`BN`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`OT`.`OT_NAME` AS `OT_NAME`,`OT`.`OT_CODE` AS `OT_CODE`,`AP`.`AP_TYPE` AS `AP_TYPE`,`AP`.`AP_DATE` AS `AP_DATE`,`AP`.`AP_ID` AS `AP_ID`,`AP`.`AP_STATUS` AS `AP_STATUS`,`AP`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`AP`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM` from (((((((`mtops_t_registration` `BUS` join `mtops_r_registration_nature` `BN` on((`BN`.`BN_ID` = `BUS`.`BN_ID`))) join `mtops_r_ownership_type` `OT` on((`OT`.`OT_CODE` = `BUS`.`OT_CODE`))) join `mtops_t_bp_application` `AP` on((`AP`.`BU_ID` = `BUS`.`BU_ID`))) join `mtops_t_applicant` `TP` on((`TP`.`AP_ID` = `BUS`.`AP_ID`))) join `mtops_r_bu_ar` `BUxAR` on((`BUxAR`.`BU_ID` = `BUS`.`BU_ID`))) join `mtops_t_authorize_rep` `AR` on((`AR`.`AR_ID` = `BUxAR`.`AR_ID`))) join `mtops_r_division` `DIVS` on((`DIVS`.`DIV_CODE` = `AP`.`AP_DIV_CODE_TO`))) where ((`AP`.`AP_DIV_CODE_TO` = 'DIV-INS') and (`AP`.`AP_STATUS` <> 'Terminated')) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsiv`
--
DROP TABLE IF EXISTS `view_applicationformsiv`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsiv`  AS  select `AP`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`BUS`.`BU_NAME` AS `BU_NAME`,`BUS`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`TP`.`AP_FNAME`,' ',coalesce(`TP`.`AP_MNAME`,' '),' ',coalesce(`TP`.`AP_LNAME`,' ')) AS `TAX_PAYERNAME`,`BUS`.`BU_LOCATION` AS `BU_LOCATION`,`BUS`.`BU_CONTACT` AS `BU_CONTACT`,concat(`AR`.`AR_FNAME`,' ',coalesce(`AR`.`AR_MNAME`,' '),' ',coalesce(`AR`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`AR`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`BN`.`BN_NAME` AS `BN_NAME`,`BN`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`OT`.`OT_NAME` AS `OT_NAME`,`OT`.`OT_CODE` AS `OT_CODE`,`AP`.`AP_TYPE` AS `AP_TYPE`,`AP`.`AP_DATE` AS `AP_DATE`,`AP`.`AP_ID` AS `AP_ID`,`AP`.`AP_STATUS` AS `AP_STATUS`,`AP`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`AP`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM`,`INS`.`ZONING_INS` AS `ZONING_INS`,`INS`.`FIRE_INS` AS `FIRE_INS`,`INS`.`HEALTH_SANITATION_INS` AS `HEALTH_SANITATION_INS`,`INS`.`BUILDING_INS` AS `BUILDING_INS`,`INS`.`LABOR_INS` AS `LABOR_INS`,`INS`.`MISC_INS` AS `MISC_INS`,`INS`.`INS_REMARKS` AS `INS_REMARKS` from ((((((((`mtops_t_registration` `BUS` join `mtops_r_registration_nature` `BN` on((`BN`.`BN_ID` = `BUS`.`BN_ID`))) join `mtops_r_ownership_type` `OT` on((`OT`.`OT_CODE` = `BUS`.`OT_CODE`))) join `mtops_t_bp_application` `AP` on((`AP`.`BU_ID` = `BUS`.`BU_ID`))) join `mtops_t_applicant` `TP` on((`TP`.`AP_ID` = `BUS`.`AP_ID`))) join `mtops_r_bu_ar` `BUxAR` on((`BUxAR`.`BU_ID` = `BUS`.`BU_ID`))) join `mtops_t_authorize_rep` `AR` on((`AR`.`AR_ID` = `BUxAR`.`AR_ID`))) join `mtops_t_inspections` `INS` on((`INS`.`INS_AP_REFERENCE_NO` = `AP`.`AP_REFERENCE_NO`))) join `mtops_r_division` `DIVS` on((`DIVS`.`DIV_CODE` = `AP`.`AP_DIV_CODE_TO`))) where ((`AP`.`AP_DIV_CODE_TO` = 'DIV-INV') and (`AP`.`AP_STATUS` <> 'Terminated')) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformsrel`
--
DROP TABLE IF EXISTS `view_applicationformsrel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformsrel`  AS  select `BPA`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`BU`.`BU_NAME` AS `BU_NAME`,`NT`.`BN_NAME` AS `BN_NAME`,concat(`TX`.`AP_FNAME`,' ',`TX`.`AP_MNAME`,' ',`TX`.`AP_LNAME`) AS `AP_NAME`,`TX`.`AP_HOME_ADDRESS` AS `AP_HOME_ADDRESS`,`T`.`TB_ID` AS `TB_ID`,`T`.`TB_DATE_BILLED` AS `TB_DATE_BILLED`,concat(`EMP`.`EP_FNAME`,' ',`EMP`.`EP_MNAME`,' ',`EMP`.`EP_LNAME`) AS `EMP_NAME` from (((((`mtops_t_bp_application` `BPA` join `mtops_t_registration` `BU` on((`BPA`.`BU_ID` = `BU`.`BU_ID`))) join `mtops_t_applicant` `TX` on((`BU`.`AP_ID` = `TX`.`AP_ID`))) join `mtops_t_taxbill` `T` on((`BPA`.`TB_ID` = `T`.`TB_ID`))) join `mtops_r_registration_nature` `NT` on((`BU`.`BN_ID` = `NT`.`BN_ID`))) join `mtops_t_employee_profile` `EMP` on((`T`.`ASSESSED_BY` = `EMP`.`EP_ID`))) where ((`BPA`.`AP_DIV_CODE_TO` = 'DIV-REL') and (`BPA`.`AP_STATUS` <> 'Terminated')) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applicationformstre`
--
DROP TABLE IF EXISTS `view_applicationformstre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_applicationformstre`  AS  select `BPA`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`BU`.`BU_NAME` AS `BU_NAME`,`NT`.`BN_NAME` AS `BN_NAME`,concat(`TX`.`AP_FNAME`,' ',`TX`.`AP_MNAME`,' ',`TX`.`AP_LNAME`) AS `AP_NAME`,`TX`.`AP_HOME_ADDRESS` AS `AP_HOME_ADDRESS`,`T`.`TB_ID` AS `TB_ID`,`T`.`TB_DATE_BILLED` AS `TB_DATE_BILLED`,concat(`EMP`.`EP_FNAME`,' ',`EMP`.`EP_MNAME`,' ',`EMP`.`EP_LNAME`) AS `EMP_NAME` from (((((`mtops_t_bp_application` `BPA` join `mtops_t_registration` `BU` on((`BPA`.`BU_ID` = `BU`.`BU_ID`))) join `mtops_t_applicant` `TX` on((`BU`.`AP_ID` = `TX`.`AP_ID`))) join `mtops_t_taxbill` `T` on((`BPA`.`TB_ID` = `T`.`TB_ID`))) join `mtops_r_registration_nature` `NT` on((`BU`.`BN_ID` = `NT`.`BN_ID`))) join `mtops_t_employee_profile` `EMP` on((`T`.`ASSESSED_BY` = `EMP`.`EP_ID`))) where ((`BPA`.`AP_DIV_CODE_TO` = 'DIV-TRE') and (`BPA`.`AP_STATUS` <> 'Terminated')) ;

-- --------------------------------------------------------

--
-- Structure for view `view_bussperm`
--
DROP TABLE IF EXISTS `view_bussperm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_bussperm`  AS  select `permit`.`BP_NUMBER` AS `BP_NUMBER`,`permit`.`BP_ISSUED_DATE` AS `BP_ISSUED_DATE`,`applicant`.`AP_NATIONALITY` AS `AP_NATIONALITY`,`registration`.`BU_NAME` AS `BU_NAME`,concat(`btar`.`AR_FNAME`,' ',`btar`.`AR_MNAME`,' ',`btar`.`AR_LNAME`) AS `AR_NAME`,`registration`.`BU_PRESIDENT` AS `BU_PRESIDENT`,`registration`.`BU_LOCATION` AS `BU_LOCATION`,`permit`.`BP_VALID_YEARS` AS `BP_VALID_YEARS`,`nature`.`BN_NAME` AS `BN_NAME`,`nature`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`registration`.`BU_CAPITALIZATION` AS `BU_CAPITALIZATION`,`permit`.`BP_REMARKS` AS `BP_REMARKS`,`registration`.`BU_EMP_NO` AS `BU_EMP_NO`,`applicant`.`AP_SSS_NO` AS `AP_SSS_NO`,`applicant`.`AP_TIN` AS `AP_TIN`,`registration`.`BU_AREA` AS `BU_AREA`,`t`.`TB_ID` AS `TB_ID`,`t`.`TB_DATE_BILLED` AS `TB_DATE_BILLED` from ((((((((`mtops_t_registration_permit` join `mtops_t_bp_application` `a` on((`mtops_t_registration_permit`.`AP_ID` = `a`.`AP_ID`))) join `mtops_t_registration` `registration` on((`a`.`BU_ID` = `registration`.`BU_ID`))) join `mtops_r_registration_nature` `nature` on((`registration`.`BN_ID` = `nature`.`BN_ID`))) join `mtops_r_bu_ar` `ar` on((`registration`.`BU_ID` = `ar`.`BU_ID`))) join `mtops_t_authorize_rep` `btar` on((`ar`.`AR_ID` = `btar`.`AR_ID`))) join `mtops_t_applicant` `applicant` on((`registration`.`AP_ID` = `applicant`.`AP_ID`))) join `mtops_t_taxbill` `t` on((`a`.`TB_ID` = `t`.`TB_ID`))) join `mtops_t_registration_permit` `permit` on((`a`.`AP_ID` = `permit`.`AP_ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_routeslip`
--
DROP TABLE IF EXISTS `view_routeslip`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_routeslip`  AS  select `H`.`TL_DATE` AS `TL_DATE`,`H`.`TL_REMARKS` AS `TL_REMARKS`,`H`.`TL_DIV_NAME` AS `TL_DIV_NAME` from (`mtops_t_ap_history` `H` join `mtops_r_division` `DV` on((`H`.`TL_DIV_CODE` = `DV`.`DIV_CODE`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_terminatedap`
--
DROP TABLE IF EXISTS `view_terminatedap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_terminatedap`  AS  select `mtops_t_bp_application`.`AP_ID` AS `AP_ID`,`mtops_t_bp_application`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`mtops_t_bp_application`.`AP_DATE` AS `AP_DATE`,`mtops_t_bp_application`.`AP_TYPE` AS `AP_TYPE`,`mtops_t_bp_application`.`AP_STATUS` AS `AP_STATUS`,`mtops_t_bp_application`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`mtops_t_bp_application`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM`,`mtops_t_bp_application`.`AP_DATE_ACCESSED` AS `AP_DATE_ACCESSED`,`mtops_t_bp_application`.`AP_DATE_RE_INS` AS `AP_DATE_RE_INS`,`mtops_t_bp_application`.`AP_RE_INS_DEAD` AS `AP_RE_INS_DEAD`,`mtops_t_bp_application`.`AP_REMARKS` AS `AP_REMARKS`,`mtops_t_bp_application`.`BU_ID` AS `BU_ID`,`mtops_t_bp_application`.`TB_ID` AS `TB_ID`,`mtops_t_bp_application`.`U_ID` AS `U_ID` from `mtops_t_bp_application` where (`mtops_t_bp_application`.`AP_STATUS` = 'Terminated') ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mtops_r_bu_ar`
--
ALTER TABLE `mtops_r_bu_ar`
  ADD CONSTRAINT `bu_ar_fk_ar` FOREIGN KEY (`AR_ID`) REFERENCES `mtops_t_authorize_rep` (`AR_ID`),
  ADD CONSTRAINT `bu_ar_fk_bu` FOREIGN KEY (`BU_ID`) REFERENCES `mtops_t_registration` (`BU_ID`);

--
-- Constraints for table `mtops_r_ot_bn_req`
--
ALTER TABLE `mtops_r_ot_bn_req`
  ADD CONSTRAINT `ot_bn_req_fk_bn` FOREIGN KEY (`BN_ID`) REFERENCES `mtops_r_registration_nature` (`BN_ID`),
  ADD CONSTRAINT `ot_bn_req_fk_ot` FOREIGN KEY (`OT_ID`) REFERENCES `mtops_r_ownership_type` (`OT_ID`),
  ADD CONSTRAINT `ot_bn_req_fk_rt` FOREIGN KEY (`RT_ID`) REFERENCES `mtops_r_req_type` (`RT_ID`);

--
-- Constraints for table `mtops_t_ap_history`
--
ALTER TABLE `mtops_t_ap_history`
  ADD CONSTRAINT `TL_AP_NO` FOREIGN KEY (`TL_AP_NO`) REFERENCES `mtops_t_bp_application` (`AP_REFERENCE_NO`),
  ADD CONSTRAINT `TL_DIV_CODE` FOREIGN KEY (`TL_DIV_CODE`) REFERENCES `mtops_r_division` (`DIV_CODE`);

--
-- Constraints for table `mtops_t_attachments`
--
ALTER TABLE `mtops_t_attachments`
  ADD CONSTRAINT `attachments_fk_ap` FOREIGN KEY (`AP_ID`) REFERENCES `mtops_t_bp_application` (`AP_ID`),
  ADD CONSTRAINT `attachments_fk_rt` FOREIGN KEY (`REQ_GRP_ID`) REFERENCES `mtops_r_req_type` (`RT_ID`);

--
-- Constraints for table `mtops_t_audit_trail`
--
ALTER TABLE `mtops_t_audit_trail`
  ADD CONSTRAINT `fk_audt_div` FOREIGN KEY (`AUDT_DIV_CODE`) REFERENCES `mtops_r_division` (`DIV_CODE`),
  ADD CONSTRAINT `fk_audt_ep` FOREIGN KEY (`AUDT_EP_ID`) REFERENCES `mtops_t_employee_profile` (`EP_ID`);

--
-- Constraints for table `mtops_t_bp_application`
--
ALTER TABLE `mtops_t_bp_application`
  ADD CONSTRAINT `application_fk_bu` FOREIGN KEY (`BU_ID`) REFERENCES `mtops_t_registration` (`BU_ID`),
  ADD CONSTRAINT `application_fk_divfro` FOREIGN KEY (`AP_DIV_CODE_FROM`) REFERENCES `mtops_r_division` (`DIV_CODE`),
  ADD CONSTRAINT `application_fk_divto` FOREIGN KEY (`AP_DIV_CODE_TO`) REFERENCES `mtops_r_division` (`DIV_CODE`),
  ADD CONSTRAINT `application_fk_tb` FOREIGN KEY (`TB_ID`) REFERENCES `mtops_t_taxbill` (`TB_ID`),
  ADD CONSTRAINT `application_fk_u` FOREIGN KEY (`U_ID`) REFERENCES `mtops_t_user` (`U_ID`);

--
-- Constraints for table `mtops_t_registration`
--
ALTER TABLE `mtops_t_registration`
  ADD CONSTRAINT `registration_fk_bn` FOREIGN KEY (`BN_ID`) REFERENCES `mtops_r_registration_nature` (`BN_ID`),
  ADD CONSTRAINT `registration_fk_otcode` FOREIGN KEY (`OT_CODE`) REFERENCES `mtops_r_ownership_type` (`OT_CODE`),
  ADD CONSTRAINT `registration_fk_rent` FOREIGN KEY (`RENT_ID`) REFERENCES `mtops_t_is_rented` (`RENT_ID`),
  ADD CONSTRAINT `registration_fk_tp` FOREIGN KEY (`AP_ID`) REFERENCES `mtops_t_applicant` (`AP_ID`);

--
-- Constraints for table `mtops_t_registration_permit`
--
ALTER TABLE `mtops_t_registration_permit`
  ADD CONSTRAINT `buspermit_fk_ap` FOREIGN KEY (`AP_ID`) REFERENCES `mtops_t_bp_application` (`AP_ID`),
  ADD CONSTRAINT `buspermit_fk_bu` FOREIGN KEY (`BU_ID`) REFERENCES `mtops_t_registration` (`BU_ID`);

--
-- Constraints for table `mtops_t_employee_profile`
--
ALTER TABLE `mtops_t_employee_profile`
  ADD CONSTRAINT `employee_fk_div` FOREIGN KEY (`DIV_ID`) REFERENCES `mtops_r_division` (`DIV_ID`);

--
-- Constraints for table `mtops_t_fl_tb`
--
ALTER TABLE `mtops_t_fl_tb`
  ADD CONSTRAINT `fl_tb_fk_fl` FOREIGN KEY (`FL_ID`) REFERENCES `mtops_r_fee_list` (`FL_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fl_tb_fk_tb` FOREIGN KEY (`TB_ID`) REFERENCES `mtops_t_taxbill` (`TB_ID`) ON DELETE CASCADE;

--
-- Constraints for table `mtops_t_inspections`
--
ALTER TABLE `mtops_t_inspections`
  ADD CONSTRAINT `insp_fk_refno` FOREIGN KEY (`INS_AP_REFERENCE_NO`) REFERENCES `mtops_t_bp_application` (`AP_REFERENCE_NO`);

--
-- Constraints for table `mtops_t_official_receipt`
--
ALTER TABLE `mtops_t_official_receipt`
  ADD CONSTRAINT `official_receipt_fk_tb` FOREIGN KEY (`TB_ID`) REFERENCES `mtops_t_taxbill` (`TB_ID`);

--
-- Constraints for table `mtops_t_taxbill`
--
ALTER TABLE `mtops_t_taxbill`
  ADD CONSTRAINT `taxbill_fk_approved_by` FOREIGN KEY (`APPROVED_BY`) REFERENCES `mtops_t_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `taxbill_fk_assessed_by` FOREIGN KEY (`ASSESSED_BY`) REFERENCES `mtops_t_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `taxbill_fk_rec_approval` FOREIGN KEY (`REC_APPROVAL_BY`) REFERENCES `mtops_t_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `taxbill_fk_verified_by` FOREIGN KEY (`VERIFIED_BY`) REFERENCES `mtops_t_employee_profile` (`EP_ID`);

--
-- Constraints for table `mtops_t_user`
--
ALTER TABLE `mtops_t_user`
  ADD CONSTRAINT `user_fk_divcode` FOREIGN KEY (`U_ROLE`) REFERENCES `mtops_r_division` (`DIV_CODE`),
  ADD CONSTRAINT `user_fk_ep` FOREIGN KEY (`EP_ID`) REFERENCES `mtops_t_employee_profile` (`EP_ID`);

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
-- Metadata for table mtops_r_registration_nature
--

--
-- Metadata for table mtops_r_bu_ar
--

--
-- Metadata for table mtops_r_division
--

--
-- Metadata for table mtops_r_fee_list
--

--
-- Metadata for table mtops_r_ot_bn_req
--

--
-- Metadata for table mtops_r_ownership_type
--

--
-- Metadata for table mtops_r_req_type
--

--
-- Metadata for table mtops_t_ap_history
--

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'lgu_paeis_db', 'mtops_t_ap_history', '{\"sorted_col\":\"`mtops_t_ap_history`.`TL_DATE` DESC\"}', '2018-10-20 16:35:39');

--
-- Metadata for table mtops_t_attachments
--

--
-- Metadata for table mtops_t_audit_trail
--

--
-- Metadata for table mtops_t_authorize_rep
--

--
-- Metadata for table mtops_t_bp_application
--

--
-- Metadata for table mtops_t_registration
--

--
-- Metadata for table mtops_t_registration_permit
--

--
-- Metadata for table mtops_t_employee_profile
--

--
-- Metadata for table mtops_t_fl_tb
--

--
-- Metadata for table mtops_t_inspections
--

--
-- Metadata for table mtops_t_is_rented
--

--
-- Metadata for table mtops_t_official_receipt
--

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'lgu_paeis_db', 'mtops_t_official_receipt', '{\"sorted_col\":\"`OR_TW_CH_MO_NO`  DESC\"}', '2018-10-12 14:14:15');

--
-- Metadata for table mtops_t_taxbill
--

--
-- Metadata for table mtops_t_applicant
--

--
-- Metadata for table mtops_t_user
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
-- Metadata for table view_applicationformsas
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
-- Metadata for table view_bussperm
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
