--PV_522_ALL_IN_ONE
USE master;
GO

-- 1. ?????? ??? ??? ?????, ??? ??? ?????????? ????
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'PV_522_ALL_IN_ONE')
BEGIN
    ALTER DATABASE PV_522_ALL_IN_ONE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PV_522_ALL_IN_ONE;
END
GO

-- 2. ???????? ??? ??? ?????
CREATE DATABASE PV_522_ALL_IN_ONE;
GO

-- 3. ?????? ??? ???????? ?????? ???
USE PV_522_ALL_IN_ONE;
GO

-- 4. ???????? ??? ????????????? ??? ??????????????

CREATE TABLE Directions 
(
    direction_id SMALLINT PRIMARY KEY IDENTITY(1,1),
    direction_name NVARCHAR(100) NOT NULL
);

CREATE TABLE Groups 
(
    group_id	INT PRIMARY KEY IDENTITY(1,1),
    group_name  NVARCHAR(50) NOT NULL,
    direction   SMALLINT NOT NULL,

    CONSTRAINT FK_Groups_Directions FOREIGN KEY (direction) REFERENCES Directions(direction_id)
);

CREATE TABLE Disciplines 
(
    discipline_id	SMALLINT PRIMARY KEY IDENTITY(1,1),
    discipline_name NVARCHAR(100) NOT NULL
);

CREATE TABLE Teachers 
(
    teacher_id	INT PRIMARY KEY IDENTITY(1,1),
    first_name	NVARCHAR(50) NOT NULL,
    last_name	NVARCHAR(50) NOT NULL
);

CREATE TABLE Students 
(
    student_id	INT PRIMARY KEY IDENTITY(1,1),
    [group]		INT NOT NULL,
    first_name	NVARCHAR(50) NOT NULL,
    last_name	NVARCHAR(50) NOT NULL,

    CONSTRAINT FK_Students_Groups FOREIGN KEY ([group]) REFERENCES Groups(group_id)
);

CREATE TABLE Schedule 
(
    lesson_id	INT PRIMARY KEY IDENTITY(1,1),
    [date]		DATE NOT NULL,
    [time]		TIME(7) NOT NULL,
    discipline	SMALLINT NOT NULL,
    [group]		INT NOT NULL,
    teacher		INT NOT NULL,
    [subject]	NVARCHAR(255),
    spent		BIT NOT NULL DEFAULT 0,

    CONSTRAINT FK_Schedule_Groups			FOREIGN KEY ([group])		REFERENCES Groups(group_id),
    CONSTRAINT FK_Schedule_Teachers			FOREIGN KEY (teacher)		REFERENCES Teachers(teacher_id),
    CONSTRAINT FK_Schedule_Disciplines		FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE Grades 
(
    student INT NOT NULL,
    lesson	INT NOT NULL,
    grade_1 INT NULL,
    grade_2 INT NULL,

    CONSTRAINT FK_Grades_Students FOREIGN KEY (student) REFERENCES Students(student_id),
    CONSTRAINT FK_Grades_Schedule FOREIGN KEY (lesson) REFERENCES Schedule(lesson_id)
);

CREATE TABLE HomeWorks 
(
    [group]		INT NOT NULL,
    lesson		INT NOT NULL,
    [data]		VARBINARY(2000),
    dascription VARCHAR(255) NULL,
    deadline	DATE NULL,

    PRIMARY KEY ([group], lesson),
    CONSTRAINT FK_HomeWorks_Groups		FOREIGN KEY ([group])	REFERENCES Groups(group_id),
    CONSTRAINT FK_HomeWorks_Schedule	FOREIGN KEY (lesson)	REFERENCES Schedule(lesson_id)
);

CREATE TABLE HWResults 
(
    lesson			INT NOT NULL,
    [group]			INT NOT NULL,
    student_id		INT NOT NULL,
    [description]	VARCHAR(255) NULL,
    [data]			VARBINARY(2000) NULL,
    grade			INT NULL,
    comment			VARCHAR(255) NULL,

    CONSTRAINT PK_HWResults				PRIMARY KEY (lesson, [group], student_id),
    CONSTRAINT FK_HWResults_HomeWorks	FOREIGN KEY ([group], lesson)	REFERENCES HomeWorks ([group], lesson),
    CONSTRAINT FK_HWResults_Students	FOREIGN KEY (student_id)		REFERENCES Students(student_id)
);

CREATE TABLE Exams 
(
    teacher		INT NOT NULL,
    student_id	INT NOT NULL,
    discipline	SMALLINT NOT NULL,
    grade		INT NULL,

    CONSTRAINT PK_Exams				PRIMARY KEY (student_id, discipline),
    CONSTRAINT FK_Exams_Teachers	FOREIGN KEY (teacher)		REFERENCES Teachers(teacher_id),
    CONSTRAINT FK_Exams_Students	FOREIGN KEY (student_id)	REFERENCES Students(student_id),
    CONSTRAINT FK_Exams_Disciplines FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id)
);
