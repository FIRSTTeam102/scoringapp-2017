CREATE OR REPLACE VIEW `match_team_pts_v`
AS
  SELECT   `mt`.`tournament_id` AS `tournament_id`
           , `mt`.`match_number` AS `match_number`
           , `mt`.`team_number` AS `team_number`
           , `mt`.`alliance` AS `alliance`
           , `mt`.`ignore_match` AS `ignore_match`
           , (CASE `mt`.`did_show_up` WHEN 'Y' THEN 1 ELSE 0 END) AS `did_show_up`
           , (CASE `mt`.`did_break_down` WHEN 'Y' THEN 1 ELSE 0 END) AS `did_break_down`
           , (CASE `mt`.`auto_crossed_baseline` WHEN 'Y' THEN 1 ELSE 0 END) AS `auto_cross`
           , (CASE `mt`.`auto_crossed_baseline` WHEN 'Y' THEN 5 ELSE 0 END) AS `auto_cross_pts`
           , (CASE `mt`.`auto_gear_attempt` WHEN 'Y' THEN 1 ELSE 0 END) AS `auto_gear_attempts`
           , (CASE `mt`.`auto_gear_outcome` WHEN 'S' THEN 1 WHEN 'H' THEN 1 ELSE 0 END) AS `auto_gear_success`
           , (CASE `mt`.`auto_gear_outcome` WHEN 'S' THEN 60 WHEN 'H' THEN 60 ELSE 0 END) AS `auto_gear_pts`
           , (CASE `mt`.`auto_goal_attempt` WHEN 'Y' THEN 1 WHEN 'HGS' THEN 3 WHEN 'LGS' THEN 1 ELSE 0 END) AS `auto_goal`
           , (CASE `mt`.`climbed_rope` WHEN 'Y' THEN 1 ELSE 0 END) AS `climbed_rope_success`
           , (CASE `mt`.`climbed_rope` WHEN 'Y' THEN 50 ELSE 0 END) AS `climbed_rope_pts`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'H' THEN 1 ELSE 0 END)) AS `H_Tries`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'H' THEN (CASE `mtc`.`success` WHEN 'S' THEN 2 ELSE 0 END) ELSE 0 END)) AS `H_PTS`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'L' THEN 1 ELSE 0 END)) AS `L_Tries`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'L' THEN (CASE `mtc`.`success` WHEN 'S' THEN 1 ELSE 0 END) ELSE 0 END)) AS `L_PTS`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'G' THEN 1 ELSE 0 END)) AS `G_Tries`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'G' THEN (CASE `mtc`.`success` WHEN 'S' THEN 1 ELSE 0 END) ELSE 0 END)) AS `G_SUCCESS`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'G' THEN (CASE `mtc`.`success` WHEN 'S' THEN 10 ELSE 0 END) ELSE 0 END)) AS `G_pts`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'B' THEN 1 ELSE 0 END)) AS `Broke_Down`,
           sum((CASE `mtc`.`operation_attempted` WHEN 'O' THEN 1 ELSE 0 END)) AS `Recovered`
  FROM     ((`match_teams` `mt` LEFT JOIN `match_team_cycles` `mtc` ON (((`mtc`.`tournament_id` = `mt`.`tournament_id`) AND (`mtc`.`match_number` = `mt`.`match_number`) AND (`mtc`.`team_number` = `mt`.`team_number`)))) JOIN `tournaments` `t`)
  WHERE    ((`mt`.`tournament_id` = `t`.`ID`) AND (`mt`.`completed` = 'Y') AND (`t`.`active` = 'Y') AND (`mt`.`ignore_match` = 'N'
            ))
  GROUP BY `mt`.`tournament_id`, `mt`.`match_number`, `mt`.`team_number`, `mt`.`alliance`, `mt`.`ignore_match`,
           (CASE `mt`.`did_show_up` WHEN 'Y' THEN 1 ELSE 0 END);

