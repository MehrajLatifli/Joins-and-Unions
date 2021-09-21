
-- Joins and Unions


use Academy




-- Print names of the classrooms where the teacher "Edward Hopper" lectures


select 
LectureRooms.[Name of Classroom]
from 
Lectures
Inner Join  Teachers
ON 
Teachers.Id=Lectures.[TeacherId for Lectures]
Inner Join  Schedules
ON
Schedules.[LectureId for Schedules]=Lectures.Id
Inner Join  LectureRooms
ON
Schedules.[LectureRoomsId for Schedules]=LectureRooms.Id
Where 
Teachers.[Teachers's name] ='Edward' and Teachers.[Teachers's surname]='Hopper'




-- Print names of the assistants who deliver lectures for the group "F505".


select Distinct
Teachers.[Teachers's name]
from
Assistants
Inner Join  Teachers
ON 
Assistants.[TeacherId for Assistants]=Teachers.Id
Inner Join  Lectures
ON 
Lectures.[TeacherId for Lectures] =Teachers.Id
Inner Join  [Groups and Lectures]
ON 
[Groups and Lectures].[LectureId for Groups and Lectures]=Lectures.Id
Inner Join  Groups
ON 
Groups.Id=[Groups and Lectures].[GroupId for Groups and Lectures]
where
Groups.[Name of Group]='F505'




-- Print subjects taught by the teacher "Alex Carmack" for groups of the 5th year


select
Subjects.[Name of Subject], Groups.[Name of Group]
from
Subjects
Inner Join  Lectures
ON 
Lectures.[SubjectId for Lectures]=Subjects.Id
Inner Join  Teachers
ON 
Lectures.[TeacherId for Lectures]=Teachers.Id
Inner Join  [Groups and Lectures]
ON 
[Groups and Lectures].[LectureId for Groups and Lectures]=Lectures.Id
Inner Join  Groups
ON 
Groups.Id=[Groups and Lectures].[GroupId for Groups and Lectures]
where 
Teachers.[Teachers's name]='Alex' 
AND
Teachers.[Teachers's surname]='Carmack'
AND
Groups.[Year of Group]=5




--x Print names of the teachers who do not deliver lectures on Mondays


select Distinct
Teachers.[Teachers's name], Schedules.[Day of week]
from
Teachers
Inner Join  Lectures
ON 
Lectures.[TeacherId for Lectures]=Teachers.Id
Inner Join  Subjects
ON 
Lectures.[SubjectId for Lectures]=Subjects.Id
Inner Join  Schedules
ON 
Schedules.[LectureId for Schedules]=Lectures.Id
EXCEPT
-- deliver lectures on Mondays
select Distinct
Teachers.[Teachers's name], Schedules.[Day of week]
from
Teachers
Inner Join  Lectures
ON 
Lectures.[TeacherId for Lectures]=Teachers.Id
Inner Join  Subjects
ON 
Lectures.[SubjectId for Lectures]=Subjects.Id
Inner Join  Schedules
ON 
Schedules.[LectureId for Schedules]=Lectures.Id
where
Schedules.[Day of week] < ALL
(
Select Schedules.[Day of week]
from Schedules, Lectures
where Schedules.[LectureId for Schedules]= Lectures.Id
AND
Schedules.[Day of week]>1
)




-- Print names of the classrooms, indicating their buildings, in which there are no lectures on Wednesday of the second week on the third double period.


select Distinct
LectureRooms.[Name of Classroom], LectureRooms.Building, Schedules.[Day of week], Schedules.[Week number of lecture], Schedules.[Double period]
from
LectureRooms
Inner Join  Schedules
ON 
LectureRooms.Id=Schedules.[LectureRoomsId for Schedules]
Inner Join Lectures
ON
Lectures.Id=Schedules.[LectureId for Schedules]
where
Schedules.[Day of week]<>3
AND
Schedules.[Week number of lecture]=2
AND
Schedules.[Double period]=3




-- Print full names of teachers of the Computer Science faculty, who do not supervise groups of the Software Development department.


select Distinct
Teachers.[Teachers's name]+' '+ Teachers.[Teachers's surname] as [Teacher's fullname], Departments.[Name of Departments]
from
Teachers
Inner Join Lectures
ON 
Lectures.[TeacherId for Lectures] = Teachers.Id
Inner Join [Groups and Lectures]
ON
Lectures.Id= [Groups and Lectures].[LectureId for Groups and Lectures]
Inner Join Groups
ON
[Groups and Lectures].[GroupId for Groups and Lectures]= Groups.Id
Inner Join Departments
ON
Departments.Id=Groups.[DepartmentId for Groups]
Inner Join Faculties
ON
Faculties.Id=Departments.[FacultyId for Departments]
where
Faculties.[Name of Faculty] = 'Computer Science'
AND
Departments.[Name of Departments] != 'Software Development'




-- Print numbers of all buildings that are available in the tables of faculties, departments, and classrooms.


select Distinct
LectureRooms.Building, Faculties.[Name of Faculty], Departments.[Name of Departments], LectureRooms.[Name of Classroom]
from
Faculties
Inner Join Departments
ON 
Faculties.Id=Departments.[FacultyId for Departments]
Inner Join Groups
ON 
Departments.Id=Groups.[DepartmentId for Groups]
Inner Join [Groups and Lectures]
ON 
[Groups and Lectures].[GroupId for Groups and Lectures]= Groups.Id
Inner Join Lectures
ON 
Lectures.Id= [Groups and Lectures].[LectureId for Groups and Lectures]
Inner Join Schedules
ON 
Schedules.[LectureId for Schedules]=Lectures.Id
Inner Join LectureRooms
ON 
LectureRooms.Id=Schedules.[LectureId for Schedules]




-- Print full names of teachers in the following order: deans of faculties, heads of departments, teachers, curators, assistants.


select Distinct
Teachers.[Teachers's name]+' '+Teachers.[Teachers's surname]
from
Teachers
Inner Join Heads
ON 
Heads.[TeacherId for Heads]=Teachers.Id
UNION ALL
select Distinct
Teachers.[Teachers's name]+' '+Teachers.[Teachers's surname]
from
Teachers
Inner Join Deans
ON 
Deans.[TeacherId for Deans]=Teachers.Id
UNION ALL
select Distinct
Teachers.[Teachers's name]+' '+Teachers.[Teachers's surname]
from
Teachers
Inner Join Curators
ON 
Curators.[TeacherId for Curators] = Teachers.Id
UNION ALL
select Distinct
Teachers.[Teachers's name]+' '+Teachers.[Teachers's surname]
from
Teachers
Inner Join Lectures
ON 
Lectures.[TeacherId for Lectures] = Teachers.Id
Inner Join [Groups and Lectures]
ON 
Lectures.Id = [Groups and Lectures].[LectureId for Groups and Lectures]
Inner Join Groups
ON 
Groups.Id = [Groups and Lectures].[GroupId for Groups and Lectures]
Inner Join Departments
ON 
Departments.Id=Groups.[DepartmentId for Groups]
Inner Join Faculties
ON 
Faculties.Id=Departments.[FacultyId for Departments]
Inner Join Deans
ON 
Deans.Id=Faculties.[DeanId for Faculties]
Inner Join Heads
ON 
Heads.Id= Departments.[HeadId for Departments]
Inner Join [Groups and Curators]
ON 
[Groups and Curators].[GroupId for Groups and Curators]= Groups.Id




-- Print days of the week (without repetitions), in which there are classes in the classrooms "A311" and "A104" of the building 5


select Distinct
Schedules.[Day of week]
from
LectureRooms
Inner Join Schedules
ON 
LectureRooms.Id=Schedules.[LectureRoomsId for Schedules]
Inner Join Lectures
ON 
Lectures.Id=Schedules.[LectureId for Schedules]
Inner Join [Groups and Lectures]
ON 
Lectures.Id=[Groups and Lectures].[LectureId for Groups and Lectures]
Inner Join Groups
ON 
Groups.Id=[Groups and Lectures].[GroupId for Groups and Lectures]
where
LectureRooms.Building=5
AND
(
LectureRooms.[Name of Classroom]='A311'
OR
LectureRooms.[Name of Classroom]='A104'
)



