--SQLQuery4-CREATE Schadule branch.sql
USE PV_522_DDL;

--CREATE TABLE Schedule
--(
--	lesson_id		INT PRIMARY KEY IDENTITY(1,1),
--	[date]			DATE	 NOT NULL,
--	[time]			TIME(7)	 NOT NULL,
--	discipline		SMALLINT NOT NULL,
--	[group]			INT		 NOT	NULL,
--	teacher			INT		 NOT NULL,
--	[subject]		NVARCHAR(255),
--	spent			BIT		 NOT NULL DEFAULT 0,

--	CONSTRAINT FK_Schedule_Groups		FOREIGN KEY([group])	REFERENCES Groups(group_id),
--	CONSTRAINT FK_Schedule_Teachers		FOREIGN KEY(teacher)	REFERENCES Teachers(teacher_id),
--	CONSTRAINT FK_Schedule_Disciplines	FOREIGN KEY(discipline) REFERENCES Disciplines(discipline_id),
--);

--CREATE TABLE Grades
--(
--	student		INT		NOT NULL,
--	lesson		INT		NOT NULL,
--	grade_1		INT		NULL,
--	grade_2		INT		NULL,

--	CONSTRAINT FK_Grades_Students		FOREIGN KEY(student)	REFERENCES Students(student_id),
--	CONSTRAINT FK_Grades_Schedule		FOREIGN KEY(lesson)	REFERENCES Schedule(lesson_id),
--);

--CREATE TABLE HomeWorks
--(
--	[group]		INT		NOT NULL,
--	lesson		INT		NOT NULL,
--	[data]		VARBINARY(2000),
--	description VARCHAR(255) NULL,
--	deadline	DATE NULL,

--	PRIMARY KEY([group], lesson),

--	CONSTRAINT FK_HomeWorks_Groups		FOREIGN KEY([group])	REFERENCES Groups(group_id),
--	CONSTRAINT FK_HomeWorks_Schedule		FOREIGN KEY(lesson)	REFERENCES Schedule(lesson_id),
--);


--CREATE TABLE HWResults
--(
--	lesson		INT		NOT NULL,
--	[group]		INT		NOT NULL,
--	student_id	INT		NOT NULL,
--	description VARCHAR(255)	NULL,
--	grade		INT		NULL,
--	comment		INT		NULL,

--	CONSTRAINT PK_HWresults  PRIMARY KEY(lesson, [group], student_id ),

--	CONSTRAINT FK_HWresults_HomeWorks		FOREIGN KEY([group],lesson)	REFERENCES HomeWorks ([group],lesson),
--	CONSTRAINT FK_HomeWorks_Students		FOREIGN KEY(student_id)		REFERENCES Students(student_id)
--);

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