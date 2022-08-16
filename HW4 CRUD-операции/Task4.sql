-- task_2
-- Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT DISTINCT `firstname` FROM `users` ORDER BY `firstname`;

-- task_3
-- Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false).
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
ALTER TABLE `profiles` ADD COLUMN `is_active` BOOL NOT NULL DEFAULT TRUE;

UPDATE `profiles`
SET `is_active` = DATE(NOW()) - INTERVAL 18 YEAR > `birthday`;

-- task_4
-- Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
DELETE FROM `messages`
WHERE `created_at` > NOW();