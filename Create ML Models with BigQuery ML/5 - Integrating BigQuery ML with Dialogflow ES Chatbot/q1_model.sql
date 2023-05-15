CREATE OR REPLACE MODEL `helpdesk.predict_eta_v0`
OPTIONS(model_type='linear_reg') AS
SELECT
 category,
 resolutiontime as label
FROM
  `helpdesk.issues`