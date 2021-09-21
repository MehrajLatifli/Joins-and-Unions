
--Cannot drop database because it is currently in use
USE [master]
ALTER DATABASE Academy SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP database Academy;

-- Delete table with auto increment id
Truncate table Academy.dbo.Departments; 
DROP table Academy.dbo.Departments; 

-- Cannot truncate table because it is being referenced by a FOREIGN KEY constraint.
delete from Academy.dbo.Groups;
DBCC CHECKIDENT ('Academy.dbo.Departments', RESEED, 0);








create database Academy

use Academy




-- Teachers


create table Teachers
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Teachers's name]  nvarchar(max) NOT NULL,
[Teachers's surname]  nvarchar(max) NOT NULL,

Constraint CK_TeacherName Check([Teachers's name] <>' '),
Constraint CK__TeacherSurname Check([Teachers's surname] <>' '),
)


Insert into Academy.dbo.Teachers(Academy.dbo.Teachers.[Teachers's name], Academy.dbo.Teachers.[Teachers's surname])
values
(N'Alex', N'Carmack'),
(N'Edward', N'Hopper'),
(N'Cavid',N'Oğuzlu'),
(N'Qıbçaq',N'Türksoy'),
(N'Orxan',N'Qüdrətli'),
(N'Bağır',N'Bağırzadə'),
(N'Səbinə',N'Fikrətli'),
(N'Zərifə',N'Osmanlı'),
(N'Samantha',N'Adams'),
(N'Kate',N'Brown'),
(N'Head 1 Teacher''s name', N'Head 1 Teacher''s surname'),
(N'Head 2 Teacher''s name', N'Head 2 Teacher''s surname'),
(N'Head 3 Teacher''s name', N'Head 3 Teacher''s surname'),
(N'Head 4 Teacher''s name', N'Head 4 Teacher''s surname'),
(N'Head 5 Teacher''s name', N'Head 5 Teacher''s surname'),
(N'Dean 1 Teacher''s name', N'Dean 1 Teacher''s surname'),
(N'Dean 2 Teacher''s name', N'Dean 2 Teacher''s surname'),
(N'Dean 3 Teacher''s name', N'Dean 3 Teacher''s surname'),
(N'Dean 4 Teacher''s name', N'Dean 4 Teacher''s surname'),
(N'Dean 5 Teacher''s name', N'Dean 5 Teacher''s surname'),

(N'Curator 1 Teacher''s name', N'Curator 1 Teacher''s surname'),
(N'Curator 2 Teacher''s name', N'Curator 2 Teacher''s surname'),
(N'Curator 3 Teacher''s name', N'Curator 3 Teacher''s surname'),
(N'Curator 4 Teacher''s name', N'Curator 4 Teacher''s surname'),
(N'Curator 5 Teacher''s name', N'Curator 5 Teacher''s surname'),
(N'Curator 6 Teacher''s name', N'Curator 6 Teacher''s surname'),
(N'Curator 7 Teacher''s name', N'Curator 7 Teacher''s surname'),
(N'Curator 8 Teacher''s name', N'Curator 8 Teacher''s surname'),
(N'Curator 9 Teacher''s name', N'Curator 9 Teacher''s surname'),
(N'Curator 10 Teacher''s name', N'Curator 10 Teacher''s surname')




select *from  Academy.dbo.Teachers




-- Subjects


create table Subjects
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Name of Subject]  nvarchar(100) NOT NULL,

Constraint CK_Name_of_Subject Check([Name of Subject] <>' '),
Constraint UQ_Name_of_Subject Unique([Name of Subject])
)


Insert into Academy.dbo.Subjects(Academy.dbo.Subjects.[Name of Subject])
values
(N'Basics of Programming'),
(N'Algorithm'),
(N'Higher mathematics'),
(N'Basics of cybernetics'),
(N'Basics of physics'),
(N'Higher physics'),
(N'Basics of chemistry'),
(N'Higher chemistry'),
(N'Basics of statistics'),
(N'Database  Theory'),
(N'Basics of econometrica'),
(N'Basics of economics'),
(N'Basics of sociology'),
(N'Religions and myths'),
(N'Basics of phiolosophy'),
(N'Metaphysics'),
(N'Basics of psychology'),
(N'Basics of anthropology')


select *from  Academy.dbo.Subjects




-- Assistants


create table Assistants
(
Id int primary key IDENTITY (1,1) NOT NULL,
[TeacherId for Assistants] int  NOT NULL,

Constraint FK_TeacherId_forAssistants Foreign key ([TeacherId for Assistants]) References Teachers(Id) On Delete CASCADE On Update CASCADE
)


Insert into Academy.dbo.Assistants(Academy.dbo.Assistants.[TeacherId for Assistants])
values
(2),
(4),
(6),
(8),
(10)


select *from  Academy.dbo.Assistants




-- Lectures


create table Lectures
(
Id int primary key IDENTITY (1,1) NOT NULL,
[TeacherId for Lectures] int  NOT NULL,
[SubjectId for Lectures] int  NOT NULL,

Constraint FK_TeacherId_forLectures Foreign key ([TeacherId for Lectures]) References Teachers(Id) On Delete CASCADE On Update CASCADE,
Constraint FK_SubjectId_forLectures Foreign key ([SubjectId for Lectures]) References Subjects(Id) On Delete CASCADE On Update CASCADE
)


Insert into Academy.dbo.Lectures(Academy.dbo.Lectures.[TeacherId for Lectures], Academy.dbo.Lectures.[SubjectId for Lectures])
values


(1,1),
(1,2),
(2,1),
(2,2),

--

(1,3),
(1,4),
(2,4),
(2,3),

--

(3,5),
(4,6),
(3,6),
(4,5),

--

(3,7),
(4,7),
(4,8),
(3,8),

--

(5,9),
(6,9),
(5,10),
(6,10),

--

(5,11),
(6,12),
(5,12),
(6,11),

--

(7,13),
(8,13),
(7,14),
(8,14),

--

(7,15),
(8,16),
(7,16),
(8,15),
--

(9,17),
(10,18),
(9,18),
(10,17)


select *from  Academy.dbo.Lectures


select 
*from
Academy.dbo.Teachers as T,
Academy.dbo.Subjects as S,
Academy.dbo.Lectures as L
where 
T.Id=L.[TeacherId for Lectures]
AND
S.Id= L.[SubjectId for Lectures]
Order by T.Id




-- Deans


create table Deans
(
Id int primary key IDENTITY (1,1) NOT NULL,
[TeacherId for Deans] int  NOT NULL,

Constraint FK_TeacherId_forDeans Foreign key ([TeacherId for Deans]) References Teachers(Id) On Delete CASCADE On Update CASCADE
)


Insert into Academy.dbo.Deans(Academy.dbo.Deans.[TeacherId for Deans])
values
(11),
(12),
(13),
(14),
(15)


select *from  Academy.dbo.Deans




-- Curators


create table Curators
(
Id int primary key IDENTITY (1,1) NOT NULL,
[TeacherId for Curators] int  NOT NULL,

Constraint FK_TeacherId_forCurators Foreign key ([TeacherId for Curators]) References Teachers(Id) On Delete CASCADE On Update CASCADE
)


Insert into Academy.dbo.Curators(Academy.dbo.Curators.[TeacherId for Curators])
values
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30)


select *from  Academy.dbo.Curators


select
*from
Academy.dbo.Teachers as T,
Academy.dbo.Curators as C
where 
T.Id= C.[TeacherId for Curators]




-- Faculties


create table Faculties
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Name of Faculty]  nvarchar(100) NOT NULL,
Building int NOT NULL,
[DeanId for Faculties] int  NOT NULL,

