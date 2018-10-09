DROP VIEW IF EXISTS view_assessment;

CREATE ALGORITHM = UNDEFINED
  DEFINER = `root`@`localhost`
  SQL SECURITY DEFINER VIEW `view_assessment`  AS
  select `bus`.`BU_ID`              AS `BUID`,
         `_as`.`AS_OR_NO`           AS `AS_OR_NO`,
         `_as`.`AS_PERIOD_COVERED`  AS `AS_PERIOD_COVERED`,
         `_as`.`AS_DUE_DATE`        AS `AS_DUE_DATE`,
         `_as`.`AS_PAYMENT_DATE`    AS `AS_PAYMENT_DATE`,
         `_as`.`AS_AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,
         `bus`.`BU_NAME`            AS `BU_NAME`,
         `bus`.`BU_LOCATION`        AS `BU_LOCATION`,
         `bus`.`BU_CONTACT`         AS `BU_CONTACT`,
         `f`.`FEES_NAME`            AS `FEES_NAME`,
         `f`.`AMOUNT`               AS `AMOUNT`
  from `bpls_r_assessment` `_as`
         join `bpls_t_bp_application` `ap` on `ap`.`AP_REFERENCE_NO` = `_as`.`AS_AP_REFERENCE_NO`
         join `lgu_r_fee_set` `fs` on `fs`.`FS_CODE` = `_as`.`AS_FEE_SET`
         join `lgu_r_fees` `f` on `f`.`FEES_CODE` = `fs`.`FS_PRM_FEE`
         join `lgu_r_business` `bus` on `bus`.`BU_ID` = `ap`.`BU_ID`;