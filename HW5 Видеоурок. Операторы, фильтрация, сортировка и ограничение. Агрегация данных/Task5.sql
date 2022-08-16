-- task_1_1
-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
UPDATE users SET created_at = NOW(), updated_at = NOW();

-- task_1_2
-- Таблица users была неудачно спроектирована.
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате
-- "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введенные ранее значения.
SELECT * FROM users;

ALTER TABLE users ADD new_created_at DATETIME;
UPDATE users SET new_created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i');
ALTER TABLE users DROP created_at;
ALTER TABLE users CHANGE new_created_at created_at DATETIME;

SELECT * FROM users;

-- task_1_3
-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
-- 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.
SELECT value FROM storehouses_products;
SELECT value FROM storehouses_products ORDER BY IF (value = 0, 1, 0), value;

-- task_2_1
-- Подсчитайте средний возраст пользователей в таблице users
SELECT ROUND(AVG(YEAR(NOW())-YEAR(birthday_at)), 0) AS average_age FROM users;

-- task_2_2
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
ALTER TABLE users ADD dayname VARCHAR(255);
UPDATE users SET dayname = DAYNAME(DATE_FORMAT(birthday_at, '2022-%m-%d'));

SELECT * FROM users;
SELECT dayname, COUNT(dayname) FROM users GROUP BY dayname ORDER BY COUNT(dayname) DESC;
