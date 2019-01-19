DROP VIEW IF EXISTS view_routeslip;

CREATE VIEW view_routeslip AS
  SELECT TL_DATE, TL_REMARKS, TL_DIV_NAME
  FROM bpls_t_ap_history H
         JOIN bpls_r_division DV ON H.TL_DIV_CODE = DV.DIV_CODE