ALTER TABLE `mtops_t_application_frm`
  DROP FOREIGN KEY `applifrm_fk_repre`;
ALTER TABLE `mtops_t_fl_tb`
  DROP FOREIGN KEY `fk_mtops_t_fl_tb_mtops_r_fee_list_1`;
ALTER TABLE `mtops_t_fl_tb`
  DROP FOREIGN KEY `fk_mtops_t_fl_tb_mtops_t_assessment_1`;
ALTER TABLE `mtops_t_official_receipt`
  DROP FOREIGN KEY `fk_mtops_t_official_receipt_mtops_t_assessment_1`;
ALTER TABLE `mtops_t_application_frm`
  DROP FOREIGN KEY `applifrm_fk_tb`;
ALTER TABLE `mtops_t_permit`
  DROP FOREIGN KEY `fk_mtops_t_permit_mtops_t_application_frm_1`;

DROP INDEX `applifrm_fk_repre`
ON `mtops_t_application_frm`;
DROP INDEX `applifrm_fk_tb`
ON `mtops_t_application_frm`;
DROP INDEX `fl_tb_fk_fl`
ON `mtops_t_fl_tb`;
DROP INDEX `fl_tb_fk_tb`
ON `mtops_t_fl_tb`;
DROP INDEX `official_receipt_fk_tb`
ON `mtops_t_official_receipt`;
DROP INDEX `taxbill_fk_assessed`
ON `mtops_t_assessment`;
DROP INDEX `taxbill_fk_verified`
ON `mtops_t_assessment`;
DROP INDEX `taxbill_fk_reccom`
ON `mtops_t_assessment`;
DROP INDEX `taxbill_fk_approved`
ON `mtops_t_assessment`;
DROP INDEX `permit_fk_apfrm`
ON `mtops_t_permit`;

DROP TABLE `mtops_t_application_frm`;
DROP TABLE `mtops_t_representative`;
DROP TABLE `mtops_r_requirements`;
DROP TABLE `mtops_r_fee_list`;
DROP TABLE `mtops_t_fl_tb`;
DROP TABLE `mtops_t_official_receipt`;
DROP TABLE `mtops_t_assessment`;
DROP TABLE `mtops_t_permit`;

