-- Предварительная версия курсового проекта

-- task_1
-- DDL-команды
CREATE DATABASE IF NOT EXISTS `SberDatabase`
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE `SberDatabase`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id` SERIAL PRIMARY KEY,
    `surname` VARCHAR(255) NOT NULL COMMENT 'Фамилия',
    `name` VARCHAR(255) NOT NULL COMMENT 'Имя',
    `patronymic` VARCHAR(255) COMMENT 'Отчество',
    `birthday_at` DATE NOT NULL COMMENT 'Дата рождения',
    `passport` BIGINT UNSIGNED UNIQUE NOT NULL COMMENT 'Серия и номер паспорта',
    `phone` BIGINT UNSIGNED UNIQUE NOT NULL COMMENT 'Номер телефона'

) COMMENT 'Пользователи';

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
    `id` SERIAL PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `currency` VARCHAR(255) NOT NULL COMMENT 'Валюта',
    `bik` BIGINT UNSIGNED UNIQUE NOT NULL COMMENT 'БИК',
    `korr_account` BIGINT UNSIGNED UNIQUE NOT NULL COMMENT 'Корр. счет',
    `inn` BIGINT UNSIGNED UNIQUE NOT NULL COMMENT 'ИНН',
    `kpp` BIGINT UNSIGNED UNIQUE NOT NULL COMMENT 'КПП',

    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)

) COMMENT 'Счета';

DROP TABLE IF EXISTS `payment_systems`;
CREATE TABLE `payment_systems` (
    `id` SERIAL PRIMARY KEY,
    `name` VARCHAR(255) UNIQUE NOT NULL COMMENT 'Название'

) COMMENT 'Платежные системы';

DROP TABLE IF EXISTS `types_of_cards`;
CREATE TABLE `types_of_cards` (
    `id` SERIAL PRIMARY KEY,
    `name` VARCHAR(255) UNIQUE NOT NULL COMMENT 'Название',
    `service_fee` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Плата за обслуживание'

) COMMENT 'Виды дебетовых карт';

DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
    `id` SERIAL PRIMARY KEY,
    `account_id` BIGINT UNSIGNED NOT NULL COMMENT 'Номер счета',
    `payment_system_id` BIGINT UNSIGNED NOT NULL COMMENT 'Платежная система',
    `type_of_card` BIGINT UNSIGNED NOT NULL COMMENT 'Вид карты',
    `card_number` BIGINT UNSIGNED UNIQUE NOT NULL COMMENT 'Номер карты',
    `CVV` INT UNSIGNED NOT NULL COMMENT 'CVV',
    `expiration_date` DATE NOT NULL COMMENT 'Срок действия',
    `balance` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Баланс',

    FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`),
    FOREIGN KEY (`payment_system_id`) REFERENCES `payment_systems`(`id`),
    FOREIGN KEY (`type_of_card`) REFERENCES `types_of_cards`(`id`)

) COMMENT 'Дебетовые карты';

DELIMITER //
DROP TRIGGER IF EXISTS `default_card_expiration_date`//
CREATE TRIGGER `default_card_expiration_date`
BEFORE INSERT ON `cards`
FOR EACH ROW
BEGIN
    SELECT DATE_SUB(DATE_FORMAT(DATE_ADD(CURRENT_DATE, INTERVAL 61 MONTH), '%Y-%m-01'), INTERVAL 1 DAY) INTO @expiration_dt;
    SET NEW.`expiration_date` = @expiration_dt;
END //
DELIMITER ;

DROP TABLE IF EXISTS `types_of_deposits`;
CREATE TABLE `types_of_deposits` (
    `id` SERIAL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL COMMENT 'Название',
    `description` TEXT NOT NULL COMMENT 'Описание',
    `percent` INT UNSIGNED NOT NULL COMMENT 'Начисляемый процент',
    `removable` BOOL NOT NULL COMMENT 'Частичное снятие',
    `refillable` BOOL NOT NULL COMMENT 'Пополнение',
    `minimal_period` INT UNSIGNED NOT NULL COMMENT 'Минимальный срок',
    `initial_balance` BIGINT NOT NULL COMMENT 'Минимальная сумма'

) COMMENT 'Виды вкладов';

