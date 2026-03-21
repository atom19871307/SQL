--SQLQuery0-CHECK.sql
USE PV_522_Import;
SET DATEFIRST 1;

--PRINT dbo.GetLastLearnigDate(N'PV_522');
--EXEC sp_SelectSchedule;

PRINT dbo.GetNextLearningDay(N'PV_522', N'2026-03-19')

--EXEC sp_GetNextLearningDay N'PV_522', N'2026-03-17';

--SELECT learning_days FROM Groups WHERE group_id=522