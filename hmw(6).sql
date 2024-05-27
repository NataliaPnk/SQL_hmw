В рамках БД "видео-хостинг":


Создать таблицы реакций и комментариев (на видео)

Добавить несколько записей в каждую таблицу выше

CREATE TABLE video_reactions ( 
id int primary key auto_increment,
created_at timestamp,
video_id int,
value int,
author_id int,
cancel int
  );


  CREATE TABLE video_comments ( 
id int primary key auto_increment,
created_at timestamp,
video_id int,
content varchar,
author_id int,
to_like int,
to_dislike int
  );