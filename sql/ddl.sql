CREATE EXTENSION plperl;

CREATE SCHEMA public;

create table users
(
	user_id serial not null
		constraint users_pk
			primary key,
	name varchar not null
);

create table todos
(
	todo_id serial not null,
  user_id integer not null
    constraint todos_users_user_id_fk
      references users
      on delete cascade,
	title varchar not null,
	completed boolean default false not null,
	constraint todos_pk
		primary key (todo_id, user_id)
);
