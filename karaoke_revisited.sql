DROP TABLE rooms_songs_manytomany;
DROP TABLE songs;
DROP TABLE guests;
DROP TABLE rooms;

CREATE TABLE songs (
  id SERIAL8        PRIMARY KEY,
  name              VARCHAR(255) NOT NULL,
  artist            VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
  id SERIAL8        PRIMARY KEY,
  room_genre        VARCHAR(255) NOT NULL,
  -- playlist_id INT8  REFERENCES songs(id),
  entry_fee         INT NOT NULL,
  room_capacity     INT NOT NULL
);

CREATE TABLE guests (
  id SERIAL8        PRIMARY KEY,
  name              VARCHAR(255) NOT NULL,
  wallet            INT NOT NULL,
  room_id INT8      REFERENCES rooms(id)
);

CREATE TABLE rooms_songs_manytomany (
  id SERIAL8        PRIMARY KEY,
  playlist_id INT8  REFERENCES songs(id),
  room_id INT8      REFERENCES rooms(id)
);


INSERT INTO songs (name, artist)
  VALUES ('Despacito', 'Luis Fonsi');
INSERT INTO songs (name, artist)
  VALUES ('Alive', 'Sia');
INSERT INTO songs (name, artist)
  VALUES ('Caledonia', 'Dougie Mclean');

INSERT INTO rooms (room_genre, entry_fee, room_capacity)
  VALUES ('Spanish Pop',5,2);
INSERT INTO rooms (room_genre,  entry_fee, room_capacity)
  VALUES ('Pop',5,2);
INSERT INTO rooms (room_genre,  entry_fee, room_capacity)
  VALUES ('Scottish',5,2);
INSERT INTO rooms (room_genre,  entry_fee, room_capacity)
  VALUES ('All genres',10,4);

INSERT INTO guests (name, wallet, room_id)
  VALUES ('Rachael', 15, 1);
INSERT INTO guests (name, wallet, room_id)
  VALUES ('Rebecca', 10, 1);
INSERT INTO guests (name, wallet, room_id)
  VALUES ('Kenny', 5, 2);

INSERT INTO rooms_songs_manytomany (playlist_id, room_id)
  VALUES (1, 1);

UPDATE guests
  SET name = 'Gordon'
  WHERE name = 'Kenny';

UPDATE rooms
  SET room_genre = 'American Pop'
  WHERE room_genre = 'Pop';

  

-- SELECT * FROM songs;
-- SELECT * FROM guests;
-- SELECT * FROM rooms;
-- SELECT * FROM rooms_songs_manytomany;

-- SELECT room_genre FROM rooms #this returns a column!

-- SELECT * FROM songs WHERE name = 'Caledonia' #this returns a row!
