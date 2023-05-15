CREATE OR REPLACE MODEL
  `bracketology.ncaa_model_updated`
OPTIONS
  ( model_type='logistic_reg') AS
SELECT
  # this time, don't train the model on school name or seed
  season,
  label,
  # our pace
  poss_40min,
  pace_rank,
  pace_rating,
  # opponent pace
  opp_poss_40min,
  opp_pace_rank,
  opp_pace_rating,
  # difference in pace
  pace_rank_diff,
  pace_stat_diff,
  pace_rating_diff,
  # our efficiency
  pts_100poss,
  efficiency_rank,
  efficiency_rating,
  # opponent efficiency
  opp_pts_100poss,
  opp_efficiency_rank,
  opp_efficiency_rating,
  # difference in efficiency
  eff_rank_diff,
  eff_stat_diff,
  eff_rating_diff
FROM `bracketology.training_new_features`
# here we'll train on 2014 - 2017 and predict on 2018
WHERE season BETWEEN 2014 AND 2017 # between in SQL is inclusive of end points