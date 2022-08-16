-- task_1
-- Пусть задан некоторый пользователь.
-- Из всех пользователей соц. сети найдите человека,
-- который больше всех общался с выбранным пользователем (написал ему сообщений).
SELECT DISTINCT from_user_id FROM messages 
WHERE 
    from_user_id = 
        (SELECT from_user_id FROM messages GROUP BY from_user_id, to_user_id 
        HAVING to_user_id = 1560 AND COUNT(from_user_id) = 
            (SELECT COUNT(from_user_id) FROM messages GROUP BY from_user_id, to_user_id 
            HAVING to_user_id = 1560 ORDER BY COUNT(from_user_id) DESC LIMIT 1));

-- task_2
-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
SELECT COUNT(likes.media_id) AS `Summary_of_likes`
FROM likes 
WHERE likes.media_id IN
    ( SELECT media.id 
    FROM media
    WHERE media.user_id IN 
        ( SELECT profiles.user_id 
        FROM profiles 
        WHERE DATE(NOW()) - INTERVAL 10 YEAR < profiles.birthday ) );

-- task_3
-- Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT 
   ( SELECT COUNT(user_id) 
    FROM likes 
    WHERE user_id IN 
        ( SELECT user_id 
        FROM profiles 
        WHERE gender = 'f' ) ) AS female, 
    ( SELECT COUNT(user_id) 
    FROM likes 
    WHERE user_id IN 
        ( SELECT user_id 
        FROM profiles 
        WHERE gender = 'm' ) ) AS male;

