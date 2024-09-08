
select * from movie;
select * from directors;

select * from movie  left join directors on movie.director_id = directors.director_id;

select * from movie  inner join directors on movie.director_id = directors.director_id;

select * from movie  right join directors on movie.director_id = directors.director_id;