Constraint CK_Name_of_Faculty Check([Name of Faculty] <>' '),
Constraint UQ_Name_of_Faculty Unique([Name of Faculty]),
Constraint CK_Building Check(Building >=1 AND Building <=5),

Constraint FK_DeanId_forFaculties Foreign key ([DeanId for Faculties]) References Deans(Id) On Delete No Action On Update No Action
)


Insert into Academy.dbo.Faculties(Academy.dbo.Faculties.[Name of Faculty], Academy.dbo.Faculties.Building, Academy.dbo.Faculties.[DeanId for Faculties]) 
values
(N'Computer Science', 1, 1),
(N'Electronics', 1, 1),
(N'Physics', 2, 2),
(N'Chemistry', 2, 2),
(N'Statistics', 3, 3),
(N'Econometrica', 3, 3),
(N'Sociology', 4, 4),
(N'Philosophy', 4, 4),
(N'Psychology', 5, 5),
(N'Civil Engineering', 5, 5)


select *from Academy.dbo.Faculties


select 
*from 
Academy.dbo.Deans as D,
Academy.dbo.Faculties as F
where
F.[DeanId for Faculties] = D.Id




-- Heads


create table Heads
(
Id int primary key IDENTITY (1,1) NOT NULL,
[TeacherId for Heads] int  NOT NULL,

Constraint FK_TeacherId_forHeads Foreign key ([TeacherId for Heads]) References Teachers(Id) On Delete CASCADE On Update CASCADE
)


