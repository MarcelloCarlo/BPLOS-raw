-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2019 at 11:03 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lgu_paeis_db`
--
USE lgu_paeis_db;
-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_actual_use`
--

DROP TABLE IF EXISTS `rpt_r_actual_use`; CREATE TABLE `rpt_r_actual_use` (
  `AU_ID` int(7) NOT NULL,
  `AU_CODE` varchar(5) NOT NULL,
  `AU_DESC` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rpt_r_actual_use`
--

INSERT INTO `rpt_r_actual_use` (`AU_ID`, `AU_CODE`, `AU_DESC`) VALUES
(1, 'AR', 'Residential'),
(2, 'AC', 'Commercial'),
(3, 'AI', 'Industrial'),
(4, 'AA', 'Agricultural'),
(5, 'AM', 'Mineral'),
(6, 'ATF', 'Timberland or Forest'),
(7, 'ASH', 'Hospital'),
(8, 'ASC', 'Cultural'),
(9, 'ASS', 'Scientific'),
(10, 'ASLWD', 'Local Water District'),
(11, 'ACH', 'Charitable'),
(12, 'ARE', 'Religious'),
(13, 'ARC', 'Recreational'),
(14, 'AED', 'Educational'),
(15, 'ACT', 'Cemetery'),
(16, 'ARK', 'Park'),
(17, 'ANG', 'Gov-National'),
(18, 'APG', 'Gov-Provincial'),
(19, 'ACG', 'Gov-City'),
(20, 'AMG', 'Gov-Municipality'),
(21, 'ABG', 'Gov-Barangay'),
(22, 'AGOCC', 'Gov-Corporation'),
(23, 'T1', 'Test 1');

-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_assessment_lvl`
--
DROP TABLE IF EXISTS `rpt_r_assessment_lvl`; CREATE TABLE `rpt_r_assessment_lvl` (
  `AL_ID` int(7) NOT NULL,
  `PT_ID` int(7) NOT NULL,
  `PC_ID` int(7) NOT NULL,
  `AL_MIN_FMV` int(10) DEFAULT NULL,
  `AL_MAX_FMV` int(10) DEFAULT NULL,
  `AL_VAL` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rpt_r_assessment_lvl`
--

INSERT INTO `rpt_r_assessment_lvl` (`AL_ID`, `PT_ID`, `PC_ID`, `AL_MIN_FMV`, `AL_MAX_FMV`, `AL_VAL`) VALUES
(3, 1, 1, NULL, NULL, 0.4),
(4, 1, 2, NULL, NULL, 0.2),
(5, 1, 3, NULL, NULL, 0.5),
(6, 1, 4, NULL, NULL, 0.5),
(7, 1, 5, NULL, NULL, 0.5),
(8, 1, 6, NULL, NULL, 0.2),
(19, 2, 1, NULL, NULL, 0.4),
(20, 2, 2, NULL, NULL, 0.5),
(21, 2, 3, NULL, NULL, 0.8),
(22, 2, 4, NULL, NULL, 0.8),
(23, 3, 1, 0, 300000, 0.25),
(24, 3, 1, 300000, 500000, 0.3),
(25, 3, 1, 500000, 750000, 0.35),
(26, 3, 1, 750000, 1000000, 0.4),
(27, 3, 1, 1000000, 2000000, 0.45),
(28, 3, 1, 2000000, NULL, 0.5),
(29, 3, 2, 0, 175000, 0),
(30, 3, 2, 175000, 300000, 0.1),
(31, 3, 2, 300000, 500000, 0.2),
(32, 3, 2, 500000, 750000, 0.25),
(33, 3, 2, 750000, 1000000, 0.3),
(34, 3, 2, 1000000, 2000000, 0.35),
(35, 3, 2, 2000000, 5000000, 0.4),
(36, 3, 2, 5000000, 10000000, 0.5),
(37, 3, 2, 10000000, NULL, 0.6),
(38, 3, 3, 0, 300000, 30),
(39, 3, 3, 300000, 500000, 35),
(40, 3, 3, 500000, 750000, 40),
(41, 3, 3, 750000, 1000000, 50),
(42, 3, 3, 1000000, 2000000, 60),
(43, 3, 3, 2000000, 5000000, 70),
(44, 3, 3, 5000000, 10000000, 75),
(45, 3, 3, 10000000, NULL, 80),
(46, 3, 4, 0, 300000, 30),
(47, 3, 4, 300000, 500000, 35),
(48, 3, 4, 500000, 750000, 40),
(49, 3, 4, 750000, 1000000, 50),
(50, 3, 4, 1000000, 2000000, 60),
(51, 3, 4, 2000000, 5000000, 70),
(52, 3, 4, 5000000, 10000000, 75),
(53, 3, 4, 10000000, NULL, 80),
(54, 3, 6, 0, 300000, 45),
(55, 3, 6, 300000, 500000, 50),
(56, 3, 6, 500000, 750000, 55),
(57, 3, 6, 750000, 1000000, 60),
(58, 3, 6, 1000000, 2000000, 70),
(59, 3, 6, 2000000, NULL, 80),
(60, 1, 13, NULL, NULL, 15),
(61, 1, 14, NULL, NULL, 15),
(62, 1, 15, NULL, NULL, 15),
(63, 1, 16, NULL, NULL, 10),
(64, 1, 17, NULL, NULL, 10),
(65, 2, 13, NULL, NULL, 15),
(66, 2, 14, NULL, NULL, 15),
(67, 2, 15, NULL, NULL, 15),
(68, 2, 16, NULL, NULL, 10),
(69, 2, 17, NULL, NULL, 10),
(70, 3, 13, NULL, NULL, 15),
(71, 3, 14, NULL, NULL, 15),
(72, 3, 15, NULL, NULL, 15),
(73, 3, 16, NULL, NULL, 10),
(74, 3, 17, NULL, NULL, 10),
(75, 1, 1, NULL, NULL, 22);

-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_fee_list`
--

DROP TABLE IF EXISTS `rpt_r_fee_list`; CREATE TABLE `rpt_r_fee_list` (
  `RPTFL_ID` int(11) NOT NULL,
  `RPTFL_NAME` varchar(100) NOT NULL,
  `RPTFL_AMOUNT` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_mrktval_agri`
--

DROP TABLE IF EXISTS `rpt_r_mrktval_agri`; CREATE TABLE `rpt_r_mrktval_agri` (
  `MVA_ID` int(7) NOT NULL,
  `PC_ID` int(7) NOT NULL,
  `MVA_CODE` varchar(100) NOT NULL,
  `MVA_DESC` varchar(100) NOT NULL,
  `MVA_CATE` varchar(100) NOT NULL,
  `MVA_SUBCAT` varchar(100) NOT NULL,
  `MVA_VAL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rpt_r_mrktval_agri`
--

INSERT INTO `rpt_r_mrktval_agri` (`MVA_ID`, `PC_ID`, `MVA_CODE`, `MVA_DESC`, `MVA_CATE`, `MVA_SUBCAT`, `MVA_VAL`) VALUES
(1, 1, 'testcode', 'testdesc', 'testcategory', 'testsubcat', 'testval'),
(2, 3, 'code', 'desc', 'cat', 'subcat', 'calue'),
(3, 1, 'test code 3', 'test desc 3', 'test cat 3', 'test subcat 3', '3');

-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_mrktval_bldg`
--

DROP TABLE IF EXISTS `rpt_r_mrktval_bldg`; CREATE TABLE `rpt_r_mrktval_bldg` (
  `MVB_ID` int(7) NOT NULL,
  `PC_ID` int(7) NOT NULL,
  `MVB_TYPE` varchar(100) NOT NULL,
  `MVB_SUBCLASS` varchar(100) NOT NULL,
  `MVB_DESC` varchar(100) NOT NULL,
  `MVB_SUBDESC` varchar(100) NOT NULL,
  `MVB_VAL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_mrktval_land`
--

DROP TABLE IF EXISTS `rpt_r_mrktval_land`; CREATE TABLE `rpt_r_mrktval_land` (
  `MVL_ID` int(7) NOT NULL,
  `PC_ID` int(7) NOT NULL,
  `AU_ID` int(7) NOT NULL,
  `MVL_SUBCLASS` varchar(50) NOT NULL,
  `MVL_VAL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_property_class`
--

DROP TABLE IF EXISTS `rpt_r_property_class`; CREATE TABLE `rpt_r_property_class` (
  `PC_ID` int(7) NOT NULL,
  `PC_CODE` varchar(5) NOT NULL,
  `PC_DESC` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rpt_r_property_class`
--

INSERT INTO `rpt_r_property_class` (`PC_ID`, `PC_CODE`, `PC_DESC`) VALUES
(1, 'A', 'Agricultural'),
(2, 'R', 'Residential'),
(3, 'C', 'Commercial'),
(4, 'I', 'Industrial'),
(5, 'M', 'Mineral'),
(6, 'T', 'Timberland or Forest'),
(13, 'SH', 'S-Hospital'),
(14, 'SC', 'S-Cultural'),
(15, 'SS', 'S-Scientific'),
(16, 'SW', 'S-Local Water District'),
(17, 'SG', 'S-Generation or Distribution of Electric Power');

-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_property_type`
--

DROP TABLE IF EXISTS `rpt_r_property_type`; CREATE TABLE `rpt_r_property_type` (
  `PT_ID` int(7) NOT NULL,
  `PT_CODE` varchar(5) NOT NULL,
  `PT_DESC` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rpt_r_property_type`
--

INSERT INTO `rpt_r_property_type` (`PT_ID`, `PT_CODE`, `PT_DESC`) VALUES
(1, 'L', 'Land'),
(2, 'M', 'Machinery'),
(3, 'B', 'Building or Other Structure'),
(4, 'SC', 'Special Classes'),
(5, 'T', 'Trees ');

-- --------------------------------------------------------

--
-- Table structure for table `rpt_r_rate`
--

DROP TABLE IF EXISTS `rpt_r_rate`; CREATE TABLE `rpt_r_rate` (
  `RPTR_ID` int(7) NOT NULL,
  `RPTR_LOC` varchar(100) NOT NULL,
  `RPTR_RATE` DECIMAL(11) NOT NULL,
  `RPTR_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_t_assessment`
--

DROP TABLE IF EXISTS `rpt_t_assessment`; CREATE TABLE `rpt_t_assessment` (
  `RPTA_ID` int(7) NOT NULL,
  `RPL_ID` int(7) NOT NULL,
  `PC_ID` int(7) NOT NULL,
  `MRKT_VAL` decimal(10,0) NOT NULL,
  `AU_ID` int(7) NOT NULL,
  `AL_ID` int(7) NOT NULL,
  `ASSESSED_VAL` int(11) NOT NULL,
  `RPTA_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ARP_NO` varchar(11) NOT NULL,
  `ASSESSMENT_EFFECTIVITY` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ASSESSED_BY` varchar(100) NOT NULL,
  `APPROVED_BY` varchar(100) NOT NULL,
  `FLAG` enum('TAXABLE','EXEMPT') NOT NULL DEFAULT 'TAXABLE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_t_fl_tb`
--

DROP TABLE IF EXISTS `rpt_t_fl_tb`; CREATE TABLE `rpt_t_fl_tb` (
  `RPTTB_ID` int(11) NOT NULL,
  `RPTFL_ID` int(11) NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_t_official_receipt`
--

DROP TABLE IF EXISTS `rpt_t_official_receipt`; CREATE TABLE `rpt_t_official_receipt` (
  `RPTOR_ID` int(7) NOT NULL,
  `RPTOR_NUMBER` varchar(9) NOT NULL,
  `RPTOR_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RPTOR_TOT_AMNT` decimal(7,0) NOT NULL,
  `RPTOR_TW_CH_MO_NO` varchar(15) NOT NULL,
  `RPTOR_TW_CH_MO_DATE` date NOT NULL,
  `RPTOR_PYMT_TYPE` enum('Cash','Check','Money Order','Treasury Warrant') NOT NULL DEFAULT 'Cash',
  `OIC_CITY_TREASURER` int(7) DEFAULT NULL,
  `RPTTB_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_t_rptax`
--

DROP TABLE IF EXISTS `rpt_t_rptax`; CREATE TABLE `rpt_t_rptax` (
  `RPTAX_ID` int(7) NOT NULL,
  `RPTA_ID` int(7) NOT NULL,
  `RPTR_ID` int(7) NOT NULL,
  `RPT_AMOUNT` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_t_rp_land`
--

DROP TABLE IF EXISTS `rpt_t_rp_land`; CREATE TABLE `rpt_t_rp_land` (
  `RPL_ID` int(7) NOT NULL,
  `RPL_PIN` varchar(20) NOT NULL,
  `RPO_ID` int(7) NOT NULL,
  `RPL_L_NO_LOT_BLK` varchar(100) NOT NULL,
  `RPL_L_STREET` varchar(100) NOT NULL,
  `RPL_L_BRGY` varchar(100) NOT NULL,
  `RPL_L_DIST_MUNI` varchar(100) NOT NULL,
  `RPL_L_CITY_PROV` varchar(100) NOT NULL,
  `RPL_B_NORTH` varchar(100) DEFAULT NULL,
  `RPL_B_EAST` varchar(100) DEFAULT NULL,
  `RPL_B_SOUTH` varchar(100) DEFAULT NULL,
  `RPL_B_WEST` varchar(100) DEFAULT NULL,
  `RPL_AREA` decimal(10,3) NOT NULL,
  `PC_ID` int(7) NOT NULL,
  `PT_ID` int(7) NOT NULL,
  `AU_ID` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_t_rp_owner`
--

DROP TABLE IF EXISTS `rpt_t_rp_owner`;CREATE TABLE `rpt_t_rp_owner` (
  `RPO_ID` int(7) NOT NULL,
  `RPO_SNAME` varchar(100) NOT NULL,
  `RPO_FNAME` varchar(100) NOT NULL,
  `RPO_MNAME` varchar(100) NOT NULL,
  `RPO_ADDR` varchar(300) NOT NULL,
  `RPO_CONT` varchar(100) NOT NULL,
  `RPO_EMAIL` varchar(100) DEFAULT NULL,
  `RPO_TIN` varchar(50) NOT NULL,
  `RPO_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_t_taxbill`
--

DROP TABLE IF EXISTS `rpt_t_taxbill`;CREATE TABLE `rpt_t_taxbill` (
  `RPTTB_ID` int(11) NOT NULL,
  `RPTTB_BILL_NO` varchar(30) NOT NULL,
  `RPTTB_DATE_BILLED` date NOT NULL,
  `RPTAX_ID` int(7) NOT NULL,
  `RPTTD_ID` int(7) NOT NULL,
  `RPL_ID` int(7) NOT NULL,
  `RPO_ID` int(7) NOT NULL,
  `RPTA_ID` int(7) NOT NULL,
  `TAX_YEAR` date NOT NULL,
  `INSTALLMENT` enum('FULL','SEMI ANNUAL','QUARTERLY') NOT NULL DEFAULT 'FULL',
  `BANK_REF` varchar(100) DEFAULT NULL,
  `AMOUNT_DUE` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_t_tax_dec`
--

DROP TABLE IF EXISTS `rpt_t_tax_dec`; CREATE TABLE `rpt_t_tax_dec` (
  `RPTTD_ID` int(7) NOT NULL,
  `TD_NUM` varchar(10) NOT NULL,
  `RPL_ID` int(7) NOT NULL,
  `RPO_ID` int(7) NOT NULL,
  `RPTA_ID` int(7) NOT NULL,
  `APPROVED_BY` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rpt_r_actual_use`
--
ALTER TABLE `rpt_r_actual_use`
  ADD PRIMARY KEY (`AU_ID`);

--
-- Indexes for table `rpt_r_assessment_lvl`
--
ALTER TABLE `rpt_r_assessment_lvl`
  ADD PRIMARY KEY (`AL_ID`),
  ADD KEY `PC_ID` (`PC_ID`),
  ADD KEY `PT_ID` (`PT_ID`);

--
-- Indexes for table `rpt_r_fee_list`
--
ALTER TABLE `rpt_r_fee_list`
  ADD PRIMARY KEY (`RPTFL_ID`);

--
-- Indexes for table `rpt_r_mrktval_agri`
--
ALTER TABLE `rpt_r_mrktval_agri`
  ADD PRIMARY KEY (`MVA_ID`),
  ADD KEY `fk_mva_pc` (`PC_ID`);

--
-- Indexes for table `rpt_r_mrktval_bldg`
--
ALTER TABLE `rpt_r_mrktval_bldg`
  ADD PRIMARY KEY (`MVB_ID`),
  ADD KEY `fk_mvb_pc` (`PC_ID`);

--
-- Indexes for table `rpt_r_mrktval_land`
--
ALTER TABLE `rpt_r_mrktval_land`
  ADD PRIMARY KEY (`MVL_ID`),
  ADD KEY `fk_mvl_pc` (`PC_ID`),
  ADD KEY `fk_mvl_au` (`AU_ID`);

--
-- Indexes for table `rpt_r_property_class`
--
ALTER TABLE `rpt_r_property_class`
  ADD PRIMARY KEY (`PC_ID`);

--
-- Indexes for table `rpt_r_property_type`
--
ALTER TABLE `rpt_r_property_type`
  ADD PRIMARY KEY (`PT_ID`);

--
-- Indexes for table `rpt_r_rate`
--
ALTER TABLE `rpt_r_rate`
  ADD PRIMARY KEY (`RPTR_ID`);

--
-- Indexes for table `rpt_t_assessment`
--
ALTER TABLE `rpt_t_assessment`
  ADD PRIMARY KEY (`RPTA_ID`),
  ADD KEY `as_land` (`RPL_ID`),
  ADD KEY `as_class` (`PC_ID`),
  ADD KEY `as_actualuse` (`AU_ID`),
  ADD KEY `as_aslevel` (`AL_ID`);

--
-- Indexes for table `rpt_t_fl_tb`
--
ALTER TABLE `rpt_t_fl_tb`
  ADD KEY `RPTTB_ID` (`RPTTB_ID`),
  ADD KEY `RPTFL_ID` (`RPTFL_ID`);

--
-- Indexes for table `rpt_t_official_receipt`
--
ALTER TABLE `rpt_t_official_receipt`
  ADD PRIMARY KEY (`RPTOR_ID`),
  ADD UNIQUE KEY `u_rptor_number` (`RPTOR_NUMBER`),
  ADD KEY `rptor_fk_emp_id` (`OIC_CITY_TREASURER`),
  ADD KEY `receipt_bill` (`RPTTB_ID`);

--
-- Indexes for table `rpt_t_rptax`
--
ALTER TABLE `rpt_t_rptax`
  ADD PRIMARY KEY (`RPTAX_ID`),
  ADD KEY `tax_assessment` (`RPTA_ID`),
  ADD KEY `tax_rate` (`RPTR_ID`);

--
-- Indexes for table `rpt_t_rp_land`
--
ALTER TABLE `rpt_t_rp_land`
  ADD PRIMARY KEY (`RPL_ID`),
  ADD KEY `rpl_index_pin` (`RPL_PIN`),
  ADD KEY `rpl_fk_rpo_id` (`RPO_ID`),
  ADD KEY `prop_class` (`PC_ID`),
  ADD KEY `prop_type` (`PT_ID`),
  ADD KEY `prop_use` (`AU_ID`);

--
-- Indexes for table `rpt_t_rp_owner`
--
ALTER TABLE `rpt_t_rp_owner`
  ADD PRIMARY KEY (`RPO_ID`);

--
-- Indexes for table `rpt_t_taxbill`
--
ALTER TABLE `rpt_t_taxbill`
  ADD PRIMARY KEY (`RPTTB_ID`),
  ADD KEY `bill_rpt` (`RPTAX_ID`),
  ADD KEY `taxbill_taxdec` (`RPTTD_ID`),
  ADD KEY `taxbill_propland` (`RPL_ID`),
  ADD KEY `taxbill_owner` (`RPO_ID`),
  ADD KEY `taxbill_assessment` (`RPTA_ID`);

--
-- Indexes for table `rpt_t_tax_dec`
--
ALTER TABLE `rpt_t_tax_dec`
  ADD PRIMARY KEY (`RPTTD_ID`),
  ADD UNIQUE KEY `td_num` (`TD_NUM`),
  ADD KEY `taxdec_propland` (`RPL_ID`),
  ADD KEY `taxdec_owner` (`RPO_ID`),
  ADD KEY `taxdec_assessment` (`RPTA_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rpt_r_actual_use`
--
ALTER TABLE `rpt_r_actual_use`
  MODIFY `AU_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `rpt_r_assessment_lvl`
--
ALTER TABLE `rpt_r_assessment_lvl`
  MODIFY `AL_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `rpt_r_mrktval_agri`
--
ALTER TABLE `rpt_r_mrktval_agri`
  MODIFY `MVA_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `rpt_r_mrktval_bldg`
--
ALTER TABLE `rpt_r_mrktval_bldg`
  MODIFY `MVB_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rpt_r_mrktval_land`
--
ALTER TABLE `rpt_r_mrktval_land`
  MODIFY `MVL_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rpt_r_property_class`
--
ALTER TABLE `rpt_r_property_class`
  MODIFY `PC_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `rpt_r_property_type`
--
ALTER TABLE `rpt_r_property_type`
  MODIFY `PT_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `rpt_r_rate`
--
ALTER TABLE `rpt_r_rate`
  MODIFY `RPTR_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rpt_t_assessment`
--
ALTER TABLE `rpt_t_assessment`
  MODIFY `RPTA_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rpt_t_official_receipt`
--
ALTER TABLE `rpt_t_official_receipt`
  MODIFY `RPTOR_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rpt_t_rptax`
--
ALTER TABLE `rpt_t_rptax`
  MODIFY `RPTAX_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rpt_t_rp_land`
--
ALTER TABLE `rpt_t_rp_land`
  MODIFY `RPL_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rpt_t_rp_owner`
--
ALTER TABLE `rpt_t_rp_owner`
  MODIFY `RPO_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rpt_t_tax_dec`
--
ALTER TABLE `rpt_t_tax_dec`
  MODIFY `RPTTD_ID` int(7) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `rpt_r_assessment_lvl`
--
ALTER TABLE `rpt_r_assessment_lvl`
  ADD CONSTRAINT `al_fk_pcid` FOREIGN KEY (`PC_ID`) REFERENCES `rpt_r_property_class` (`PC_ID`),
  ADD CONSTRAINT `al_fk_ptid` FOREIGN KEY (`PT_ID`) REFERENCES `rpt_r_property_type` (`PT_ID`);

--
-- Constraints for table `rpt_r_mrktval_agri`
--
ALTER TABLE `rpt_r_mrktval_agri`
  ADD CONSTRAINT `fk_mva_pc` FOREIGN KEY (`PC_ID`) REFERENCES `rpt_r_property_class` (`PC_ID`);

--
-- Constraints for table `rpt_r_mrktval_bldg`
--
ALTER TABLE `rpt_r_mrktval_bldg`
  ADD CONSTRAINT `fk_mvb_pc` FOREIGN KEY (`PC_ID`) REFERENCES `rpt_r_property_class` (`PC_ID`);

--
-- Constraints for table `rpt_r_mrktval_land`
--
ALTER TABLE `rpt_r_mrktval_land`
  ADD CONSTRAINT `fk_mvl_au` FOREIGN KEY (`AU_ID`) REFERENCES `rpt_r_actual_use` (`AU_ID`),
  ADD CONSTRAINT `fk_mvl_pc` FOREIGN KEY (`PC_ID`) REFERENCES `rpt_r_property_class` (`PC_ID`);

--
-- Constraints for table `rpt_t_assessment`
--
ALTER TABLE `rpt_t_assessment`
  ADD CONSTRAINT `rpt_t_assessment_ibfk_1` FOREIGN KEY (`RPL_ID`) REFERENCES `rpt_t_rp_land` (`RPL_ID`),
  ADD CONSTRAINT `rpt_t_assessment_ibfk_2` FOREIGN KEY (`PC_ID`) REFERENCES `rpt_r_property_class` (`PC_ID`),
  ADD CONSTRAINT `rpt_t_assessment_ibfk_3` FOREIGN KEY (`AU_ID`) REFERENCES `rpt_r_actual_use` (`AU_ID`),
  ADD CONSTRAINT `rpt_t_assessment_ibfk_4` FOREIGN KEY (`AL_ID`) REFERENCES `rpt_r_assessment_lvl` (`AL_ID`);

--
-- Constraints for table `rpt_t_fl_tb`
--
ALTER TABLE `rpt_t_fl_tb`
  ADD CONSTRAINT `rpt_t_fl_tb_ibfk_1` FOREIGN KEY (`RPTTB_ID`) REFERENCES `rpt_t_taxbill` (`RPTTB_ID`),
  ADD CONSTRAINT `rpt_t_fl_tb_ibfk_2` FOREIGN KEY (`RPTFL_ID`) REFERENCES `rpt_r_fee_list` (`RPTFL_ID`);

--
-- Constraints for table `rpt_t_rptax`
--
ALTER TABLE `rpt_t_rptax`
  ADD CONSTRAINT `rpt_t_rptax_ibfk_1` FOREIGN KEY (`RPTA_ID`) REFERENCES `rpt_t_assessment` (`RPTA_ID`),
  ADD CONSTRAINT `rpt_t_rptax_ibfk_2` FOREIGN KEY (`RPTR_ID`) REFERENCES `rpt_r_rate` (`RPTR_ID`);

--
-- Constraints for table `rpt_t_rp_land`
--
ALTER TABLE `rpt_t_rp_land`
  ADD CONSTRAINT `fk_rpl_rpo` FOREIGN KEY (`RPO_ID`) REFERENCES `rpt_t_rp_owner` (`RPO_ID`);

--
-- Constraints for table `rpt_t_taxbill`
--
ALTER TABLE `rpt_t_taxbill`
  ADD CONSTRAINT `rpt_t_taxbill_ibfk_1` FOREIGN KEY (`RPTAX_ID`) REFERENCES `rpt_t_rptax` (`RPTAX_ID`),
  ADD CONSTRAINT `rpt_t_taxbill_ibfk_2` FOREIGN KEY (`RPTTD_ID`) REFERENCES `rpt_t_tax_dec` (`RPTTD_ID`),
  ADD CONSTRAINT `rpt_t_taxbill_ibfk_3` FOREIGN KEY (`RPL_ID`) REFERENCES `rpt_t_rp_land` (`RPL_ID`),
  ADD CONSTRAINT `rpt_t_taxbill_ibfk_4` FOREIGN KEY (`RPO_ID`) REFERENCES `rpt_t_rp_owner` (`RPO_ID`),
  ADD CONSTRAINT `rpt_t_taxbill_ibfk_5` FOREIGN KEY (`RPTA_ID`) REFERENCES `rpt_t_assessment` (`RPTA_ID`);

--
-- Constraints for table `rpt_t_tax_dec`
--
ALTER TABLE `rpt_t_tax_dec`
  ADD CONSTRAINT `rpt_t_tax_dec_ibfk_1` FOREIGN KEY (`RPL_ID`) REFERENCES `rpt_t_rp_land` (`RPL_ID`),
  ADD CONSTRAINT `rpt_t_tax_dec_ibfk_2` FOREIGN KEY (`RPO_ID`) REFERENCES `rpt_t_rp_owner` (`RPO_ID`),
  ADD CONSTRAINT `rpt_t_tax_dec_ibfk_3` FOREIGN KEY (`RPTA_ID`) REFERENCES `rpt_t_assessment` (`RPTA_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
