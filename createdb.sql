-- Secuencia personalizada para la tabla student
CREATE SEQUENCE student_id_seq START 7488 INCREMENT 168;

-- student(student_id, name, program)
CREATE TABLE student(
  student_id INT NOT NULL DEFAULT nextval('student_id_seq'),
  name VARCHAR(50) NOT NULL,
  program VARCHAR(50) NOT NULL,
  PRIMARY KEY(student_id)
);

-- instructor (instructor_id, name, dept, title)
CREATE TABLE instructor(
  instructor_id SERIAL NOT NULL,
  name VARCHAR(50) NOT NULL,
  dept VARCHAR(50) NOT NULL,
  title VARCHAR(50) NOT NULL,
  PRIMARY KEY(instructor_id)
);

-- Secuencia personalizada para la tabla course
CREATE SEQUENCE course_id_seq START 837827 INCREMENT 23;

-- course (course_id, title, syllabus, credits)
CREATE TABLE course(
  course_id INT NOT NULL DEFAULT nextval('course_id_seq'),
  title VARCHAR(50) NOT NULL,
  syllabus VARCHAR(50) NOT NULL,
  credits INT NOT NULL,
  PRIMARY KEY(course_id)
);

-- course_offering (course_id*, sec_id, year, semester, time, classroom)
CREATE TABLE course_offering(
  course_id INT NOT NULL REFERENCES course(course_id),
  sec_id INT NOT NULL,
  year INT NOT NULL,
  semester VARCHAR(50) NOT NULL,
  time VARCHAR(50) NOT NULL,
  classroom VARCHAR(50) NOT NULL,
  PRIMARY KEY(course_id, sec_id, year, semester)
);

-- enrols (student_id*, course_id*, sec_id, semester, year, grade) con validacion de nota
CREATE TABLE enrols(
  student_id INT NOT NULL REFERENCES student(student_id),
  course_id INT NOT NULL REFERENCES course(course_id),
  sec_id INT NOT NULL,
  semester VARCHAR(50) NOT NULL,
  year INT NOT NULL,
  grade NUMERIC(3,2) NOT NULL CHECK (grade >= 1.00 AND grade <= 5.00),
  PRIMARY KEY(student_id, course_id, sec_id, semester, year)
);

-- teaches (course_id*, sec_id, semester, year, instructor_id*)
CREATE TABLE teaches(
  course_id INT NOT NULL REFERENCES course(course_id),
  sec_id INT NOT NULL,
  semester VARCHAR(50) NOT NULL,
  year INT NOT NULL,
  instructor_id INT NOT NULL REFERENCES instructor(instructor_id),
  PRIMARY KEY(course_id, sec_id, semester, year, instructor_id)
);

-- requires (main_course*, prerequisite*)
CREATE TABLE requires(
  main_course INT NOT NULL REFERENCES course(course_id),
  prerequisite INT NOT NULL REFERENCES course(course_id),
  PRIMARY KEY(main_course, prerequisite)
);
