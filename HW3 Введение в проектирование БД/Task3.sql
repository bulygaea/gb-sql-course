-- task_1
-- Написать скрипт, добавляющий в БД vk 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
DROP TABLE IF EXISTS musicians;
CREATE TABLE musicians (
	id SERIAL,
	name VARCHAR(50),
	
	-- PRIMARY KEY (id)
);

DROP TABLE IF EXISTS audio;
CREATE TABLE audio (
	id SERIAL,
	name VARCHAR(50),
	
	-- PRIMARY KEY (id)
);

DROP TABLE IF EXISTS musician_audio;
CREATE TABLE musician_audio (
	audio_id BIGINT UNSIGNED NOT NULL,
	musician_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (audio_id) REFERENCES audio(id),
	FOREIGN KEY (musician_id) REFERENCES musicians(id)
);

DROP TABLE IF EXISTS users_audio;
CREATE TABLE users_audio (
	user_id BIGINT UNSIGNED NOT NULL,
	audio_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (audio_id) REFERENCES audio(id)
);