-- Sample Data 3: Specific User Request Test Case
-- Based on the user's provided logic for Matiere 3, Solution/Method selection

-- 1. Ensure Operators exist (Mapping method_id/solution_id logic)
TRUNCATE TABLE operators CASCADE;
INSERT INTO operators (id, name, symbol) VALUES 
(1, 'Average Logic', 'null'),
(2, 'Highest Logic', '>'),
(3, 'Lowest Logic', '<'),
(4, 'Highest (Inclusive)', '>='),
(5, 'Lowest (Inclusive)', '<=');

-- Reset sequence
SELECT setval('operators_id_seq', (SELECT MAX(id) FROM operators));

-- 2. Ensure Students exist
INSERT INTO students (id, name) VALUES (1, 'Etudiant 1') ON CONFLICT (id) DO NOTHING;

-- 3. Ensure Correctors (Profs) exist
INSERT INTO correctors (id, name) VALUES 
(1, 'Prof 1'),
(2, 'Prof 2'),
(3, 'Prof 3')
ON CONFLICT (id) DO NOTHING;

-- 4. Ensure Subjects (Matieres) exist
INSERT INTO subjects (id, subject_name, coefficient) VALUES (3, 'Matiere 3', 1.0) ON CONFLICT (id) DO NOTHING;

-- 5. Ensure an Exam exists for this subject
INSERT INTO exams (id, id_subject, name, exam_date) VALUES (3, 3, 'Calcul de Note Matiere 3', '2024-06-15') ON CONFLICT (id) DO NOTHING;

-- 6. Insert Parameters (Rules for Matiere 3)
-- Rule: <= 2 -> Petit (Mapped to a specific operator logic)
-- Rule: > 5 -> Grand
INSERT INTO parameters (id_subject, limit_value, id_operator) VALUES 
(3, 2.0, 3), -- Closest to 2 -> Using Lowest (Petit)
(3, 5.0, 2); -- Closest to 5 -> Using Highest (Grand)

-- 7. Insert Grades (Notes)
-- Notes: 10, 11, 11.75
-- Differences: |10-11|=1, |10-11.75|=1.75, |11-11.75|=0.75
-- Sum of Differences = 1 + 1.75 + 0.75 = 3.5
-- Match analysis:
-- Distance to Limit 2.0: |3.5 - 2.0| = 1.5
-- Distance to Limit 5.0: |3.5 - 5.0| = 1.5
-- Tie-breaker: Take the lowest limit (2.0) -> Use Lowest Logic (Petit).
INSERT INTO grades (id_student, id_exam, value, id_corrector) VALUES 
(1, 3, 10.00, 1),
(1, 3, 11.00, 2),
(1, 3, 11.75, 3);

-- 8. Reset ALL sequences to ensure UI "Add" operations work correctly
SELECT setval('operators_id_seq', (SELECT MAX(id) FROM operators));
SELECT setval('students_id_seq', COALESCE((SELECT MAX(id) FROM students), 1));
SELECT setval('correctors_id_seq', COALESCE((SELECT MAX(id) FROM correctors), 1));
SELECT setval('subjects_id_seq', COALESCE((SELECT MAX(id) FROM subjects), 1));
SELECT setval('exams_id_seq', COALESCE((SELECT MAX(id) FROM exams), 1));
SELECT setval('parameters_id_seq', COALESCE((SELECT MAX(id) FROM parameters), 1));
SELECT setval('grades_id_seq', COALESCE((SELECT MAX(id) FROM grades), 1));
