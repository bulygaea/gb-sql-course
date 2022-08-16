-- task_2
-- Дамп БД (наполнение таблиц данными), можно пользоваться генераторами данных.
INSERT INTO `users` (`id`, `surname`, `name`, `patronymic`, `birthday_at`, `passport`, `phone`) VALUES
    (1001, 'Григорьев', 'Егор', 'Львович', '1988-09-16', '8141632463', '70686825877'),
    (1002, 'Николаева', 'София', 'Егоровна', '2007-08-10', '9254963741', '77005816892'),
    (1003, 'Морозов', 'Максим', 'Артемьевич', '1977-05-01', '9665584463', '72447851910'),
    (1004, 'Михайлова', 'Софья', 'Артемовна', '1971-05-24', '4719688424', '78747282322'),
    (1005, 'Мельникова', 'Екатерина', 'Романовна', '1998-03-23', '1198152222', '74534179935'),
    (1006, 'Волков', 'Григорий', 'Михайлович', '1985-10-10', '5288425315', '74576244992'),
    (1007, 'Лазарев', 'Мирослав', 'Тихонович', '1975-11-10', '3245906119', '70820335928'),
    (1008, 'Дубровин', 'Макар', 'Адамович', '1997-03-20', '6536728832', '73463017584'),
    (1009, 'Леонтьева', 'Елизавета', 'Петровна', '1978-10-28', '2543791757', '73464657584');

INSERT INTO `accounts` (`id`, `user_id`, `currency`, `bik`, `korr_account`, `inn`, `kpp`) VALUES
    (1, 1001, 'RUB', 591731039, 346706729259860992, 1404612055, 260765666),
    (2, 1002, 'RUB', 567592410, 776627963145124192, 7693145261, 614293120),
    (3, 1003, 'RUB', 824449147, 352748740687090688, 1258368255, 682661582),
    (4, 1004, 'RUB', 196242436, 227536073608902656, 5104831302, 571539492),
    (5, 1005, 'RUB', 715100225, 184958250330902528, 1264561546, 604749868),
    (6, 1006, 'RUB', 105239847, 413554577544376321, 9748776026, 283810052),
    (7, 1007, 'RUB', 929291628, 776627963145224192, 7059468784, 118882167),
    (8, 1008, 'RUB', 499891421, 767708826257377280, 8400231192, 712134374),
    (9, 1009, 'RUB', 564491538, 224519537363562496, 4163270577, 961499602),
    (10, 1001, 'RUB', 184743352, 776627963145924192, 9920565600, 579837625),
    (11, 1002, 'RUB', 292601058, 481120053472307200, 9411145356, 932626750),
    (12, 1002, 'RUB', 246421530, 524734098810322944, 7750790048, 500106076),
    (13, 1003, 'RUB', 985510713, 548534998839915520, 7681555595, 924725342),
    (14, 1003, 'RUB', 996388490, 145996352135976967, 5751759279, 595750776),
    (15, 1004, 'RUB', 125499342, 774970428740290568, 4425790645, 339362742),
    (16, 1004, 'RUB', 894654555, 534367697934728192, 6167889821, 784008799),
    (17, 1004, 'RUB', 844284389, 758139909173454848, 7958829463, 985457131),
    (18, 1005, 'RUB', 915962263, 276832715666973696, 1555084199, 180277873),
    (19, 1005, 'RUB', 182023823, 715698208383594496, 8033117404, 962073087);

INSERT INTO `payment_systems` VALUES 
    (1, 'Maestro'),
    (2, 'МИР'),
    (3, 'MasterCard'),
    (4, 'VISA');

INSERT INTO `types_of_cards` (`id`, `name`, `service_fee`) VALUES
    (1, 'СберКарта Мир для пособий и пенсии', 0),
    (2, 'Детская СберКарта', 0),
    (3, 'СберКарта для иностранцев', 150),
    (4, 'Премиальная карта аэрофлота', 1000),
    (5, 'Классическая карта Подари жизнь', 40),
    (6, 'Золотая карта Подари жизнь', 300),
    (7, 'Платиновая карта Подари жизнь', 850),
    (8, 'Карта болельщика ЦСКА', 60),
    (9, 'СберКарта Тревел', 200),
    (10, 'Молодежная карта СберКарта', 40),
    (11, 'СберКарта', 150);

INSERT INTO `cards` (`id`, `account_id`, `payment_system_id`, `type_of_card`, `card_number`, `CVV`) VALUES
    (1, 1, 4, 11, 4858443003042444, 513),
    (2, 10, 2, 5, 4325492597540086, 395),
    (3, 2, 4, 10, 4788927954158345, 929),
    (4, 11, 2, 11, 4404394795473009, 329),
    (5, 3, 2, 1, 4712227257286898, 415),
    (6, 4, 2, 1, 4111194292302436, 831),
    (7, 5, 3, 4, 5582651815776708, 132),
    (8, 18, 4, 9, 4308268238089647, 177),
    (9, 19, 2, 10, 5481196642315710, 181),
    (10, 6, 1, 7, 6011008321403328, 392),
    (11, 7, 2, 1, 5222830188437785, 503),
    (12, 8, 3, 8, 5577386779412118, 266),
    (13, 9, 4, 7, 4976693980888907, 432);

INSERT INTO `types_of_deposits` (`id`, `name`, `description`, `percent`, `removable`, `refillable`, `minimal_period`, `initial_balance`) VALUES
    (1, 'Управляй+', 'Пополняйте и снимайте деньги до неснижаемого остатка в любое время, проценты при этом сохранятся. Начисленные проценты можно снять или перечислить на карту. Если оставлять проценты на вкладе, то каждый месяц они прибавляются к общей сумме и увеличивают доход в следующих периодах.', 5.02, TRUE, TRUE, 3, 30000),
    (2, 'Накопительный счет', 'Копите и свободно распоряжайтесь деньгами — ежемесячное начисление процентов, возможность пополнять и снимать без ограничений. Для новых пользователей повышенная ставка.', 7, TRUE, TRUE, 0, 0),
    (3, 'Вклад Подари жизнь', 'Возможность помочь детям с тяжёлыми заболеваниями', 3.44, FALSE, FALSE, 12, 10000);

INSERT INTO `deposits` (`id`, `account_id`, `type_of_deposit`, `period`, `balance`) VALUES
    (1, 12, 2, CURRENT_DATE + INTERVAL 3 MONTH, 0),
    (2, 13, 3, CURRENT_DATE + INTERVAL 24 MONTH, 10000),
    (3, 14, 1, CURRENT_DATE + INTERVAL 12 MONTH, 30000),
    (4, 15, 3, CURRENT_DATE + INTERVAL 36 MONTH, 25000),
    (5, 16, 1, CURRENT_DATE + INTERVAL 3 MONTH, 15000),
    (6, 17, 2, CURRENT_DATE + INTERVAL 1 MONTH, 5000);

INSERT INTO `types_of_transactions` (`id`, `name`) VALUES
    (1, 'Операция капитализации вклада'),
    (2, 'Переводы'),
    (3, 'Финансовые операции со вкладом'),
    (4, 'Операция платы за обслуживание'),
    (5, 'Выдача/внесение наличных'),
    (6, 'Оплата товаров и услуг');

INSERT INTO `retail_outlets` (`id`, `name`) VALUES
    (1, 'Пятерочка'),
    (2, 'Лента'),
    (3, 'Магнит'),
    (4, 'Перекресток'),
    (5, 'Дикси');
