-- Insertando datos dummies en createdb.sql
-- 5 registros para student
INSERT INTO
  student (name, program)
VALUES
  ('John Doe', 'Computer Science'),
  ('Jane Smith', 'Mathematics'),
  ('Alice Johnson', 'Physics'),
  ('Bob Williams', 'Engineering'),
  ('Eva Davis', 'Biology');

-- 5 registros para instructor
INSERT INTO
  instructor (name, dept, title)
VALUES
  ('Professor A', 'Computer Science', 'Associate Professor'),
  ('Professor B', 'Mathematics', 'Assistant Professor'),
  ('Professor C', 'Physics', 'Professor'),
  ('Professor D', 'Engineering', 'Senior Lecturer'),
  ('Professor E', 'Biology', 'Lecturer');

-- 5 registros para course
INSERT INTO
  course (title, syllabus, credits)
VALUES
  ('Introduction to Programming', 'Programming Basics', 4),
  ('Calculus I', 'Limits and Derivatives', 3),
  ('Physics for Engineers', 'Mechanics and Thermodynamics', 4),
  ('Database Design', 'Relational Databases', 3),
  ('Cell Biology', 'Cell Structure and Function', 4);

INSERT INTO
  course_offering (course_id, sec_id, year, semester, time, classroom)
VALUES
  (837827, 1, 2023, 'Fall', '9:00 AM - 10:30 AM', 'Room 101'),
  (837850, 2, 2023, 'Fall', '11:00 AM - 12:30 PM', 'Room 201'),
  (837873, 1, 2023, 'Spring', '2:00 PM - 3:30 PM', 'Room 301' ),
  (837896, 2, 2023, 'Spring', '4:00 PM - 5:30 PM', 'Room 401'),
  (837919, 1, 2023, 'Fall', '1:00 PM - 2:30 PM', 'Room 501');

-- 5 registros para enrols
INSERT INTO
  enrols (student_id, course_id, sec_id, semester, year, grade) 
VALUES
  (7488, 837827, 1, 'Fall', 2023, 4.0),
  (7656, 837850, 2, 'Fall', 2023, 3.5),
  (7824, 837873, 1, 'Spring', 2023, 4.5),
  (7992, 837896, 2, 'Spring', 2023, 3.0),
  (8160, 837919, 1, 'Fall', 2023, 5.0);

-- 5 registros para teaches
INSERT INTO
  teaches (course_id, sec_id, semester, year, instructor_id)
VALUES
  (837827, 1, 'Fall', 2023, 1),
  (837850, 2, 'Fall', 2023, 2),
  (837873, 1, 'Spring', 2023, 3),
  (837896, 2, 'Spring', 2023, 4),
  (837919, 1, 'Fall', 2023, 5);

-- 5 registros para requires
INSERT INTO
  requires (main_course, prerequisite) 
VALUES
  (837827, 837850),
  (837850, 837873),
  (837873, 837827),
  (837896, 837850),
  (837919, 837896);
  