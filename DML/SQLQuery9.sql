USE PV_522_DDL;
GO

SELECT 
    D.discipline_name AS [Дисциплина], 
    COUNT(DISTINCT S.teacher) AS [Количество преподавателей]
FROM Disciplines D
JOIN Schedule S ON D.discipline_id = S.discipline
WHERE D.discipline_name = N'C++ Programming'
GROUP BY D.discipline_name;