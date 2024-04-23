-- Event Management 


CREATE TABLE EVENTS(EVENT_ID INT PRIMARY KEY, EVENT_NAME VARCHAR(20), EVENT_DATE DATE, 
				   EVENT_LOCATION VARCHAR(20),EVENT_DESCRIPTION VARCHAR(50));
CREATE TABLE ATTENDEES(ATTENDEE_ID INT PRIMARY KEY,ATTENDEE_NAME VARCHAR(20),
					   ATTENDE_PHONE BIGINT,ATTENDEE_EMAIL VARCHAR(20),
					   ATTENDEE_CITY VARCHAR(20));
CREATE TABLE REGISTRATIONS(REGISTRATION_ID INT PRIMARY KEY,EVENT_ID INT,ATTENDEE_ID INT,
						  Registration_DATE DATE, REGISTRATION_AMOUNT NUMERIC,
						  FOREIGN KEY (EVENT_ID) REFERENCES EVENTS(EVENT_ID),
						  FOREIGN KEY (ATTENDEE_ID) REFERENCES ATTENDEES(ATTENDEE_ID));
						  

Insert into events Values(01,'Culturals','17-05-2024','Chennai','Participate Students only'),
(02,'Webinar','17-04-2024','Mumbai','Anyone can be participated'),
(03,'Sports Day','09-04-2024','Chennai','Participate Students Only'),
(04,'Workshop','01-07-2024','Banglore','Eligible Students only participate'),
(05,'Seminar','04-08-2024','Mumbai','Anyone canbe participate'),
(06,'Webinar','08-09-2024','Chennai','Anyone Can be Participate');
Insert into attendees Values (101,'mani',9346781254,'mani@gmail.com','Chennai'),
(102,'vini',8372891736,'manoj@gmail.com','Mumbai'),
(103,'dhomi',8493929209,'dhomi@gmail.com',
'Banglore'),
(104,'mopla',9830322782,'mopla@gmail.com','Chennai'),
(105,'pandarun',8383839191,
'pandarun@gmail.com','Mumbai'),
(106,'pandiyan',9210108312,'pandiyan@gmail.com','Chennai'),
(107,'vikram',8921037489,'vikram@gmail.com','Banglore');
Insert into Registrations Values(201,03,101,'23-04-2024',300),(202,05,102,'01-05-2024',100),
(203,04,103,'29-04-2024',200),(204,03,104,'27-04-2024',500),(205,02,105,'23-04-2024',350),(206,
06,106,'05-05-2024',300),(207,01,107,'20-05-2024',100);

Insert into events Values(07,'Workshop','17-05-2024','Banglore','All are participated');

Update Events set Event_Name = 'Webinar' Where EVENT_ID = 06;

DELETE FROM EVENTS WHERE EVENT_ID = 07;

Insert Into attendees values (108,'Manimegalai',9273829010,'manimeg@gmail.com','Chennai');

insert into registrations values (208,5,108,'01-05-2024',100);

Select E.event_id, E.event_name, Count(R.attendee_id) From events E
Left Join registrations R ON E.event_id = R.event_id Group by E.event_id, E.event_name;
