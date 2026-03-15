-- Sample Data for Grades Management System

-- 1. Insert Operators (Grading Logic)
INSERT INTO operators (name, symbol) VALUES 
('Average Logic', 'null'),
('Highest Logic', '>'),
('Lowest Logic', '<'),
('Highest (Inclusive)', '>='),
('Lowest (Inclusive)', '<=');

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

-- 6. Insert Parameters (Rules for Mathematics)
-- If closest limit is 0 -> Take Average
-- If closest limit is 10 -> Take Highest Grade
-- If closest limit is 20 -> Take Lowest Grade (Extreme inconsistency)
INSERT INTO parameters (id_subject, limit_value, id_operator) VALUES 
(1, 0.00, 1),  -- Operator 1 is Average
(1, 10.00, 2), -- Operator 2 is Highest
(1, 20.00, 3); -- Operator 3 is Lowest

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
