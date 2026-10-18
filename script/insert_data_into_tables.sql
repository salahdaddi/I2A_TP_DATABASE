/*
Script : chargement de données de test pour la base 'university'
But : vider et réinsérer les données dans department, teacher, class, student, teacher_class

Remarques :
 - Exécuter en se plaçant dans la base cible : USE university;
 - Vérifier les contraintes FK et cycles avant toute modification structurelle.
*/
DELETE FROM dbo.teacher_class;
DELETE FROM dbo.student;
DELETE FROM dbo.class;
DELETE FROM dbo.teacher;
DELETE FROM dbo.department;
INSERT INTO department (department_id, department_name) 
VALUES 
(1, 'Informatique'), 
(2, 'Mathématiques'), 
(3, 'Électronique'), 
(4, 'Physique'), 
(5, 'Chimie'); 
-- Insert Teachers
INSERT INTO teacher 
(teacher_id, last_name, first_name, salary, department_id) 
VALUES 
(101, 'Benali', 'Ahmed', 75000, 1), 
(102, 'Saidi', 'Nadia', 62000, 1), 
(103, 'Karim', 'Samir', 48000, 2), 
(104, 'Haddad', 'Amel', 85000, 2), 
(105, 'Mansouri', 'Ali', 55000, 3), 
(106, 'Rahmani', 'Sara', 72000, 3), 
(107, 'Bensaid', 'Omar', 45000, 4), 
(108, 'Ahmed', 'Yasmine', 68000, 1), 
(109, 'Khelifi', 'Nora', NULL, 1); 
--  Insert Classes
INSERT INTO class 
(class_id, class_name, department_id) 
VALUES 
(10, 'M1-GL', 1), 
(20, 'M1-IA', 1), 
(30, 'M1-Math', 2), 
(40, 'M1-Elec', 3), 
(50, 'M1-Physique', 4);
-- Insert Students 
INSERT INTO student 
(student_id, last_name, first_name, age, class_id) 
VALUES 
(1, 'Ahmed', 'Karim', 22, 10), 
(2, 'Ali', 'Sara', 23, 10), 
(3, 'Amine', 'Yacine', 21, 20), 
(4, 'Benali', 'Lina', 24, 20), 
(5, 'Brahimi', 'Omar', 22, 30), 
(6, 'Chibani', 'Amel', 23, 30), 
(7, 'Dali', 'Sami', 21, 40), 
(8, 'Farah', 'Ines', 22, NULL), 
(9, 'Ahmed', 'Salim', 25, 10), 
(10, 'Ali', 'Nadia', 20, 20);
-- Insert Teacher-Class
INSERT INTO teacher_class (teacher_id, class_id) 
VALUES -- Teacher 101 (Benali Ahmed) teaches M1-GL and M1-IA 
(101, 10), 
(101, 20), -- Teacher 102 (Saidi Nadia) teaches M1-GL and M1-Math 
(102, 10), 
(102, 30), -- Teacher 103 (Karim Samir) teaches M1-Math 
(103, 30), -- Teacher 104 (Haddad Amel) teaches M1-Math and M1-Elec 
(104, 30), 
(104, 40), -- Teacher 105 (Mansouri Ali) teaches M1-Elec 
(105, 40), -- Teacher 106 (Rahmani Sara) teaches M1-Elec and M1-Physique 
(106, 40), 
(106, 50), -- Teacher 107 (Bensaid Omar) teaches M1-Physique 
(107, 50), -- Teacher 108 (Ahmed Yasmine) teaches M1-GL and M1-IA 
(108, 10), 
(108, 20), -- Teacher 109 (Khelifi Nora) teaches M1-IA 
(109, 20); 