Insert into Academy.dbo.Heads(Academy.dbo.Heads.[TeacherId for Heads])
values
(16),
(17),
(18),
(19),
(20)


select *from Academy.dbo.Heads




-- Departments


create table Departments
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Name of Departments]  nvarchar(100) NOT NULL,
Building int NOT NULL,
[FacultyId for Departments] int  NOT NULL,
[HeadId for Departments] int  NOT NULL,

Constraint CK_Name_of_Departments Check([Name of Departments] <>' '),
Constraint UQ_Name_of_Departments Unique([Name of Departments]),
Constraint CK_BuildingDepartments Check(Building >=1 AND Building <=5),

Constraint FK_FacultyId_forDepartments Foreign key ([FacultyId for Departments]) References Faculties(Id) On Delete NO ACTION On Update NO ACTION,
Constraint FK_HeadId_forDepartments Foreign key ([HeadId for Departments]) References Heads(Id) On Delete NO ACTION On Update NO ACTION
)


Insert into Academy.dbo.Departments(Academy.dbo.Departments.[Name of Departments], Academy.dbo.Departments.Building, Academy.dbo.Departments.[FacultyId for Departments], Academy.dbo.Departments.[HeadId for Departments])
values
(N'Software Development', 1, 1, 1),
(N'Software Development_2', 1, 2, 1),
(N'Software Development_3', 1, 1, 2),
(N'Physics and Chemistry', 2, 3, 2),
(N'Physics and Chemistry_2', 2, 4, 3),
(N'Statistics and Econometrica', 3, 5, 3),
(N'Statistics and Econometrica_2', 3, 6, 4),
(N'Sociology and Philosophy', 4, 7, 4),
(N'Sociology and Philosophy_2', 4, 8, 5),
(N'Psychology', 5, 9, 5),
(N'Civil Engineering', 5, 10, 1)


select *from Academy.dbo.Departments


select 
*from
Academy.dbo.Faculties as F,
Academy.dbo.Heads as H,
Academy.dbo.Departments as D,
Academy.dbo.Teachers as T
where
F.Id=D.[FacultyId for Departments]
AND
H.Id=D.[HeadId for Departments]
AND
H.[TeacherId for Heads] = T.Id




-- Groups 


create table Groups 
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Name of Group] nvarchar(10) NOT NULL,
[Year of Group] int  NOT NULL,
[DepartmentId for Groups] int  NOT NULL,

Constraint FK_DepartmentId_forGroups Foreign key ([DepartmentId for Groups]) References Departments(Id) On Delete No Action On Update No Action,

Constraint CK_Name_of_Group Check([Name of Group] <>' '),
Constraint UQ_Name_of_Group Unique([Name of Group]),
Constraint CK_Year_of_Group Check([Year of Group] >=1 AND [Year of Group]<=5)
)


Insert into Academy.dbo.Groups([Name of Group], [Year of Group], [DepartmentId for Groups])
values
(N'F505', 5, 1),
(N'B103', 5, 1),
(N'C226', 4, 2),
(N'D221', 4, 2),
(N'A213', 3, 3),
(N'Q289', 3, 3),
(N'V214', 2, 4),
(N'J283', 2, 4),
(N'F205', 1, 5),
(N'B203', 1, 5),
(N'C326', 5, 1),
(N'D421', 5, 1),
(N'A613', 4, 2),
(N'Q589', 4, 2),
(N'V714', 3, 3),
(N'J973', 3, 3),
(N'A870', 2, 4),
(N'Q849', 2, 4),
(N'V584', 1, 5),
(N'J974', 1, 5)


select *from Academy.dbo.Groups




-- Groups and Lectures


create table [Groups and Lectures]
(
Id int primary key IDENTITY (1,1) NOT NULL,
[GroupId for Groups and Lectures] int  NOT NULL,
[LectureId for Groups and Lectures] int  NOT NULL,

Constraint FK_GroupId_forGroupsandLectures Foreign key ([GroupId for Groups and Lectures]) References Groups(Id) On Delete CASCADE On Update CASCADE,
Constraint FK_LectureId_forGroupsandLectures Foreign key ([LectureId for Groups and Lectures]) References Lectures(Id) On Delete CASCADE On Update CASCADE
)


Insert into Academy.dbo.[Groups and Lectures]([GroupId for Groups and Lectures], [LectureId for Groups and Lectures])
values

(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),


(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),

(2, 13),
(2, 14),
(2, 15),
(2, 16),

(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),

(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),


(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),

