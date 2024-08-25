drop database if exists movies;
create database if not exists movies;

use movies;

create table if not exists directors (
  director_id int primary key auto_increment,
  name varchar(50) not null,
  dob date not null,
  nationatlity varchar(255) not null,
  awards text
);

drop table if exists movie;

create table if not exists movie(
 movie_id int primary key auto_increment,
 title varchar(255) not null,
 release_year year not null,
 genre varchar(255) not null,
 language varchar(50) default 'Telugu',
 duration_minitues int not null,
 rating decimal(3,1),
 director_id int,
 foreign key (director_id)  references directors(director_id)
);


create table if not exists Actors (
  actor_id int primary key auto_increment,
  name varchar(255) not null,
  dob year,
  nationatlity varchar(100) not null,
  gender char(1) not null,
  debut_year year
);

create table if not exists Movie_cast(
  actor_id int,
  movie_id int,
  role_name varchar(255) not null,
  screen_time_min int,
  foreign key (actor_id) references Actors(actor_id),
  foreign key (movie_id) references movie(movie_id),
  primary key(movie_id , actor_id)
);

create table if not exists Box_Office(
   movie_id int,
   budget bigint,
   box_office_collection bigint,
   domestic_collection bigint,
   international_collection bigint,
   foreign key (movie_id) references movie(movie_id),
   primary key (movie_id)
);

-- Insert into directors table
INSERT INTO directors (name, dob, nationatlity, awards) VALUES 
('Steven Spielberg', '1946-12-18', 'American', '3 Academy Awards'),
('Christopher Nolan', '1970-07-30', 'British-American', NULL),
('Hayao Miyazaki', '1941-01-05', 'Japanese', 'Academy Honorary Award'),
('Patty Jenkins', '1971-07-24', 'American', 'Various nominations');

-- Insert into movie table
INSERT INTO movie (title, release_year, genre, language, duration_minitues, rating, director_id) VALUES 
('Jurassic Park', 1993, 'Sci-Fi', 'English', 127, 8.1, 1),
('Inception', 2010, 'Sci-Fi', 'English', 148, 8.8, 2),
('Spirited Away', 2001, 'Animation', 'Japanese', 125, 8.6, 3),
('Wonder Woman', 2017, 'Action', 'English', 141, 7.4, 4),
('Tenet', 2020, 'Action', 'Telugu', 150, 7.5, 2); -- Testing default language

-- Insert into Actors table
INSERT INTO Actors (name, dob, nationatlity, gender, debut_year) VALUES 
('Leonardo DiCaprio', 1974, 'American', 'M', 1991),
('Emma Watson', 1990, 'British', 'F', 2001),
('Christian Bale', 1974, 'British', 'M', 1987),
('Scarlett Johansson', 1984, 'American', 'F', 1994),
('Ken Watanabe', 1959, 'Japanese', 'M', 1979);

-- Insert into Movie_cast table
INSERT INTO Movie_cast (actor_id, movie_id, role_name, screen_time_min) VALUES 
(1, 2, 'Dom Cobb', 90),  -- Leonardo DiCaprio in Inception
(2, 4, 'Diana Prince', 120),  -- Emma Watson in Wonder Woman
(3, 2, 'Bruce Wayne', 85),  -- Christian Bale in Inception (hypothetical role)
(4, 1, 'Ellie Sattler', 30),  -- Scarlett Johansson in Jurassic Park (hypothetical role)
(5, 3, 'Haku', 50);  -- Ken Watanabe in Spirited Away

-- Insert into Box_Office table
INSERT INTO Box_Office (movie_id, budget, box_office_collection, domestic_collection, international_collection) VALUES 
(1, 63000000, 1029200000, 357000000, 672000000),  -- Jurassic Park
(2, 160000000, 836800000, 292576195, 544223805),  -- Inception
(3, 19000000, 395580000, 10000000, 385580000),  -- Spirited Away
(4, 149000000, 821847012, 412563408, 409283604),  -- Wonder Woman
(5, 205000000, 363656624, 58200000, 305456624);  -- Tenet

-- Insert more directors into directors table
INSERT INTO directors (name, dob, nationatlity, awards) VALUES 
('Quentin Tarantino', '1963-03-27', 'American', '2 Academy Awards'),
('James Cameron', '1954-08-16', 'Canadian', '3 Academy Awards'),
('Greta Gerwig', '1983-08-04', 'American', 'Golden Globe Award'),
('Martin Scorsese', '1942-11-17', 'American', '1 Academy Award'),
('Alfonso Cuarón', '1961-11-28', 'Mexican', '4 Academy Awards');

-- Insert more movies into movie table
INSERT INTO movie (title, release_year, genre, language, duration_minitues, rating, director_id) VALUES 
('Pulp Fiction', 1994, 'Crime', 'English', 154, 8.9, 5),
('Avatar', 2009, 'Sci-Fi', 'English', 162, 7.8, 6),
('Little Women', 2019, 'Drama', 'English', 135, 7.8, 7),
('The Irishman', 2019, 'Crime', 'English', 209, 7.8, 8),
('Gravity', 2013, 'Sci-Fi', 'English', 91, 7.7, 9);

-- Insert more actors into Actors table
INSERT INTO Actors (name, dob, nationatlity, gender, debut_year) VALUES 
('Samuel L. Jackson', 1948, 'American', 'M', 1972),
('Zoe Saldana', 1978, 'American', 'F', 1999),
('Timothée Chalamet', 1995, 'American', 'M', 2012),
('Robert De Niro', 1943, 'American', 'M', 1963),
('Sandra Bullock', 1964, 'American', 'F', 1987);

-- Insert more cast roles into Movie_cast table
INSERT INTO Movie_cast (actor_id, movie_id, role_name, screen_time_min) VALUES 
(6, 6, 'Jules Winnfield', 100),  -- Samuel L. Jackson in Pulp Fiction
(7, 7, 'Neytiri', 90),  -- Zoe Saldana in Avatar
(8, 8, 'Laurie', 60),  -- Timothée Chalamet in Little Women
(9, 9, 'Frank Sheeran', 120),  -- Robert De Niro in The Irishman
(10, 10, 'Dr. Ryan Stone', 80);  -- Sandra Bullock in Gravity

-- Insert more box office records into Box_Office table
INSERT INTO Box_Office (movie_id, budget, box_office_collection, domestic_collection, international_collection) VALUES 
(6, 8000000, 213900000, 107928762, 105971238),  -- Pulp Fiction
(7, 237000000, 2847246203, 760507625, 2086738578),  -- Avatar
(8, 40000000, 218800000, 108100000, 110700000),  -- Little Women
(9, 159000000, 79600000, 31000000, 48600000),  -- The Irishman
(10, 100000000, 723192705, 274092705, 449100000);  -- Gravity


select * from Box_Office;

select * from Movie_cast;

select * from movie;

select * from Actors;

select * from directors;

select international_collection - domestic_collection as diff from Box_Office;

-- part2 budget

select budget*2 as new_budget from Box_Office;

DELIMITER $$
CREATE PROCEDURE GetMovies()
BEGIN
	SELECT *
	FROM
		movie;
END$$
DELIMITER ;

call GetMovies();



select * from movie where language in ('Telugu','Japanese');