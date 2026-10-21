/*
Fichier : Modifications de données (UPDATE) "PART M" 
Contenu :
  - Mise à jour du salaire d'un enseignant (`teacher.salary`)
  - Augmentation conditionnelle de salaires (`teacher`)
  - Réaffectation d'un étudiant à une classe (`student.class_id`)
*/

-- Modifying Existing Data with UPDATE 

-- Modify One Teacher's Salary 
UPDATE teacher
SET salary = 78000
WHERE teacher_id = 101;
SELECT * FROM teacher
WHERE teacher_id = 101;

-- Modify Several Rows 
UPDATE teacher
SET salary = salary * 1.05
WHERE teacher_id = 101 AND salary IS NOT NULL;

UPDATE student 
SET class_id = 10 
WHERE student_id = 8; 

-- Update Using a Condition
UPDATE teacher 
SET salary = salary * 1.10 
WHERE salary < 50000; 
