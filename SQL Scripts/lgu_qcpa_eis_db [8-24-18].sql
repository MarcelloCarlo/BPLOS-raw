-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 23, 2018 at 06:46 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET FOREIGN_KEY_CHECKS=0;
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
CREATE DATABASE IF NOT EXISTS `lgu_qcpa_eis_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lgu_qcpa_eis_db`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `lgu_application_sp` (IN `bu_name` VARCHAR(200), IN `tp_lname` VARCHAR(50), IN `tp_fname` VARCHAR(50), IN `tp_mname` VARCHAR(50), IN `tp_hsno` VARCHAR(10), IN `tp_Strt` VARCHAR(90), IN `tp_brgy` VARCHAR(100), IN `tp_city` VARCHAR(100), IN `bu_flr` VARCHAR(10), IN `bu_Strt_no` VARCHAR(50), IN `bu_strt_name` VARCHAR(50), IN `bu_brgy` VARCHAR(50), IN `bu_pin` VARCHAR(35), IN `bu_lot_block` VARCHAR(300), IN `tp_tin` VARCHAR(20), IN `bu_dti_no` INT(11), IN `bu_dti_date` DATE, IN `bu_contact` CHAR(11), IN `bu_faxno` CHAR(11), IN `tp_sssno` VARCHAR(20), IN `bu_emp_no` INT(5), IN `ar_lname` VARCHAR(50), IN `ar_fname` VARCHAR(50), IN `ar_mname` VARCHAR(50), IN `ar_address` VARCHAR(300), IN `rent_start` DATE, IN `rent_permonth` DOUBLE(5,2), IN `rent_lessor` VARCHAR(100), IN `sb_area` DOUBLE(5,2), IN `bn_id` INT(11), IN `bu_unit_no` INT(11), IN `bu_area` DOUBLE(5,2), IN `bu_capitalization` DOUBLE(5,2))  NO SQL
BEGIN
    DECLARE
        taxpayer_id INT(11) ; DECLARE business_id INT(11) ; DECLARE isrented_id INT(11) ; DECLARE rep_id INT(11) ; DECLARE tp_address VARCHAR(300) ; DECLARE bu_loc VARCHAR(300) ; DECLARE ap_ref_no VARCHAR(50) ;
    SET
        tp_address =(
        SELECT
            CONCAT(
                'tp_hsno',
                ', ',
                'tp_Strt',
                ', ',
                'tp_brgy',
                ', ',
                'tp_city'
            )
    ) ;
SET
    bu_loc =(
    SELECT
        CONCAT(
            'bu_flr',
            ', ',
            'bu_Strt_no',
            ' ',
            'bu_strt_name',
            ', ',
            'bu_strt_name'
        )
) ;
INSERT INTO `lgu_r_authorize_rep`(
    `AR_FNAME`,
    `AR_MNAME`,
    `AR_LNAME`,
    `AR_HOME_ADDRESS`
)
VALUES(
    'ar_fname',
    'ar_mname',
    'ar_lname',
    'ar_address'
) ;
INSERT INTO `lgu_r_is_rented`(
    `RENT_DATE_STARTED`,
    `RENT_MONTHLY_RENTAL`,
    `RENT_LESSOR`
)
VALUES(
    'rent_start',
    'rent_permonth',
    'rent_lessor'
) ;
INSERT INTO `lgu_r_taxpayer`(
    `TP_FNAME`,
    `TP_MNAME`,
    `TP_LNAME`,
    `TP_HOME_ADDRESS`,
    `TP_TIN`,
    `TP_SSS_NO`
)
VALUES(
    'tp_fname',
    'tp_mname',
    'tp_lname',
    'tp_address',
    'tp_tin',
    'tp_sssno'
) ;
SET
    isrented_id =(
    SELECT
        CONVERT(@last_id := MAX(`RENT_ID`),SIGNED)
    FROM
        `lgu_r_is_rented`
) ;

INSERT INTO `lgu_r_business`(
    `BU_NAME`,
    `BU_LOCATION`,
    `BU_PROPERTY_INDEX_NO`,
    `BU_LOT_BLOCK_NO`,
    `BU_CONTACT`,
    `BU_FAX_NO`,
    `SB_AREA`,
    `DTI_REG_NO`,
    `DTI_DATE`,
    `BU_EMP_NO`,
    `BU_AREA`,
    `BU_UNIT_NO`,
    `BU_CAPITALIZATION`,
    `TP_ID`,
    `OT_ID`
)
VALUES(
    'bu_name',
    'bu_loc',
    'bu_pin',
    'bu_lot_block',
    'bu_contact',
    'bu_faxno',
    'sb_area',
    'bu_dti_no',
    'bu_dti_date',
    'bu_emp_no',
    'bu_area',
    'bu_unit_no',
    'bu_capitalization',
    (SELECT MAX(`TP_ID`)
    FROM `lgu_r_taxpayer`),
    '1'
) ;

