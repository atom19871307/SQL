--PV_522_ALL_IN_ONE
USE master
GO

-- 1. ??? ?? ????, ?????? ???
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'PV_522_ALL_IN_ONE')
BEGIN
    ALTER DATABASE PV_522_ALL_IN_ONE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PV_522_ALL_IN_ONE;
END
GO -- ?? ???????? ?

-- 2. ???????? ??? ?????
CREATE DATABASE PV_522_ALL_IN_ONE;
GO -- ?? ??? ?????? ?, ?? ?????? ???? ???? ???

-- 3. ???? ????? ????? ??? ??????????

GO

CREATE DATABASE PV_522_ALL_IN_ONE
ON
(
	NAME		=	PV_522_ALL_IN_ONE,
	FILENAME	=	'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_522_ALL_IN_ONE.mdf',
	SIZE		=	8 MB,
	MAXSIZE		=	500 MB,
	FILEGROWTH	=	8 MB
)
LOG ON
(
	NAME		=	PV_522_ALL_IN_ONE_Log,
	FILENAME	=	'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_522_ALL_IN_ONE.ldf',
	SIZE		=	8 MB,
	MAXSIZE		=	500 MB,
	FILEGROWTH	=	8 MB
);



CREATE TABLE Directions
(
	direction_id	SMALLINT		PRIMARY KEY,
	direction_name	NVARCHAR(50)	NOT NULL
);

CREATE TABLE Groups
(
	group_id		INT				PRIMARY KEY,
	group_name		NVARCHAR(24)	NOT NULL,
	start_date		DATE			NOT NULL,
	start_time		TIME			NOT NULL,
	learning_days	INT				NOT NULL,
	direction		SMALLINT		NOT NULL
	CONSTRAINT FK_Groups_Directions		FOREIGN KEY REFERENCES Directions(direction_id)
);


CREATE TABLE Students
(
	student_id		INT				PRIMARY KEY,
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50)		NULL,
	birth_date		DATE			NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT  FK_Groups_Groups		FOREIGN KEY REFERENCES Groups(group_id)
	);

CREATE TABLE Teachers
(
	teacher_id		INT				PRIMARY KEY,
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50)		NULL,
	birth_date		DATE			NOT NULL,
	rate			MONEY			NOT NULL	DEFAULT 50
);

CREATE  TABLE Disciplines
(
	discipline_id		SMALLINT		PRIMARY KEY,
	discipline_name		NVARCHAR(150)	NOT NULL,
	number_of_lessons	TINYINT			NOT NULL
);
CREATE  TABLE TeachersDisciplinesRelation
(
	teacher		INT,
	discipline	SMALLINT,
	PRIMARY KEY (teacher,discipline),
	CONSTRAINT FK_TDR_Teachers	 FOREIGN KEY (teacher)		REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_TDR_Discipline FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id)
);
CREATE  TABLE DirectionsDirectionRelation
(
	discipline	SMALLINT,
	direction	SMALLINT,
	PRIMARY KEY (discipline,direction),
	CONSTRAINT FK_TDR_Disciplines	FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_TDR_Directions	FOREIGN KEY (direction)		REFERENCES Directions(direction_id)
	);
	CREATE TABLE Schedule
(
	lesson_id		INT PRIMARY KEY IDENTITY(1,1),
	[date]			DATE	 NOT NULL,
	[time]			TIME(7)	 NOT NULL,
	discipline		SMALLINT NOT NULL,
	[group]			INT		 NOT	NULL,
	teacher			INT		 NOT NULL,
	[subject]		NVARCHAR(255),
	spent			BIT		 NOT NULL DEFAULT 0,

	CONSTRAINT FK_Schedule_Groups		FOREIGN KEY([group])	REFERENCES Groups(group_id),
	CONSTRAINT FK_Schedule_Teachers		FOREIGN KEY(teacher)	REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_Schedule_Disciplines	FOREIGN KEY(discipline) REFERENCES Disciplines(discipline_id),
);

CREATE TABLE Grades
(
	student		INT		NOT NULL,
	lesson		INT		NOT NULL,
	grade_1		INT		NULL,
	grade_2		INT		NULL,

	CONSTRAINT FK_Grades_Students		FOREIGN KEY(student)	REFERENCES Students(student_id),
	CONSTRAINT FK_Grades_Schedule		FOREIGN KEY(lesson)	REFERENCES Schedule(lesson_id),
);

CREATE TABLE HomeWorks
(
	[group]		INT		NOT NULL,
	lesson		INT		NOT NULL,
	[data]		VARBINARY(2000),
	description VARCHAR(255) NULL,
	deadline	DATE NULL,

	PRIMARY KEY([group], lesson),

	CONSTRAINT FK_HomeWorks_Groups		FOREIGN KEY([group])	REFERENCES Groups(group_id),
	CONSTRAINT FK_HomeWorks_Schedule		FOREIGN KEY(lesson)	REFERENCES Schedule(lesson_id),
);


CREATE TABLE HWResults
(
	lesson		INT		NOT NULL,
	[group]		INT		NOT NULL,
	student_id	INT		NOT NULL,
	description VARCHAR(255)	NULL,
	grade		INT		NULL,
	comment		INT		NULL,

	CONSTRAINT PK_HWresults  PRIMARY KEY(lesson, [group], student_id ),

	CONSTRAINT FK_HWresults_HomeWorks		FOREIGN KEY([group],lesson)	REFERENCES HomeWorks ([group],lesson),
	CONSTRAINT FK_HomeWorks_Students		FOREIGN KEY(student_id)		REFERENCES Students(student_id)
);

CREATE TABLE Exams
(
	teacher		INT NOT NULL,
	student_id	INT NOT NULL,
	discipline	SMALLINT NOT NULL,
	grade		INT NULL,

	CONSTRAINT PK_EXAMS  PRIMARY KEY(student_id, discipline),

	CONSTRAINT FK_Exams_Teachers	FOREIGN KEY (teacher)	 REFERENCES Teachers(teacher_id),
    CONSTRAINT FK_Exams_Students	FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT FK_Exams_Disciplines FOREIGN KEY (discipline) REFERENCES Disciplines(discipline_id)
)