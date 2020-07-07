SELECT P.spid
      ,E.name as DBname
	  ,P.login_time
	  ,P.last_batch
	  ,P.status
	  ,P.program_name
	  ,P.cmd
	  ,P.loginame
	  ,C.client_net_address
	  ,D.text FROM sys.sysprocesses AS P 
INNER JOIN sys.dm_exec_connections AS C ON P.spid = C.session_id CROSS APPLY sys.dm_exec_sql_text (P . sql_handle) D 
INNER JOIN sys.databases AS E on D.dbid = E.database_id 
-- WHERE client_net_address IN ('°Ë»öIP') 
-- ORDER BY login_time

