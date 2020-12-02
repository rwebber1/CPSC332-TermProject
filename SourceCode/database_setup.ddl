-- Create Database Design
CREATE TABLE Professor(
	ssn INT NOT NULL PRIMARY KEY,
	p_name VARCHAR(40) NOT NULL,
	p_title VARCHAR(20) NOT NULL,
	sex ENUM('M','F') NOT NULL,
	salary VARCHAR(15) NOT NULL,
	street VARCHAR(40) NOT NULL,
	city VARCHAR(40) NOT NULL,
	state VARCHAR(2) NOT NULL,
	zip_code VARCHAR(5) NOT NULL,
	area_code SMALLINT,
	phone_no VARCHAR(12)  NOT NULL);

CREATE TABLE Department(
	dep_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dep_name VARCHAR(30) NOT NULL,
	dep_telephone VARCHAR(12) NOT NULL,
	location VARCHAR(50) NOT NULL,
	chair_ssn INT NOT NULL,
	FOREIGN KEY (chair_ssn) REFERENCES Professor(ssn));

CREATE TABLE Course(
	course_no VARCHAR(9) NOT NULL PRIMARY KEY,
	c_title VARCHAR(30) NOT NULL,
	textbook VARCHAR(50) NOT NULL,
	units ENUM('3','4','5') NOT NULL,
	course_dep VARCHAR(4),
	FOREIGN KEY (course_dep) REFERENCES Department(dep_no));

CREATE TABLE Student(
	cwid INT NOT NULL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	s_address VARCHAR(70) NOT NULL,
	s_telephone VARCHAR(12) NOT NULL,
	major_dep VARCHAR(4),
	FOREIGN KEY (major_dep) REFERENCES Department(dep_no));

CREATE TABLE Section(
	section_no SMALLINT NOT NULL,
	section_course VARCHAR(9) NOT NULL,
	seat_no SMALLINT NOT NULL,
	meeting_days VARCHAR(10) NOT NULL,
	start_time VARCHAR(10) NOT NULL,
	end_time VARCHAR(10) NOT NULL,
	classroom VARCHAR(10) NOT NULL,
	p_ssn INT NOT NULL,
	FOREIGN KEY (section_course) REFERENCES Course(course_no),
	FOREIGN KEY (p_ssn) REFERENCES Professor(ssn),
	PRIMARY KEY(section_no, section_course));

CREATE TABLE Enrollment(
	enrolled_cwid INT NOT NULL,
	enrolled_section SMALLINT NOT NULL,
	enrolled_course VARCHAR(9) NOT NULL,
	grade ENUM('A+','A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F') NOT NULL,
	FOREIGN KEY(enrolled_cwid) REFERENCES Student(cwid),
	FOREIGN KEY(enrolled_section) REFERENCES Section(section_no),
	FOREIGN KEY(enrolled_course) REFERENCES Course(course_no),
	PRIMARY KEY(enrolled_cwid, enrolled_section, enrolled_course));

CREATE TABLE Minor(
	dep_minor VARCHAR(4),
	student_cwid INT,
	FOREIGN KEY (dep_minor) REFERENCES Department(dep_no),
	FOREIGN KEY (student_cwid) REFERENCES Student(cwid),
	PRIMARY KEY (dep_minor, student_cwid));

CREATE TABLE Prerequisites(
	course VARCHAR(9) NOT NULL,
	prereq VARCHAR(40) NOT NULL,
	FOREIGN KEY(course) REFERENCES Course(course_no),
	PRIMARY KEY(course, prereq));

CREATE TABLE Degrees(
	degree_ssn INT NOT NULL,
	degree VARCHAR(20) NOT NULL,
	FOREIGN KEY (degree_ssn) REFERENCES Professor(ssn),
	PRIMARY KEY (degree_ssn, degree));

-- Populate Tables with Records

