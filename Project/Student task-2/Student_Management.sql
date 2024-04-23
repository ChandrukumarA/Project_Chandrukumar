-- Student Management 

create table Student(Student_id integer, Stu_name text, Department text, email_id text,
					 Phone_no numeric, Address text,Date_of_birth date, Gender Text, 
					 Major text, GPA numeric,Grade text);


Insert Into Student Values (1,'saravana','csc','saravana@gmail.com',8754930208,
'villupuram','02-09-2000','Male','Computer',7.0,'C'),
(2,'santhosh','csc',
'santhosh@gmail.com',9874563210,'chennai','06-07-2000','Male','Computer',9.0,'A'),
(3,'chandru','Commerce','chandru@gmail.com',9566073016,'kerala','02-09-2000','Male',
 'Economics',8.0,'B'),
 (4,'charu','csc','charu@gmail.com','9790762960','villupuram',
'25-07-2003','Female','Computer',6.0,'D'),
(5,'saranya','Biology','saranya@gmail.com',9790761296,
'Royapuram,Chennai','01-01-2001','Female','Botony',4.0,'F'),
(6,'Anandhi','Computer Science','Anandhi1@gmail.com',
9304910293,'Royapuram,Chennai','11-11-2000','Female','Computer',5.0,'E'),
(7,'nivetha','Biology','nivetha@gmail.com',
9284756821,'adyar,Chennai','08-10-2002','Female','Zoology',3.5,'F'),
(8,'papa','Biology','papa@gmail.com',
917432910,'Santhome,Chennai','01-01-2000','Female','Botny',7.0,'C'),
(9,'Arthi','Commerce','Arthi1@gmail.com',9218628193,
'Royapuram,Chennai','21-05-2000','Female','Economics',8.5,'B'),
(10,'Ananya','Commerce','Ananya1@gmail.com',9843125662,
'Chepauk,Chennai','04-09-2000','Female','Bio Maths',7.0,'C');


Select * from Student order by grade desc; 

Select * from Student where Gender = 'Male';

Select * from Student where Gpa < 5.0;

Update Student Set Grade = 'B', Email_id = 'abinav01@gmail.com' where Student_id = 8;

Select stu_name, date_of_birth from Student where Grade = 'B';

Select Department, Gender, avg(GPA) from student group by Department, Gender;

Alter table student rename to stu_info;

Select Stu_Name from studentinfo WHERE GPA = (select max(GPA) from studentinfo);
