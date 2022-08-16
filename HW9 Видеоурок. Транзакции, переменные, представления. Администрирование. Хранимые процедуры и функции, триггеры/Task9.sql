-- task_1_1
-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
START TRANSACTION;
INSERT INTO sample.users 
    SELECT * FROM shop.users 
    WHERE shop.users.id = 1;
DELETE FROM shop.users WHERE shop.users.id = 1;
COMMIT;

-- task_1_2
-- Создайте представление, которое выводит название name товарной позиции из таблицы products и
-- соответствующее название каталога name из таблицы catalogs.
CREATE OR REPLACE VIEW products_catalogs (product_name, catalog_name) 
AS SELECT products.name, catalogs.name 
    FROM products 
    LEFT JOIN catalogs
    ON products.catalog_id = catalogs.id;

-- task_2_1
-- Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть
-- доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.
USE shop;
CREATE USER shop_read;
GRANT SELECT ON shop.* TO shop_read;
CREATE USER shop;
GRANT ALL ON shop.* TO shop;

-- task_3_1
-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DELIMITER //
DROP FUNCTION IF EXISTS hello //
CREATE FUNCTION hello()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE time TIME DEFAULT DATE_FORMAT(NOW(), '%H:%i');
    CASE
    WHEN (TIME_FORMAT('06:00', '%H:%i') <= time < TIME_FORMAT('12:00', '%H:%i')) THEN
        RETURN 'Доброе утро';
    WHEN (TIME_FORMAT('12:00', '%H:%i') <= time < TIME_FORMAT('18:00', '%H:%i')) THEN
        RETURN 'Добрый день';
    WHEN (TIME_FORMAT('18:00', '%H:%i') <= time < TIME_FORMAT('00:00', '%H:%i')) THEN
        RETURN 'Добрый вечер';
    WHEN (TIME_FORMAT('00:00', '%H:%i') <= time < TIME_FORMAT('06:00', '%H:%i')) THEN
        RETURN 'Доброй ночи';
    END CASE;
END //

-- task_3_2
-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них.
-- Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.
DROP TRIGGER IF EXISTS check_update_null //
CREATE TRIGGER check_update_null BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF OLD.name IS NULL AND NEW.description IS NULL
        OR NEW.name IS NULL AND OLD.description IS NULL
        OR NEW.name IS NULL AND NEW.description IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "`name` and `description` can't be NULL at the same time";
    END IF;
END //

DROP TRIGGER IF EXISTS check_insert_null //
CREATE TRIGGER check_insert_null BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF NEW.name IS NULL AND NEW.description IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "`name` and `description` can't be NULL at the same time";
    END IF;
END //
