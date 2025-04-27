# pr_07
# Практическая работа 7. Импорт и экспорт данных в SQL. Работа с внешними источниками данных
Цель: научиться импортировать и экспортировать данные в базу данных SQL. Работа включает в себя загрузку данных из внешних источников в таблицы базы данных, а также экспорт данных из базы данных в различные форматы. Студенты научатся работать с внешними данными, преобразовывать их в нужный формат и интегрировать с существующими таблицами в базе данных.
## Задачи:
1. Создание ERD диаграммы для базы данных.
2. Разработка SQL-скриптов для создания базы данных и таблиц.
3. Реализация заданий в Jupyter Notebook с подключением к базе данных, вставкой и обновлением данных, а также визуализацией информации.

## Индивидуальные задания, вариант 3:
1. Создайте базу данных "hospital_db" и подключитесь к ней.
2. Заполните таблицу "Doctor" данными о 5 новых врачах.
3. Получите все записи из таблицы "Doctor", где зарплата > 30000.
4. Получите список всех врачей из больницы с ID=1.
5. Используйте Pandas для агрегации зарплаты врачей по специальностям.
## Выполнение работы
Перед тем как приступить к выполнению задания, установим библиотеку psycopg2 для дальнейшей работы:
````
%pip install psycopg2
````
Теперь импортируем библиотеку psycopg2 для работы с PostgreSQL и класс Error для обработки ошибок при подключении к базе данных.
````
import psycopg2
from psycopg2 import Error
````
## Задание 1. Создайте базу данных "hospital_db" и подключитесь к ней.
Заходим в VScode, добавляем новую строку с кодом и прописываем скрипт для подключения и создания новой базы данных "hospital_db", а также сразу для создания таблиц Hospital и Doctor для дальнейшей работы и выполнения нужных заданий, предворительно подключившись к БД.
````
import psycopg2

def get_connection(database_name):
    
    connection = psycopg2.connect(user="postgres",
                                  password="26102006",
                                  host="localhost",
                                  port="5432",
                                  database=database_name)
    return connection

def close_connection(connection):
   
    if connection:
        connection.close()
        print("Соединение с PostgreSQL закрыто")

try:
   
    connection = psycopg2.connect(user="postgres",
                                  password="26102006",
                                  host="localhost",
                                  port="5432",
                                  database="pr_7")
    connection.autocommit = True  
    cursor = connection.cursor()

  
    cursor.execute("CREATE DATABASE hospital_db;")
    print("База данных 'hospital_db' успешно создана")

    
    close_connection(connection)

    
    connection = get_connection("hospital_db")
    cursor = connection.cursor()

    # Создание таблицы Hospital
    create_table_query = '''
    CREATE TABLE Hospital (
        Hospital_Id serial NOT NULL PRIMARY KEY,
        Hospital_Name VARCHAR (100) NOT NULL,
        Bed_Count serial
    );
    '''
    cursor.execute(create_table_query)
    connection.commit()
    print("Таблица 'Hospital' успешно создана")

    # Вставка данных в таблицу
    insert_query = '''
    INSERT INTO Hospital (Hospital_Id, Hospital_Name, Bed_Count)
    VALUES
    (1, 'Mayo Clinic', 200),
    (2, 'Cleveland Clinic', 400),
    (3, 'Johns Hopkins', 1000),
    (4, 'UCLA Medical Center', 1500);
    '''
    cursor.execute(insert_query)
    connection.commit()
    print("Данные успешно вставлены в таблицу 'Hospital'")

    # Создание таблицы Doctor
    create_table_query = '''
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
    '''
    cursor.execute(create_table_query)
    connection.commit()
    print("Таблица 'Doctor' успешно создана")

    # Вставка данных в таблицу Doctor
    insert_query = '''
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
    '''
    cursor.execute(insert_query)
    connection.commit()
    print("Данные успешно вставлены в таблицу 'Doctor'")

except (Exception, psycopg2.Error) as error:
    print("Ошибка при подключении или работе с PostgreSQL:", error)

finally:
    
    if connection:
        close_connection(connection)
