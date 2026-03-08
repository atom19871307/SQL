USE PV_522_DDL;
GO

SELECT 
    D.discipline_name AS [Дисциплина],
    T.first_name + ' ' + T.last_name AS [Преподаватель]
FROM Disciplines D
JOIN Schedule S ON D.discipline_id = S.discipline
JOIN Teachers T ON S.teacher = T.teacher_id
WHERE D.discipline_name = N'C++ Programming';