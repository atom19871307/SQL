--SQLQuery1-GetNextLearningDate.sql
USE PV_522_Import;

CREATE FUNCTION GetNextLearningDate(@group_name AS NCHAR(10), @last_learning_date AS DATE = N'1900-01-01')RETURNS DATE
AS
BEGIN
		
END