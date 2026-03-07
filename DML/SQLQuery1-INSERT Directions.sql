--SQLQuery1-INSERT Directions.sql
USE PV_522_DDL;

--INSERT Directions
--		(direction_id,direction_name)
--VALUES	(1,				N'Разработка программного обеспечения');

--INSERT Directions
--		(direction_id,direction_name)
--VALUES
--		(2,					N'Компьютерная графика и дизайн'),
--		(3,					N'Сетевые технологии и системное администрирование')
--		;

INSERT Directions
VALUES 
		(4, N'Java devolopment'),
		(5, N'C++ devolopment'),
		(6, N'Python devolopment'),
		(7, N'GameDev'),
		(8, N'Android devolopment'),
		(9, N'NET devolopment'),
		(10, N'Web devolopment')
		;
SELECT * FROM Directions;