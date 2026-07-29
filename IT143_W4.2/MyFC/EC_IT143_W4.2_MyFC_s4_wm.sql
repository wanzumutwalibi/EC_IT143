CREATE VIEW v_team_players
AS

SELECT 
t.t_code,
COUNT(*) AS Players

FROM tblPlayerFact p

JOIN tblTeamDim t
ON p.t_id = t.t_id

GROUP BY t.t_code;