create database FA20BCE030DB
use FA20BCE030DB

CREATE TABLE DOCTOR(
d_id int PRIMARY KEY, 
d_name varchar(255), 
specialization varchar(255) default 'General', 
gender char, 
contact int,
salery money,
p_id int,
m_id int,
l_id int,
a_id int,
dep_id int
);

CREATE TABLE PATIENT(
p_id int PRIMARY KEY, 
p_name varchar(255), 
age int, 
gender char, 
contact int,
d_id int,
m_id int,
a_id int
);

CREATE TABLE PHARMACY(
m_id int PRIMARY KEY, 
m_name varchar(255), 
price money,
d_id int,
p_id int
);

CREATE TABLE APPOINTMENT(
a_id int PRIMARY KEY, 
a_time time, 
a_date date, 
p_bill money,
d_id int,
p_id int

);

CREATE TABLE DEPARTMENT(
dep_id int PRIMARY KEY, 
dep_name varchar(255),
d_id int,
l_id int,
s_id int,
r_no int

);

CREATE TABLE LABS(
l_no int PRIMARY KEY,
d_id int,
dep_id int
);

CREATE TABLE ROOMS(
r_no int PRIMARY KEY, 
r_type varchar(255) default 'General', 
r_availability char,
dep_id int
);

CREATE TABLE STAFF(
s_id int PRIMARY KEY, 
s_name varchar(255), 
s_type varchar(255) default 'General', 
contact int,
dep_id int
);

ALTER TABLE DOCTOR
ADD FOREIGN KEY(p_id) REFERENCES PATIENT(p_id),
FOREIGN KEY(m_id) REFERENCES PHARMACY(m_id),
FOREIGN KEY(l_id) REFERENCES LABS(l_no),
FOREIGN KEY(a_id) REFERENCES APPOINTMENT(a_id),
FOREIGN KEY(dep_id) REFERENCES DEPARTMENT(dep_id);

ALTER TABLE PATIENT
ADD FOREIGN KEY(d_id) REFERENCES DOCTOR(d_id),
FOREIGN KEY(m_id) REFERENCES PHARMACY(m_id),
FOREIGN KEY(a_id) REFERENCES APPOINTMENT(a_id);

ALTER TABLE PHARMACY
ADD FOREIGN KEY(d_id) REFERENCES DOCTOR(d_id),
FOREIGN KEY(p_id) REFERENCES PATIENT(p_id);

ALTER TABLE APPOINTMENT
ADD FOREIGN KEY(d_id) REFERENCES DOCTOR(d_id),
FOREIGN KEY(p_id) REFERENCES PATIENT(p_id);

ALTER TABLE DEPARTMENT
ADD FOREIGN KEY(d_id) REFERENCES DOCTOR(d_id),
FOREIGN KEY(l_id) REFERENCES LABS(l_no),
FOREIGN KEY(s_id) REFERENCES STAFF(s_id),
FOREIGN KEY(r_no) REFERENCES ROOMS(r_no);

ALTER TABLE LABS
ADD FOREIGN KEY(d_id) REFERENCES DOCTOR(d_id),
FOREIGN KEY(dep_id) REFERENCES DEPARTMENT(dep_id);

ALTER TABLE STAFF
ADD FOREIGN KEY(dep_id) REFERENCES DEPARTMENT(dep_id);

ALTER TABLE ROOMS
ADD FOREIGN KEY(dep_id) REFERENCES DEPARTMENT(dep_id);


CREATE INDEX d_id
ON DOCTOR(d_id);

CREATE INDEX p_id
ON PATIENT(p_id);

CREATE INDEX l_no
ON LABS(l_no);

CREATE INDEX r_no
ON ROOMS(r_no);

CREATE INDEX a_id
ON APPOINTMENT(a_id);

CREATE INDEX dep_id
ON DEPARTMENT(dep_id);

CREATE INDEX m_id
ON PHARMACY(m_id);

CREATE INDEX s_id
ON STAFF(s_id);


INSERT INTO DOCTOR
VALUES (1,'LAURA', 'PHYSICIAN', 'F', 012345, '17000');



DROP TABLE DOCTOR;
DROP TABLE PATIENT;
DROP TABLE PHARMACY;
DROP TABLE LABS;
DROP TABLE ROOMS;
DROP TABLE STAFF;
DROP TABLE DEPARTMENT;
DROP TABLE APPOINTMENT;

select * from DOCTOR;
select * from PATIENT;
select * from PHARMACY;
select * from LABS;
select * from ROOMS;
select * from STAFF;
select * from DEPARTMENT;
select * from APPOINTMENT;