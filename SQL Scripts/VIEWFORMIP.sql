DROP VIEW IF EXISTS view_applicationformsip;
CREATE VIEW view_applicationformsip AS
  SELECT AP.AP_REFERENCE_NO,
         BUS.BU_NAME,
         BUS.BU_PRESIDENT,
         CONCAT(
           TP.TP_FNAME,
           '',
           COALESCE(TP.TP_MNAME,''),
           '',
           COALESCE(TP.TP_LNAME,'')
             ) TAX_PAYERNAME,
         BUS.BU_LOCATION,
         BUS.BU_CONTACT,
         CONCAT(
           AR.AR_FNAME,
          '',
           COALESCE(AR.AR_MNAME,''),
           '',
           COALESCE(AR.AR_LNAME,'')
             ) AUTH_REPNAME,
         AR.AR_HOME_ADDRESS,
         BN.BN_NAME,
         BN.BN_CLASSIFICATION,
         OT.OT_NAME,
         OT.OT_CODE,
         AP.AP_TYPE,
         AP.AP_DATE,
         ATC.AT_UNIFIED_FILE_NAME,
         AP.AP_ID,
         AP.AP_STATUS,
         AP.AP_DIV_CODE_TO,
         AP.AP_DIV_CODE_FROM,
         ATC.AT_ID,
         ATC.AT_BRGY_CLEARANCE,
         ATC.AT_DTI_REGISTRATION,
         ATC.AT_SEC_REGISTRATION,
         ATC.AT_TITLE_TO_PROPERTY,
         ATC.AT_TAX_DECLARATION,
         ATC.AT_CONTRACT_OF_LEASE,
         ATC.AT_LESSORS_BP,
         ATC.AT_AUTHORIZATION,
         ATC.AT_LOCATIONAL_CLR,
         ATC.AT_SANITARY_HEALTH_CERT,
         ATC.AT_BUILDING_PERMIT,
         ATC.AT_POLLUTION_CLR,
         ATC.AT_MECHANICAL_PERMIT,
         ATC.AT_ELECTRICAL_INSP,
         ATC.AT_POLICE_CLEARANCE,
         ATC.AT_CTAO_CLEARANCE_CERT,
         ATC.AT_FSIC,
         ATC.AT_PREV_BP,
         ATC.AT_TAX_BILL,
         ATC.AT_OFFICIAL_RECEIPT,
         ATC.AT_PCAB_LICENSE,
         ATC.AT_MISC_DOCUMENTS,
         ATC.AP_Remarks
  FROM lgu_t_business BUS
         INNER JOIN lgu_r_business_nature BN ON BN.BN_ID = BUS.BN_ID
         INNER JOIN lgu_r_ownership_type OT ON OT.OT_CODE = BUS.OT_CODE
         INNER JOIN lgu_t_bp_application AP ON AP.BU_ID = BUS.BU_ID
         INNER JOIN lgu_t_taxpayer TP ON TP.TP_ID = BUS.TP_ID
         INNER JOIN lgu_r_bu_ar BUxAR ON BUxAR.BU_ID = BUS.BU_ID
         INNER JOIN lgu_t_authorize_rep AR ON AR.AR_ID = BUxAR.AR_ID
         INNER JOIN lgu_t_attachments ATC ON ATC.AP_ID = AP.AP_ID
         INNER JOIN lgu_r_division DIVS ON DIVS.DIV_CODE = AP.AP_DIV_CODE_TO
  WHERE AP.AP_DIV_CODE_TO = 'DIV-INS' AND BN.BN_CLASSIFICATION = 'L';