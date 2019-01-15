-- 기본쿼리연습
drop table pet;

CREATE TABLE pet (
    name VARCHAR(20),
    owner VARCHAR(20),
    species VARCHAR(20),
    gender CHAR(1),
    birth DATE,
    death DATE
);

desc pet;


insert into pet values('마음이','대혁','dog','f','2018-01-18',null);
SELECT 
    *
FROM
    pet;
SELECT 
    name, owner
FROM
    pet;
    
    load data local infile "/Users/choi/Desktop/pet.txt" into table pet;
    
    select * from pet;
    
    -- select 구문
    
    select * from pet;
    
    select * from pet where name='bowser';
	select * from pet where name='Bowser';
    select * from pet where birth >='1998-01-01';
    select * from pet where gender ='f' and species = 'dog';
    
    select * from pet where species = 'snake' or species = 'bird' ;
    
    select name, birth from pet;
    
       select name, birth from pet order by birth asc;
    
    
    