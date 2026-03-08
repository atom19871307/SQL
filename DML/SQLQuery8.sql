USE PV_522_DDL;
GO

SELECT 
    T.last_name AS [Преподаватель], 
    COUNT(DISTINCT S.discipline) AS [Количество дисциплин]
FROM Teachers T
JOIN Schedule S ON T.teacher_id = S.teacher
WHERE T.last_name = N'Mayilyan' 
GROUP BY T.last_name;