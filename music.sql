-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL,
  producer_id INT REFERENCES producers(id)
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT REFERENCES albums(id)
);

CREATE TABLE songs_artists
(
  song_id INT REFERENCES songs(id),
  artist_id INT REFERENCES artists(id),
  PRIMARY KEY (song_id, artist_id)
);

INSERT INTO artists (name) 
VALUES ('Hanson'), ('Queen'), ('Mariah Carey'), 
('Boyz II Men'), ('Lady Gaga'), ('Bradley Cooper'), 
('Nickelback'), ('Jay Z'), ('Alicia Keys'), 
('Katy Perry'), ('Juicy J'), ('Maroon 5'), 
('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');


INSERT INTO albums (title, release_date, producer_id) 
VALUES ('Middle of Nowhere', '1997-04-15', 1), 
('A Night at the Opera', '1975-10-31', 2), 
('Daydream', '1995-11-14', 3), ('A Star Is Born', '2018-09-27', 4), 
('Silver Side Up', '2001-08-21', 5), ('The Blueprint 3', '2009-10-20', 6), 
('Prism', '2013-12-17', 7), ('Hands All Over', '2011-06-21', 8), 
('Let Go', '2002-05-14', 9), ('The Writing''s on the Wall', '1999-11-07', 10);

INSERT INTO songs (title, duration_in_seconds, release_date, album_id) 
VALUES ('MMMBop', 238, '1997-04-15', 1), ('Bohemian Rhapsody', 355, '1975-10-31', 2), 
('One Sweet Day', 282, '1995-11-14', 3), ('Shallow', 216, '2018-09-27', 4), 
('How You Remind Me', 223, '2001-08-21', 5), 
('New York State of Mind', 276, '2009-10-20', 6), 
('Dark Horse', 215, '2013-12-17', 7), ('Moves Like Jagger', 201, '2011-06-21', 8), 
('Complicated', 244, '2002-05-14', 9), ('Say My Name', 240, '1999-11-07', 10);

INSERT INTO songs_artists (song_id, artist_id) 
VALUES (1, 1), (2, 2), (3, 3), (3, 4), (4, 5), (4, 6), (5, 7), (6, 8), 
(6, 9), (7, 10), (7, 11), (8, 12), (8, 13), (9, 14), (10, 15);
