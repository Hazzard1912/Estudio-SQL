-- recuperar el dept, title de los instructores registrados en la base de datos.
SELECT dept, title FROM instructor;

-- Indique el nombre y programa del estudiante con student_id = 7656, es decir, recuperar esos datos de la tabla student.
SELECT name, program FROM student WHERE student_id = 7656;

-- Encuentre los nombres de todos los estudiantes que se han matriculado en el curso con course_id = 837873
SELECT name FROM student JOIN enrols USING (student_id) WHERE course_id = 837873;

-- Esta seria la vista segun los datos que se ingresaron en la base de datos (todos los estudiantes van en semestres del 2023).
-- Solo se deberia modificar el where de la subconsulta
CREATE VIEW better_students AS
SELECT *
FROM (
    SELECT
        e.student_id,
        e.semester,
        e.year,
        e.grade,
        s.name AS student_name,
        ROW_NUMBER() OVER (PARTITION BY e.semester, e.year ORDER BY e.grade DESC) AS row_num
    FROM enrols e
    JOIN student s USING (student_id)
    WHERE e.year BETWEEN 1900 AND 2023
) AS subquery
WHERE row_num = 1;

