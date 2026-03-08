--SQLQuery4-INSERT Disciplines.sql
USE PV_522_DDL;
Go
--SELECT * FROM Disciplines;

--INSERT INTO Disciplines (discipline_name)
--VALUES
--	(1, N'C++ Programming'),
--	(2, N'SQL Server Administration'),
--	(3, N'C# Development'),
--	(4, N'Web Technologies'),
--	(5, N'System Design');
--GO
--SELECT * FROM Disciplines;

--INSERT INTO Disciplines (discipline_id, discipline_name,number_of_lessons)
--VALUES
--	(1, N'C++ Programming', 80),
--	(2, N'SQL Server Administration', 60),
--	(3, N'C# Development',90),
--	(4, N'Web Technologies',40),
--	(5, N'System Design',30);
--GO
--SELECT * FROM Disciplines;

DELETE FROM Disciplines;
Go

INSERT INTO Disciplines (discipline_id, discipline_name, number_of_lessons)
VALUES 
    (1, N'C++ Programming', 90),
    (2, N'SQL Server Administration', 60),
    (3, N'C# Development', 90),
    (4, N'Web Technologies', 45),
    (5, N'System Design', 30);
GO

-- 3. ????? ??? ????? ?????????
SELECT * FROM Disciplines;

