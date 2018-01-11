create table stage(
	num int,
	title text,
	description text,
	price       float,
	y           int,
	preprocessedTitle     text,
	preprocessedDescr     text,
	category_id           int,
	catname               text,
	cat0                  text,
	cat1                  text,
	cat2                  text,
	y0 					  int
);

select count(*) from stage;

-- .import C:/projects/AvitoML/data/prep_catdataset.csv stage

delete from stage where num = '';

select * from stage  limit(100);

create table catdata as select title, description, price, y as category_id, preprocessedTitle, PreprocessedDescr from stage;

select * from catdata;

create table cat (
	num int,
	category_id int ,
	name text,
	cat0 text,
	cat1 text,
	cat2 text
);

-- .import C:/projects/AvitoML/data/sepcat.csv cat
with t0 as (select distinct cat0 from cat)
select cat0, (select count(*) from t0 where t0.cat0>t00.cat0) as c0ind from t0 as t00

with t1 as (select distinct cat1 from cat)
select cat1, (select count(*) from t1 where t1.cat1>t11.cat1) as c1ind from t1 as t11


select count(*), count(distinct category_id), count(distinct cat0), count(distinct cat1)
from catdata join cat using(category_id)

create table catind as 
with 
	t0 as     (select distinct cat0 from cat),
	c0ind as  (select cat0, (select count(*) from t0 where t0.cat0>t00.cat0) as c0ind from t0 as t00),
	t1 as     (select distinct cat1 from cat),
	c1ind as (select cat1, (select count(*) from t1 where t1.cat1>t11.cat1) as c1ind from t1 as t11)
select * from cat 
join c0ind using(cat0)
join c1ind using(cat1);

select c0ind as y0, c1ind as y1, category_id as y2 from catind;

select count(*), count(distinct category_id), count(distinct c0ind), count(distinct c1ind)
from catdata join catind using(category_id)

select y0, y2, count(*) from (
item_id,title,description,price

	select catdata._rowid_ as item_id, preprocessedTitle, preprocessedDescr, price, category_id as y2, c0ind as y0, c1ind as y1  
	from catdata join catind using(category_id)

	) t group by 1,2



