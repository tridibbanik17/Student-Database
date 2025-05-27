-- Create a new database named students
CREATE DATABASE students;

-- Connect to the new database to be able to start adding tables.
\c students

-- four tables. One for the students and their info, one for each major, another for each course, and a final one for showing what courses are included in each major. 
CREATE TABLE students();
CREATE TABLE majors();
CREATE TABLE courses();
CREATE TABLE majors_courses();

-- Add a column to the students table named student_id. Give it a type of SERIAL so it automatically increments and make it a PRIMARY KEY.
ALTER TABLE students ADD COLUMN student_id SERIAL PRIMARY KEY;

-- Add a column to the students table named first_name. Make it a type of VARCHAR(50) and give it the NOT NULL constraint.
ALTER TABLE students ADD COLUMN first_name VARCHAR(50) NOT NULL;

-- Add a column to the students table named last_name. Make it a type of VARCHAR(50) and give it the NOT NULL constraint.
ALTER TABLE students ADD COLUMN last_name VARCHAR(50) NOT NULL;

-- Create a column in the students table named major_id, give it a data type of INT for now.
ALTER TABLE students ADD COLUMN major_id INT;

-- Create the last column, gpa. Data in this table are decimals with a length of 2 and 1 number is to the right of the decimal. So give it a data type of NUMERIC(2,1).
ALTER TABLE students ADD COLUMN gpa NUMERIC(2,1);

-- Add a major_id column to majors table. Make it a type of SERIAL and the PRIMARY KEY for this table.
ALTER TABLE majors ADD COLUMN major_id SERIAL PRIMARY KEY;

-- Add a column to majors table named major. Make it a VARCHAR with a max-length of 50 and give it the NOT NULL constraint.
ALTER TABLE majors ADD COLUMN major VARCHAR(50) NOT NULL;

-- Set the major_id column from the students table as a foreign key that references the major_id column from the majors table.
ALTER TABLE students ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);

-- Add a course_id column to courses table. Give it a type of SERIAL and make it the primary key.
ALTER TABLE courses ADD COLUMN course_id SERIAL PRIMARY KEY;

-- Add a course column to the courses table that's a type of VARCHAR. The course names are a little longer, so give them a max-length of 100. Also, make sure it can't accept null values.
ALTER TABLE courses ADD COLUMN course VARCHAR(100) NOT NULL;

-- Add a major_id column to majors_courses table. Just give it a type of INT for now.
ALTER TABLE majors_courses ADD column major_id INT;

-- Set the major_id column from the majors_courses table as a foreign key that references the major_id column from the majors table.
ALTER TABLE majors_courses ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);

-- add a course_id column to majors_courses table. Just give it a type of INT again for now.
ALTER TABLE majors_courses ADD COLUMN course_id INT;

-- Set the course_id column from the majors_courses table as a foreign key that references the course_id column from the courses table.
ALTER TABLE majors_courses ADD FOREIGN KEY(course_id) REFERENCES courses(course_id);

-- Add a composite primary key to the table using the two columns: major_id and course_id.
ALTER TABLE majors_courses ADD PRIMARY KEY(major_id, course_id);

-- Add the first major 'Database Administration' to majors table major column with VALUES('Database Administration').
INSERT INTO majors(major) VALUES('Database Administration');

-- Use SELECT to view all the data in the majors table to make sure it got inserted correctly.
SELECT * FROM majors;

-- Add the first course 'Data Structures and Algorithms' to courses table course column with VALUES('Data Structures and Algorithms').
INSERT INTO courses(course) VALUES('Data Structures and Algorithms');

-- Use SELECT to view all the data in the courses table to make sure it got inserted correctly.
SELECT * FROM courses;

-- Add a row to majors_courses with both major_id and course_id values equal to 1.
INSERT INTO majors_courses(major_id, course_id) VALUES(1,1);

-- View all the data in the majors_courses table.
SELECT * FROM majors_courses;

-- Add the first row to the students table. The student_id is 1, first_name is 'Rhea', last_name is 'Kellems', major_id is 1 and gpa is 2.5.
INSERT INTO students(student_id, first_name, last_name, major_id, gpa) VALUES(1, 'Rhea', 'Kellems', 1, 2.5);

-- View all the data in the students table.
SELECT * FROM students;

-- Use truncate to delete all inserted data from all tables.
-- TRUNCATE majors, majors_courses, students;
-- TRUNCATE courses, majors_courses;

-- USE pg_dump --clean --create --inserts --username=freecodecamp students > students.sql in the terminal to dump the database into a students.sql file.