-- Professor Inserts
INSERT INTO Professor(ssn, p_name, p_title, sex, salary, street, city, state, zip_code, area_code, phone_no)
VALUES (123456789, 'Shawn Wang', 'Dr.', 'M', '$999999', 'Main', 'Fullerton', 'CA', '92831', 805, 7297128);

INSERT INTO Professor(ssn, p_name, p_title, sex, salary, street, city, state, zip_code, area_code, phone_no)
VALUES (987654321, 'Doina Bein', 'Dr', 'F', '$100000', 'Parkway', 'Fullerton', 'CA', '92831', 949, 1112222);

INSERT INTO Professor(ssn, p_name, p_title, sex, salary, street, city, state, zip_code, area_code, phone_no)
VALUES (000000000, 'Chistopher Ryu', 'Dr', 'M', '$103000', 'Wall', 'New York City', 'NY', '91029', 709, 3214567);

-- Department Inserts
INSERT INTO Department(dep_no,dep_name,dep_telephone, location, chair_ssn)
VALUES ('CPSC', 'Computer Science', '657 278-3700', 'CS-522', 123456789);

INSERT INTO Department(dep_no,dep_name,dep_telephone, location, chair_ssn)
VALUES ('MATH', 'Mathematics', '657 278-3631', 'MH-154', 000000000);

-- Course Inserts
INSERT INTO Course(course_no, textbook, c_title, units, course_dep)
VALUES('CPSC 332', 'Fundamentals of Databases', 'FILE STRUCTURE AND DATABASES', '3', 'CPSC');

INSERT INTO Course(course_no, textbook, c_title, units, course_dep)
VALUES('CPSC 471', 'Computer Networking - A Top-Down Approach', 'COMPUTER COMMUNICATIONS', '3', 'CPSC');

INSERT INTO Course(course_no, textbook, c_title, units, course_dep)
VALUES('MATH 250B', 'Analytical/Geomtric Calculus I, II, III', 'MULTIVARIABLE CALCULUS', '5', 'MATH');

INSERT INTO Course(course_no, textbook, c_title, units, course_dep)
VALUES('CPSC 362', 'Software Development Lifecycle', 'SOFTWARE ENGINEERING', '4', 'CPSC');

-- Section Inserts
INSERT INTO Section(section_no, section_course, seat_no, meeting_days, start_time, end_time, classroom, p_ssn)
VALUES(1, 'CPSC 332', 40, 'T/Th', '9:00 AM', '10:55 AM', 'CS 101', 123456789);

INSERT INTO Section(section_no, section_course, seat_no, meeting_days, start_time, end_time, classroom, p_ssn)
VALUES(2, 'CPSC 332', 40, 'M/W/F', '2:30 PM', '3:50 PM', 'CS 104', 123456789);

INSERT INTO Section(section_no, section_course, seat_no, meeting_days, start_time, end_time, classroom, p_ssn)
VALUES(1, 'CPSC 362', 30, 'Sa', '8:00 AM', '12:45 PM', 'CS 501', 987654321);

INSERT INTO Section(section_no, section_course, seat_no, meeting_days, start_time, end_time, classroom, p_ssn)
VALUES(4, 'CPSC 471', 42, 'M/W', '4:00 PM', '5:15 PM', 'CS 201', 000000000);

INSERT INTO Section(section_no, section_course, seat_no, meeting_days, start_time, end_time, classroom, p_ssn)
VALUES(1, 'CPSC 471', 35, 'T', '5:00 PM', '8:55 PM', 'CS 304', 987654321);

INSERT INTO Section(section_no, section_course, seat_no, meeting_days, start_time, end_time, classroom, p_ssn)
VALUES(1, 'MATH 250B', 42, 'Th', '8:00 AM', '8:55 AM', 'MH 410', 123456789);

-- Student Inserts
INSERT INTO Student(cwid, first_name, last_name, s_address, s_telephone, major_dep)
VALUES(111111111, 'John', 'Wick', '5432 West Ave. Fullerton CA', '999-999-9999', 'CPSC');

