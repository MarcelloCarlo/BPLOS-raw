DROP VIEW IF EXISTS view_terminatedap;
CREATE VIEW view_terminatedap AS
  SELECT  FROM bpls_t_bp_application WHERE AP_STATUS = 'Terminated';