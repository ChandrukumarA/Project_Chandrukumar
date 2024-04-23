-- Academic Management Project 

-- create table studentInfo
create table StudentInfo(STU_ID int primary key,STU_NAME VARCHAR(30),DOB DATE,
						 PHONE_NO BIGINT,EMAIL_ID VARCHAR(30),ADDRESS VARCHAR(50));

-- create table courseInfo
create table CourseInfo(COURSE_ID INT primary key,COURSE_NAME VARCHAR(30),
						INSTRUCTOR_NAME VARCHAR(30));
-- create table enrollmentInfo
create table EnrollmentInfo(ENROLLMENT_ID INT,STU_ID INT,COURSE_ID INT,
							ENROLL_STATUS varchar(30),
							FOREIGN KEY (STU_ID) REFERENCES StudentsInfo(STU_ID),
							FOREIGN KEY (COURSE_ID) REFERENCES CourseInfo(COURSE_ID));
							

insert into StudentsInfo VALUES
(101,'chandru','21-02-2000','9367929830','Siva01@gmail.com','chennai'),
(102,'saravana','22-03-2001','9812937379','Sweatha02@gmail.com','trichy'),
(103,'charu','09-04-2001','9832456781','Aravind03@gmail','coimbatore'),
(104,'saranya','08-10-2001','8939728738','Vijay04@gmail.com','ooty'),
(105,'Yashika','04-07-2000','9840308212','Yashika05@gmail.com','ramnad'),
(106,'mani','25-04-2000','9948384748','Mona06@gmail.com','theppam');
insert into CourseInfo values(91,'SQL','Karthik'),(92,'dbms','Riya'),
(93,'python','Ragu'),(94,'rdbms','Karthik');
insert into EnrollmentInfo values(1,101,91,'Enrolled'),(2,102,92,'Not Enrolled'),
(3,103,93,'Enrolled'),(4,104,94,'Enrolled'),(5,105,92,'Enrolled'),
(6,106,93,' Not Enrolled');

select S.STU_NAME, S.PHONE_NO,E.ENROLL_STATUS
from EnrollmentInfo E
inner join StudentsInfo s  on E.STU_ID=S.STU_ID;

select C.COURSE_NAME
from EnrollmentInfo E
join CourseInfo C on E.COURSE_ID = C.COURSE_ID
where E.STU_ID = 105 and E.ENROLL_STATUS='Enrolled';


Select COURSE_NAME, INSTRUCTOR_NAME FROM courseInfo;


Select * FROM courseInfo Where COURSE_NAME = 'dbms';


Select * FROM courseInfo Where COURSE_NAME IN ('dbms','python');


select C.COURSE_NAME,count(E.STU_ID)AS NUMBER_OF_STUDENT from EnrollmentInfo E 
inner join CourseInfo C on E.COURSE_ID = C.COURSE_ID where E.ENROLL_STATUS = 'Enrolled' 
group by C.COURSE_NAME;


select S.STU_NAME from EnrollmentInfo E inner join StudentInfo S on E.STU_ID = S.STU_ID
where E.COURSE_ID = 93 and E.ENROLL_STATUS = 'Enrolled';

select C.INSTRUCTOR_NAME,count(E.STU_ID) AS Enrolled_Student from CourseInfo C
join EnrollmentInfo E on C.Course_ID = E.COURSE_ID where 
E.ENROLL_STATUS = 'Enrolled' group by C.INSTRUCTOR_NAME;

select S.STU_NAME,count(E.COURSE_ID)from StudentInfo S join EnrollmentInfo E 
on S.STU_ID = E.STU_ID where E.ENTROLL_STATUS = 'Enrolled' group by S.STU_NAME
having count(E.COURSE_ID) >1;

select C.COURSE_NAME,count(E.STU_ID) AS Enrolled_Students from EnrollmentInfo E 
join CourseInfo C on E.COURSE_ID = C.COURSE_ID Where E.ENROLL_STATUS = 'Enrolled' 
group by C.COURSE_NAME order by Enrolled_Students desc;
