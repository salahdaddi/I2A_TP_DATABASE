
-- Assurer la présence de la base
IF DB_ID(N'university') IS NULL
    CREATE DATABASE university;
GO

USE university;
GO

-- Drop dans l'ordre "enfants" -> "parents"
IF OBJECT_ID(N'dbo.student','U') IS NOT NULL DROP TABLE dbo.student;
IF OBJECT_ID(N'dbo.teacher','U') IS NOT NULL DROP TABLE dbo.teacher;
IF OBJECT_ID(N'dbo.class','U') IS NOT NULL DROP TABLE dbo.class;
IF OBJECT_ID(N'dbo.department','U') IS NOT NULL DROP TABLE dbo.department;
IF OBJECT_ID(N'dbo.teacher_class','U') IS NOT NULL DROP TABLE dbo.teacher_class;
GO

-- Puis recréation des tables (department d'abord)
CREATE TABLE dbo.department ( 
    department_id   INTEGER    PRIMARY KEY, 
    department_name NVARCHAR(50)   NOT NULL UNIQUE); 
GO
CREATE TABLE dbo.teacher ( 
        teacher_id     INTEGER       PRIMARY KEY, 
        last_name      NVARCHAR(50)   NOT NULL, 
        first_name     NVARCHAR(50)   NOT NULL, 
        salary         NUMERIC(10,2) DEFAULT 30000, 
        department_id  INTEGER       REFERENCES department(department_id) 
                                     ON DELETE SET NULL 
                                     ON UPDATE CASCADE);
GO
CREATE TABLE dbo.class ( 
    class_id       INTEGER       PRIMARY KEY, 
    class_name     NVARCHAR(50)   NOT NULL, 
    department_id  INTEGER       REFERENCES department(department_id) 
                                 ON DELETE CASCADE 
                                 ON UPDATE CASCADE); 
GO
CREATE TABLE dbo.student ( 
    student_id   INTEGER       PRIMARY KEY,
    last_name    NVARCHAR(50)   NOT NULL, 
    first_name   NVARCHAR(50)   NOT NULL, 
    age          INTEGER       NOT NULL 
                                           CHECK (age > 0 AND age < 150), 
    class_id     INTEGER       REFERENCES class(class_id) 
                               ON DELETE SET NULL 
                               ON UPDATE CASCADE);
GO
CREATE TABLE dbo.teacher_class (
    teacher_id INTEGER NOT NULL,
    class_id   INTEGER NOT NULL,
    PRIMARY KEY (teacher_id, class_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id) ON DELETE CASCADE,
    FOREIGN KEY (class_id)   REFERENCES class(class_id)  ON DELETE NO ACTION
);
GO