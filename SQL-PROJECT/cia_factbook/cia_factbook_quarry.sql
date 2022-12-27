/*
Which country has the highest population?

*/


select  country,population from cia_factbook
order by population desc
limit 1;



/*
Which country has the least number of people?
*/
select  country,population from cia_factbook
where population != 0
order by population 
limit 1;

/*
Which country is witnessing the highest population growth?
*/

select country , population_growth_rate from cia_factbook
order by population_growth_rate desc 
limit 1;

/* 
Which country has an extraordinary number for the population?
*/
select  country,population from cia_factbook
where population != 0
order by population desc
limit 10;

/* 
Which is the most densely populated country in the world?
*/
select country , area , population , (population/area)as density 
from cia_factbook
order by (population/area) desc
limit 1;