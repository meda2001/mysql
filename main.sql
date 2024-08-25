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

select * from Box_Office;

select * from Movie_cast;

select * from movie;

select * from Actors;

select * from directors;

select international_collection - domestic_collection as diff from Box_Office;

-- part2 budget

select budget*2 as new_budget from Box_Office;