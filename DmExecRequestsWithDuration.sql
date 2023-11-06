USE master
GO
 
SELECT
CASE
WHEN estimated_completion_time < 36000000
THEN '0'
ELSE ''
END
+ RTRIM(estimated_completion_time/1000/3600)
+ ':' + RIGHT('0' + RTRIM((estimated_completion_time/1000)%3600/60), 2)
+ ':' + RIGHT('0' + RTRIM((estimated_completion_time/1000)%60), 2) AS [Time Remaining],
percent_complete,
*
FROM sys.dm_exec_requests
WHERE percent_complete > 0
