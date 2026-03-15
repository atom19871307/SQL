--SQLQuery3-Scheme 12-21.sql
USE PV_522_Import;
GO

EXEC sp_InsertSchedule
@group_name			=	N'PV_522',
@discipline_name	=	N'MS SQL Server ADO.NET', -- Я поместил здесь один из предметов в свой список
@teacher_name		=	N'Олег',
@start_date			=	'2026-03-16';  -- Начало занятий

SELECT * FROM Schedule

--USE PV_522_Import;
--GO
----Изменяем начало групповых классов в базе
---- ?????? ??? ???? ?????? ?????? ?????? ???
--UPDATE Groups 
--SET start_time	=	'18:30' 
--WHERE group_name	=	N'PV_522';