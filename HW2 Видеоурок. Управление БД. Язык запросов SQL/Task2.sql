-- task_2
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

SELECT * FROM mysql.users;