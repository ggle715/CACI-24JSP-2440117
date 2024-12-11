CREATE DATABASE IF NOT EXISTS wave
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE wave;

CREATE TABLE IF NOT EXISTS user(
    id VARCHAR(128) PRIMARY KEY,
    jsonstr VARCHAR(1024)
);

CREATE TABLE IF NOT EXISTS feed(
    no INT UNSIGNED PRIMARY KEY,
    id VARCHAR(128),
    jsonstr VARCHAR(8192)
);

CREATE TABLE IF NOT EXISTS friend(
    id VARCHAR(128),
    frid VARCHAR(128),
    INDEX idx1(id)
);

CREATE TABLE IF NOT EXISTS board (
    no INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    author VARCHAR(128),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    view_count INT DEFAULT 0,
    FOREIGN KEY (author) REFERENCES user(id)
);
