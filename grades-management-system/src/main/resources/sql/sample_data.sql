-- Sample Data for Grades Management System

-- 1. Insert Operators (Grading Logic)
TRUNCATE TABLE operators CASCADE;
INSERT INTO operators (id, name, symbol) VALUES 
(1, 'Average Logic', 'null'),
(2, 'Highest Logic', '>'),
(3, 'Lowest Logic', '<'),
(4, 'Highest (Inclusive)', '>='),
(5, 'Lowest (Inclusive)', '<=');

-- Reset serial sequence to continue from the next ID
SELECT setval('operators_id_seq', (SELECT MAX(id) FROM operators));

-- 2. Insert Students
INSERT INTO students (name) VALUES 
('Jean Dupont'),
('Alice Martin'),
('Bob Smith');

-- 3. Insert Correctors (Teachers)
INSERT INTO correctors (name) VALUES 
('Prof. Williams'),
('Dr. Brown'),
('Mme. Lefebvre');

-- 4. Insert Subjects
INSERT INTO subjects (subject_name, coefficient) VALUES 
('Mathematics', 4.0),
('Physics', 3.0),
('History', 2.0);

-- 5. Insert Exams
INSERT INTO exams (id_subject, name, exam_date) VALUES 
(1, 'Final Math Exam 2024', '2024-06-15'),
(2, 'Physics Midterm', '2024-05-10');

-- If sum of diffs > 20 -> Take Lowest Grade (Extreme inconsistency)
-- If sum of diffs > 10 -> Take Highest Grade
-- If sum of diffs >= 0 -> Take Average (Fallback)
INSERT INTO parameters (id_subject, limit_value, id_operator, comparison_symbol) VALUES 
(1, 20.00, 3, '>'), -- Operator 3 is Lowest, for diff > 20
(1, 10.00, 2, '>'), -- Operator 2 is Highest, for diff > 10
(1, 0.00, 1, '>='); -- Operator 1 is Average, for diff >= 0

-- 7. Insert Grades (Scenario for Simulation)
-- Student 1 (Jean Dupont) for Math Exam
-- Grades: 12, 14, 13
-- Differences: |12-14|=2, |12-13|=1, |14-13|=1. Sum = 4.
-- Result: Sum 4 falls in [0-5] range -> Operation: Average -> Final: 13.0
INSERT INTO grades (id_student, id_exam, value, id_corrector) VALUES 
(1, 1, 12.0, 1),
(1, 1, 14.0, 2),
(1, 1, 13.0, 3);

-- Student 2 (Alice Martin) for Math Exam
-- Grades: 10, 18, 12
-- Differences: |10-18|=8, |10-12|=2, |18-12|=6. Sum = 16.
-- Result: Sum 16 falls in [10.01-null] range -> Operation: Lowest -> Final: 10.0
INSERT INTO grades (id_student, id_exam, value, id_corrector) VALUES 
(2, 1, 10.0, 1),
(2, 1, 18.0, 2),
(2, 1, 12.0, 3);

-- Reset ALL sequences to ensure UI "Add" operations work correctly
SELECT setval('operators_id_seq', (SELECT MAX(id) FROM operators));
SELECT setval('students_id_seq', COALESCE((SELECT MAX(id) FROM students), 1));
SELECT setval('correctors_id_seq', COALESCE((SELECT MAX(id) FROM correctors), 1));
SELECT setval('subjects_id_seq', COALESCE((SELECT MAX(id) FROM subjects), 1));
SELECT setval('exams_id_seq', COALESCE((SELECT MAX(id) FROM exams), 1));
SELECT setval('parameters_id_seq', COALESCE((SELECT MAX(id) FROM parameters), 1));
SELECT setval('grades_id_seq', COALESCE((SELECT MAX(id) FROM grades), 1));
