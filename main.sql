-- Tutorial 0
SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- Tutorial 1

SELECT name FROM world
  WHERE name LIKE 'Y%'

SELECT name FROM world
  WHERE name LIKE '%y'

SELECT name FROM world
  WHERE name LIKE '%x%'

SELECT name FROM world
  WHERE name LIKE '%land'

SELECT name FROM world
  WHERE name LIKE 'C%ia'

SELECT name FROM world
  WHERE name LIKE '%oo%'

SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

SELECT name FROM world
  WHERE name LIKE '_t%'
  ORDER BY name

SELECT name FROM world
  WHERE name LIKE '%o__o%'

SELECT name FROM world
  WHERE name LIKE '____'

SELECT name
  FROM world
  WHERE name LIKE capital

SELECT name
  FROM world
  WHERE capital LIKE concat(name,' city')

SELECT capital, name
  FROM world
  WHERE capital LIKE concat(name,'%')

SELECT capital, name
  FROM world
  WHERE capital LIKE concat(name,'_%')

SELECT name, replace(capital, name, '')
  FROM world
  WHERE capital LIKE concat(name,'_%')

-- Tutorial 2

SELECT name, continent, population FROM world

SELECT name FROM world
WHERE population >= 200000000

SELECT name, (gdp / population) as per_capita_gdp FROM world
WHERE population >= 200000000

select name, (population / 1000000) population_in_millions
from world
where continent = 'South America'

select name, population
from world
where name in('France', 'Germany', 'Italy')

select name
from world
where name like '%United%'

select name, population, area
from world
where area >= 3000000
or population >= 250000000

select name, population, area
from world
where area >= 3000000
xor population >= 250000000

select name, round(population/1000000, 2), round(gdp/1000000000, 2)
from world
where continent= 'South America'

select name, round(gdp / population, -3)
from world
where gdp >= 1000000000000

SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

