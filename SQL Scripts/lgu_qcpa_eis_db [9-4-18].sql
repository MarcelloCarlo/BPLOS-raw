-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2018 at 06:45 AM
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
CREATE DATABASE IF NOT EXISTS `lgu_qcpa_eis_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lgu_qcpa_eis_db`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `lgu_application_sp`$$
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
-- Creation: Sep 04, 2018 at 01:27 AM
--

DROP TABLE IF EXISTS `lgu_r_attachments`;
CREATE TABLE IF NOT EXISTS `lgu_r_attachments` (
  `AT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AT_UNIFIED_FILE` text NOT NULL,
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
  `AP_Remarks` text NOT NULL,
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
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_authorize_rep`;
CREATE TABLE IF NOT EXISTS `lgu_r_authorize_rep` (
  `AR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AR_FNAME` varchar(50) NOT NULL,
  `AR_MNAME` varchar(50) DEFAULT NULL,
  `AR_LNAME` varchar(50) NOT NULL,
  `AR_POSITION` varchar(50) DEFAULT NULL,
  `AR_HOME_ADDRESS` varchar(300) NOT NULL,
  PRIMARY KEY (`AR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_authorize_rep`:
--

--
-- Dumping data for table `lgu_r_authorize_rep`
--

INSERT INTO `lgu_r_authorize_rep` (`AR_ID`, `AR_FNAME`, `AR_MNAME`, `AR_LNAME`, `AR_POSITION`, `AR_HOME_ADDRESS`) VALUES
(1, 'Dizon', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(2, 'Dizon', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(3, 'Dizon', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(4, 'Dizon', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(5, 'Dizon', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(6, 'Dizon', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(7, 'Dizon', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(8, 'Dizon', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(9, 'Dizon', 'Garrido', 'Dizon', NULL, 'Edi Sa Puso moo'),
(10, 'Dizon', 'Garrido', 'Dizon', NULL, 'Edi Sa Puso moo'),
(11, 'Dizon', 'Mae', 'Dizon', NULL, 'Augmented Divisoria'),
(12, 'Olive', 'Oil', 'Gabriel', NULL, 'Stonewall, NYC'),
(13, 'Olive', 'Oil', 'Gabriel', NULL, 'Stonewall, NYC'),
(14, 'Olive', 'Oil', 'Gabriel', NULL, 'Stonewall, NYC'),
(15, 'Olive', 'Oil', 'Gabriel', NULL, 'Stonewall, NYC'),
(16, 'Malene', 'GarridoX', 'Dizon', NULL, 'basta somewhere'),
(17, 'Malene', 'GarridoX', 'Dizon', NULL, 'basta somewhere'),
(18, 'Ronnnnnelynn', 'Villegas las vegas', 'Villegas', NULL, 'Sa may Q. Ave'),
(19, 'Ronnnnnelynn', 'Villegas las vegas', 'Villegas', NULL, 'Sa may Q. Ave'),
(20, 'Malene', 'Mae', 'Dizon', NULL, 'Line Corner'),
(21, 'Malene', 'Mae', 'Dizon', NULL, 'Line Corner'),
(22, 'Malene', 'MaAEE', 'Dizon', NULL, 'basta somewhereX'),
(23, 'Malene', 'MaAEE', 'Dizon', NULL, 'basta somewhereX'),
(24, 'Malene', 'MaAEE', 'Dizon', NULL, 'basta somewhereX'),
(25, 'Malene', 'MaAEE', 'Dizon', NULL, 'basta somewhereX'),
(26, 'Malene', 'Apo', 'Dizon', NULL, 'Batasan Road'),
(27, 'Malene', 'Garrido', 'Dizon', NULL, 'basta somewhere'),
(28, 'Malene', 'Garrido', 'Dizon', NULL, 'basta somewhere');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(1, '164-180903', '2018-09-03', 'New', 1, NULL),
(2, '275-180903', '2018-09-03', 'New', 2, NULL),
(3, '386-180903', '2018-09-03', 'New', 3, NULL),
(4, '497-180903', '2018-09-03', 'New', 4, NULL),
(5, '5108-180903', '2018-09-03', 'New', 5, NULL),
(6, '6119-180903', '2018-09-03', 'New', 6, NULL),
(7, '71311-180903', '2018-09-03', 'Renew', 7, NULL),
(8, '81412-180903', '2018-09-03', 'New', 8, NULL),
(9, '91513-180903', '2018-09-03', 'New', 9, NULL),
(10, '101614-180903', '2018-09-03', 'New', 10, NULL),
(11, '111715-180903', '2018-09-03', 'Renew', 11, NULL),
(12, '121816-180903', '2018-09-03', 'Renew', 12, NULL),
(13, '131917-180903', '2018-09-03', 'New', 13, NULL),
(14, '142018-180903', '2018-09-03', 'New', 14, NULL),
(15, '152119-180903', '2018-09-03', 'New', 15, NULL),
(16, '162220-180903', '2018-09-03', 'New', 16, NULL),
(17, '172321-180903', '2018-09-03', 'New', 17, NULL),
(18, '182422-180903', '2018-09-03', 'New', 18, NULL),
(19, '192523-180903', '2018-09-03', 'New', 19, NULL),
(20, '202624-180904', '2018-09-04', 'New', 20, NULL),
(21, '212725-180904', '2018-09-04', 'New', 21, NULL),
(22, '222826-180904', '2018-09-04', 'New', 22, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_business`:
--   `BN_ID`
--       `lgu_r_business_nature` -> `BN_ID`
--   `OT_ID`
--       `lgu_r_ownership_type` -> `OT_ID`
--   `TP_ID`
--       `lgu_r_taxpayer` -> `TP_ID`
--

--
-- Dumping data for table `lgu_r_business`
--

INSERT INTO `lgu_r_business` (`BU_ID`, `BU_NAME`, `BU_PRESIDENT`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_FAX_NO`, `BU_CONTACT`, `SB_AREA`, `DTI_REG_NO`, `DTI_DATE`, `SEC_REG_NO`, `SEC_DATE`, `BU_EMP_NO`, `BU_UNIT_NO`, `BU_AREA`, `BU_CAPITALIZATION`, `BN_ID`, `TP_ID`, `OT_ID`) VALUES
(1, 'La Creme PutCarideria', NULL, '65f 7869 T. Ave T. Sora', '6876876', '78576', '768745', '45664456', 45666, 6786687, '2018-08-26', NULL, NULL, 45, 435, 45666, 453453, 4, 4, 1),
(2, 'Mamita Carinderia', NULL, '65f 7869 T. Ave T. Sora', '6876876', '57656', '456456', '4564566', 56533, 6786687, '2018-08-26', NULL, NULL, 45, 435, 56533, 453453, 4, 5, 1),
(3, 'Soup De ganda', NULL, '59f 8898 Tambuntingga Tandang Sora', '6876876', '23453', '234554', '2345234', 56533, 2345352, '2018-08-26', NULL, NULL, 45, 435, 56533, 453453, 4, 6, 1),
(4, 'Beyence bOULET', NULL, '1f 435 T. AveT T. Sora', '6876876', '465465', '768745', '78745', 56533, 6786687, '2018-08-26', NULL, NULL, 23, 435, 56533, 453453, 4, 7, 1),
(5, 'Beyence bOULET', NULL, '1f 435 T. AveT T. Sora', '6876876', '465465', '768745', '78745', 56533, 6786687, '2018-08-26', NULL, NULL, 23, 435, 56533, 453453, 4, 8, 1),
(6, 'Mami Del PuutaSerya', NULL, '65f 7869 T. Ave T. Sora', '6876876', '452456', '456-4564', '789-6789', 34535, 6786687, '2018-08-26', NULL, NULL, 45, 435, 34535, 453453, 4, 9, 1),
(7, 'Cook n Slaying', NULL, 'Ultra Stall 775 Khemerlyn Katips', '6876876', '745646', '546-5465', '784-5654', 66.6, 6786687, '2018-08-26', NULL, NULL, 45, 435, 66.6, 453453, 4, 11, 1),
(8, 'Cook n Slaying', NULL, 'Ultra Stall 775 Khemerlyn Katips', '6876876', '745646', '546-5465', '784-5654', 66.6, 6786687, '2018-08-26', NULL, NULL, 45, 435, 66.6, 453453, 4, 12, 1),
(9, 'Cook n Slaying', NULL, 'Ultra Stall 775 Khemerlyn Katips', '6876876', '745646', '546-5465', '784-5654', 66.6, 6786687, '2018-08-26', NULL, NULL, 45, 435, 66.6, 453453, 4, 13, 1),
(10, 'La Creme PutCarideria', NULL, '65f 7869 T. Ave T. Sora', '6876876', '456456', '456-4645', '456-4566', 56533, 6786687, '2018-08-26', NULL, NULL, 45, 435, 56533, 453453, 4, 14, 1),
(11, 'La Creme PutCarideria', NULL, '65f 7869 T. Ave T. Sora', '6876876', '456456', '456-4645', '456-4566', 56533, 6786687, '2018-08-26', NULL, NULL, 45, 435, 56533, 453453, 4, 15, 1),
(12, 'Lana Del Soupas', NULL, 'Main Stall 7845 Food St. Tandang Sora', '48765465', '5646456', '661-6655', '962-2061', 2345, 565465465, '2017-06-25', NULL, NULL, 10, 435, 2345, 453453, 4, 16, 1),
(13, 'Lana Del Soupas', NULL, 'Main Stall 7845 Food St. Tandang Sora', '48765465', '5646456', '661-6655', '962-2061', 2345, 565465465, '2017-06-25', NULL, NULL, 10, 435, 2345, 453453, 4, 17, 1),
(14, 'Lagari Administrative Ofisu', NULL, '7 Floor 546 T. Ave T. Sora', '6876876', '4532456', '456-4564', '452-4464', 56533, 6786687, '2018-08-26', NULL, NULL, 45, 34, 56533, 453453, 2, 18, 1),
(15, 'Lagari Administrative Ofisu', NULL, '7 Floor 546 T. Ave T. Sora', '6876876', '4532456', '456-4564', '452-4464', 56533, 6786687, '2018-08-26', NULL, NULL, 45, 34, 56533, 453453, 2, 19, 1),
(16, 'La Roux Office', NULL, '45 789 Calle Tandang Sora', '6876876', '222', '242-4424', '242-3423', 56533, 234, '2018-08-26', NULL, NULL, 23, 435, 56533, 453453, 6, 20, 1),
(17, 'La Roux Office', NULL, '45 789 Calle Tandang Sora', '6876876', '222', '242-4424', '242-3423', 56533, 234, '2018-08-26', NULL, NULL, 23, 435, 56533, 453453, 6, 21, 1),
(18, 'La Roux Office', NULL, '45 789 Calle Tandang Sora', '6876876', '222', '242-4424', '242-3423', 56533, 234, '2018-08-26', NULL, NULL, 23, 435, 56533, 453453, 6, 22, 1),
(19, 'La Roux Office', NULL, '45 789 Calle Tandang Sora', '6876876', '222', '242-4424', '242-3423', 56533, 234, '2018-08-26', NULL, NULL, 23, 435, 56533, 453453, 6, 23, 1),
(20, 'La Cafe en Garde', NULL, '65f 789 Kinamay Tandang Sora', '78766', '564652', '784-5421', '965-6223', 565, 645646, '2018-01-07', NULL, NULL, 20, 34, 565, 453, 4, 24, 1),
(21, 'La Creme Put', NULL, '1f 8765 Street Fighter Tandang Sora', '654565', '7897465', '564-6523', '985-6321', 45, 56464654, '2015-09-27', NULL, NULL, 7, 34, 45, 453453, 4, 25, 1),
(22, 'La Creme Put', NULL, '1f 8765 Street Fighter Tandang Sora', '654565', '7897465', '564-6523', '985-6321', 45, 56464654, '2015-09-27', NULL, NULL, 7, 34, 45, 453453, 4, 26, 1);

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
  `BN_CLASSIFICATION` char(1) NOT NULL,
  PRIMARY KEY (`BN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_business_nature`:
--

--
-- Dumping data for table `lgu_r_business_nature`
--

INSERT INTO `lgu_r_business_nature` (`BN_ID`, `BN_NAME`, `BN_CLASSIFICATION`) VALUES
(1, 'Accounting Services', 'S'),
(2, 'Administrative Office', 'S'),
(3, 'Building Maintenance', 'S'),
(4, 'Carinderias', 'S'),
(5, 'Consultancy Firms', 'S'),
(6, 'Deep Well Drilling Office', 'S'),
(7, 'Engineering Services', 'S'),
(8, 'General Building Contractor', 'S');

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

--
-- Dumping data for table `lgu_r_bu_ar`
--

INSERT INTO `lgu_r_bu_ar` (`AR_ID`, `BU_ID`) VALUES
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
(28, 22);

-- --------------------------------------------------------

--
-- Table structure for table `lgu_r_division`
--
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_division`;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_is_rented`:
--

--
-- Dumping data for table `lgu_r_is_rented`
--

INSERT INTO `lgu_r_is_rented` (`RENT_ID`, `RENT_DATE_STARTED`, `RENT_MONTHLY_RENTAL`, `RENT_LESSOR`) VALUES
(1, '2018-08-26', 45664, 'Carlo'),
(2, '2018-08-26', 45664, 'Carlo'),
(3, '2018-08-26', 45664, 'Carlo'),
(4, '2018-08-26', 45664, '45456'),
(5, '2018-08-26', 45664, '45456'),
(6, '2018-08-26', 45664, 'Carlo'),
(7, '2018-08-26', 45664, 'Carlo'),
(8, '2018-08-26', 45664, 'Carlo'),
(9, '2018-08-26', 45664, 'Carlo'),
(10, '2018-08-26', 45664, 'Maperang Vaccla'),
(11, '2018-08-26', 23423, 'Corporal'),
(12, '2018-08-26', 23423, 'Corporal'),
(13, '2018-08-26', 23423, 'Corporal'),
(14, '2018-08-26', 23423, 'Corporal'),
(15, '2018-08-26', 45664, 'Carlo'),
(16, '2018-08-26', 45664, 'Carlo'),
(17, '2018-06-04', 45664, 'Carlo'),
(18, '2018-06-04', 45664, 'Carlo'),
(19, '2018-08-26', 45664, 'Carlo Gutierrez'),
(20, '2018-08-26', 45664, 'Carlo Gutierrez'),
(21, '2018-08-26', 45664, 'Carlo'),
(22, '2018-08-26', 45664, 'Carlo'),
(23, '2018-08-26', 45664, 'Carlo'),
(24, '2018-08-26', 45664, 'Carlo'),
(25, '2018-04-01', 45664, 'Carlo Gutierrez'),
(26, '2018-02-25', 45664, 'Carlo Gutierrez'),
(27, '2018-02-25', 45664, 'Carlo Gutierrez');

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
-- Creation: Aug 28, 2018 at 03:53 AM
--

DROP TABLE IF EXISTS `lgu_r_taxpayer`;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lgu_r_taxpayer`:
--

--
-- Dumping data for table `lgu_r_taxpayer`
--

INSERT INTO `lgu_r_taxpayer` (`TP_ID`, `TP_FNAME`, `TP_MNAME`, `TP_LNAME`, `TP_NATIONALITY`, `TP_HOME_ADDRESS`, `TP_TIN`, `TP_SSS_NO`, `TP_STATUS`) VALUES
(1, 'ALYNA', 'MAeMae', 'APO', 'Filipino', 'basta somewhere', '8676455', '456456', 'Active'),
(2, 'ALYNA', 'MAeMae', 'APO', 'Filipino', 'basta somewhere', '8676455', '454646', 'Active'),
(3, 'ALYNA', 'MAeMae', 'APO', 'Filipino', 'basta somewhere', '8676455', '456456', 'Active'),
(4, 'ALYNA', 'MAeMae', 'APO', 'Filipino', 'basta somewhere', '8676455', '456456', 'Active'),
(5, 'ALYNA', 'MAeMae', 'APO', 'Filipino', 'basta somewhere', '8676455', '456456', 'Active'),
(6, 'JOHN Carlo ', 'Villar', 'Gutierrez', 'Filipino', '6969 Tambuntingga Tandang Sora Quezon City', '3245', '2345235', 'Active'),
(7, 'Maria', 'Mariaaaaaaa', 'Alejandria', 'Filipino', '785 kabaw Firviw Quezon City', '8676455', '454646', 'Active'),
(8, 'Maria', 'Mariaaaaaaa', 'Alejandria', 'Filipino', '785 kabaw Firviw Quezon City', '8676455', '454646', 'Active'),
(9, 'Patrick', 'Loyololololol', 'Alejandria', 'Filipino', '666 TokwatBeyonce T. Sora Quezon City', '8676455', '454646', 'Active'),
(10, 'Turonnelyn', 'Jhemerlyn', 'Villegurs', 'Filipino', '45 Vending Street Tandang Katips Quezon City', '8676455', '78745645', 'Active'),
(11, 'Turonnelyn', 'Jhemerlyn', 'Villegurs', 'Filipino', '45 Vending Street Tandang Katips Quezon City', '8676455', '78745645', 'Active'),
(12, 'Turonnelyn', 'Jhemerlyn', 'Villegurs', 'Filipino', '45 Vending Street Tandang Katips Quezon City', '8676455', '78745645', 'Active'),
(13, 'Turonnelyn', 'Jhemerlyn', 'Villegurs', 'Filipino', '45 Vending Street Tandang Katips Quezon City', '8676455', '78745645', 'Active'),
(14, 'ALYNA', 'MAeMae', 'APO', 'Filipino', '666 Tokwa T. Sora Quezon City', '8676455', '4564456', 'Active'),
(15, 'ALYNA', 'MAeMae', 'APO', 'Filipino', '666 Tokwa T. Sora Quezon City', '8676455', '4564456', 'Active'),
(16, 'John Carlo', 'Gutierrez', 'Aligaen', 'Filipino', '4545 Food St. Tandang Sora Quezon City', '5654645', '454646', 'Active'),
(17, 'John Carlo', 'Gutierrez', 'Aligaen', 'Filipino', '4545 Food St. Tandang Sora Quezon City', '5654645', '454646', 'Active'),
(18, 'Alyana', 'Venti', 'Grande', 'Filipino', '667 Admin Land Quezon Ave. Quezon City', '8676455', '454646', 'Active'),
(19, 'Alyana', 'Venti', 'Grande', 'Filipino', '667 Admin Land Quezon Ave. Quezon City', '8676455', '454646', 'Active'),
(20, 'Venti', 'Grande', 'APO', 'Filipino', '45 Chenka Tandang Sora Quezon City', '8676455', '234234234', 'Active'),
(21, 'Venti', 'Grande', 'APO', 'Filipino', '45 Chenka Tandang Sora Quezon City', '8676455', '234234234', 'Active'),
(22, 'Venti', 'Grande', 'APO', 'Filipino', '45 Chenka Tandang Sora Quezon City', '8676455', '234234234', 'Active'),
(23, 'Venti', 'Grande', 'APO', 'Filipino', '45 Chenka Tandang Sora Quezon City', '8676455', '234234234', 'Active'),
(24, 'John Carlo', 'Villar', 'Gutierrez', 'Filipino', '985 Kinamay Tandang Sora Quezon City', '654646', '454646', 'Active'),
(25, 'Malene', 'Dizon', 'APO', 'Filipino', '878 Seyla T. Sora Quezon City', '4654654', '454646', 'Active'),
(26, 'Malene', 'Dizon', 'APO', 'Filipino', '878 Seyla T. Sora Quezon City', '4654654', '454646', 'Active');

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
