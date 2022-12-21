use Covid19
select * from CovidDeath;


--SELECTING PERTICULAR DATA

select location,date,total_cases,new_cases,total_deaths, population from CovidDeath; 

--LOOKING TOTAL DEATHS vs TOTAL CASES
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage from CovidDeath


--LOOKING COVID19 IN US
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage 
from CovidDeath where location like '%States%';


--LOOKING TOTAL CASES vs POPULATION
select location,date,population,total_cases,(total_cases/population)*100 as Infected_Population_Percentage 
from CovidDeath where continent is not null;  


--LOOKING COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION
select location,population,max(total_cases)as Highest_infection_Count,max((total_cases/population))*100 as Infected_Population_Percentage 
from CovidDeath where continent is not null group by location,population 
order by Infected_Population_Percentage desc;


--LOOKING COUNTRIES WITH HIGHEST DEATH COUNT AS PER POPULATION
select location,max(cast(total_deaths as int))as Total_Death_Count 
from CovidDeath where continent is not null group by location
order by Total_Death_Count desc


--TOTAL DEATH COUNT BY CONTINENT
select continent,max(cast(total_deaths as int))as Total_Death_Count 
from CovidDeath where continent is not null group by continent
order by Total_Death_Count desc


------- TOTAL CASES,DEATHS & DEATH PERCENTAGE
select SUM(new_cases),sum(total_cases) as Total_Cases, sum(cast( new_deaths as int))as Total_Death,
sum(cast(new_deaths as int))/sum(new_cases)*100 as Death_Percentage
from CovidDeath where continent is not null