INSERT INTO `lgu_r_bu_ar`(`AR_ID`, `BU_ID`)
VALUES((SELECT MAX(`AR_ID`) FROM `lgu_r_authorize_rep`), (SELECT MAX(`BU_ID`) FROM `lgu_r_business`)) ;

INSERT INTO `lgu_r_bp_application`(
    `AP_REFERENCE_NO`,
    `AP_DATE`,
    `AP_TYPE`,
    `BU_ID`
)
VALUES(
    (
    SELECT
        CONCAT(
            'tp_tin',
            '-',
            (
            SELECT
                DATE_FORMAT(CURRENT_TIMESTAMP, '%y%m%d')
        ),
        '-',
        'business_id'
        )
),
    CURRENT_TIMESTAMP(), 'New Application',  (SELECT MAX(`BU_ID`) FROM `lgu_r_business`)) ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_attachments`
--
-- Creation: Aug 23, 2018 at 11:16 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_attachments` (
  `AT_ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `AP_ID` int(11) DEFAULT NULL,
  `RT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AT_ID`),
  KEY `lgu_r_attachments_fk_bp_application` (`AP_ID`),
  KEY `lgu_r_attachments_fk_req_type` (`RT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_authorize_rep` (
  `AR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AR_FNAME` varchar(50) NOT NULL,
  `AR_MNAME` varchar(50) DEFAULT NULL,
  `AR_LNAME` varchar(50) NOT NULL,
  `AR_POSITION` varchar(50) DEFAULT NULL,
  `AR_HOME_ADDRESS` varchar(300) NOT NULL,
  PRIMARY KEY (`AR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_authorize_rep`:
--

--
-- Dumping data for table `lgu_r_authorize_rep`
--

INSERT INTO `lgu_r_authorize_rep` (`AR_ID`, `AR_FNAME`, `AR_MNAME`, `AR_LNAME`, `AR_POSITION`, `AR_HOME_ADDRESS`) VALUES
(1, 'ar_fname', 'ar_mname', 'ar_lname', NULL, 'ar_address'),
(2, 'ar_fname', 'ar_mname', 'ar_lname', NULL, 'ar_address'),
(3, 'ar_fname', 'ar_mname', 'ar_lname', NULL, 'ar_address'),
(4, 'ar_fname', 'ar_mname', 'ar_lname', NULL, 'ar_address'),

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_bp_application`
--
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_bp_application` (
  `AP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AP_REFERENCE_NO` varchar(15) DEFAULT NULL,
  `AP_DATE` date NOT NULL,
  `AP_TYPE` varchar(10) NOT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  `U_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AP_ID`),
  KEY `lgu_r_bp_application_fk_business` (`BU_ID`),
  KEY `lgu_r_bp_application_fk_user` (`U_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_bp_application`:
--   `BU_ID`
--       `lgu_r_business` -> `BU_ID`
--   `U_ID`
--       `lgu_r_user` -> `U_ID`
--

--
-- Dumping data for table `lgu_r_bp_application`
--

INSERT INTO `lgu_r_bp_application` (`AP_ID`, `AP_REFERENCE_NO`, `AP_DATE`, `AP_TYPE`, `BU_ID`, `U_ID`) VALUES
(1, 'ap_ref_no', '2018-08-17', 'New Application', 0, NULL),
(2, 'ap_ref_no', '2018-08-17', 'New Application', 0, NULL),
(3, 'ap_ref_no', '2018-08-17', 'New Application', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_business`
--
-- Creation: Aug 23, 2018 at 09:41 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_business` (
  `BU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BU_NAME` varchar(200) NOT NULL,
  `BU_PRESIDENT` varchar(100) NOT NULL,
  `BU_LOCATION` varchar(300) NOT NULL,
  `BU_PROPERTY_INDEX_NO` varchar(35) NOT NULL,
  `BU_LOT_BLOCK_NO` varchar(35) NOT NULL,
  `BU_FAX_NO` char(11) DEFAULT NULL,
  `BU_CONTACT` char(11) NOT NULL,
  `SB_AREA` decimal(5,3) DEFAULT NULL,
  `DTI_REG_NO` int(11) DEFAULT NULL,
  `DTI_DATE` date DEFAULT NULL,
  `SEC_REG_NO` int(11) DEFAULT NULL,
  `SEC_DATE` date DEFAULT NULL,
  `BU_EMP_NO` int(5) DEFAULT NULL,
  `BU_UNIT_NO` int(11) NOT NULL,
  `BU_AREA` double(5,2) NOT NULL,
  `BU_CAPITALIZATION` double(5,2) DEFAULT NULL,
  `BN_ID` int(11) DEFAULT NULL,
  `TP_ID` int(11) DEFAULT NULL,
  `OT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BU_ID`),
  KEY `lgu_r_business_fk_1` (`BN_ID`),
  KEY `lgu_r_business_fk_2` (`TP_ID`),
  KEY `lgu_r_business_fk_4` (`OT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_business`:
--   `BN_ID`
--       `lgu_r_business_nature` -> `BN_ID`
--   `TP_ID`
--       `lgu_r_taxpayer` -> `TP_ID`
--   `OT_ID`
--       `lgu_r_ownership_type` -> `OT_ID`
--

--
-- Dumping data for table `lgu_r_business`
--

INSERT INTO `lgu_r_business` (`BU_ID`, `BU_NAME`, `BU_PRESIDENT`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_FAX_NO`, `BU_CONTACT`, `SB_AREA`, `DTI_REG_NO`, `DTI_DATE`, `SEC_REG_NO`, `SEC_DATE`, `BU_EMP_NO`, `BU_UNIT_NO`, `BU_AREA`, `BU_CAPITALIZATION`, `BN_ID`, `TP_ID`, `OT_ID`) VALUES
(7, 'bu_name', '', 'bu_loc', 'bu_pin', 'bu_lot_block', 'bu_faxno', 'bu_contact', '0.000', 0, '0000-00-00', NULL, NULL, 0, 0, 0.00, 0.00, 0, 0, 1),
(8, 'bu_name', '', 'bu_loc', 'bu_pin', 'bu_lot_block', 'bu_faxno', 'bu_contact', '0.000', 0, '0000-00-00', NULL, NULL, 0, 0, 0.00, 0.00, 0, 0, 1),
(14, 'bu_name', '', 'bu_loc', 'bu_pin', 'bu_lot_block', 'bu_faxno', 'bu_contact', '0.000', 0, '0000-00-00', NULL, NULL, 0, 0, 0.00, 0.00, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_business_nature`
--
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_business_nature` (
  `BN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BN_NAME` varchar(100) NOT NULL,
  `BN_CLASSIFICATION` varchar(50) NOT NULL,
  PRIMARY KEY (`BN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_business_nature`:
--

--
-- Dumping data for table `lgu_r_business_nature`
--

INSERT INTO `lgu_r_business_nature` (`BN_ID`, `BN_NAME`, `BN_CLASSIFICATION`) VALUES
(1, 'name', 'low scale');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_business_permit`
--
-- Creation: Aug 23, 2018 at 11:17 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_business_permit` (
  `BP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BP_NUMBER` int(11) NOT NULL,
  `BP_ISSUED_DATE` date NOT NULL,
  `BP_VALID_YEARS` int(3) DEFAULT NULL,
  `BP_REMARKS` varchar(300) NOT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  `AP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BP_ID`),
  KEY `lgu_r_business_permit_fk_1` (`BU_ID`),
  KEY `lgu_r_business_permit_fk_2` (`AP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_business_permit`:
--   `BU_ID`
--       `lgu_r_business` -> `BU_ID`
--   `AP_ID`
--       `lgu_r_bp_application` -> `AP_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_bu_ar`
--
-- Creation: Aug 23, 2018 at 11:17 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_bu_ar` (
  `AR_ID` int(11) DEFAULT NULL,
  `BU_ID` int(11) DEFAULT NULL,
  KEY `lgu_r_bu_ar_fk_1` (`BU_ID`),
  KEY `lgu_r_bu_ar_fk_2` (`AR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_bu_ar`:
--   `BU_ID`
--       `lgu_r_business` -> `BU_ID`
--   `AR_ID`
--       `lgu_r_authorize_rep` -> `AR_ID`
--

--
-- Dumping data for table `lgu_r_bu_ar`
--

INSERT INTO `lgu_r_bu_ar` (`AR_ID`, `BU_ID`) VALUES
(0, 0),
(0, 0),
(0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_division`
--
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_division` (
  `DIV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIV_NAME` varchar(50) NOT NULL,
  `DIV_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`DIV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_division`:
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_employee_profile`
--
-- Creation: Aug 17, 2018 at 06:09 AM
--

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
  `DIV_ID` int(11) NOT NULL,
  PRIMARY KEY (`EP_ID`),
  KEY `lgu_r_employee_profile_fk_1` (`DIV_ID`)
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
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_is_rented` (
  `RENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RENT_DATE_STARTED` date NOT NULL,
  `RENT_MONTHLY_RENTAL` double(5,2) NOT NULL,
  `RENT_LESSOR` varchar(100) NOT NULL,
  PRIMARY KEY (`RENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_is_rented`:
--

--
-- Dumping data for table `lgu_r_is_rented`
--

INSERT INTO `lgu_r_is_rented` (`RENT_ID`, `RENT_DATE_STARTED`, `RENT_MONTHLY_RENTAL`, `RENT_LESSOR`) VALUES
(1, '0000-00-00', 0.00, 'rent_lessor'),
(2, '0000-00-00', 0.00, 'rent_lessor'),
(3, '0000-00-00', 0.00, 'rent_lessor'),
(4, '0000-00-00', 0.00, 'rent_lessor'),
(5, '0000-00-00', 0.00, 'rent_lessor'),
(6, '0000-00-00', 0.00, 'rent_lessor'),
(7, '0000-00-00', 0.00, 'rent_lessor'),
(8, '0000-00-00', 0.00, 'rent_lessor'),
(9, '0000-00-00', 0.00, 'rent_lessor'),
(10, '0000-00-00', 0.00, 'rent_lessor'),
(11, '0000-00-00', 0.00, 'rent_lessor'),
(12, '0000-00-00', 0.00, 'rent_lessor'),
(13, '0000-00-00', 0.00, 'rent_lessor'),
(14, '0000-00-00', 0.00, 'rent_lessor'),
(15, '0000-00-00', 0.00, 'rent_lessor'),
(16, '0000-00-00', 0.00, 'rent_lessor');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_module`
--
-- Creation: Aug 17, 2018 at 06:09 AM
--

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
-- Creation: Aug 23, 2018 at 11:18 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_ot_req` (
  `OT_ID` int(11) DEFAULT NULL,
  `RT_ID` int(11) DEFAULT NULL,
  KEY `lgu_r_ot_req_fk_1` (`OT_ID`),
  KEY `lgu_r_ot_req_fk_2` (`RT_ID`)
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
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_ownership_type` (
  `OT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OT_NAME` varchar(50) NOT NULL,
  `OT_DESC` varchar(300) NOT NULL,
  PRIMARY KEY (`OT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_ownership_type`:
--

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_req_type`
--
-- Creation: Aug 17, 2018 at 06:09 AM
--

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
-- Creation: Aug 17, 2018 at 06:09 AM
--

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
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_role_mod` (
  `MOD_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  KEY `lgu_r_role_mod_fk_1` (`MOD_ID`),
  KEY `lgu_r_role_mod_fk_2` (`ROLE_ID`)
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
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_taxpayer` (
  `TP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TP_FNAME` varchar(50) NOT NULL,
  `TP_MNAME` varchar(50) DEFAULT NULL,
  `TP_LNAME` varchar(50) NOT NULL,
  `TP_NATIONALITY` varchar(50) DEFAULT 'Filipino',
  `TP_HOME_ADDRESS` varchar(300) NOT NULL,
  `TP_TIN` varchar(20) NOT NULL,
  `TP_SSS_NO` varchar(20) DEFAULT NULL,
  `TP_STATUS` varchar(10) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`TP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_taxpayer`:
--

--
-- Dumping data for table `lgu_r_taxpayer`
--

INSERT INTO `lgu_r_taxpayer` (`TP_ID`, `TP_FNAME`, `TP_MNAME`, `TP_LNAME`, `TP_NATIONALITY`, `TP_HOME_ADDRESS`, `TP_TIN`, `TP_SSS_NO`, `TP_STATUS`) VALUES
(1, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(2, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(3, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(4, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(5, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(6, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(7, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(8, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(9, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(10, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(11, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(12, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(13, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(14, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(15, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active'),
(16, 'tp_fname', 'tp_mname', 'tp_lname', 'Filipino', 'tp_address', 'tp_tin', 'tp_sssno', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_user`
--
-- Creation: Aug 17, 2018 at 06:09 AM
--

CREATE TABLE IF NOT EXISTS `lgu_r_user` (
  `U_ID` int(11) NOT NULL AUTO_INCREMENT,
  `U_USERNAME` varchar(25) NOT NULL,
  `U_PASSWORD` varchar(150) NOT NULL,
  `U_TYPE` varchar(30) NOT NULL,
  `U_STATUS` varchar(10) NOT NULL DEFAULT 'Active',
  `EP_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`U_ID`),
  KEY `lgu_r_user_fk_1` (`EP_ID`),
  KEY `lgu_r_user_fk_2` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_user`:
--   `EP_ID`
--       `lgu_r_employee_profile` -> `EP_ID`
--   `ROLE_ID`
--       `lgu_r_role` -> `ROLE_ID`
--

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lgu_r_attachments`
--
ALTER TABLE `lgu_r_attachments`
  ADD CONSTRAINT `lgu_r_attachments_fk_1` FOREIGN KEY (`AP_ID`) REFERENCES `lgu_r_bp_application` (`AP_ID`),
  ADD CONSTRAINT `lgu_r_attachments_fk_2` FOREIGN KEY (`RT_ID`) REFERENCES `lgu_r_req_type` (`RT_ID`);

--
-- Constraints for table `lgu_r_bp_application`
--
ALTER TABLE `lgu_r_bp_application`
  ADD CONSTRAINT `lgu_r_bp_application_fk_1` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`),
  ADD CONSTRAINT `lgu_r_bp_application_fk_2` FOREIGN KEY (`U_ID`) REFERENCES `lgu_r_user` (`U_ID`);

--
-- Constraints for table `lgu_r_business`
--
ALTER TABLE `lgu_r_business`
  ADD CONSTRAINT `lgu_r_business_fk_1` FOREIGN KEY (`BN_ID`) REFERENCES `lgu_r_business_nature` (`BN_ID`),
  ADD CONSTRAINT `lgu_r_business_fk_2` FOREIGN KEY (`TP_ID`) REFERENCES `lgu_r_taxpayer` (`TP_ID`),
  ADD CONSTRAINT `lgu_r_business_fk_4` FOREIGN KEY (`OT_ID`) REFERENCES `lgu_r_ownership_type` (`OT_ID`);

--
-- Constraints for table `lgu_r_business_permit`
--
ALTER TABLE `lgu_r_business_permit`
  ADD CONSTRAINT `lgu_r_business_permit_fk_1` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`),
  ADD CONSTRAINT `lgu_r_business_permit_fk_2` FOREIGN KEY (`AP_ID`) REFERENCES `lgu_r_bp_application` (`AP_ID`);

--
-- Constraints for table `lgu_r_bu_ar`
--
ALTER TABLE `lgu_r_bu_ar`
  ADD CONSTRAINT `lgu_r_bu_ar_fk_1` FOREIGN KEY (`BU_ID`) REFERENCES `lgu_r_business` (`BU_ID`),
  ADD CONSTRAINT `lgu_r_bu_ar_fk_2` FOREIGN KEY (`AR_ID`) REFERENCES `lgu_r_authorize_rep` (`AR_ID`);

--
-- Constraints for table `lgu_r_employee_profile`
--
ALTER TABLE `lgu_r_employee_profile`
  ADD CONSTRAINT `lgu_r_employee_profile_fk_1` FOREIGN KEY (`DIV_ID`) REFERENCES `lgu_r_division` (`DIV_ID`);

--
-- Constraints for table `lgu_r_ot_req`
--
ALTER TABLE `lgu_r_ot_req`
  ADD CONSTRAINT `lgu_r_ot_req_fk_1` FOREIGN KEY (`OT_ID`) REFERENCES `lgu_r_ownership_type` (`OT_ID`),
  ADD CONSTRAINT `lgu_r_ot_req_fk_2` FOREIGN KEY (`RT_ID`) REFERENCES `lgu_r_req_type` (`RT_ID`);

--
-- Constraints for table `lgu_r_role_mod`
--
ALTER TABLE `lgu_r_role_mod`
  ADD CONSTRAINT `lgu_r_role_mod_fk_1` FOREIGN KEY (`MOD_ID`) REFERENCES `lgu_r_module` (`MOD_ID`),
  ADD CONSTRAINT `lgu_r_role_mod_fk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `lgu_r_role` (`ROLE_ID`);

--
-- Constraints for table `lgu_r_user`
--
ALTER TABLE `lgu_r_user`
  ADD CONSTRAINT `lgu_r_user_fk_1` FOREIGN KEY (`EP_ID`) REFERENCES `lgu_r_employee_profile` (`EP_ID`),
  ADD CONSTRAINT `lgu_r_user_fk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `lgu_r_role` (`ROLE_ID`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
