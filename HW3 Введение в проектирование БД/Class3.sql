-- Работа на вебинаре
CREATE DATABASE IF NOT EXISTS vk
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE vk;

CREATE TABLE users (
	id SERIAL,
	firstname VARCHAR(50) COMMENT 'Имя' NOT NULL,
	lastname VARCHAR(50) COMMENT 'Фамилия' NOT NULL,
	email VARCHAR(120) UNIQUE,
	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE,
	
	index users_firstname_lastname_idx(firstname, lastname)
) COMMENT 'Пользователи';

CREATE TABLE profiles (
	user_id SERIAL,
	gender CHAR(1),
	birthday DATE,
	photo_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	hometown VARCHAR(50)
);

ALTER TABLE profiles ADD CONSTRAINT fk_user_id
FOREIGN KEY(user_id) REFERENCES users(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

CREATE TABLE messages (
	id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)
);

CREATE TABLE friend_request (
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	status ENUM('requested', 'approved', 'declined', 'unfriended'),
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY (initiator_user_id, target_user_id),
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id)
);

CREATE TABLE communities (
	id SERIAL,
	name VARCHAR(50),
	admin_user_id BIGINT UNSIGNED NOT NULL,
	
	index communities_name_idx(name),
	FOREIGN KEY (admin_user_id) REFERENCES users(id)
);

CREATE TABLE users_communities (
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (user_id, community_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (community_id) REFERENCES communities(id)
);

CREATE TABLE media_types (
	id SERIAL,
	name VARCHAR(20),
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE media (
	id SERIAL,
	media_type_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	filename VARCHAR(255),
	media_size INT,
	metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);

CREATE TABLE likes (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW()
);

CREATE TABLE photo_albums (
	id SERIAL,
	name VARCHAR(100),
	user_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE photos (
	id SERIAL,
	photo_album_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (photo_album_id) REFERENCES photo_albums(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);
