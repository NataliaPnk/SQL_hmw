-- 1. Создать таблицу комментариев (comments) с использованием механизма валидации данных в SQL
create table comments (
	id int primary key auto_increment,
	created_at timestamp default current_timestamp,

	
  author_id int not null,
  track_id int not null,
	value varchar(324) not null
  

	foreign key (author_id) references users(id),
  foreign key (track_id) references tracks(id)
)


-- 2. Добавить в таблицу комментариев несколько записей

INSERT INTO comments (author_id, track_id, value)
VALUES
	(3, 4, 'This song make me happy. I like it!'),
	(5, 4, 'My dog loves this track so do I'),
  (1, 2, 'It is really awesome!'),
	(2, 4, 'This song is incredible good!! I wanna listen to it again and again!')
	


-- 3. Вывести ко-во комментариев на каждый трек (в упорядоченном виде)

SELECT *,
COUNT(comments.id) AS amount_of_tracks
FROM 
tracks
JOIN comments ON tracks.author_id = comments.id
ORDER BY tracks DESC