INSERT INTO Student(cwid, first_name, last_name, s_address, s_telephone, major_dep)
VALUES(222222222, 'Wallstreet', 'Bets', '1 First Ave. New York NY', '888-888-8888', 'CPSC');

INSERT INTO Student(cwid, first_name, last_name, s_address, s_telephone, major_dep)
VALUES(333333333, 'Riley', 'Webber', '123 Champagne St. Venice CA', '777-777-7777', 'CPSC');

INSERT INTO Student(cwid, first_name, last_name, s_address, s_telephone, major_dep)
VALUES(444444444, 'Jim', 'Halpert', '543 Sidewalk Scranton PA', '666-666-6666', 'MATH');

INSERT INTO Student(cwid, first_name, last_name, s_address, s_telephone, major_dep)
VALUES(555555555, 'Elom', 'Musk', '89003 Von Karman Irvine CA', '555-555-5555', 'MATH');

INSERT INTO Student(cwid, first_name, last_name, s_address, s_telephone, major_dep)
VALUES(666666666, 'Albert', 'Einstein', '321 Walkway Manhattan NY', '444-444-4444', 'MATH');

INSERT INTO Student(cwid, first_name, last_name, s_address, s_telephone, major_dep)
VALUES(777777777, 'Naruto', 'Uzukami', '5627 Ramen Way Konoha CA', '333-333-3333', 'CPSC');

INSERT INTO Student(cwid, first_name, last_name, s_address, s_telephone, major_dep)
VALUES(888888888, 'Jhin', 'Virtuoso', '4444 Fourth St. Four Points UT', '222-222-2222', 'CPSC');

-- Enrollment Inserts
INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(111111111, 1, 'CPSC 332', 'A+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(111111111, 1, 'CPSC 471', 'C+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(111111111, 4, 'CPSC 471', 'B-');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(111111111, 2, 'CPSC 332', 'A');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(222222222, 1, 'CPSC 332', 'C');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(222222222, 1, 'MATH 250B', 'C-');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(333333333, 1, 'CPSC 332', 'A-');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(333333333, 1, 'MATH 250B', 'A+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(444444444, 4, 'CPSC 471', 'D+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(444444444, 1, 'CPSC 362', 'B');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(555555555, 1, 'CPSC 362', 'A+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(555555555, 1, 'CPSC 471', 'F');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(666666666, 1, 'CPSC 332', 'D+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(666666666, 1, 'CPSC 471', 'A+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(333333333, 1, 'CPSC 362', 'A+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(222222222, 1, 'CPSC 471', 'A-');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(444444444, 1, 'MATH 250B', 'D+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(555555555, 1, 'MATH 250B', 'F');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(222222222, 1, 'CPSC 362', 'A+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(666666666, 1, 'CPSC 362', 'C+');

INSERT INTO Enrollment(enrolled_cwid, enrolled_section, enrolled_course, grade)
VALUES(333333333, 4, 'CPSC 471', 'C');

-- Minor Inserts
INSERT INTO Minor(dep_minor, student_cwid)
VALUES('MATH', 333333333 );

INSERT INTO Minor(dep_minor, student_cwid)
VALUES('CPSC', 555555555);

-- Prerequisite Inserts
INSERT INTO Prerequisites(course, prereq)
VALUES('MATH 250B', 'INTRO TO CALCULUS');

INSERT INTO Prerequisites(course, prereq)
VALUES('CPSC 332', 'EPP');

-- Degree Inserts
INSERT INTO Degrees(degree_ssn, degree)
VALUES(123456789, 'M.S. Comuputer Networks');

INSERT INTO Degrees(degree_ssn, degree)
VALUES(123456789, 'B.S. Computer Science');

INSERT INTO Degrees(degree_ssn, degree)
VALUES(000000000, 'B.S. Computer Science');