-- Any Tournament
CREATE OR REPLACE VIEW `match_team_pts_v`
AS
  SELECT   `mt`.`tournament_id` AS `tournament_id`
           , `mt`.`match_number` AS `match_number`
           , `mt`.`team_number` AS `team_number`
           , `mt`.`alliance` AS `alliance`
           , `mt`.`ignore_match` AS `ignore_match`
           , (CASE `mt`.`did_show_up` WHEN 'Y' THEN 1 ELSE 0 END) AS `did_show_up`
           , (CASE `mt`.`did_break_down` WHEN 'Y' THEN 1 ELSE 0 END) AS `did_break_down`
           , (CASE `mt`.`auto_crossed_baseline` WHEN 'Y' THEN 1 ELSE 0 END) AS `auto_cross`
           , (CASE `mt`.`auto_crossed_baseline` WHEN 'Y' THEN 5 ELSE 0 END) AS `auto_cross_pts`
           , (CASE `mt`.`auto_gear_attempt` WHEN 'Y' THEN 1 ELSE 0 END) AS `auto_gear_attempts`
           , (CASE `mt`.`auto_gear_outcome` WHEN 'S' THEN 1 WHEN 'H' THEN 1 ELSE 0 END) AS `auto_gear_success`
           , (CASE `mt`.`auto_gear_outcome` WHEN 'S' THEN 60 WHEN 'H' THEN 60 ELSE 0 END) AS `auto_gear_pts`
           , (CASE `mt`.`auto_goal_attempt` WHEN 'Y' THEN 1 WHEN 'HGS' THEN 3 WHEN 'LGS' THEN 1 ELSE 0 END) AS `auto_goal`
           , (CASE `mt`.`climbed_rope` WHEN 'Y' THEN 1 ELSE 0 END) AS `climbed_rope_success`
           , (CASE `mt`.`climbed_rope` WHEN 'Y' THEN 50 ELSE 0 END) AS `climbed_rope_pts`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'H' THEN 1 ELSE 0 END)) AS `H_Tries`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'H' THEN (CASE `mtc`.`success` WHEN 'S' THEN 2 ELSE 0 END) ELSE 0 END)) AS `H_PTS`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'L' THEN 1 ELSE 0 END)) AS `L_Tries`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'L' THEN (CASE `mtc`.`success` WHEN 'S' THEN 1 ELSE 0 END) ELSE 0 END)) AS `L_PTS`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'G' THEN 1 ELSE 0 END)) AS `G_Tries`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'G' THEN (CASE `mtc`.`success` WHEN 'S' THEN 1 ELSE 0 END) ELSE 0 END)) AS `G_SUCCESS`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'G' THEN (CASE `mtc`.`success` WHEN 'S' THEN 10 ELSE 0 END) ELSE 0 END)) AS `G_pts`
           , sum((CASE `mtc`.`operation_attempted` WHEN 'B' THEN 1 ELSE 0 END)) AS `Broke_Down`,
           sum((CASE `mtc`.`operation_attempted` WHEN 'O' THEN 1 ELSE 0 END)) AS `Recovered`
  FROM     (`match_teams` `mt` LEFT JOIN `match_team_cycles` `mtc` ON (((`mtc`.`tournament_id` = `mt`.`tournament_id`) AND (`mtc`.`match_number` = `mt`.`match_number`) AND (`mtc`.`team_number` = `mt`.`team_number`))))
  WHERE    ((`mt`.`completed` = 'Y') AND (`mt`.`ignore_match` = 'N'))
  GROUP BY `mt`.`tournament_id`, `mt`.`match_number`, `mt`.`team_number`, `mt`.`alliance`, `mt`.`ignore_match`,(CASE `mt`.`did_show_up` WHEN 'Y' THEN 1 ELSE 0 END);
		   
-- Original
CREATE OR REPLACE VIEW `team_avg_pts_norank_v`
AS
  SELECT   `m`.`tournament_id` AS `tournament_id`
           , `tp`.`team_number` AS `team_number`
           , `tt`.`ranking_points` AS `ranking_points`
           , `tt`.`frc_rank` AS `frc_rank`
           , count(0) AS `num_matches`
           , round((((((sum(`tp`.`auto_cross_pts`) + sum(`tp`.`auto_gear_pts`)) + sum(`tp`.`auto_goal`)) + sum(`tp`.`G_pts`)) + sum(`tp`.`climbed_rope_pts`)) / count(0)), 1) AS `avg_pts`
           , round((((sum(`tp`.`auto_cross_pts`) + sum(`tp`.`auto_gear_pts`)) + sum(`tp`.`auto_goal`)) / count(0)), 1) AS `avg_auto_pts`
           , sum(`tp`.`auto_gear_attempts`) AS `auto_gear_tries`,
           sum(`tp`.`auto_gear_success`) AS `auto_gear_success`,
           round(((sum(`tp`.`auto_gear_success`) / count(0)) * 100), 0) AS `auto_gear_PCT`,
           round((sum(`tp`.`G_SUCCESS`) / count(0)), 1) AS `Avg_Gears`,
           round(((sum(`tp`.`climbed_rope_success`) / count(0)) * 100), 0) AS `Rope_Pct`,
           sum(`tp`.`auto_goal`) AS `auto_goal`,
           sum(`tp`.`climbed_rope_success`) AS `climbed_rope`,
           sum(`tp`.`G_Tries`) AS `Gear_Tries`,
           sum(`tp`.`G_SUCCESS`) AS `Gear_Success`,
           sum(`tp`.`G_pts`) AS `Gear_pts`,
           round((sum(`tp`.`G_pts`) / count(0)), 1) AS `Avg_Gear`,
           round((sum(`tp`.`G_pts`) / count(0)), 1) AS `Avg_Gear_pts`,
           round(((sum(`tp`.`G_SUCCESS`) / sum(`tp`.`G_Tries`)) * 100), 0) AS `Gear_PCT`,
           round((sum(`tp`.`H_PTS`) / count(0)), 1) AS `Avg_hi_pts`,
           round((sum(`tp`.`L_PTS`) / count(0)), 1) AS `Avg_lo_pts`,
           sum(`tp`.`Broke_Down`) AS `Broke_Down`,
           sum(`tp`.`Recovered`) AS `Recovered`
  FROM     ((`match_team_pts_v` `tp` LEFT JOIN `tournament_teams` `tt` ON (((`tp`.`tournament_id` = `tt`.`tournament_id`) AND (`tp`.`team_number` = `tt`.`team_number`)))) LEFT JOIN `matches` `m` ON (((`tp`.`tournament_id` = `m`.`tournament_id`) AND (`tp`.`match_number` = `m`.`match_number`))))
  WHERE    (`tp`.`ignore_match` = 'N')
  GROUP BY `tp`.`team_number`;

