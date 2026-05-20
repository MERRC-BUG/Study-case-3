CREATE DATABASE IF NOT EXISTS blogphim CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE blogphim;

CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    genre VARCHAR(100),
    year INT
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);
INSERT INTO movies (title, genre, year) VALUES
('Inception', 'Sci-Fi', 2010),
('The Dark Knight', 'Action', 2008),
('Interstellar', 'Sci-Fi', 2014),
('Parasite', 'Drama', 2019),
('Avengers: Endgame', 'Action', 2019),
('Joker', 'Drama', 2019),
('The Matrix', 'Sci-Fi', 1999),
('The Shawshank Redemption', 'Drama', 1994),
('The Lord of the Rings: The Fellowship of the Ring', 'Fantasy', 2001),
('Spider-Man: Into the Spider-Verse', 'Animation', 2018);
INSERT INTO reviews (movie_id, content) VALUES
(1, 'A mind-bending thriller with stunning visuals.'),
(2, 'An intense and gripping superhero film.'),
(3, 'A visually stunning exploration of space and time.'),
(4, 'A brilliant social commentary with unexpected twists.'),
(5, 'An epic conclusion to the Marvel saga with emotional depth.'),
(6, 'Joaquin Phoenix delivers a haunting and unforgettable performance.'),
(7, 'A groundbreaking sci-fi classic with action and philosophy.'),
(8, 'Một câu chuyện cảm động về hy vọng và tình bạn.'),
(9, 'Hành trình sử thi đầy nhiệm màu, cảm xúc và chiến tranh.'),
(10, 'Phong cách hoạt hình độc đáo và nội dung xúc động cho người xem mọi lứa tuổi.');
