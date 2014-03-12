create database lib;
CREATE  TABLE IF NOT EXISTS `lib`.`admin` (  `user` VARCHAR(45) NOT NULL ,  `passwd` VARCHAR(45) NULL ,  PRIMARY KEY (`user`) );

insert into lib.admin (user,passwd) values('admin','admin');

CREATE  TABLE IF NOT EXISTS `lib`.`books` (  `id` INT NOT NULL ,  `title` VARCHAR(45) NOT NULL ,  `author` VARCHAR(45) NOT NULL ,  `state` VARCHAR(45) NOT NULL ,  PRIMARY KEY (`id`) );

insert into lib.books (id,title,author,state) values (1024,'C++ Primer','Lippman','in');
insert into lib.books (id,title,author,state) values (32768,'SICP','Abelson','in');
insert into lib.books (id,title,author,state) values (128,'Design Patterns','Erich','in');
insert into lib.books (id,title,author,state) values (2,'The Art of Computer Programming','Donald E. Knuth','in');
insert into lib.books (id,title,author,state) values (32,'Expert C Programming','LinDen','in');
insert into lib.books (id,title,author,state) values (64,'Thinking in Java','Bruce Eckel','in');
