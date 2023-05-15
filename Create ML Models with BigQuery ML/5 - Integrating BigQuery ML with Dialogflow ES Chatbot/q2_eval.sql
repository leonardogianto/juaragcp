WITH eval_table AS (
SELECT
 category,
 resolutiontime as label
FROM
  helpdesk.issues
)
SELECT
  *
FROM
  ML.EVALUATE(MODEL helpdesk.predict_eta_v0,
    TABLE eval_table)