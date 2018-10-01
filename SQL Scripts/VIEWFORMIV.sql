DROP VIEW IF EXISTS view_applicationformsiv;
CREATE VIEW view_applicationformsiv AS
  SELECT AP.AP_REFERENCE_NO,
         BUS.BU_NAME,
         BUS.BU_PRESIDENT,
         CONCAT(
           TP.TP_FNAME,
           ' ',
           COALESCE(TP.TP_MNAME,' '),
           ' ',
           COALESCE(TP.TP_LNAME,' ')
             ) TAX_PAYERNAME,
         BUS.BU_LOCATION,
         BUS.BU_CONTACT,
         CONCAT(
           AR.AR_FNAME,
          ' ',
           COALESCE(AR.AR_MNAME,' '),
           ' ',
           COALESCE(AR.AR_LNAME,' ')
             ) AUTH_REPNAME,
         AR.AR_HOME_ADDRESS,
         BN.BN_NAME,
         BN.BN_CLASSIFICATION,
         OT.OT_NAME,
         OT.OT_CODE,
         AP.AP_TYPE,
         AP.AP_DATE,
         AP.AP_ID,
         AP.AP_STATUS,
         AP.AP_DIV_CODE_TO,
         AP.AP_DIV_CODE_FROM,
         INS.ZONING_INS,
         INS.FIRE_INS,
         INS.HEALTH_SANITATION_INS,
         INS.BUILDING_INS,
         INS.LABOR_INS,
         INS.MISC_INS,
         INS.INS_REMARKS
  FROM lgu_t_business BUS
         INNER JOIN lgu_r_business_nature BN ON BN.BN_ID = BUS.BN_ID
         INNER JOIN lgu_r_ownership_type OT ON OT.OT_CODE = BUS.OT_CODE
         INNER JOIN lgu_t_bp_application AP ON AP.BU_ID = BUS.BU_ID
         INNER JOIN lgu_t_taxpayer TP ON TP.TP_ID = BUS.TP_ID
         INNER JOIN lgu_r_bu_ar BUxAR ON BUxAR.BU_ID = BUS.BU_ID
         INNER JOIN lgu_t_authorize_rep AR ON AR.AR_ID = BUxAR.AR_ID
         INNER JOIN lgu_t_inspections INS ON INS.INS_AP_REFERENCE_NO = AP_REFERENCE_NO
         INNER JOIN lgu_r_division DIVS ON DIVS.DIV_CODE = AP.AP_DIV_CODE_TO
  WHERE AP.AP_DIV_CODE_TO = 'DIV-INV';