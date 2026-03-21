--SQLQuery1-sp_GetNextLearningDay.sql 
USE PV_522_Import;
SET DATEFIRST 1;
GO

CREATE PROCEDURE sP_GetNextLearningDay @group_name AS NCHAR(10), @last_learning_date AS DATE
AS
BEGIN
	DECLARE @group_id				AS	INT		= (SELECT group_id FROM Groups WHERE group_name=@group_name);
	DECLARE @learning_days			AS	TINYINT = (SELECT learning_days FROM Groups WHERE group_id=@group_id);
	DECLARE @last_learning_day		AS	TINYINT = DATEPART(WEEKDAY,@last_learning_date);
	DECLARE @next_learning_day		AS	TINYINT = 0;
	DECLARE @day					AS	TINYINT = @last_learning_day + 1;
	PRINT @group_id
	PRINT @learning_days
	PRINT @last_learning_day
	PRINT @next_learning_day
	PRINT @day

	WHILE	@day <7
	BEGIN
		IF @learning_days & POWER (2, @day-1) <> 0
		BEGIN
			SET @next_learning_day = @day;
			PRINT N'------------------------------';
			PRINT @next_learning_day;
			PRINT N'------------------------------';
		END
			SET @day += 1;
	END
	RETURN @next_learning_day;
END