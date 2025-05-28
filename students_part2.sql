--Enter psql -U postgres < students_dump.sql in the Shell to rebuild the database.

--View the database
\l

--Connect the database
\c students_dump

--Display the tables and relations
\d

--View the details of the students table
\d students

--Check all the data in students table
SELECT * FROM students;

--View the first_name, last_name and gpa columns from the students table.
SELECT first_name, last_name, gpa FROM students;

--View the first_name, last_name and gpa columns from the students table with rows only WHERE gpa < 2.5.
SELECT first_name, last_name, gpa FROM students WHERE gpa < 2.5;

--View the first_name, last_name and gpa columns from the students table with a gpa greater than or equal to 3.8.
SELECT first_name, last_name, gpa FROM students WHERE gpa >= 3.8;

--View the first_name, last_name and gpa columns from the students table with a gpa not equal to 4.0.
SELECT first_name, last_name, gpa  FROM students  WHERE gpa != 4.0;

--view all the data in the majors table.
SELECT * FROM majors;

--view all majors named Game Design in the majors table.
SELECT * FROM majors WHERE major='Game Design';

--view all majors that are not named Game Design in the majors table.
SELECT * FROM majors WHERE major!='Game Design';

--Use the greater than operator to see majors that come after 'Game Design' alphabetically.
SELECT * FROM majors WHERE major>'Game Design';

--Use the greater than or equal to operator to see majors that come after 'Game Design' alphabetically including 'Game Design'.
SELECT * FROM majors WHERE major>='Game Design';

--View the majors that come before G in the majors table.
SELECT * FROM majors WHERE major<'G';

--view all the data in the students table.
SELECT * FROM students;

--return the rows for students whose last name comes before M in the alphabet.
SELECT * FROM students WHERE last_name<'M';

--return the rows for students whose last name comes before M in the alphabet OR return rows of students with a 3.9 GPA.
SELECT * FROM students WHERE last_name<'M' OR gpa=3.9;

--return the rows for students whose last name comes before M in the alphabet AND return rows of students with a 3.9 GPA.
SELECT * FROM students WHERE last_name<'M' AND gpa=3.9;

--return the rows for students whose last name comes before M in the alphabet AND return rows of students with a 3.9 GPA OR GPA lower than 2.3.
SELECT * FROM students WHERE last_name<'M' AND gpa=3.9 OR gpa < 2.3;

--View students whose last name is before M that have a GPA of 3.9 or less than 2.3.
SELECT * FROM students WHERE last_name<'M' AND (gpa=3.9 OR gpa < 2.3);

--view everything from the courses table.
SELECT * FROM courses;

--View the rows in courses table with a course name that matches the pattern '_lgorithms'.
SELECT course FROM courses WHERE course LIKE '_lgorithms';

--View the courses that end in lgorithms where anything can come before 'lgorithms'.
SELECT course FROM courses WHERE course LIKE '%lgorithms';

--View courses that start with Web.
SELECT course FROM courses WHERE course LIKE 'Web%';

--Show courses that have a second letter of e.
SELECT course FROM courses WHERE course LIKE '_e%';

--View the courses with a space in their names.
SELECT course FROM courses WHERE course LIKE '% %';

--View the courses without a space in their names.
SELECT course FROM courses WHERE course NOT Like '% %';

--View courses that contain an A.
SELECT course FROM courses WHERE course Like '%A%';

--View courses that contain an A or a (ignore the case).
SELECT course FROM courses WHERE course ILIKE '%A%';

--View courses that do not contain an A or a (ignore the case).
SELECT course FROM courses WHERE course NOT ILIKE '%A%';

--View the courses that don't have a capital or lowercase A and have a space.
SELECT course FROM courses WHERE course Like '% %' AND course NOT ILIKE '%A%';

--View all the data in the students table.
SELECT * FROM students;

--View the students who don't have a GPA.
SELECT * FROM students WHERE gpa IS NULL;

--View the students who do have a GPA.
SELECT * FROM students WHERE gpa IS NOT NULL;

--View all the info on students who haven't chosen a major.
SELECT * FROM students WHERE major_id IS NULL;

--View the students who don't have a major, but don't include students without a GPA.
SELECT * FROM students WHERE gpa IS NOT NULL AND major_id IS NULL;

--View the students who don't have a major and gpa.
SELECT * FROM students WHERE major_id IS NULL AND gpa IS NULL;

--View all the info in the students table in order by the GPA's.
SELECT * FROM students ORDER BY gpa;

--View all the info in the students table in the descending order of the GPA's.
SELECT * FROM students ORDER BY gpa DESC;

--View all the student info with the highest GPA's at the top, and in alphabetical order by first_name if the GPA's match.
SELECT * FROM students ORDER BY gpa DESC, first_name;

