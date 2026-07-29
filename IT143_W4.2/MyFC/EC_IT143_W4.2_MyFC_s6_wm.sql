TRUNCATE TABLE t_team_players;

INSERT INTO t_team_players

SELECT *
FROM v_team_players;