# Create schemas
DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube CHARACTER SET utf8mb4;
USE youtube;

# Create tables
CREATE TABLE users
(
    id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    birth DATE,
    gender ENUM('male', 'female', 'other') NOT NULL,
    country VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10),
    PRIMARY KEY(id)
);

CREATE TABLE videos
(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    channel_id INT UNSIGNED,
    date DATETIME NOT NULL,
    title VARCHAR(50) NOT NULL,
    description TEXT,
    size DOUBLE NOT NULL,
    file_name VARCHAR(50) NOT NULL,
    duration TIME NOT NULL,
    thumbnail VARCHAR(100),
    reproductions INT NOT NULL,
    likes INT NOT NULL,
    dislikes INT NOT NULL,
    state ENUM('public', 'hidden', 'private') NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE channels
(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    creation_date DATETIME NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE subscriptions
(
    user_id INT UNSIGNED NOT NULL,
    channel_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(user_id, channel_id)
);

CREATE TABLE tags
(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE video_tags
(
    video_id INT UNSIGNED NOT NULL,
    tag_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(video_id, tag_id)
);

CREATE TABLE video_likes
(
    video_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY(video_id, user_id)
);

CREATE TABLE video_dislikes
(
    video_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL UNIQUE,
    date DATETIME NOT NULL,
    PRIMARY KEY(video_id, user_id)
);

CREATE TABLE playlists
(
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    creation_date DATETIME NOT NULL,
    state ENUM('public','private') NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE playlist_videos
(
    playlist_id INT UNSIGNED NOT NULL,
    video_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(playlist_id, video_id)
);

CREATE TABLE comments
(
    id INT UNSIGNED AUTO_INCREMENT,
    video_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    text TEXT NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE comment_likes
(
    comment_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY(comment_id, user_id)
);

CREATE TABLE comment_dislikes
(
    comment_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY(comment_id, user_id)
);

# Create FKs
ALTER TABLE channels
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;

ALTER TABLE videos
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;
    
ALTER TABLE subscriptions
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;

ALTER TABLE subscriptions
    ADD    FOREIGN KEY (channel_id)
    REFERENCES channels(id)
;
    
ALTER TABLE video_tags
    ADD    FOREIGN KEY (video_id)
    REFERENCES videos(id)
;
    
ALTER TABLE video_tags
    ADD    FOREIGN KEY (tag_id)
    REFERENCES tags(id)
;
    
ALTER TABLE video_likes
    ADD    FOREIGN KEY (video_id)
    REFERENCES videos(id)
;
    
ALTER TABLE video_likes
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;
    
ALTER TABLE video_dislikes
    ADD    FOREIGN KEY (video_id)
    REFERENCES videos(id)
;
    
ALTER TABLE video_dislikes
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;

ALTER TABLE playlists
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;

ALTER TABLE playlist_videos
    ADD    FOREIGN KEY (playlist_id)
    REFERENCES playlists(id)
;
    
ALTER TABLE playlist_videos
    ADD    FOREIGN KEY (video_id)
    REFERENCES videos(id)
;
    
ALTER TABLE comments
    ADD    FOREIGN KEY (video_id)
    REFERENCES videos(id)
;
    
ALTER TABLE comments
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;

ALTER TABLE comment_likes
    ADD    FOREIGN KEY (comment_id)
    REFERENCES comments(id)
;
    
ALTER TABLE comment_likes
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;

ALTER TABLE comment_dislikes
    ADD    FOREIGN KEY (comment_id)
    REFERENCES comments(id)
;
    
ALTER TABLE comment_dislikes
    ADD    FOREIGN KEY (user_id)
    REFERENCES users(id)
;

# Create Indexes
INSERT INTO users VALUES (1, "dottie@email.com","12345","MrDot","1998-07-19", 'other',"Spain","05746");
INSERT INTO users VALUES (2, "lil.mile@email.com","abcde","Lil mile","1986-07-19",'female',"Spain","05746");
INSERT INTO users VALUES (3, "king00@email.com","abc.123","King Lab","2000-07-19",'male',"Spain","02348");

INSERT INTO videos VALUES (1, 1, 1, "2021-03-10 05:15:12",  "Elegant Jazz - Good morning mood with Jazz Cafe", "Elegant Jazz - Good morning mood with Jazz Cafe - Cheerful Jazz &  Bossa Nova for the best mood", "57 Mb", "jazz_music.mpeg", '00:32:16', "jazz_image.jpg", 18293, 2, 0, "public");
INSERT INTO videos VALUES (2, 1, 1, "2021-06-27 09:55:53", "coffee shop radio // 24/7 lofi hip-hop beats", "This stream's playlist is curated with an emphasis on meditation and relaxation. No vocal samples, just smooth beats to relax the mind after a long day", "36 Mb", "coffee_shop_radio.mpeg", '00:28:15', "coffee_shop_radio.jpg", 2394, 1, 1, "public");
INSERT INTO videos VALUES (3, 2, 2, "2021-04-28 18:45:21", "(Replay) GNP Mexico Premier Padel Major: Grand Stand", "Follow the live score", "36 Mb", "padel.mpeg", "01:56:05", "padel.jpg", 14526, 1, 0, 'public');

INSERT INTO channels VALUES (1, 1, "Chill Music Videos", "Relaxing music videos", "2021-02-24 03:12:26");
INSERT INTO channels VALUES (2, 2, "Premier Padel", "The home of Premier Padel - the official new global Padel tour. Subscribe for news, highlights, interviews, behind the scene footage, and more.", "2021-04-27 18:45:21");

INSERT INTO subscriptions VALUES (1, 2);
INSERT INTO subscriptions VALUES (2, 1);
INSERT INTO subscriptions VALUES (3, 1);
INSERT INTO subscriptions VALUES (3, 2);

INSERT INTO tags VALUES (1, "Music");
INSERT INTO tags VALUES (2, "Sports");

INSERT INTO video_tags VALUES (1, 1);
INSERT INTO video_tags VALUES (2, 1);
INSERT INTO video_tags VALUES (3, 2);

INSERT INTO video_likes VALUES (1, 2, "2021-11-12 11:55:09");
INSERT INTO video_likes VALUES (1, 3, "2021-10-25 08:38:27");
INSERT INTO video_likes VALUES (2, 3, "2021-10-11 18:32:40");
INSERT INTO video_likes VALUES (3, 3, "2021-12-18 15:20:22");

INSERT INTO video_dislikes VALUES (2, 2, "2021-10-11 23:00:57");

INSERT INTO playlists VALUES (1, 3, "Chill Music", "2021-08-14 19:15:35", "public");

INSERT INTO playlist_videos VALUES (1, 1);
INSERT INTO playlist_videos VALUES (1, 2);

INSERT INTO comments VALUES (1, 1, 2, "Great video!", "2021-10-16 15:02:13");
INSERT INTO comments VALUES (2, 1, 3, "love this music, so relaxing", "2021-10-16 15:02:13");
INSERT INTO comments VALUES (3, 3, 3, "best play!!!", "2021-12-01 13:13:53");

INSERT INTO comment_likes VALUES (2, 1, "2021-11-02 12:50:45");

INSERT INTO comment_dislikes VALUES (3, 1, "2021-10-22 22:38:21");