-- Showing results from all tournaments
CREATE OR REPLACE VIEW `team_avg_pts_norank_v`
AS
  SELECT   `m`.`tournament_id` AS `tournament_id`
           , `tp`.`team_number` AS `team_number`
           , `tt`.`ranking_points` AS `ranking_points`
           , `tt`.`frc_rank` AS `frc_rank`
           , count(0) AS `num_matches`
           , round((((((sum(`tp`.`auto_cross_pts`) + sum(`tp`.`auto_gear_pts`)) + sum(`tp`.`auto_goal`)) + sum(`tp`.`G_pts`)) + sum(`tp`.`climbed_rope_pts`)) / count(0)), 1) AS `avg_pts`
           , round((((sum(`tp`.`auto_cross_pts`) + sum(`tp`.`auto_gear_pts`)) + sum(`tp`.`auto_goal`)) / count(0)), 1) AS `avg_auto_pts`
           , sum(`tp`.`auto_gear_attempts`) AS `auto_gear_tries`,
           sum(`tp`.`auto_gear_success`) AS `auto_gear_success`,
           round(((sum(`tp`.`auto_gear_success`) / count(0)) * 100), 0) AS `auto_gear_PCT`,
           round((sum(`tp`.`G_SUCCESS`) / count(0)), 1) AS `Avg_Gears`,
           round(((sum(`tp`.`climbed_rope_success`) / count(0)) * 100), 0) AS `Rope_Pct`,
           sum(`tp`.`auto_goal`) AS `auto_goal`,
           sum(`tp`.`climbed_rope_success`) AS `climbed_rope`,
           sum(`tp`.`G_Tries`) AS `Gear_Tries`,
           sum(`tp`.`G_SUCCESS`) AS `Gear_Success`,
           sum(`tp`.`G_pts`) AS `Gear_pts`,
           round((sum(`tp`.`G_pts`) / count(0)), 1) AS `Avg_Gear`,
           round((sum(`tp`.`G_pts`) / count(0)), 1) AS `Avg_Gear_pts`,
           round(((sum(`tp`.`G_SUCCESS`) / sum(`tp`.`G_Tries`)) * 100), 0) AS `Gear_PCT`,
           round((sum(`tp`.`H_PTS`) / count(0)), 1) AS `Avg_hi_pts`,
           round((sum(`tp`.`L_PTS`) / count(0)), 1) AS `Avg_lo_pts`,
           sum(`tp`.`Broke_Down`) AS `Broke_Down`,
           sum(`tp`.`Recovered`) AS `Recovered`
  FROM     ((`match_team_pts_v` `tp` LEFT JOIN `tournament_teams` `tt` ON (((`tp`.`tournament_id` = `tt`.`tournament_id`) AND (`tp`.`team_number` = `tt`.`team_number`)))) LEFT JOIN `matches` `m` ON (((`tp`.`tournament_id` = `m`.`tournament_id`) AND (`tp`.`match_number` = `m`.`match_number`))))
  WHERE    (`tp`.`ignore_match` = 'N')
  GROUP BY `tp`.`team_number`;

