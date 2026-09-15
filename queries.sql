-- CONSULTA 0.1
-- SELECT * FROM enrollments LIMIT 5;
-- CONSULTA 0.2
--SELECT * FROM students;
-- CONSULTA 0.3
-- SELECT * FROM courses;

----------------LAS 12 CONSULTAS DE PRACTICAS
-- 1. Listar todas las inscripciones del curso 'Intro to Python', mostrando nombre del estudiante, email y porcentaje de completado
-- SELECT student_name, student_email, completion_percentage
--FROM enrollments
--WHERE course_title = 'Intro to Python';

-- 2. Obtener todas las inscripciones donde completion_percentage sea menor que 10
--SELECT *
--FROM enrollments
--WHERE completion_percentage < 10;

-- 3. Encontrar todas las inscripciones donde el campo instructor sea NULL
--SELECT *
--FROM enrollments
--WHERE instructor IS NULL;

-- 4. Listar los 5 estudiantes con mayor completion_percentage que todavía no han aprobado (passed = false)
-- SELECT 
   -- student_name, 
   -- student_email, 
   -- course_title, 
   -- completion_percentage, 
   -- passed
--FROM enrollments
--WHERE passed = FALSE
--ORDER BY completion_percentage DESC
--LIMIT 5;

-- 5.  Mostrar todas las inscripciones creadas en el último año, ordenadas por enrollment_date descendente. Se calculo dinámicamente tomando como referencia la fecha máxima de la tabla
--SELECT *
--FROM enrollments
--WHERE enrollment_date >= (SELECT MAX(enrollment_date) - INTERVAL '1 year' FROM enrollments)
--ORDER BY enrollment_date DESC;

-- 6. INSERT del registro de inscripción faltante (id = 18) indicado en el brief
--INSERT INTO enrollments ( id, student_id, student_name, student_email, course_id, course_title, 
 -- category, enrollment_date, completion_percentage, passed, monthly_fee_paid, instructor) VALUES (
  -- 18, 3, 'Lucia Fernandes', 'lucia.fernandes@student.edutrack.com', 5, 'Advanced Python', 
  -- 'Programming', '2025-04-01', 0, FALSE, 69.99, 'Carlos Vega');

-- 7. UPDATE de inscripciones con instructor NULL asignando el valor por defect 'Pending assignment'
--UPDATE enrollments SET instructor = 'Pending assignment' WHERE instructor IS NULL;

-- 8. DELETE de inscripciones asociadas a cuentas de prueba (@test.com)
-- SELECT * FROM enrollments WHERE student_email LIKE '%@test.com';
--DELETE FROM enrollments WHERE student_email LIKE '%@test.com';

-- 9. Contar el número de inscripciones agrupado por category
-- SELECT category, COUNT(*) AS total_enrollments FROM enrollments GROUP BY category;

-- 10. Calcular el promedio de completion_percentage agrupado por course_title, ordenado de menor a mayor
--SELECT course_title, AVG(completion_percentage) AS avg_completion
--FROM enrollments GROUP BY course_title ORDER BY avg_completion ASC;

-- 11. Mostrar únicamente los cursos con más de 3 inscripciones
--SELECT course_title, COUNT(*) AS total_enrollments FROM enrollments 
--GROUP BY course_title HAVING COUNT(*) > 3;

-- 12. Calcular los ingresos totales (SUM de monthly_fee_paid) agrupados por category, ordenados de mayor a menor
SELECT category, SUM(monthly_fee_paid) AS total_revenue
FROM enrollments GROUP BY category ORDER BY total_revenue DESC;