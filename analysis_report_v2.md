# Reporte de Ejecución de Consultas — EduTrack v2

---

## Consultas — INNER JOIN

### 1. Listar todas las inscripciones (Estudiante, Curso, Porcentaje completado)

| estudiante | curso | completion_percentage |
| :--- | :--- | :--- |
| Emily Watson | Intro to Python | 85 |
| Emily Watson | Web Design Basics | 60 |
| Klaus Weber | Intro to Python | 92 |
| Klaus Weber | Data Analysis with SQL | 78 |
| Lucia Fernandes | Web Design Basics | 5 |
| Lucia Fernandes | Digital Marketing 101 | 3 |
| Marco Rossi | Advanced Python | 95 |
| Marco Rossi | Intro to Python | 88 |
| Yuki Nakamura | Data Analysis with SQL | 45 |
| Yuki Nakamura | UI/UX Fundamentals | 0 |
| Pierre Dubois | UI/UX Fundamentals | 0 |
| Priya Sharma | Digital Marketing 101 | 70 |
| Priya Sharma | Intro to Python | 55 |
| Pierre Dubois | Data Analysis with SQL | 20 |
| Emily Watson | Advanced Python | 40 |
| Lucia Fernandes | Advanced Python | 0 |

---

### 2. Estudiantes que han aprobado al menos un curso

| name | email | curso_aprobado |
| :--- | :--- | :--- |
| Emily Watson | emily.watson@student.edutrack.com | Intro to Python |
| Klaus Weber | klaus.weber@student.edutrack.com | Intro to Python |
| Klaus Weber | klaus.weber@student.edutrack.com | Data Analysis with SQL |
| Marco Rossi | marco.rossi@student.edutrack.com | Advanced Python |
| Marco Rossi | marco.rossi@student.edutrack.com | Intro to Python |
| Priya Sharma | priya.sharma@student.edutrack.com | Digital Marketing 101 |

---

### 3. Porcentaje de completado medio por instructor

| instructor_name | promedio_completado |
| :--- | :--- |
| Carlos Vega | 65.00 |
| Marta López | 63.29 |
| Lucia Prades | 36.50 |
| Pending assignment | 0.00 |

---

## Consultas — LEFT JOIN (Detección de datos faltantes)

### 1. Estudiantes sin ninguna inscripción

| id | name | email |
| :--- | :--- | :--- |
| 8 | Giulia Romano | giulia.romano@student.edutrack.com |

---

### 2. Cursos sin ninguna inscripción

| id | title | category |
| :--- | :--- | :--- |
| 7 | Email Campaigns | Marketing |

---

## Consultas — Agregación entre tablas

### 1. Estudiantes inscritos en más de un curso

| id | name | total_cursos |
| :--- | :--- | :--- |
| 1 | Emily Watson | 3 |
| 2 | Klaus Weber | 2 |
| 3 | Lucia Fernandes | 3 |
| 4 | Marco Rossi | 2 |
| 5 | Yuki Nakamura | 2 |
| 6 | Pierre Dubois | 2 |
| 7 | Priya Sharma | 2 |

---

### 2. Ingresos totales por categoría (según `monthly_fee` de courses)

| category | ingresos_totales |
| :--- | :--- |
| Data | 179.97 |
| Design | 79.98 |
| Marketing | 59.98 |
| Programming | 409.91 |

---

### 3. Instructores y total de estudiantes inscritos

| instructor_name | total_estudiantes |
| :--- | :--- |
| Carlos Vega | 5 |
| Pending assignment | 2 |
| Lucia Prades | 2 |
| Marta López | 7 |

---

## Consultas — Integridad de datos

### 1. Registros huérfanos por `student_id` inexistente

*(0 filas devueltas — No se encontraron registros huérfanos de estudiantes)*

---

### 2. Registros huérfanos por `course_id` inexistente

*(0 filas devueltas — No se encontraron registros huérfanos de cursos)*