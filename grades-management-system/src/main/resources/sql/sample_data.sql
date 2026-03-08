-- Sample Data for Grades Management System

-- 1. Insert Operators (Grading Logic)
INSERT INTO operators (name, symbol) VALUES 
('Average Logic', 'null'),
('Highest Logic', '>'),
('Lowest Logic', '<');

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
-- If sum of differences is between 0 and 5 -> Take Average
INSERT INTO parameters (id_subject, min_value, max_value, id_operator) VALUES 
(1, 0, 5, 1); 

-- If sum of differences is between 5.01 and 10 -> Take Highest Grade
INSERT INTO parameters (id_subject, min_value, max_value, id_operator) VALUES 
(1, 5.01, 10, 2);

-- If sum of differences is above 10 -> Take Lowest Grade (Extreme inconsistency)
INSERT INTO parameters (id_subject, min_value, max_value, id_operator) VALUES 
(1, 10.01, NULL, 3);

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
