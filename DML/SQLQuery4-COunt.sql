--SQLQuery4-COunt.sql
USE PV_522_Import;

--SELECT 
--			direction_name			AS N'Направление обучение',
--			COUNT (group_id)		AS N'Количества групп'
--FROM		Groups, Directions
--WHERE		direction=direction_id
--GROUP BY	direction_name
--ORDER BY	COUNT (group_id) 		DESC
--;

--SELECT 
--			group_name			AS	N'Имя групы',
--			COUNT (stud_id)		AS N'Количества студентов'
--FROM		Students, Groups
--WHERE		[group]=group_id	
--GROUP BY	group_name
--HAVING		COUNT(stud_id) < 10
--;

--SELECT * FROM Groups;

--SELECT
--			[Направление обучение]		=	direction_name,
--			[Каличество групп]			=	COUNT(DISTINCT group_id),
--			[Каличество студентов]		=	COUNT(stud_id)
--FROM		Students,Groups,Directions
--WHERE		[group]		=	group_id
--AND			direction	=	direction_id
--GROUP BY	direction_name
--;

--SELECT
--			DISTINCT discipline_name
--FROM		Disciplines;

SELECT
		[Направление обучения]		=	direction_name,
		[Количество групп]			=	(SELECT COUNT(DISTINCT group_id) FROM Groups WHERE direction=direction_id),
		[Количество студентов]		=	
		(SELECT COUNT(stud_id) FROM Students,Groups WHERE [group]=group_id AND direction=direction_id ) 
FROM	 Directions
--WHERE	direction=direction_id
;