(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),


(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),

(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),

(4, 21),
(4, 22),
(4, 23),
(4, 24),
(4, 25),
(4, 26),
(4, 27),


(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),

(5, 11),
(5, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 20),


(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),

(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),


(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),


(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),


(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),


(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),


(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 9),
(11, 10),

(11, 21),
(11, 22),
(11, 23),
(11, 24),
(11, 25),
(11, 26),
(11, 27),
(11, 28),
(11, 29),
(11, 30),


(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 9),
(12, 10),

(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(13, 7),
(13, 8),
(13, 9),
(13, 10),


(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 6),
(14, 7),
(14, 8),
(14, 9),
(14, 10),

(14, 11),
(14, 12),
(14, 13),
(14, 14),
(14, 15),
(14, 16),
(14, 17),
(14, 18),
(14, 19),
(14, 20),


(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5),
(15, 6),
(15, 7),
(15, 8),
(15, 9),
(15, 10),


(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(16, 6),
(16, 7),
(16, 8),
(16, 9),
(16, 10),

(16, 11),
(16, 12),
(16, 13),
(16, 14),
(16, 15),
(16, 16),
(16, 17),
(16, 18),
(16, 19),
(16, 20),


(17, 11),
(17, 12),
(17, 13),
(17, 14),
(17, 15),
(17, 16),
(17, 17),
(17, 18),
(17, 19),
(17, 20),


(18, 1),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 6),
(18, 7),
(18, 8),
(18, 9),
(18, 10),



(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(19, 10),


(20, 1),
(20, 2),
(20, 3),
(20, 4),
(20, 5),
(20, 6),
(20, 7),
(20, 8),
(20, 9),
(20, 10)



select *from Academy.dbo.Lectures 


select *from Academy.dbo.Groups


select *from Academy.dbo.[Groups and Lectures] 


select 
*from 
Academy.dbo.Groups as G,
Academy.dbo.Lectures as L,
Academy.dbo.[Groups and Lectures] as GL
where
G.Id =GL.[GroupId for Groups and Lectures]
AND
L.Id=GL.[LectureId for Groups and Lectures]




-- Groups and Curators


create table [Groups and Curators]
(
Id int primary key IDENTITY (1,1) NOT NULL,
[CuratorId for Groups and Curators] int  NOT NULL,
[GroupId for Groups and Curators] int  NOT NULL,

Constraint FK_CuratorId_forGroupsandCurators Foreign key ([CuratorId for Groups and Curators]) References Curators(Id) On Delete CASCADE On Update CASCADE,
Constraint FK_GroupId_forGroupsandCurators Foreign key ([GroupId for Groups and Curators]) References Groups(Id) On Delete CASCADE On Update CASCADE
)


Insert into Academy.dbo.[Groups and Curators](Academy.dbo.[Groups and Curators].[CuratorId for Groups and Curators], Academy.dbo.[Groups and Curators].[GroupId for Groups and Curators]) 
values
(1,1),
(1,9),
(2,2),
(2,10),
(3,3),
(3,11),
(4,4),
(4,12),
(5,5),
(5,13),
(6,6),
(6,14),
(7,7),
(7,15),
(8,8),
(8,16),
(9,17),
(9,18),
(10,19),
(10,20)


select *from Academy.dbo.Curators


select *from Academy.dbo.Groups


select *from Academy.dbo.[Groups and Curators]


select
*from 
Academy.dbo.Curators as C,
Academy.dbo.Groups as G,
Academy.dbo.[Groups and Curators] as GC,
Academy.dbo.Teachers as T
where
GC.[CuratorId for Groups and Curators]= C.Id
AND
GC.[GroupId for Groups and Curators]= G.Id
AND
T.Id = C.[TeacherId for Curators]




-- LectureRooms


create table LectureRooms
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Name of Classroom]  nvarchar(10) NOT NULL,
Building int NOT NULL,

Constraint CK_Name_of_Classroom Check([Name of Classroom] <>' '),
Constraint UQ_Name_of_Classroom Unique([Name of Classroom]),
Constraint CK_BuildingClassroom Check(Building >=1 AND Building <=5)
)


Insert Into Academy.dbo.LectureRooms (Academy.dbo.LectureRooms.[Name of Classroom], Academy.dbo.LectureRooms.Building)
values
(N'A311',5),
(N'A104',5),
(N'A211',5),
(N'A404',5),

(N'B311',4),
(N'B104',4),
(N'B211',4),
(N'B404',4),

(N'C311',3),
(N'C104',3),
(N'C211',3),
(N'C404',3),

