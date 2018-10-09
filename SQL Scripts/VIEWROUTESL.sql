DROP VIEW IF EXISTS view_routeslip;

CREATE VIEW view_routeslip AS
  SELECT AP_REFERENCE_NO,
         AP_TYPE,
         AP_STATUS,
         AP_DIV_CODE_TO,
         AP_DATE_ACCESSED,
         AP_REMARKS,
         BU_NAME,
         BU_PRESIDENT,
         BU_LOCATION,
         BU_CONTACT,
         TP_FNAME,
         TP_MNAME,
         TP_LNAME,
         TP_HOME_ADDRESS,
         BN_NAME,
         BN_CLASSIFICATION,
         DV.DIV_NAME
  FROM bpls_t_bp_application BP
         JOIN bpls_t_business BU on BP.BU_ID = BU.BU_ID
         JOIN bpls_r_business_nature BN on BU.BN_ID = BN.BN_ID
         JOIN bpls_t_taxpayer t on BU.TP_ID = t.TP_ID
JOIN bpls_r_division DV ON BP.AP_DIV_CODE_TO = DV.DIV_CODE;