DROP TABLE IF EXISTS `deposits`;
CREATE TABLE `deposits` (
    `id` SERIAL PRIMARY KEY,
    `account_id` BIGINT UNSIGNED NOT NULL COMMENT 'Номер счета',
    `type_of_deposit` BIGINT UNSIGNED NOT NULL COMMENT 'Вид вклада',
    `period` DATE NOT NULL COMMENT 'Срок вклада',
    `balance` BIGINT NOT NULL COMMENT 'Баланс',
    `capitalization` BIGINT NOT NULL DEFAULT 0 COMMENT 'Начисленные проценты',

    FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`),
    FOREIGN KEY (`type_of_deposit`) REFERENCES `types_of_deposits`(`id`)

) COMMENT 'Вклады';

DROP TABLE IF EXISTS `types_of_transactions`;
CREATE TABLE `types_of_transactions` (
    `id` SERIAL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL COMMENT 'Название'

) COMMENT 'Виды операций';

-- Заполняется при внесении записей в таблицы ниже
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
    `id` SERIAL PRIMARY KEY,
    `type_of_transaction` BIGINT UNSIGNED NOT NULL COMMENT 'Вид операции',
    `transaction_id` BIGINT UNSIGNED NOT NULL COMMENT 'Идентификатор операции',

    FOREIGN KEY (`type_of_transaction`) REFERENCES `types_of_transactions`(`id`)

) COMMENT 'История операций';

-- Заполняется с помощью функции
DROP TABLE IF EXISTS `capitalizations`;
CREATE TABLE `capitalizations` (
    `id` SERIAL PRIMARY KEY,
    `deposit_id` BIGINT UNSIGNED NOT NULL COMMENT 'Номер вклада',
    `creation_date` DATETIME DEFAULT NOW() COMMENT 'Дата и время операции',
    `money` BIGINT UNSIGNED NOT NULL COMMENT 'Сумма операции',

    FOREIGN KEY (`deposit_id`) REFERENCES `deposits`(`id`)

) COMMENT 'Операция капитализации вклада';

-- Заполняется во время выполнения транзакции
DROP TABLE IF EXISTS `remittances`;
CREATE TABLE `remittances` (
    `id` SERIAL PRIMARY KEY,
    `in_card` BIGINT UNSIGNED NOT NULL COMMENT 'Счет зачисления',
    `out_card` BIGINT UNSIGNED NOT NULL COMMENT 'Счет списания',
    `creation_date` DATETIME DEFAULT NOW() COMMENT 'Дата и время операции',
    `money` BIGINT UNSIGNED NOT NULL COMMENT 'Сумма операции',

    FOREIGN KEY (`in_card`) REFERENCES `cards`(`card_number`),
    FOREIGN KEY (`out_card`) REFERENCES `cards`(`card_number`)

) COMMENT 'Переводы';

-- Заполняется во время выполнения транзакции
DROP TABLE IF EXISTS `deposit_transactions`;
CREATE TABLE `deposit_transactions` (
    `id` SERIAL PRIMARY KEY,
    `card_id` BIGINT UNSIGNED NOT NULL COMMENT 'Счет зачисления',
    `deposit_id` BIGINT UNSIGNED NOT NULL COMMENT 'Счет списания',
    `creation_date` DATETIME DEFAULT NOW() COMMENT 'Дата и время операции',
    `money` BIGINT UNSIGNED NOT NULL COMMENT 'Сумма операции',

    FOREIGN KEY (`card_id`) REFERENCES `cards`(`card_number`),
    FOREIGN KEY (`deposit_id`) REFERENCES `deposits`(`id`)

) COMMENT 'Финансовые операции со вкладом';

-- Заполняется с помощью функции
DROP TABLE IF EXISTS `payments_for_service`;
CREATE TABLE `payments_for_service` (
    `id` SERIAL PRIMARY KEY,
    `card_id` BIGINT UNSIGNED NOT NULL COMMENT 'Номер карты',
    `creation_date` DATETIME DEFAULT NOW() COMMENT 'Дата и время операции',
    `money` BIGINT UNSIGNED NOT NULL COMMENT 'Сумма операции',

    FOREIGN KEY (`card_id`) REFERENCES `cards`(`card_number`)

) COMMENT 'Операция платы за обслуживание';

-- Заполняется во время выполнения транзакции
DROP TABLE IF EXISTS `cash_turnover`;
CREATE TABLE `cash_turnover` (
    `id` SERIAL PRIMARY KEY,
    `card_id` BIGINT UNSIGNED NOT NULL COMMENT 'Номер карты',
    `creation_date` DATETIME DEFAULT NOW() COMMENT 'Дата и время операции',
    `money` BIGINT NOT NULL COMMENT 'Сумма операции',
    `NFC` BOOL NOT NULL COMMENT 'Использование NFC',
    `address` VARCHAR(255) NOT NULL COMMENT 'Адрес проведения операции',

    FOREIGN KEY (`card_id`) REFERENCES `cards`(`card_number`)

) COMMENT 'Выдача/внесение наличных';

DROP TABLE IF EXISTS `retail_outlets`;
CREATE TABLE `retail_outlets` (
    `id` SERIAL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL COMMENT 'Название'

) COMMENT 'Торговые точки';

-- Заполняется во время выполнения транзакции
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
    `id` SERIAL PRIMARY KEY,
    `retail_outlet_id` BIGINT UNSIGNED NOT NULL COMMENT 'Торговая точка',
    `card_id` BIGINT UNSIGNED NOT NULL COMMENT 'Номер карты',
    `creation_date` DATETIME DEFAULT NOW() COMMENT 'Дата и время операции',
    `money` BIGINT NOT NULL COMMENT 'Сумма операции',

    FOREIGN KEY (`card_id`) REFERENCES `cards`(`card_number`),
    FOREIGN KEY (`retail_outlet_id`) REFERENCES `retail_outlets`(`id`)

) COMMENT 'Оплата товаров и услуг';
