CREATE VIEW view_terminatedap AS
  SELECT BUS.BU_NAME, BP.AP_DATE_ACCESSED, BP.AP_REMARKS
  FROM lgu_r_bp_application BP
         INNER JOIN lgu_r_business BUS ON BUS.BU_ID = BP.BU_ID
  WHERE BP.AP_STATUS = 'Terminated';