--View all the student info with the highest GPA's at the top, and in alphabetical order by first_name if the GPA's match, but only return the first 10 rows.
SELECT * FROM students ORDER BY gpa DESC, first_name LIMIT 10;

--View all the student info with the highest GPA's at the top, and in alphabetical order by first_name if the GPA's match, but only return the first 10 rows, but don't get the ones who don't have a GPA.
SELECT * FROM students WHERE gpa IS NOT NULL ORDER BY gpa DESC, first_name LIMIT 10;

--View the lowest value in the gpa column of the students table.
SELECT MIN(gpa) FROM students;

--View the highest value in the gpa column of the students table.
SELECT MAX(gpa) FROM students;

--Use a SUM function find out what all the values of the major_id column in the students table add up to.
SELECT SUM(major_id) FROM students;

--View the average of all the values of the major_id column in the students table.
SELECT AVG(major_id) FROM students;

-- View the rounded up value of the avg of all the values of the major_id column in the students table.
SELECT CEIL(AVG(major_id)) FROM students;

--Use ROUND to round the average of the major_id column to the nearest whole number.
SELECT ROUND(AVG(major_id)) FROM students;

--Round the average of the major_id to five decimal places.
SELECT ROUND(AVG(major_id), 5) FROM students;

--Use COUNT(*) to see how many majors there are in majors table.
SELECT COUNT(*) FROM majors;

--Use COUNT(*) to see how many students there are in the students table.
SELECT COUNT(*) FROM students;

--View the count of the major_id column in the students table to see how many students have picked a major.
SELECT COUNT(major_id) FROM students;

--View the unique major_id values in the students table.
SELECT DISTINCT(major_id) FROM students;

--View the unique major_id values in the students table using GROUP BY method.
SELECT major_id FROM students GROUP BY major_id;

--View the major_id column and number of students in each major_id.
SELECT major_id, COUNT(*) FROM students GROUP BY major_id;

--View the unique major_id values with GROUP BY again, but see what the lowest GPA is in each of them.
SELECT major_id, MIN(gpa) FROM students GROUP BY major_id;

--View the unique major_id values with GROUP BY again, but see what the lowest and highest GPA is in each of them showing in two different columns.
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id;

--View the unique major_id values with GROUP BY again, but see what the lowest and highest GPA is in each of them showing in two different columns and use HAVING to show which ones have a maximum GPA of 4.0.
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa)=4.0;

--View the unique major_id values with GROUP BY again, but see what the lowest and highest GPA is in each of them showing in two different columns and use HAVING to show which ones have a maximum GPA of 4.0. Rename the min column to min_gpa.
SELECT major_id, MIN(gpa) AS min_gpa, MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa)=4.0;

--View the unique major_id values with GROUP BY again, but see what the lowest and highest GPA is in each of them showing in two different columns and use HAVING to show which ones have a maximum GPA of 4.0. Rename the min column to min_gpa. Rename the max column to max_gpa.
SELECT major_id, MIN(gpa) AS min_gpa, MAX(gpa) AS max_gpa FROM students GROUP BY major_id HAVING MAX(gpa)=4.0;

--View the major_id and number of students in each major_id in a column named number_of_students.
SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id;

--View the major_id and number of students in each major_id in a column named number_of_students, but only show the rows with less than eight students in the major.
SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id HAVING COUNT(*) < 8;

--There are a total of 4 JOIN: LEFT JOIN, RIGHT JOIN, FULL JOIN, INNER JOIN. 
--FULL JOIN: All rows show up.
--LEFT JOIN: column on the left hand side of LEFT JOIN gets to display all its rows.
--RIGHT JOIN: column on the right hand side of RIGHT JOIN gets to display all its rows.
--INNER JOIN: Only rows in both columns that have the foreign key to get to display.
--The majors and students table are linked with the major_id foreign key. To be able to see the name of a major that a student is taking, JOIN the two tables into one. Here's an example of how to do that:
--SELECT * FROM <table_1> FULL JOIN <table_2> ON <table_1>.<foreign_key_column> = <table_2>.<foreign_key_column>;
SELECT * FROM students FULL JOIN majors ON students.major_id = majors.major_id;

--Use a LEFT JOIN to join the same two tables in the same way.
SELECT * FROM students LEFT JOIN majors ON students.major_id = majors.major_id;

--Join the same two tables with a RIGHT JOIN this time.
SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id;

--Join the two tables with an INNER JOIN.
SELECT * FROM students INNER JOIN majors ON students.major_id = majors.major_id;

--Use LEFT JOIN to join two tables. Show all the majors, but only show students that have a major.
SELECT * FROM majors LEFT JOIN students ON majors.major_id = students.major_id;