(N'D311',2),
(N'D104',2),
(N'D211',2),
(N'D404',2),

(N'E311',1),
(N'E104',1),
(N'E211',1),
(N'E404',1)


select *from Academy.dbo.LectureRooms




-- Schedules


create table Schedules
(
Id int primary key IDENTITY (1,1) NOT NULL,
[Double period] int NOT NULL,
[Day of week] int NOT NULL,
[Week number of lecture] int NOT NULL,
[LectureId for Schedules] int  NOT NULL,
[LectureRoomsId for Schedules] int  NOT NULL,

Constraint CK_DoublePeriod Check([Double period] >=1 AND [Double period] <=8),
Constraint CK_DayofWeek Check([Day of week] >=1 AND [Day of week] <=7),
Constraint CK_WeeknumberofLecture Check([Week number of lecture] >=1 AND [Week number of lecture] <=52),

Constraint FK_LectureId_forSchedules Foreign key ([LectureId for Schedules]) References Lectures(Id) On Delete NO ACTION On Update NO ACTION,
Constraint FK_LectureRoomsId_forSchedules Foreign key ([LectureRoomsId for Schedules]) References LectureRooms(Id) On Delete NO ACTION On Update NO ACTION
)


Insert into Academy.dbo.Schedules([Double period], [Day of week], [Week number of lecture], [LectureId for Schedules], [LectureRoomsId for Schedules])
values
(5, 1, 8, 1, 1),
(5, 3, 9, 1, 2),
(6, 3, 9, 2, 3),
(5, 4, 5, 2, 4),
(3, 2, 2, 3, 5),
(7, 4, 12, 3, 6),
(3, 2, 12, 4, 7),
(5, 2, 12, 4, 8),
(4, 3, 12, 5, 9),
(3, 7, 2, 5, 10),
(5, 1, 8, 6, 11),
(5, 3, 9, 6, 12),
(6, 3, 9, 7, 13),
(5, 7, 50, 7, 14),
(3, 2, 2, 8, 15),
(7, 4, 12, 8, 16),
(3, 2, 12, 9, 17),
(5, 2, 12, 9, 18),
(4, 7, 12, 10, 19),
(3, 7, 2, 10, 20),

(5, 1, 8, 11, 1),
(5, 3, 9, 11, 2),
(6, 3, 9, 12, 3),
(5, 4, 5, 12, 4),
(3, 2, 2, 13, 5),
(7, 4, 12, 13, 6),
(3, 2, 12, 14, 7),
(5, 2, 12, 14, 8),
(4, 3, 12, 15, 9),
(3, 7, 2, 15, 10),
(5, 1, 8, 16, 11),
(5, 3, 9, 16, 12),
(6, 3, 9, 17, 13),
(5, 7, 50, 17, 14),
(3, 2, 2, 18, 15),
(7, 4, 12, 18, 16),
(3, 2, 12, 19, 17),
(5, 2, 12, 19, 18),
(4, 7, 12, 20, 19),
(3, 7, 2, 20, 20),

(5, 1, 8, 21, 1),
(5, 3, 9, 21, 2),
(6, 3, 9, 22, 3),
(5, 4, 5, 22, 4),
(3, 2, 2, 23, 5),
(7, 4, 12, 23, 6),
(3, 2, 12, 24, 7),
(5, 2, 12, 24, 8),
(4, 3, 12, 25, 9),
(3, 7, 2, 25, 10),
(5, 1, 8, 26, 11),
(5, 3, 9, 26, 12),
(6, 3, 9, 27, 13),
(5, 7, 50, 27, 14),
(3, 2, 2, 28, 15),
(7, 4, 12, 28, 16),
(3, 2, 12, 29, 17),
(5, 2, 12, 29, 18),
(4, 7, 12, 30, 19),
(3, 7, 2, 30, 20),

(5, 1, 8, 31, 1),
(5, 3, 9, 31, 2),
(6, 3, 9, 32, 3),
(5, 4, 5, 32, 4),
(3, 2, 2, 33, 5),
(7, 4, 12, 33, 6),
(3, 2, 12, 34, 7),
(5, 2, 12, 34, 8),
(4, 3, 12, 35, 9),
(3, 7, 2, 35, 10),
(5, 1, 8, 36, 11),
(5, 3, 9, 36, 12)


select *from Academy.dbo.Schedules


select
*from
Academy.dbo.Lectures as L,
Academy.dbo.LectureRooms as LR,
Academy.dbo.Schedules as S
where
L.Id=S.[LectureId for Schedules]
AND
LR.Id=S.[LectureRoomsId for Schedules]
