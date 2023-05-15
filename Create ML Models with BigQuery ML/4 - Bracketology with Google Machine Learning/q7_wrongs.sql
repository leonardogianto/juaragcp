SELECT
  model.label AS predicted_label,
  model.prob AS confidence,
  predictions.label AS correct_label,
  game_date,
  round,
  seed,
  school_ncaa,
  points,
  opponent_seed,
  opponent_school_ncaa,
  opponent_points
FROM `bracketology.predictions` AS predictions,
UNNEST(predicted_label_probs) AS model
WHERE model.prob > .8 AND predicted_label <> predictions.label