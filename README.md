# pr_07
Цель: научиться импортировать и экспортировать данные в базу данных SQL. Работа включает в себя загрузку данных из внешних источников в таблицы базы данных, а также экспорт данных из базы данных в различные форматы. Студенты научатся работать с внешними данными, преобразовывать их в нужный формат и интегрировать с существующими таблицами в базе данных.
# ВАРИАНТ 3
# Задание 1. Создайте базу данных "hospital_db" и подключитесь к ней.
Заходим в VScode, добавляем новую строку с кодом и прописываем скрипт для подключения и создания новой базы данных "hospital_db", а также сразу для создания таблиц Hospital и Doctor для дальнейшей работы.
![image](https://github.com/user-attachments/assets/40662c33-f286-448d-a968-fb506643162e)
![image](https://github.com/user-attachments/assets/f8a622ba-fffd-409f-a144-545839af24f1)
![image](https://github.com/user-attachments/assets/09bed345-6f87-4d4a-9f29-7cee216a97f3)
![image](https://github.com/user-attachments/assets/7b207a84-c579-4c07-bf5d-0f69d1a2fadb)
После выполняем написанный ранее код и получаем результат, представленный ниже:
![image](https://github.com/user-attachments/assets/a804dac6-700a-4163-ba64-c8ac03447a99)
Так отображаются созданные таблицы в pgAdmin
![image](https://github.com/user-attachments/assets/50a7d56a-3c11-45df-8630-2012f6c25bdb)
![image](https://github.com/user-attachments/assets/441bf345-d04c-4b71-8ab4-53a9f08a10c4)
# Задание 2. Заполните таблицу "Doctor" данными о 5 новых врачах.
Создаем новую строку и прописываем код для добавления данных о пяти новых врачах.
![image](https://github.com/user-attachments/assets/8d2bafd2-f3bd-46b1-8666-6f672134d21d)
![image](https://github.com/user-attachments/assets/fec2cc24-997f-4ae9-88db-c8126f282497)
После выполнения получаем следующий результат:
![image](https://github.com/user-attachments/assets/3f145793-f600-4f43-abe8-7af9b9cd51cc)
# Задание 3. Получите все записи из таблицы "Doctor", где зарплата > 30000.
Составляем запрос для вывода всех врачей, у которых зарплата больше 30000.
![image](https://github.com/user-attachments/assets/48c8b17f-c75b-47c5-b814-90d001e824ec)
![image](https://github.com/user-attachments/assets/974ba362-8247-4fee-b43f-f3eefd21ab48)
Выполнив данный код, получаем следующий результат:
![image](https://github.com/user-attachments/assets/7eaa92a6-c19e-4076-bf87-6df1994d49b3)
# Задание 4. Получите список всех врачей из больницы с ID=1.
Пишем запрос для того чтобы получить список врачей, которые работают в больнице с id=1
![image](https://github.com/user-attachments/assets/308a5ef1-d0f1-4660-aa58-dc10384b482f)
![image](https://github.com/user-attachments/assets/e9f0dbdc-329e-448b-9e70-c652ad26879f)
После выполнения получаем нужный результат:
![image](https://github.com/user-attachments/assets/9487413e-dbf2-4c2d-93fc-1ba9ac70ea61)
# Задание 5. Используйте Pandas для агрегации зарплаты врачей по специальностям.
Произведем агрегацию зарплаты врачей по их специальностям используя Pandas - библиотеку для обработки и анализа данных.
![image](https://github.com/user-attachments/assets/46a9d95d-18d3-4fd0-a979-af8abf94c876)
![image](https://github.com/user-attachments/assets/282e7d31-d31e-45ac-9bd6-3555083c5df4)
Выполняем и получаем результат:
![image](https://github.com/user-attachments/assets/23e0cda6-7cac-4fa2-99cc-ed0ed2222953)
Вывод: в ходе данной работы мы научились импортировать и экспортировать данные в базу данных SQL, научились работать с внешними данными, преобразовывать их в нужный формат и интегрировать с существующими таблицами в базе данных.



