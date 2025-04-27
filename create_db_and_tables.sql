--Задание 1. Создайте базу данных "hospital_db" и подключитесь к ней.
--Создание таблицы Hospital

CREATE TABLE Hospital (
        Hospital_Id serial NOT NULL PRIMARY KEY,
        Hospital_Name VARCHAR (100) NOT NULL,
        Bed_Count serial
    );
--Вставка данных в таблицу

 INSERT INTO Hospital (Hospital_Id, Hospital_Name, Bed_Count)
    VALUES
    (1, 'Mayo Clinic', 200),
    (2, 'Cleveland Clinic', 400),
    (3, 'Johns Hopkins', 1000),
    (4, 'UCLA Medical Center', 1500);

--Создание таблицы Doctor

 CREATE TABLE IF NOT EXISTS Doctor (
        Doctor_Id VARCHAR(10) PRIMARY KEY,
        Doctor_Name VARCHAR(100) NOT NULL,
        Hospital_Id INT NOT NULL,
        Joining_Date DATE,
        Speciality VARCHAR(100),
        Salary INT,
        Experience INT,
        FOREIGN KEY (Hospital_Id) REFERENCES Hospital(Hospital_Id)
    );

--Вставка данных в таблицу Doctor

INSERT INTO Doctor (Doctor_Id, Doctor_Name, Hospital_Id, Joining_Date, Speciality, Salary, Experience)
    VALUES
        ('101', 'David', 1, '2005-02-10', 'Pediatric', 40000, NULL),
        ('102', 'Michael', 1, '2018-07-23', 'Oncologist', 20000, NULL),
        ('103', 'Susan', 2, '2016-05-19', 'Garnacologist', 25000, NULL),
        ('104', 'Robert', 2, '2017-12-28', 'Pediatric', 28000, NULL),
        ('105', 'Linda', 3, '2004-06-04', 'Garnacologist', 42000, NULL),
        ('106', 'William', 3, '2012-09-11', 'Dermatologist', 30000, NULL),
        ('107', 'Richard', 4, '2014-08-21', 'Garnacologist', 32000, NULL),
        ('108', 'Karen', 4, '2011-10-17', 'Radiologist', 30000, NULL),
        ('109', 'James', 1, '2022-01-15', 'Cardiologist', 45000, 5),
        ('110', 'Emily', 1, '2023-04-10', 'Orthopedic Surgeon', 50000, 3),
        ('111', 'Olivia', 2, '2021-09-05', 'Neurologist', 42000, 4),
        ('112', 'John', 2, '2024-02-18', 'Surgeon', 60000, 2),
        ('113', 'Sophia', 3, '2022-07-30', 'Urologist', 38000, 6),
        ('114', 'Daniel', 3, '2025-03-22', 'Pulmonologist', 47000, 1),
        ('115', 'Isabella', 4, '2023-11-01', 'Pediatrician', 41000, 3),
        ('116', 'Liam', 4, '2022-05-25', 'Dermatologist', 35000, 4),
        ('117', 'Mia', 1, '2024-06-17', 'Gastroenterologist', 53000, 2),
        ('118', 'Lucas', 2, '2023-01-12', 'Anesthesiologist', 46000, 3);

--Задание 2. Заполните таблицу "Doctor" данными о 5 новых врачах.

--Добавление новых данных
INSERT INTO Doctor (Doctor_Id, Doctor_Name, Hospital_Id, Joining_Date, Speciality, Salary, Experience)
        VALUES
            ('119', 'Anderson', 1, '2023-03-15', 'Neurosurgeon', 58000, 7),
            ('120', 'Wilson', 2, '2024-01-10', 'Cardiothoracic Surgeon', 62000, 5),
            ('121', 'Taylor', 3, '2022-11-20', 'Endocrinologist', 48000, 4),
            ('122', 'Martinez', 4, '2023-09-05', 'Ophthalmologist', 52000, 6),
            ('123', 'Robinson', 1, '2024-04-18', 'Psychiatrist', 45000, 3);

--Задание 3. Получите все записи из таблицы "Doctor", где зарплата > 30000.

--Запрос для получения врачей, у которых зарплата больше 30000

SELECT * FROM Doctor 
WHERE Salary > 30000

--Задание 4. Получите список всех врачей из больницы с ID=1.

--Выбираем врачей из больницы, у которой ID = 1
SELECT * FROM Doctor
WHERE Hospital_Id = 1;

--Задание 5. Используйте "Pandas" для агрегации зарплаты врачей по специальностям.

--SQL запрос для получения данных о врачах, содержащие специальности и зарплату

SELECT Speciality, Salary 
FROM Doctor;
