-- Sample Data 2 for Grades Management System (Testing Parameter Tiebreak Logic)

-- 1. Insert Operators (Grading Logic)
TRUNCATE TABLE operators CASCADE;
INSERT INTO operators (id, name, symbol) VALUES 
(1, 'Average Logic', 'null'),
(2, 'Highest Logic', '>'),
(3, 'Lowest Logic', '<'),
(4, 'Highest (Inclusive)', '>='),
(5, 'Lowest (Inclusive)', '<=');

-- Reset sequence
SELECT setval('operators_id_seq', (SELECT MAX(id) FROM operators));

-- 2. Insert Students
INSERT INTO students (name) VALUES 
('Jean Dupont'),     -- For Tiebreak test (Sum=15)
('Alice Martin'),    -- For Closest to 20 test (Sum=18)
('Bob Smith');       -- For Closest to 10 test (Sum=12)

-- 3. Insert Correctors (Teachers)
INSERT INTO correctors (name) VALUES 
('Prof. Williams'),
('Dr. Brown');

-- 4. Insert Subjects
INSERT INTO subjects (subject_name, coefficient) VALUES 
('Mathematics', 4.0);

-- 5. Insert Exams
INSERT INTO exams (id_subject, name, exam_date) VALUES 
(1, 'Tiebreaker Math Exam', '2024-06-15');

-- 6. Insert Parameters (Rules for Mathematics)
-- We set up exactly two limits: 10 and 20.
INSERT INTO parameters (id_subject, limit_value, id_operator) VALUES 
(1, 10.00, 2), -- Limit 10 -> Operator 2 (Highest Grade)
(1, 20.00, 3); -- Limit 20 -> Operator 3 (Lowest Grade)

-- 7. Insert Grades (Scenarios for Simulation)

-- Scenario 1: Tiebreak Test
-- Student: Jean Dupont
-- Grades: 10, 25. 
-- Differences: |10-25|=15. Sum = 15.
-- Distance to 10 is 5. Distance to 20 is 5.
-- Tie-breaker rule: take the lowest limit (10).
-- Operation for Limit 10: Highest Grade -> Final: 25.
INSERT INTO grades (id_student, id_exam, value, id_corrector) VALUES 
(1, 1, 10.0, 1),
(1, 1, 25.0, 2);

-- Scenario 2: Closer to upper limit
-- Student: Alice Martin
-- Grades: 12, 30.
-- Differences: |12-30|=18. Sum = 18.
-- Distance to 10 is 8. Distance to 20 is 2.
-- Closest is 20.
-- Operation for Limit 20: Lowest Grade -> Final: 12.
INSERT INTO grades (id_student, id_exam, value, id_corrector) VALUES 
(2, 1, 12.0, 1),
(2, 1, 30.0, 2);

-- Scenario 3: Closer to lower limit
-- Student: Bob Smith
-- Grades: 10, 22.
-- Differences: |10-22|=12. Sum = 12.
-- Distance to 10 is 2. Distance to 20 is 8.
-- Closest is 10.
-- Operation for Limit 10: Highest Grade -> Final: 22.
INSERT INTO grades (id_student, id_exam, value, id_corrector) VALUES 
(3, 1, 10.0, 1),
(3, 1, 22.0, 2);

-- Reset ALL sequences to ensure UI "Add" operations work correctly
SELECT setval('operators_id_seq', (SELECT MAX(id) FROM operators));
SELECT setval('students_id_seq', COALESCE((SELECT MAX(id) FROM students), 1));
SELECT setval('correctors_id_seq', COALESCE((SELECT MAX(id) FROM correctors), 1));
SELECT setval('subjects_id_seq', COALESCE((SELECT MAX(id) FROM subjects), 1));
SELECT setval('exams_id_seq', COALESCE((SELECT MAX(id) FROM exams), 1));
SELECT setval('parameters_id_seq', COALESCE((SELECT MAX(id) FROM parameters), 1));
SELECT setval('grades_id_seq', COALESCE((SELECT MAX(id) FROM grades), 1));
