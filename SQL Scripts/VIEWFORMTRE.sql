DROP VIEW IF EXISTS view_applicationformstre;
CREATE VIEW view_applicationformstre AS
  SELECT BPA.AP_REFERENCE_NO,
         BU.BU_NAME,
         NT.BN_NAME,
         CONCAT(TX.TP_FNAME, ' ', TX.TP_MNAME, ' ', TX.TP_LNAME)    AS TP_NAME,
         TX.TP_HOME_ADDRESS,
         T.TB_ID,
         T.TB_DATE_BILLED,
         CONCAT(EMP.EP_FNAME, ' ', EMP.EP_MNAME, ' ', EMP.EP_LNAME) AS EMP_NAME
  FROM bpls_t_bp_application BPA
         JOIN bpls_t_business BU ON BPA.BU_ID = BU.BU_ID
         JOIN bpls_t_taxpayer TX ON BU.TP_ID = TX.TP_ID
         JOIN bpls_t_taxbill T ON BPA.TB_ID = T.TB_ID
         JOIN bpls_r_business_nature NT ON BU.BN_ID = NT.BN_ID
         JOIN bpls_t_employee_profile EMP ON T.ASSESSED_BY = EMP.EP_ID
  WHERE BPA.AP_DIV_CODE_TO = 'DIV-TRE' AND NOT AP_STATUS = 'Terminated';