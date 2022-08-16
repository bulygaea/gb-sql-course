-- task_1
-- Пусть задан некоторый пользователь.
-- Из всех пользователей соц. сети найдите человека,
-- который больше всех общался с выбранным пользователем (написал ему сообщений).
SELECT Name FROM 
( SELECT CONCAT(users.lastname, ' ', users.firstname) AS Name 
    FROM messages 
    LEFT JOIN users 
    ON messages.from_user_id = users.id 
    WHERE messages.to_user_id = 1560 ) AS tbl 
GROUP BY Name 
ORDER BY COUNT(Name) DESC 
LIMIT 1;

-- task_2
-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
SELECT SUM(likes_users.count_likes) AS `Summary_of_likes` 
FROM profiles 
LEFT JOIN 
    ( SELECT media.user_id, media_likes.count_likes 
    FROM 
        ( SELECT media_id, COUNT(user_id) AS count_likes 
        FROM likes GROUP BY media_id ORDER BY COUNT(user_id) DESC ) AS media_likes 
    LEFT JOIN media 
    ON media.id = media_likes.media_id ) AS likes_users 
ON likes_users.user_id = profiles.user_id 
WHERE DATE(NOW()) - INTERVAL 10 YEAR < profiles.birthday;

SELECT profiles.user_id FROM profiles WHERE DATE(NOW()) - INTERVAL 10 YEAR < profiles.birthday;

-- task_3
-- Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT profiles.gender, COUNT(profiles.gender) AS count_likes 
FROM likes 
LEFT JOIN profiles 
ON likes.user_id = profiles.user_id  
GROUP BY gender 
ORDER BY count_likes DESC;