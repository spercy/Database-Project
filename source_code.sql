CREATE TABLE Student (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE Course (
  course_id INT PRIMARY KEY,
  department VARCHAR(255),
  course_number INT,
  course_name VARCHAR(255),
  semester VARCHAR(255),
  year INT
);

CREATE TABLE Assignment (
  assignment_id INT PRIMARY KEY,
  course_id INT,
  category VARCHAR(255),
  total_points INT,
  weight FLOAT,
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Enrollment (
  enrollment_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Grade (
  grade_id INT PRIMARY KEY,
  assignment_id INT,
  student_id INT,
  score INT,
  FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
  FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