````
После выполняем написанный ранее код и получаем результат, представленный ниже:
![image](https://github.com/user-attachments/assets/a804dac6-700a-4163-ba64-c8ac03447a99)

Так отображаются созданные таблицы в pgAdmin
![image](https://github.com/user-attachments/assets/50a7d56a-3c11-45df-8630-2012f6c25bdb)
![image](https://github.com/user-attachments/assets/441bf345-d04c-4b71-8ab4-53a9f08a10c4)

## Задание 2. Заполните таблицу "Doctor" данными о 5 новых врачах.
Чтобы выполнить задание создаем новую строку и прописываем код для добавления данных о пяти новых врачах, добавляя их уже в созданную ранее таблицу.
````
def add_new_doctors():
    try:
        
        connection = psycopg2.connect(user="postgres",
                                      password="26102006",
                                      host="localhost",
                                      port="5432",
                                      database="hospital_db"
                                    )
        cursor = connection.cursor()

        
        insert_query = '''
        INSERT INTO Doctor (Doctor_Id, Doctor_Name, Hospital_Id, Joining_Date, Speciality, Salary, Experience)
        VALUES
            ('119', 'Anderson', 1, '2023-03-15', 'Neurosurgeon', 58000, 7),
            ('120', 'Wilson', 2, '2024-01-10', 'Cardiothoracic Surgeon', 62000, 5),
            ('121', 'Taylor', 3, '2022-11-20', 'Endocrinologist', 48000, 4),
            ('122', 'Martinez', 4, '2023-09-05', 'Ophthalmologist', 52000, 6),
            ('123', 'Robinson', 1, '2024-04-18', 'Psychiatrist', 45000, 3);
        '''
        cursor.execute(insert_query)
        connection.commit()
        print("5 новых врачей успешно добавлены в таблицу 'Doctor'")

    except psycopg2.Error as error:
        print("Ошибка при работе с PostgreSQL:", error)
        if connection:
            connection.rollback()
    finally:
        
        if connection:
            cursor.close()
            connection.close()
            print("Соединение с PostgreSQL закрыто")

add_new_doctors()
````
После выполнения получаем следующий результат:
![image](https://github.com/user-attachments/assets/3f145793-f600-4f43-abe8-7af9b9cd51cc)
## Задание 3. Получите все записи из таблицы "Doctor", где зарплата > 30000.
Составляем запрос для вывода всех врачей, у которых зарплата больше 30000.
````
import psycopg2

def get_connection(database_name):
    connection = psycopg2.connect(user="postgres",
                                  password="26102006",
                                  host="localhost",
                                  port="5432",
                                  database=database_name)
    return connection

def close_connection(connection):
    if connection:
        connection.close()
        print("Соединение с PostgreSQL закрыто")

def get_doctors_with_high_salary():
    try:
        database_name = 'hospital_db'
        connection = get_connection(database_name)
        cursor = connection.cursor()

        # Пишем SQL-запрос для получения врачей, у которых зарплата больше 30000
        select_query = """
        SELECT * FROM Doctor 
        WHERE Salary > 30000
        """
        cursor.execute(select_query)
        records = cursor.fetchall()

        # Проверяем и выводим результаты
        print("\nСписок врачей с зарплатой больше 30000:\n")
        if records:
            for row in records:
                print("ID врача:", row[0])
                print("Имя врача:", row[1])
                print("ID больницы:", row[2])
                print("Дата начала работы:", row[3])
                print("Специальность:", row[4])
                print("Зарплата:", row[5])
                print("Опыт:", row[6], "\n")
        else:
            print("Врачи с зарплатой больше 30000 не найдены.")

        close_connection(connection)
    except (Exception, psycopg2.Error) as error:
        print("Ошибка при получении данных:", error)

print("Упражнение. Получение списка врачей с зарплатой больше 30000\n")
get_doctors_with_high_salary()
````
Выполнив данный код, получаем следующий результат:
![image](https://github.com/user-attachments/assets/7eaa92a6-c19e-4076-bf87-6df1994d49b3)
## Задание 4. Получите список всех врачей из больницы с ID=1.
Пишем запрос для того чтобы получить список врачей, которые работают в больнице с id=1
````
import psycopg2

def get_connection(database_name):
    connection = psycopg2.connect(user="postgres",
                                  password="26102006",
                                  host="localhost",
                                  port="5432",
                                  database=database_name)
    return connection

def close_connection(connection):
    if connection:
        connection.close()
        print("Соединение с PostgreSQL закрыто")

def get_hospital_1_doctors():
    try:
       
        connection = psycopg2.connect(user="postgres",
                                      password="26102006",
                                      host="localhost",
                                      port="5432",
                                      database="hospital_db"
                                    )
        cursor = connection.cursor()

        # Выбираем врачей из больницы, у которой ID = 1
        select_query = '''
        SELECT * FROM Doctor
        WHERE Hospital_Id = 1;
        '''
        
        cursor.execute(select_query)
        doctors = cursor.fetchall()

        
        print("\nВрачи из больницы с ID 1")
        print("-" * 50)
        for doctor in doctors:
           print(f"ID: {doctor[0]}")
           print(f"Имя: {doctor[1]}")
           print(f"Больница ID: {doctor[2]}")
           print(f"Дата приема: {doctor[3]}")
           print(f"Специальность: {doctor[4]}")
           print(f"Зарплата: ${doctor[5]}")
           print(f"Опыт: {doctor[6] or 'Не указан'} лет")
           print("-" * 50)
        return doctors

    except psycopg2.Error as error:
        print("Ошибка при работе с PostgreSQL:", error)
    finally:
        
        if connection:
            cursor.close()
            connection.close()
            print("\nСоединение с PostgreSQL закрыто")

get_hospital_1_doctors()
````
После выполнения получаем нужный результат:
![image](https://github.com/user-attachments/assets/9487413e-dbf2-4c2d-93fc-1ba9ac70ea61)
# Задание 5. Используйте Pandas для агрегации зарплаты врачей по специальностям.
Произведем агрегацию зарплаты врачей по их специальностям используя Pandas - библиотеку для обработки и анализа данных.
````
import psycopg2
import pandas as pd

def get_connection(database_name):
    connection = psycopg2.connect(user="postgres",
                                  password="26102006",
                                  host="localhost",
                                  port="5432",
                                  database=database_name)
    return connection

def close_connection(connection):
    if connection:
        connection.close()
        print("Соединение с PostgreSQL закрыто")

def aggregate_salary_by_speciality():
    try:
        database_name = 'hospital_db'
        connection = get_connection(database_name)
        cursor = connection.cursor()

        # Пишем SQL запрос для получения данных о врачах, содержащие специальности и зарплату
        select_query = """
        SELECT Speciality, Salary 
        FROM Doctor
        """
        cursor.execute(select_query)

        # Загружаем наши результаты в DataFrame
        records = cursor.fetchall()
        df = pd.DataFrame(records, columns=['Speciality', 'Salary'])

        # Теперь группируем данные по специальности и суммируем зарплату в каждой специальности
        salary_aggregation = df.groupby('Speciality').agg({'Salary': 'sum'}).reset_index()

        # Выводим результат
        print("\nАгрегация зарплаты врачей по специальностям:\n")
        print(salary_aggregation)

      
        close_connection(connection)
    except (Exception, psycopg2.Error) as error:
        print("Ошибка при получении данных:", error)


print("Упражнение. Агрегация зарплаты врачей по специальностям\n")
aggregate_salary_by_speciality()
````
Выполняем и получаем результат:

![image](https://github.com/user-attachments/assets/23e0cda6-7cac-4fa2-99cc-ed0ed2222953)

## Вывод: 
в ходе данной работы мы научились импортировать и экспортировать данные в базу данных SQL, научились работать с внешними данными, преобразовывать их в нужный формат и интегрировать с существующими таблицами в базе данных.

## Структура репозитория:
- `erd_diagram.png` — ERD диаграмма схемы базы данных.
- `create_db_and_tables.sql` — SQL скрипт для создания базы данных и таблиц.
- `Budyanskaya_Evgeniya_Vladimirovna.ipynb` — Jupyter Notebook с выполнением всех заданий.

## Как запустить:
1. Установите PostgreSQL и настройте доступ к базе данных.
2. Выполните SQL-скрипт `create_db_and_tables.sql` для создания базы данных и таблиц.
3. Откройте и выполните Jupyter Notebook для проверки выполнения заданий.



