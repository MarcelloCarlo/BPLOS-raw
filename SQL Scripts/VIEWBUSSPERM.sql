DROP VIEW IF EXISTS view_bussperm;
CREATE VIEW view_bussperm
  AS
    SELECT permit.BP_NUMBER,
           permit.BP_ISSUED_DATE,
           TP_NATIONALITY,
           BU_NAME,
           CONCAT(AR_FNAME, ' ', AR_MNAME, ' ', AR_LNAME) AS AR_NAME,
           BU_PRESIDENT,
           BU_LOCATION,
           permit.BP_VALID_YEARS,
           BN_NAME,
           BN_CLASSIFICATION,
           BU_CAPITALIZATION,
           permit.BP_REMARKS,
           BU_EMP_NO,
           TP_SSS_NO,
           TP_TIN,
           BU_AREA,
           t.TB_ID,
           t.TB_DATE_BILLED
    FROM bpls_t_business_permit
           JOIN bpls_t_bp_application a on bpls_t_business_permit.AP_ID = a.AP_ID
           JOIN bpls_t_business business on a.BU_ID = business.BU_ID
           JOIN bpls_r_business_nature nature on business.BN_ID = nature.BN_ID
           JOIN bpls_r_bu_ar ar on business.BU_ID = ar.BU_ID
           JOIN bpls_t_authorize_rep btar on ar.AR_ID = btar.AR_ID
           JOIN bpls_t_taxpayer taxpayer on business.TP_ID = taxpayer.TP_ID
           JOIN bpls_t_taxbill t on a.TB_ID = t.TB_ID
           JOIN bpls_t_business_permit permit on a.AP_ID = permit.AP_ID