--Use the appropriate join to show only students that are enrolled in a major, and only majors that have a student enrolled in it.
SELECT * FROM majors INNER JOIN students ON majors.major_id=students.major_id;

--Use a right join to show all students but only majors if a student is enrolled in it.
SELECT * FROM majors RIGHT JOIN students ON majors.major_id=students.major_id;

--Use the appropriate join with the same two table to show all rows in both tables whether they have a value in the foreign key column or not.
SELECT * FROM majors FULL JOIN students ON majors.major_id=students.major_id;

--Use the most efficient JOIN to join the two tables you need. Only join the tables for now, don't use any other conditions.
SELECT * FROM majors INNER JOIN students ON majors.major_id=students.major_id;

--Use the most efficient JOIN to join the two tables you need. Only join the tables for now, don't use any other conditions, but extract only the major column.
SELECT major FROM majors INNER JOIN students ON majors.major_id=students.major_id;

--Use DISTINCT to only return the unique ones to see the list of majors who have students.
SELECT DISTINCT(major) FROM majors INNER JOIN students ON majors.major_id=students.major_id;

--Show a list of majors that students aren't taking. Use the most efficient JOIN to join the two tables. Only join the tables for now, don't use any other conditions.
SELECT * FROM students RIGHT JOIN majors ON students.major_id=majors.major_id;

--Add a WHERE condition to only see the majors without students, use student_id in it's condition.
SELECT * FROM students RIGHT JOIN majors ON students.major_id=majors.major_id WHERE student_id IS NULL;

--Only get the columns you need with it to see the list of majors without students.
SELECT major FROM students RIGHT JOIN majors ON students.major_id=majors.major_id WHERE student_id IS NULL;

--Use the most efficient 'JOIN' to join the tables to get the first name, last name, major, and GPA of students who are taking Data Science or have a gpa of 3.8 or greater. Only join the tables for now, don't use any other conditions.
SELECT * FROM students LEFT JOIN majors ON students.major_id=majors.major_id;

--Use the most efficient 'JOIN' to join the tables to get all columns with students who are taking Data Science or have a gpa of 3.8 or greater.
SELECT * FROM students LEFT JOIN majors ON students.major_id=majors.major_id WHERE major='Data Science' OR gpa>=3.8;

--Use the most efficient 'JOIN' to join the tables to get the first name, last name, major, and GPA of students who are taking Data Science or have a gpa of 3.8 or greater. 
SELECT first_name, last_name, major, gpa FROM students LEFT JOIN majors ON students.major_id=majors.major_id WHERE major='Data Science' OR gpa>=3.8;

--Use the most efficient 'JOIN' to join the tables to get the first name and major for students whose first_name, or the major, contains ri. Only join the tables for now, don't use any other conditions.
SELECT * FROM students FULL JOIN majors ON students.major_id=majors.major_id;

--Use the most efficient 'JOIN' to join the tables to get the first name and major for students whose first_name, or the major, contains ri. Only add the conditions to the joined tables.
SELECT * FROM students FULL JOIN majors ON students.major_id=majors.major_id WHERE first_name LIKE '%ri%' OR major LIKE '%ri%';

--Use the most efficient 'JOIN' to join the tables to get the first name and major for students whose first_name, or the major, contains ri.
SELECT first_name, major FROM students FULL JOIN majors ON students.major_id=majors.major_id WHERE first_name LIKE '%ri%' OR major LIKE '%ri%';

--FULL JOIN students and majors tables.
SELECT * FROM students FULL JOIN majors ON students.major_id=majors.major_id;

--FULL JOIN students and majors tables, but extract only major_id column corresponding to students table.
SELECT students.major_id FROM students FULL JOIN majors ON students.major_id=majors.major_id;

--Rename the majors table to m. Anywhere the majors table is referenced, use m instead of majors.
SELECT students.major_id FROM students FULL JOIN majors AS m ON students.major_id=m.major_id;

--Rename the students table to s.
SELECT s.major_id FROM students AS s FULL JOIN majors AS m ON s.major_id=m.major_id;

--There's a shortcut keyword, USING to join tables if the foreign key column has the same name in both tables. 
--Here's an example: SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>);. 
--Use USING method to see all the columns in the students and majors table.
--Two major_id columns will turn into one with USING.
SELECT * FROM students FULL JOIN majors USING(major_id);

--In order to find out what courses a student is taking, join all the tables together. 
--Add a third table to a join like this: SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>) FULL JOIN <table_3> USING(<column>). 
--This example will join the first two tables into one, turning it into the left table for the second join. 
--Use this method to join the two tables from the previous query with the majors_courses table.
SELECT * FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id);

--Join the last table to the previous command to get the names of the courses (courses table) with foreign key of course_id.
SELECT * FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id) FULL JOIN courses USING(course_id);