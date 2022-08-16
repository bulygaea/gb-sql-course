-- task_1_1
-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products
-- в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа и содержимое поля name.
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
    id SERIAL,
    table_name VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW()
) ENGINE=ARCHIVE;

DELIMITER //
DROP TRIGGER IF EXISTS insert_into_users //
CREATE TRIGGER insert_into_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, name) VALUES ('users', NEW.name);
END //

DROP TRIGGER IF EXISTS insert_into_products //
CREATE TRIGGER insert_into_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, name) VALUES ('products', NEW.name);
END //

DROP TRIGGER IF EXISTS insert_into_catalogs //
CREATE TRIGGER insert_into_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, name) VALUES ('catalogs', NEW.name);
END //
