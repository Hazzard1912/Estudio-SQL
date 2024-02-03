-- Podemos eliminar los triggers y procedures sin problema
DROP TRIGGER IF EXISTS check_grade ON enrols;
DROP TRIGGER IF EXISTS check_grade_update ON enrols;
DROP PROCEDURE IF EXISTS create_teaches;

-- Eliminamos la vista
DROP VIEW IF EXISTS better_students;

-- Eliminamos las tablas

-- Tablas con fks
DROP TABLE IF EXISTS requires;
DROP TABLE IF EXISTS teaches;
DROP TABLE IF EXISTS enrols;
DROP TABLE IF EXISTS course_offering;

-- Tablas sin fk
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS instructor;
DROP TABLE IF EXISTS student;
