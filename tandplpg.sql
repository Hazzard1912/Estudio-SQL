-- Procedimientos y disparadores


-- Triggers:

-- Disparador al insertar registro en enrols
-- En caso de que grade sea negativa, cero (0.0) o mayor de 5.00 usar un RAISE EXCEPTION indicando que el valor a guardar en grade es incorrecto o invalido.

CREATE OR REPLACE FUNCTION check_grade() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.grade <= 0.00 OR NEW.grade > 5.00 THEN
    RAISE EXCEPTION 'El valor a guardar en grade es incorrecto o inválido.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER grade_check BEFORE INSERT ON enrols
FOR EACH ROW EXECUTE PROCEDURE check_grade();

-- Disparador al actualizar un registro en enrols. Si el valor grade es modificado, indicar el cambio usando RAISE NOTICE,
-- si el grade a actualizar es el mismo, indicar que el valor no se ha modificado. Si el grade a actualizar es negativo, cero o mayor de cinco use RAISE EXCEPTION.

CREATE OR REPLACE FUNCTION check_grade_update() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.grade = OLD.grade THEN
    RAISE NOTICE 'El valor no se ha modificado.';
  ELSIF NEW.grade <= 0.00 OR NEW.grade > 5.00 THEN
    RAISE EXCEPTION 'El valor a guardar en grade es incorrecto o inválido.';
  ELSE
    RAISE NOTICE 'El valor ha sido modificado.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_grade_update BEFORE UPDATE ON enrols
FOR EACH ROW EXECUTE PROCEDURE check_grade_update();

-- Procedimiento:

-- create_teaches automáticamente agrega un registro a teaches. Recibe dos argumentos: un identificador de instructor y un identificador de course. Se asume que ambos existen en la base de datos.

CREATE OR REPLACE PROCEDURE create_teaches(instructor_id integer, curso_id integer)
LANGUAGE plpgsql
AS $$
DECLARE
  sec_id integer;
  semester varchar(50);
  year integer;
BEGIN
  -- Validar que el curso existe en course_offering
  IF NOT EXISTS (SELECT 1 FROM course_offering co WHERE co.course_id = curso_id) THEN
    RAISE EXCEPTION 'El curso no existe en course_offering.';
  END IF;
  -- Recuperamos el sec_id, semester y year del curso
  SELECT co.sec_id, co.semester, co.year INTO sec_id, semester, year FROM course_offering co WHERE co.course_id = curso_id;
  -- Insertamos el registro
  INSERT INTO teaches (course_id, sec_id, semester, year, instructor_id)
  VALUES (curso_id, sec_id, semester, year, instructor_id);
END;
$$;
