-- SQL Table Creation and Insertion
CREATE TABLE Student (
  StudentID INTEGER PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50)
);

CREATE TABLE Course (
  CourseID INTEGER PRIMARY KEY,
  Department VARCHAR(50),
  CourseNumber INTEGER,
  CourseName VARCHAR(100),
  Semester VARCHAR(20),
  Year INTEGER
);

CREATE TABLE Enrollment (
  EnrollmentID INTEGER PRIMARY KEY,
  StudentID INTEGER,
  CourseID INTEGER,
  FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Category (
  CategoryID INTEGER PRIMARY KEY,
  CourseID INTEGER,
  CategoryName VARCHAR(50),
  Percentage DECIMAL(4, 2),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Assignment (
  AssignmentID INTEGER PRIMARY KEY,
  CategoryID INTEGER,
  MaxScore INTEGER,
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE StudentAssignment (
  StudentAssignmentID INTEGER PRIMARY KEY,
  EnrollmentID INTEGER,
  AssignmentID INTEGER,
  Score INTEGER,
  FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID),
  FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID)
);

-- Insert sample data (Students, Courses, Enrollments, categories, assignments, and Student assignments)
INSERT INTO `Student` VALUES(10000,'James', 'Taylor');
INSERT INTO `Student` VALUES(10001,'Emily', 'Smith');
INSERT INTO `Student` VALUES(10002,'Alexandra', 'Richards');
INSERT INTO `Student` VALUES(10003,'Merlyn', 'James');
INSERT INTO `Student` VALUES(10004,'Rebecca', 'Laney');
INSERT INTO `Student` VALUES(10005,'Linda', 'Simmons');
INSERT INTO `Student` VALUES(10006,'Terrell', 'Majors');
INSERT INTO `Student` VALUES(10007,'Robert', 'Johnson');
INSERT INTO `Student` VALUES(10008,'Michaela', 'Jones');
INSERT INTO `Student` VALUES(10009,'Jordyn', 'Quinn');

INSERT INTO `Course` VALUES(10000,'Computer Science' ,201, 'Computer Organization I','Fall',2023);
INSERT INTO `Course` VALUES(10001,'Computer Science' ,136, 'Computer Science III','Fall',2023);
INSERT INTO `Course` VALUES(10002,'Math' ,156, 'Calculus I','Fall',2023);

INSERT INTO `Enrollment` VALUES(10000, 10000, 10000);
INSERT INTO `Enrollment` VALUES(10001, 10002, 10000);
INSERT INTO `Enrollment` VALUES(10002, 10003, 10000);
INSERT INTO `Enrollment` VALUES(10003, 10006, 10000);
INSERT INTO `Enrollment` VALUES(10004, 10009, 10000);

INSERT INTO `Enrollment` VALUES(10005, 10001, 10001);
INSERT INTO `Enrollment` VALUES(10006, 10002, 10001);
INSERT INTO `Enrollment` VALUES(10007, 10004, 10001);
INSERT INTO `Enrollment` VALUES(10008, 10005, 10001);
INSERT INTO `Enrollment` VALUES(10009, 10006, 10001);

INSERT INTO `Enrollment` VALUES(10010, 10008, 10002);
INSERT INTO `Enrollment` VALUES(10011, 10007, 10002);
INSERT INTO `Enrollment` VALUES(10012, 10004, 10002);
INSERT INTO `Enrollment` VALUES(10013, 10001, 10002);
INSERT INTO `Enrollment` VALUES(10014, 10000, 10002);

INSERT INTO `Category` VALUES(10000, 10000, "Attendance", 5.00);
INSERT INTO `Category` VALUES(10001, 10000, "Homework", 15.00);
INSERT INTO `Category` VALUES(10002, 10000, "Projects", 20.00);
INSERT INTO `Category` VALUES(10003, 10000, "Midterm", 30.00);
INSERT INTO `Category` VALUES(10004, 10000, "Final", 30.00);

INSERT INTO `Category` VALUES(10005, 10001, "Homework", 10.00);
INSERT INTO `Category` VALUES(10006, 10001, "Quizzes", 10.00);
INSERT INTO `Category` VALUES(10007, 10001, "Projects", 25.00);
INSERT INTO `Category` VALUES(10008, 10001, "Midterm", 25.00);
INSERT INTO `Category` VALUES(10009, 10001, "Final", 30.00);

INSERT INTO `Category` VALUES(10010, 10002, "Homework", 20.00);
INSERT INTO `Category` VALUES(10011, 10002, "Quizzes", 10.00);
INSERT INTO `Category` VALUES(10012, 10002, "Tests", 40.00);
INSERT INTO `Category` VALUES(10013, 10002, "Final", 30.00);

INSERT INTO `Assignment` VALUES(10000, 10000, "Attendance", 22);
INSERT INTO `Assignment` VALUES(10001, 10001, "Homework-1", 20);
INSERT INTO `Assignment` VALUES(10002, 10001, "Homework-2", 20);
INSERT INTO `Assignment` VALUES(10003, 10001, "Homework-3", 20);
INSERT INTO `Assignment` VALUES(10004, 10002, "Project-1", 50);
INSERT INTO `Assignment` VALUES(10005, 10002, "Project-2", 50);
INSERT INTO `Assignment` VALUES(10006, 10003, "Midterm", 100);
INSERT INTO `Assignment` VALUES(10007, 10004, "Final", 100);

INSERT INTO `Assignment` VALUES(10008, 10005, "Homework 1", 20);
INSERT INTO `Assignment` VALUES(10009, 10005, "Homework 2", 20);
INSERT INTO `Assignment` VALUES(10010, 10005, "Homework 3", 20);
INSERT INTO `Assignment` VALUES(10011, 10006, "Quiz 1", 10);
INSERT INTO `Assignment` VALUES(10012, 10006, "Quiz 2", 10);
INSERT INTO `Assignment` VALUES(10013, 10007, "Project 1", 50);
INSERT INTO `Assignment` VALUES(10014, 10008, "Midterm", 100);
INSERT INTO `Assignment` VALUES(10015, 10009, "Final", 100);

INSERT INTO `Assignment` VALUES(10016, 10010, "Homework 1", 20);
INSERT INTO `Assignment` VALUES(10017, 10010, "Homework 2", 20);
INSERT INTO `Assignment` VALUES(10018, 10010, "Homework 3", 20);
INSERT INTO `Assignment` VALUES(10019, 10011, "Quiz 1", 10);
INSERT INTO `Assignment` VALUES(10020, 10011, "Quiz 2", 10);
INSERT INTO `Assignment` VALUES(10021, 10012, "Test 1", 50);
INSERT INTO `Assignment` VALUES(10022, 10012, "Test 2", 100);
INSERT INTO `Assignment` VALUES(10023, 10013, "Final", 100);

| class one

INSERT INTO `StudentAssignment` VALUES(10000, 10000, 10000, 20);
INSERT INTO `StudentAssignment` VALUES(10001, 10001, 10000, 22);
INSERT INTO `StudentAssignment` VALUES(10002, 10002, 10000, 19);
INSERT INTO `StudentAssignment` VALUES(10003, 10003, 10000, 19);
INSERT INTO `StudentAssignment` VALUES(10004, 10004, 10000, 21);

INSERT INTO `StudentAssignment` VALUES(10005, 10000, 10001, 20);
INSERT INTO `StudentAssignment` VALUES(10006, 10001, 10001, 18);
INSERT INTO `StudentAssignment` VALUES(10007, 10002, 10001, 19);
INSERT INTO `StudentAssignment` VALUES(10008, 10003, 10001, 17);
INSERT INTO `StudentAssignment` VALUES(10009, 10004, 10001, 20);

INSERT INTO `StudentAssignment` VALUES(10010, 10000, 10002, 18);
INSERT INTO `StudentAssignment` VALUES(10011, 10001, 10002, 17);
INSERT INTO `StudentAssignment` VALUES(10012, 10002, 10002, 20);
INSERT INTO `StudentAssignment` VALUES(10013, 10003, 10002, 19);
INSERT INTO `StudentAssignment` VALUES(10014, 10004, 10002, 20);

INSERT INTO `StudentAssignment` VALUES(10015, 10000, 10003, 18);
INSERT INTO `StudentAssignment` VALUES(10016, 10001, 10003, 19);
INSERT INTO `StudentAssignment` VALUES(10017, 10002, 10003, 20);
INSERT INTO `StudentAssignment` VALUES(10018, 10003, 10003, 20);
INSERT INTO `StudentAssignment` VALUES(10019, 10004, 10003, 20);

INSERT INTO `StudentAssignment` VALUES(10020, 10000, 10004, 47);
INSERT INTO `StudentAssignment` VALUES(10021, 10001, 10004, 44);
INSERT INTO `StudentAssignment` VALUES(10022, 10002, 10004, 50);
INSERT INTO `StudentAssignment` VALUES(10023, 10003, 10004, 39);
INSERT INTO `StudentAssignment` VALUES(10024, 10004, 10004, 41);

INSERT INTO `StudentAssignment` VALUES(10025, 10000, 10005, 49);
INSERT INTO `StudentAssignment` VALUES(10026, 10001, 10005, 38);
INSERT INTO `StudentAssignment` VALUES(10027, 10002, 10005, 43);
INSERT INTO `StudentAssignment` VALUES(10028, 10003, 10005, 41);
INSERT INTO `StudentAssignment` VALUES(10029, 10004, 10005, 37);

INSERT INTO `StudentAssignment` VALUES(10030, 10000, 10006, 97);
INSERT INTO `StudentAssignment` VALUES(10031, 10001, 10006, 85);
INSERT INTO `StudentAssignment` VALUES(10032, 10002, 10006, 82);
INSERT INTO `StudentAssignment` VALUES(10033, 10003, 10006, 79);
INSERT INTO `StudentAssignment` VALUES(10034, 10004, 10006, 91);

INSERT INTO `StudentAssignment` VALUES(10035, 10000, 10007, 96);
INSERT INTO `StudentAssignment` VALUES(10036, 10001, 10007, 88);
INSERT INTO `StudentAssignment` VALUES(10037, 10002, 10007, 78);
INSERT INTO `StudentAssignment` VALUES(10038, 10003, 10007, 78);
INSERT INTO `StudentAssignment` VALUES(10039, 10004, 10007, 83);

| class two

INSERT INTO `StudentAssignment` VALUES(10040, 10005, 10008, 20);
INSERT INTO `StudentAssignment` VALUES(10041, 10006, 10008, 20);
INSERT INTO `StudentAssignment` VALUES(10042, 10007, 10008, 19);
INSERT INTO `StudentAssignment` VALUES(10043, 10008, 10008, 20);
INSERT INTO `StudentAssignment` VALUES(10044, 10009, 10008, 20);

INSERT INTO `StudentAssignment` VALUES(10045, 10005, 10009, 20);
INSERT INTO `StudentAssignment` VALUES(10046, 10006, 10009, 19);
INSERT INTO `StudentAssignment` VALUES(10047, 10007, 10009, 18);
INSERT INTO `StudentAssignment` VALUES(10048, 10008, 10009, 18);
INSERT INTO `StudentAssignment` VALUES(10049, 10009, 10009, 19);

INSERT INTO `StudentAssignment` VALUES(10050, 10005, 10010, 18);
INSERT INTO `StudentAssignment` VALUES(10051, 10006, 10010, 19);
INSERT INTO `StudentAssignment` VALUES(10052, 10007, 10010, 20);
INSERT INTO `StudentAssignment` VALUES(10053, 10008, 10010, 20);
INSERT INTO `StudentAssignment` VALUES(10054, 10009, 10010, 19);

INSERT INTO `StudentAssignment` VALUES(10055, 10005, 10011, 10);
INSERT INTO `StudentAssignment` VALUES(10056, 10006, 10011, 8);
INSERT INTO `StudentAssignment` VALUES(10057, 10007, 10011, 8);
INSERT INTO `StudentAssignment` VALUES(10058, 10008, 10011, 10);
INSERT INTO `StudentAssignment` VALUES(10059, 10009, 10011, 10);

INSERT INTO `StudentAssignment` VALUES(10060, 10005, 10012, 10);
INSERT INTO `StudentAssignment` VALUES(10061, 10006, 10012, 10);
INSERT INTO `StudentAssignment` VALUES(10062, 10007, 10012, 9);
INSERT INTO `StudentAssignment` VALUES(10063, 10008, 10012, 9);
INSERT INTO `StudentAssignment` VALUES(10064, 10009, 10012, 7);

INSERT INTO `StudentAssignment` VALUES(10065, 10005, 10013, 47);
INSERT INTO `StudentAssignment` VALUES(10066, 10006, 10013, 50);
INSERT INTO `StudentAssignment` VALUES(10067, 10007, 10013, 44);
INSERT INTO `StudentAssignment` VALUES(10068, 10008, 10013, 38;
INSERT INTO `StudentAssignment` VALUES(10069, 10009, 10013, 43);

INSERT INTO `StudentAssignment` VALUES(10070, 10005, 10014, 91);
INSERT INTO `StudentAssignment` VALUES(10071, 10006, 10014, 75);
INSERT INTO `StudentAssignment` VALUES(10072, 10007, 10014, 86);
INSERT INTO `StudentAssignment` VALUES(10073, 10008, 10014, 80);
INSERT INTO `StudentAssignment` VALUES(10074, 10009, 10014, 94);

INSERT INTO `StudentAssignment` VALUES(10075, 10005, 10015, 93);
INSERT INTO `StudentAssignment` VALUES(10076, 10006, 10015, 80);
INSERT INTO `StudentAssignment` VALUES(10077, 10007, 10015, 89);
INSERT INTO `StudentAssignment` VALUES(10078, 10008, 10015, 84);
INSERT INTO `StudentAssignment` VALUES(10079, 10009, 10015, 92);

| class three

INSERT INTO `StudentAssignment` VALUES(10060, 10010, 10016, 19);
INSERT INTO `StudentAssignment` VALUES(10061, 10011, 10016, 19);
INSERT INTO `StudentAssignment` VALUES(10062, 10012, 10016, 20);
INSERT INTO `StudentAssignment` VALUES(10063, 10014, 10016, 17);
INSERT INTO `StudentAssignment` VALUES(10064, 10014, 10016, 20);

INSERT INTO `StudentAssignment` VALUES(10065, 10015, 10017, 19);
INSERT INTO `StudentAssignment` VALUES(10066, 10016, 10017, 18);
INSERT INTO `StudentAssignment` VALUES(10067, 10017, 10017, 20);
INSERT INTO `StudentAssignment` VALUES(10068, 10018, 10017, 18);
INSERT INTO `StudentAssignment` VALUES(10069, 10019, 10017, 19);

INSERT INTO `StudentAssignment` VALUES(10070, 10010, 10018, 18);
INSERT INTO `StudentAssignment` VALUES(10071, 10011, 10018, 20);
INSERT INTO `StudentAssignment` VALUES(10072, 10012, 10018, 17);
INSERT INTO `StudentAssignment` VALUES(10073, 10014, 10018, 20);
INSERT INTO `StudentAssignment` VALUES(10074, 10014, 10018, 19);

INSERT INTO `StudentAssignment` VALUES(10075, 10015, 10019, 9);
INSERT INTO `StudentAssignment` VALUES(10076, 10016, 10019, 10);
INSERT INTO `StudentAssignment` VALUES(10077, 10017, 10019, 10);
INSERT INTO `StudentAssignment` VALUES(10078, 10018, 10019, 8);
INSERT INTO `StudentAssignment` VALUES(10079, 10019, 10019, 10);

INSERT INTO `StudentAssignment` VALUES(10080, 10010, 10020, 10);
INSERT INTO `StudentAssignment` VALUES(10081, 10011, 10020, 9);
INSERT INTO `StudentAssignment` VALUES(10082, 10012, 10020, 7);
INSERT INTO `StudentAssignment` VALUES(10083, 10014, 10020, 10);
INSERT INTO `StudentAssignment` VALUES(10084, 10014, 10020, 8);

INSERT INTO `StudentAssignment` VALUES(10085, 10015, 10021, 49);
INSERT INTO `StudentAssignment` VALUES(10086, 10016, 10021, 40);
INSERT INTO `StudentAssignment` VALUES(10087, 10017, 10021, 50);
INSERT INTO `StudentAssignment` VALUES(10088, 10018, 10021, 45);
INSERT INTO `StudentAssignment` VALUES(10089, 10019, 10021, 39);

INSERT INTO `StudentAssignment` VALUES(10090, 10010, 10022, 84);
INSERT INTO `StudentAssignment` VALUES(10091, 10011, 10022, 79);
INSERT INTO `StudentAssignment` VALUES(10092, 10012, 10022, 87);
INSERT INTO `StudentAssignment` VALUES(10093, 10014, 10022, 90);
INSERT INTO `StudentAssignment` VALUES(10094, 10014, 10022, 93);

INSERT INTO `StudentAssignment` VALUES(10095, 10015, 10023, 90);
INSERT INTO `StudentAssignment` VALUES(10096, 10016, 10023, 83);
INSERT INTO `StudentAssignment` VALUES(10097, 10017, 10023, 89);
INSERT INTO `StudentAssignment` VALUES(10098, 10018, 10023, 88);
INSERT INTO `StudentAssignment` VALUES(10099, 10019, 10023, 94);





-- SQL Queries for Various Tasks

SELECT AVG(Score), MAX(Score), MIN(Score)
FROM StudentAssignment
WHERE AssignmentID = 10003;

-- List all of the students in a given course:

SELECT s.StudentID, s.FirstName, s.LastName
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
WHERE e.CourseID = 10001;

-- List all of the students in a course and all of their scores on every assignment:

SELECT s.StudentID, s.FirstName, s.LastName, a.AssignmentID, sa.Score
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN StudentAssignment sa ON e.EnrollmentID = sa.EnrollmentID
JOIN Assignment a ON sa.AssignmentID = a.AssignmentID
WHERE e.CourseID = 10001;

-- Add an assignment to a course:

INSERT INTO Assignment (CategoryID, MaxScore)
VALUES (10013, 50);


-- Change the percentages of the categories for a course:

UPDATE Category
SET Percentage = 20.00
WHERE CourseID = 10002 AND CategoryID = 10012;



-- Add 2 points to the score of each student on an assignment:

UPDATE StudentAssignment
SET Score = Score + 2
WHERE AssignmentID = 10027;

-- Add 2 points just to those students whose last name contains a 'Q':

UPDATE StudentAssignment
SET Score = Score + 2
WHERE AssignmentID = 10027 AND EnrollmentID IN (
  SELECT e.EnrollmentID
  FROM Enrollment e
  JOIN Student s ON e.StudentID = s.StudentID
  WHERE s.LastName LIKE '%Q%'
);


-- Compute the grade for a student:


SELECT SUM(c.Percentage * sa.Score / a.MaxScore) AS Grade
FROM StudentAssignment sa
JOIN Enrollment e ON sa.EnrollmentID = e.EnrollmentID
JOIN Assignment a ON sa.AssignmentID = a.AssignmentID
JOIN Category c ON a.CategoryID = c.CategoryID
WHERE e.StudentID = 10006 AND e.CourseID = 10002;


-- Compute the grade for a student, where the lowest score for a given category is dropped:


WITH LowestScoreDropped AS (
  SELECT e.StudentID, c.CategoryID, c.CourseID, SUM(c.Percentage * sa.Score / a.MaxScore) AS CategoryScore
  FROM StudentAssignment sa
  JOIN Enrollment e ON sa.EnrollmentID = e.EnrollmentID
  JOIN Assignment a ON sa.AssignmentID = a.AssignmentID
  JOIN Category c ON a.CategoryID = c.CategoryID
  WHERE sa.Score != (
    SELECT MIN(sa2.Score)
    FROM StudentAssignment sa2
    WHERE sa2.EnrollmentID = sa.EnrollmentID AND sa2.AssignmentID IN (
      SELECT a2.AssignmentID
      FROM Assignment a2
      WHERE a2.CategoryID = a.CategoryID
    )
  )
  GROUP BY e.StudentID, c.CategoryID, c.CourseID
)
SELECT StudentID, CourseID, SUM(CategoryScore) AS Grade
FROM LowestScoreDropped
WHERE StudentID = 10006 AND CourseID =10002 
GROUP BY StudentID, CourseID;
