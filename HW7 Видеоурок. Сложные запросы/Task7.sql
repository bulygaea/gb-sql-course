-- task_1
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT name FROM users 
WHERE 
    users.id IN (SELECT DISTINCT user_id FROM orders);

-- task_2
-- Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT products.name, catalogs.name 
FROM products 
    LEFT JOIN catalogs 
    ON products.catalog_id = catalogs.id;

-- task_3
-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.
SELECT table_1.id, table_1.from, table_2.to 
FROM 
(SELECT `id`, cities.name AS `from` FROM flights LEFT JOIN cities ON flights.from = cities.label ORDER BY flights.id) AS table_1 
LEFT JOIN 
( SELECT `id`, cities.name AS `to` FROM flights LEFT JOIN cities ON flights.to = cities.label ORDER BY flights.id ) AS table_2 
ON table_1.id = table_2.id 
ORDER BY table_1.id;