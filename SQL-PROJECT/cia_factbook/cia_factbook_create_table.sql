CREATE DATABASE population;
USE population;

CREATE TABLE cia_factbook(
country varchar(50),
area int,	
birth_rate float,
death_rate float,
infant_mortality_rate float,
internet_users int,
life_exp_at_birth float,
maternal_mortality_rate float,
net_migration_rate float,	
population int,
population_growth_rate float
);

LOAD DATA  INFILE 
'G:\cia_factbook___FSDA 18th Sept 2022.csv'
INTO table cia_factbook
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from cia_factbook;
