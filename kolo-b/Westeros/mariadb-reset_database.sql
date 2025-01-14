use westeros;

alter table actor_role drop foreign key FK2x71qf5w1n93pki686nbhsxqm;
alter table actor_role drop foreign key FK7nixnkawckbp6e6d7x0f5pby6;
alter table company_movies drop foreign key FKmmc8rt6ss635b1nrybown4va2;
alter table company_movies drop foreign key FKknnnj0j6wcph9jgfn2bcd4ky6;
alter table country_movies drop foreign key FKpygrtf1pvsg7g61jprlk308m8;
alter table country_movies drop foreign key FKpxkrflndnuuvgs4n7pj2sqlpx;
alter table genre_movies drop foreign key FKtgatsvi7lb98phh9ft1gogkep;
alter table genre_movies drop foreign key FKe8j9am8l355522fj88clwhbt8;
alter table language_movies drop foreign key FK78fnn8j50f8md8o3ajkdp346l;
alter table language_movies drop foreign key FKv00xsh77h5m3pcr1b1n29j5a;
drop table if exists actor;
drop table if exists actor_role;
drop table if exists company;
drop table if exists company_movies;
drop table if exists country;
drop table if exists country_movies;
drop table if exists genre;
drop table if exists genre_movies;
drop table if exists language;
drop table if exists language_movies;
drop table if exists movie;

create table actor (birthday date, deathday date, popularity float(53) not null, source_id integer not null, id bigint not null auto_increment, also_known_as varchar(255), name varchar(255), profile_path varchar(255), biography TEXT, primary key (id)) engine=InnoDB;
create table actor_role (actor_id bigint, id bigint not null auto_increment, movie_id bigint, name varchar(255), primary key (id)) engine=InnoDB;
create table company (id integer not null auto_increment, source_id integer not null, logo_path varchar(255), name varchar(255), origin_country varchar(255), primary key (id)) engine=InnoDB;
create table company_movies (movies_id integer not null, production_companies_id bigint not null) engine=InnoDB;
create table country (id integer not null auto_increment, name varchar(255), primary key (id)) engine=InnoDB;
create table country_movies (production_countries_id integer not null, movies_id bigint not null) engine=InnoDB;
create table genre (id integer not null auto_increment, source_id integer not null, name varchar(255), primary key (id)) engine=InnoDB;
create table genre_movies (genres_id integer not null, movies_id bigint not null) engine=InnoDB;
create table language (id integer not null auto_increment, english_name varchar(255), name varchar(255), primary key (id)) engine=InnoDB;
create table language_movies (spoken_languages_id integer not null, movies_id bigint not null) engine=InnoDB;
create table movie (adult bit not null, budget integer not null, popularity float(53) not null, release_date date, runtime integer not null, vote_average float(53) not null, vote_count integer not null, id bigint not null auto_increment, source_id bigint not null, backdrop_path varchar(255), homepage varchar(255), original_language varchar(255), original_title varchar(255), poster_path varchar(255), overview TEXT, primary key (id)) engine=InnoDB;
alter table actor_role add constraint FK2x71qf5w1n93pki686nbhsxqm foreign key (actor_id) references actor (id);
alter table actor_role add constraint FK7nixnkawckbp6e6d7x0f5pby6 foreign key (movie_id) references movie (id);
alter table company_movies add constraint FKmmc8rt6ss635b1nrybown4va2 foreign key (production_companies_id) references movie (id);
alter table company_movies add constraint FKknnnj0j6wcph9jgfn2bcd4ky6 foreign key (movies_id) references company (id);
alter table country_movies add constraint FKpygrtf1pvsg7g61jprlk308m8 foreign key (movies_id) references movie (id);
alter table country_movies add constraint FKpxkrflndnuuvgs4n7pj2sqlpx foreign key (production_countries_id) references country (id);
alter table genre_movies add constraint FKtgatsvi7lb98phh9ft1gogkep foreign key (movies_id) references movie (id);
alter table genre_movies add constraint FKe8j9am8l355522fj88clwhbt8 foreign key (genres_id) references genre (id);
alter table language_movies add constraint FK78fnn8j50f8md8o3ajkdp346l foreign key (movies_id) references movie (id);
alter table language_movies add constraint FKv00xsh77h5m3pcr1b1n29j5a foreign key (spoken_languages_id) references language (id);