CREATE TABLE `mtops_t_application_frm` (
  `APF_ID`                 int(11)                                                                      NOT NULL AUTO_INCREMENT,
  `APF_FNAME`              varchar(50)                                                                  NOT NULL,
  `APF_MNAME`              varchar(50)                                                                  NOT NULL,
  `APF_LNAME`              varchar(50)                                                                  NOT NULL,
  `APF_BDATE`              date                                                                         NOT NULL,
  `APF_SEX`                enum ('M', 'F', 'O')                                                         NOT NULL,
  `APF_HOUSE_NO`           varchar(50)                                                                  NOT NULL,
  `APF_STREET`             varchar(50)                                                                  NOT NULL,
  `APF_BRGY`               varchar(50)                                                                  NOT NULL,
  `APF_CITY`               varchar(50)                                                                  NOT NULL,
  `APF_CONTACT_NO`         varchar(20)                                                                      NOT NULL,
  `APF_MAILING_ADR`        varchar(200)                                                                 NOT NULL,
  `APF_EMAIL`              varchar(50)                                                                  NOT NULL,
  `APF_PLATE_NO`           varchar(50)                                                                  NOT NULL,
  `APF_TIN_NO`             varchar(50)                                                                  NOT NULL,
  `APF_DRIVERS_LICENSE_NO` varchar(50)                                                                  NOT NULL,
  `TODA_NAME`              varchar(50)                                                                  NOT NULL,
  `REPRE_ID`               int(11)                                                                      NULL     DEFAULT NULL,
  `APF_STATUS`             enum ('Pending', 'Inspecting', 'Assessing', 'Treasury', 'Releasing', 'Done') NOT NULL DEFAULT 'Pending',
  `TB_ID`                  int(11)                                                                      NOT NULL,
  PRIMARY KEY (`APF_ID`),
  INDEX `applifrm_fk_repre` (`REPRE_ID` ASC),
  INDEX `applifrm_fk_tb` (`TB_ID` ASC)
);
CREATE TABLE `mtops_t_representative` (
  `REPRE_ID`         int(11)      NOT NULL AUTO_INCREMENT,
  `REPRE_FNAME`      varchar(50)  NOT NULL,
  `REPRE_MNAME`      varchar(50)  NOT NULL,
  `REPRE__LNAME`     varchar(50)  NOT NULL,
  `REPRE_ADDRESS`    varchar(200) NOT NULL,
  `REPRE_BDAY`       date         NOT NULL,
  `REPRE_SEX`        enum ('M', 'F', 'O')     NOT NULL,
  `REPRE_EMAIL`      varchar(50)  NOT NULL,
  `REPRE_CONTACT_NO` varchar(20)      NOT NULL,
  PRIMARY KEY (REPRE_ID)
);
CREATE TABLE `mtops_r_requirements` (
  `REQ_ID`   int(11)      NOT NULL AUTO_INCREMENT,
  `REQ_NAME` varchar(50)  NOT NULL,
  `REQ_DESC` varchar(200) NOT NULL,
  PRIMARY KEY (`REQ_ID`)
);
CREATE TABLE `mtops_r_fee_list` (
  `FL_ID`     int(11)        NOT NULL AUTO_INCREMENT,
  `FL_NAME`   varchar(100) CHARACTER SET latin1
  COLLATE latin1_swedish_ci  NOT NULL,
  `FL_AMOUNT` decimal(10, 2) NULL     DEFAULT 0.00,
  PRIMARY KEY (`FL_ID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 22
  AVG_ROW_LENGTH = 0
  DEFAULT CHARACTER SET = latin1
  COLLATE = latin1_swedish_ci
  KEY_BLOCK_SIZE = 0
  MAX_ROWS = 0
  MIN_ROWS = 0
  ROW_FORMAT = Compact;
CREATE TABLE `mtops_t_fl_tb` (
  `TB_ID`  int(11)        NOT NULL,
  `FL_ID`  int(11)        NOT NULL,
  `AMOUNT` decimal(10, 2) NOT NULL,
  INDEX `fl_tb_fk_fl` (`FL_ID` ASC) USING BTREE,
  INDEX `fl_tb_fk_tb` (`TB_ID` ASC) USING BTREE
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 0
  AVG_ROW_LENGTH = 0
  DEFAULT CHARACTER SET = latin1
  COLLATE = latin1_swedish_ci
  KEY_BLOCK_SIZE = 0
  MAX_ROWS = 0
  MIN_ROWS = 0
  ROW_FORMAT = Compact;
CREATE TABLE `mtops_t_official_receipt` (
  `OR_ID`              int(11)        NOT NULL AUTO_INCREMENT,
  `OR_DATE`            date           NOT NULL,
  `OR_PYMT_TYPE`       enum ('Cash', 'Treasury Warrant', 'Check', 'Money Order') CHARACTER SET latin1
  COLLATE latin1_swedish_ci           NOT NULL,
  `OR_TW_CH_MO_NO`     varchar(20) CHARACTER SET latin1
  COLLATE latin1_swedish_ci           NULL     DEFAULT NULL,
  `OR_TOTAL_AMOUNT`    decimal(10, 2) NULL     DEFAULT NULL,
  `OR_TW_CH_MO_DATE`   date           NULL     DEFAULT NULL,
  `OIC_CITY_TREASURER` int(11)        NOT NULL,
  `TB_ID`              int(11)        NOT NULL,
  PRIMARY KEY (`OR_ID`),
  INDEX `official_receipt_fk_tb` (`TB_ID` ASC) USING BTREE
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  AVG_ROW_LENGTH = 0
  DEFAULT CHARACTER SET = latin1
  COLLATE = latin1_swedish_ci
  KEY_BLOCK_SIZE = 0
  MAX_ROWS = 0
  MIN_ROWS = 0
  ROW_FORMAT = Compact;
CREATE TABLE `mtops_t_assessment` (
  `TB_ID`           int(11) NOT NULL AUTO_INCREMENT,
  `TB_BILL_NO`      varchar(30) CHARACTER SET latin1
  COLLATE latin1_swedish_ci NOT NULL,
  `TB_DATE_BILLED`  date    NOT NULL,
  `ASSESSED_BY`     int(11) NOT NULL,
  `VERIFIED_BY`     int(11) NOT NULL,
  `REC_APPROVAL_BY` int(11) NOT NULL,
  `APPROVED_BY`     int(11) NOT NULL,
  PRIMARY KEY (`TB_ID`),
  INDEX `taxbill_fk_assessed` (`ASSESSED_BY` ASC) USING BTREE,
  INDEX `taxbill_fk_verified` (`VERIFIED_BY` ASC) USING BTREE,
  INDEX `taxbill_fk_reccom` (`REC_APPROVAL_BY` ASC) USING BTREE,
  INDEX `taxbill_fk_approved` (`APPROVED_BY` ASC) USING BTREE
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  AVG_ROW_LENGTH = 0
  DEFAULT CHARACTER SET = latin1
  COLLATE = latin1_swedish_ci
  KEY_BLOCK_SIZE = 0
  MAX_ROWS = 0
  MIN_ROWS = 0
  ROW_FORMAT = Compact;
CREATE TABLE `mtops_t_permit` (
  `PERMIT_ID`       int(11)     NOT NULL AUTO_INCREMENT,
  `PERMIT_NO`       varchar(20) NOT NULL,
  `PERMIT_DATE`     date        NOT NULL,
  `PERMIT_VALIDITY` date        NOT NULL,
  `APF_ID`          int(11)     NOT NULL,
  PRIMARY KEY (`PERMIT_ID`),
  INDEX `permit_fk_apfrm` (`APF_ID` ASC)
);

ALTER TABLE `mtops_t_application_frm`
  ADD CONSTRAINT `applifrm_fk_repre` FOREIGN KEY (`REPRE_ID`) REFERENCES `mtops_t_representative` (`REPRE_ID`);
ALTER TABLE `mtops_t_fl_tb`
  ADD CONSTRAINT `fk_mtops_t_fl_tb_mtops_r_fee_list_1` FOREIGN KEY (`FL_ID`) REFERENCES `mtops_r_fee_list` (`FL_ID`);
ALTER TABLE `mtops_t_fl_tb`
  ADD CONSTRAINT `fk_mtops_t_fl_tb_mtops_t_assessment_1` FOREIGN KEY (`TB_ID`) REFERENCES `mtops_t_assessment` (`TB_ID`);
ALTER TABLE `mtops_t_official_receipt`
  ADD CONSTRAINT `fk_mtops_t_official_receipt_mtops_t_assessment_1` FOREIGN KEY (`TB_ID`) REFERENCES `mtops_t_assessment` (`TB_ID`);
ALTER TABLE `mtops_t_application_frm`
  ADD CONSTRAINT `applifrm_fk_tb` FOREIGN KEY (`TB_ID`) REFERENCES `mtops_t_assessment` (`TB_ID`);
ALTER TABLE `mtops_t_permit`
  ADD CONSTRAINT `fk_mtops_t_permit_mtops_t_application_frm_1` FOREIGN KEY (`APF_ID`) REFERENCES `mtops_t_application_frm` (`APF_ID`);

