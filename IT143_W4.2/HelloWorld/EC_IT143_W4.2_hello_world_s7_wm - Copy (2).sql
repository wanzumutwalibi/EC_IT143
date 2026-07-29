CREATE PROCEDURE p_hello_world
AS
BEGIN

TRUNCATE TABLE t_hello_world;

INSERT INTO t_hello_world

SELECT *

FROM v_hello_world;

END;