CREATE OR REPLACE VIEW `team_avg_pts_v`
AS
  SELECT   `s`.`tournament_id` AS `tournament_id`,
           (SELECT (1 + count(0))
            FROM   `team_avg_pts_norank_v` `s2`
            WHERE  (`s2`.`avg_pts` > `s`.`avg_pts`))
             AS `102_rank`,
           `s`.`frc_rank` AS `FRC_rank`,
           ((SELECT (1 + count(0))
             FROM   `team_avg_pts_norank_v` `s2`
             WHERE  (`s2`.`avg_pts` > `s`.`avg_pts`)) - `s`.`frc_rank`)
             AS `luck`,
           `s`.`team_number` AS `team_number`,
           `s`.`num_matches` AS `num_matches`,
           `s`.`avg_pts` AS `avg_pts`,
           `s`.`ranking_points` AS `rank_pts`,
           `s`.`avg_auto_pts` AS `avg_auto_pts`,
           `s`.`auto_gear_tries` AS `auto_gear_tries`,
           `s`.`auto_gear_success` AS `auto_gear_success`,
           `s`.`auto_gear_PCT` AS `auto_gear_PCT`,
           `s`.`auto_goal` AS `auto_goal`,
           `s`.`Avg_Gears` AS `Avg_Gears`,
           `s`.`Rope_Pct` AS `Rope_Pct`,
           `s`.`climbed_rope` AS `climbed_rope`,
           `s`.`Gear_Tries` AS `Gear_Tries`,
           `s`.`Gear_Success` AS `Gear_Success`,
           `s`.`Gear_PCT` AS `Gear_PCT`,
           `s`.`Gear_pts` AS `Gear_pts`,
           `s`.`Avg_Gear_pts` AS `avg_gear_pts`,
           `s`.`Avg_hi_pts` AS `avg_hi_pts`,
           `s`.`Avg_lo_pts` AS `avg_lo_pts`,
           `s`.`Broke_Down` AS `Broke_Down`,
           `s`.`Recovered` AS `Recovered`
  FROM     `team_avg_pts_norank_v` `s`
  ORDER BY (SELECT (1 + count(0))
            FROM   `team_avg_pts_norank_v` `s2`
            WHERE  (`s2`.`avg_pts` > `s`.`avg_pts`));

-- Using data from all tournaments only showing teams from active tournament
CREATE OR REPLACE VIEW `team_avg_pts_v`
AS
  SELECT   (SELECT (1 + count(0))
            FROM   `team_avg_pts_norank_v` `s2`
            WHERE  (`s2`.`avg_pts` > `s`.`avg_pts`))
             AS `102_rank`,
           `s`.`frc_rank` AS `FRC_rank`,
           ((SELECT (1 + count(0))
             FROM   `team_avg_pts_norank_v` `s2`
             WHERE  (`s2`.`avg_pts` > `s`.`avg_pts`)) - `s`.`frc_rank`)
             AS `luck`,
           `s`.`team_number` AS `team_number`,
           `s`.`num_matches` AS `num_matches`,
           `s`.`avg_pts` AS `avg_pts`,
           `s`.`ranking_points` AS `rank_pts`,
           `s`.`avg_auto_pts` AS `avg_auto_pts`,
           `s`.`auto_gear_tries` AS `auto_gear_tries`,
           `s`.`auto_gear_success` AS `auto_gear_success`,
           `s`.`auto_gear_PCT` AS `auto_gear_PCT`,
           `s`.`auto_goal` AS `auto_goal`,
           `s`.`Avg_Gears` AS `Avg_Gears`,
           `s`.`Rope_Pct` AS `Rope_Pct`,
           `s`.`climbed_rope` AS `climbed_rope`,
           `s`.`Gear_Tries` AS `Gear_Tries`,
           `s`.`Gear_Success` AS `Gear_Success`,
           `s`.`Gear_PCT` AS `Gear_PCT`,
           `s`.`Gear_pts` AS `Gear_pts`,
           `s`.`Avg_Gear_pts` AS `avg_gear_pts`,
           `s`.`Avg_hi_pts` AS `avg_hi_pts`,
           `s`.`Avg_lo_pts` AS `avg_lo_pts`,
           `s`.`Broke_Down` AS `Broke_Down`,
           `s`.`Recovered` AS `Recovered`
  FROM     `team_avg_pts_norank_v` `s` join tournament_teams tt on s.tournament_id = tt.tournament_id and join tournaments t on 
  ORDER BY (SELECT (1 + count(0))
            FROM   `team_avg_pts_norank_v` `s2`
            WHERE  (`s2`.`avg_pts` > `s`.`avg_pts`));