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
  Percentage DECIMAL(5, 2),
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

-- Insert sample data (students, courses, enrollments, categories, assignments, and student assignments)


-- SQL Queries for Various Tasks

SELECT AVG(Score), MAX(Score), MIN(Score)
FROM StudentAssignment
WHERE AssignmentID = ?;

-- List all of the students in a given course:

SELECT s.StudentID, s.FirstName, s.LastName
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
WHERE e.CourseID = ?;

-- List all of the students in a course and all of their scores on every assignment:

SELECT s.StudentID, s.FirstName, s.LastName, a.AssignmentID, sa.Score
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN StudentAssignment sa ON e.EnrollmentID = sa.EnrollmentID
JOIN Assignment a ON sa.AssignmentID = a.AssignmentID
WHERE e.CourseID = ?;

-- Add an assignment to a course:

INSERT INTO Assignment (CategoryID, MaxScore)
VALUES (?, ?);


-- Change the percentages of the categories for a course:

UPDATE Category
SET Percentage = ?
WHERE CourseID = ? AND CategoryID = ?;



-- Add 2 points to the score of each student on an assignment:

UPDATE StudentAssignment
SET Score = Score + 2
WHERE AssignmentID = ?;

-- Add 2 points just to those students whose last name contains a 'Q':

UPDATE StudentAssignment
SET Score = Score + 2
WHERE AssignmentID = ? AND EnrollmentID IN (
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
WHERE e.StudentID = ? AND e.CourseID = ?;


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
WHERE StudentID = ? AND CourseID = ?
GROUP BY StudentID, CourseID;
