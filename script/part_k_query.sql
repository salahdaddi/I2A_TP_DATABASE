/*
Fichier de requêtes d'inspection et d'agrégation pour les tables "PART K" :
  `class`, `teacher`, `department`, `student`, `teacher_class`.

Sections incluses :
  - Afficher le contenu de chaque table.
  - Lister chaque enseignant avec les classes de son département (LEFT JOIN sur department_id).
  - Lister chaque classe avec les enseignants du même département.
  - Compter le nombre de classes par enseignant (avec nom, prénom, salaire, id de département).
  - Compter le nombre d'enseignants par classe.
  - Requêtes filtrant >1 correspondance (HAVING).
  - Requêtes pour détecter enseignants ou classes sans correspondance.

Remarques :
  - `LEFT JOIN` conserve toutes les lignes de la table de gauche ; les colonnes de la droite seront NULL si aucune correspondance.
  - `COUNT(colonne)` ignore les NULL ; un enseignant sans classe dans le département renverra 0.
*/

--  Display All Tables
SELECT * FROM class;
SELECT * FROM teacher;
SELECT * FROM department;
SELECT * FROM student;
SELECT * FROM teacher_class;

-- Display Each Teacher with the Classes They Teach 
SELECT * FROM teacher AS t
LEFT JOIN class AS c
     ON t.department_id = c.department_id;

-- Display Each Class with Its Teachers
SELECT * FROM class AS c 
LEFT JOIN teacher AS t
     ON c.department_id = t.department_id;

-- Count How Many Classes Each Teacher Teaches
SELECT 
t.teacher_id,
t.last_name,
t.first_name,
t.salary,
t.department_id,
COUNT(c.class_id) AS number_of_classes 
FROM teacher AS t
LEFT JOIN class AS c
     ON t.department_id = c.department_id
GROUP BY
    t.teacher_id,
    t.last_name,
    t.first_name,
    t.salary,
    t.department_id
ORDER BY  number_of_classes DESC;

-- Count How Many Teachers Teach Each Class
SELECT 
c.class_id,
c.class_name,
c.department_id,
COUNT(t.teacher_id) AS number_of_teachers
FROM class AS c 
LEFT JOIN teacher AS t
     ON c.department_id = t.department_id
GROUP BY c.class_id,
c.class_name,
c.department_id;

-- Find Teachers Who Teach More Than One Class 
SELECT 
t.teacher_id,
t.last_name,
t.first_name,
t.salary,
t.department_id,
COUNT(c.class_id) AS number_of_classes 
FROM teacher AS t
LEFT JOIN class AS c
     ON t.department_id = c.department_id
GROUP BY
    t.teacher_id,
    t.last_name,
    t.first_name,
    t.salary,
    t.department_id
HAVING COUNT(c.class_id) >1;

--  Find Classes Taught by More Than One Teacher 
SELECT 
c.class_id,
c.class_name,
c.department_id,
COUNT(t.teacher_id) AS number_of_teachers
FROM class AS c 
LEFT JOIN teacher AS t
     ON c.department_id = t.department_id
GROUP BY c.class_id,
c.class_name,
c.department_id
HAVING COUNT(t.teacher_id) >1;

-- Find Teachers Who Teach No Class 
SELECT * FROM teacher AS t
LEFT JOIN class AS c
     ON t.department_id = c.department_id
WHERE class_id IS NULL ;

--  Find Classes with No Teacher
SELECT * FROM class AS c
LEFT JOIN teacher AS t
     ON c.department_id = t.department_id
WHERE t.teacher_id IS NULL