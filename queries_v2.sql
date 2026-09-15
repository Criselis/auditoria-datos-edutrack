SELECT * FROM enrollments LIMIT 5;
SELECT * FROM students LIMIT 5;
SELECT * FROM courses LIMIT 5;

-- 1. Lista todas las inscripciones (estudiante, curso, porcentaje completado)
SELECT 
    s.name AS estudiante,
    c.title AS curso,
    e.completion_percentage
FROM enrollments e
INNER JOIN students s ON e.student_id = s.id
INNER JOIN courses c ON e.course_id = c.id;

-- 2. lista el nombre y email de estudiantes que han aprobado al menos un curso y el título del curso
SELECT DISTINCT 
    s.name,
    s.email,
    c.title AS curso_aprobado
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
INNER JOIN courses c ON e.course_id = c.id
WHERE e.passed = TRUE;

-- 3. Muestra el porcentaje de completado medio por instructor (ordenado de mayor a menor)
SELECT 
    c.instructor_name,
    AVG(e.completion_percentage) AS promedio_completado
FROM courses c
INNER JOIN enrollments e ON c.id = e.course_id
GROUP BY c.instructor_name
ORDER BY promedio_completado DESC;

-- 4. Consulta los estudiantes sin ninguna inscripción
SELECT 
    s.id,
    s.name,
    s.email
FROM students s
LEFT JOIN enrollments e ON s.id = e.student_id
WHERE e.id IS NULL;

-- 5. Muestra los cursos sin ninguna inscripción
SELECT 
    c.id,
    c.title,
    c.category
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
WHERE e.id IS NULL;

-- 6. Consulta los estudiantes inscritos en más de un curso
SELECT 
    s.id,
    s.name,
    COUNT(e.course_id) AS total_cursos
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id, s.name
HAVING COUNT(e.course_id) > 1;

-- 7. Muestra los ingresos totales por categoría (basado en monthly_fee de courses)
SELECT 
    c.category,
    SUM(c.monthly_fee) AS ingresos_totales
FROM courses c
INNER JOIN enrollments e ON c.id = e.course_id
GROUP BY c.category;

-- 8. Consulta el instructor junto con el número de estudiantes inscritos actualmente
SELECT 
    c.instructor_name,
    COUNT(e.student_id) AS total_estudiantes
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.instructor_name;

-- 9. Comprueba registros huérfanos por student_id inexistente
SELECT e.*
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.id
WHERE s.id IS NULL;

-- 10. Comprueba registros huérfanos por course_id inexistente
SELECT e.*
FROM enrollments e
LEFT JOIN courses c ON e.course_id = c.id
WHERE c.id IS NULL;