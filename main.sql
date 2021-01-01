-- Tutorial 0
SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- Tutorial 1

SELECT name FROM world
  WHERE name LIKE 'Y%';

SELECT name FROM world
  WHERE name LIKE '%y';

SELECT name FROM world
  WHERE name LIKE '%x%';

SELECT name FROM world
  WHERE name LIKE '%land';

SELECT name FROM world
  WHERE name LIKE 'C%ia';

SELECT name FROM world
  WHERE name LIKE '%oo%';

SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

SELECT name FROM world
  WHERE name LIKE '_t%'
  ORDER BY name;

SELECT name FROM world
  WHERE name LIKE '%o__o%';

SELECT name FROM world
  WHERE name LIKE '____';

SELECT name
  FROM world
  WHERE name LIKE capital;

SELECT name
  FROM world
  WHERE capital LIKE concat(name,' city');

SELECT capital, name
  FROM world
  WHERE capital LIKE concat(name,'%');

SELECT capital, name
  FROM world
  WHERE capital LIKE concat(name,'_%');

SELECT name, replace(capital, name, '')
  FROM world
  WHERE capital LIKE concat(name,'_%');

-- Tutorial 2

SELECT name, continent, population FROM world;

SELECT name FROM world
  WHERE population >= 200000000;

SELECT name, (gdp / population) as per_capita_gdp FROM world
  WHERE population >= 200000000;

SELECT name, (population / 1000000) population_in_millions
  FROM world
  WHERE continent = 'South America';

SELECT name, population
  FROM world
  WHERE name in('France', 'Germany', 'Italy');

SELECT name
FROM world
WHERE name LIKE '%United%';

SELECT name, population, area
FROM world
WHERE area >= 3000000
or population >= 250000000;

SELECT name, population, area
FROM world
WHERE area >= 3000000
xor population >= 250000000;

SELECT name, round(population/1000000, 2), round(gdp/1000000000, 2)
FROM world
WHERE continent= 'South America';

SELECT name, round(gdp / population, -3)
FROM world
WHERE gdp >= 1000000000000;

SELECT name, capital
  FROM world
  WHERE LENGTH(name) = LENGTH(capital);

SELECT name, capital
  FROM world
  WHERE left(name, 1) = left(capital, 1)
  AND name != capital;

SELECT name
  FROM world
  WHERE name not LIKE '% %'
  AND name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%';

-- Tutorial 3

SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950;

SELECT winner
  FROM nobel
  WHERE yr = 1962
  AND subject = 'Literature';

SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein';

SELECT winner
  FROM nobel
  WHERE subject = 'Peace'
  AND yr >= 2000;

SELECT yr, subject, winner
  FROM nobel
  WHERE subject = 'Literature'
  AND yr BETWEEN 1980 AND 1989;

SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

SELECT winner FROM nobel
  WHERE winner LIKE 'John %';

SELECT yr, subject, winner FROM nobel
  WHERE (yr = 1980 AND subject = 'Physics')
  OR (yr = 1984 AND subject = 'Chemistry');

SELECT yr, subject, winner FROM nobel
  WHERE yr = 1980
  AND subject NOT IN ('Chemistry', 'Medicine');

SELECT yr, subject, winner FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910)
  OR (subject = 'Literature' AND yr >= 2004);

SELECT * from nobel
WHERE winner = 'PETER GRÜNBERG';

SELECT * from nobel
WHERE winner = "EUGENE O\'NEILL";

SELECT winner, yr, subject from nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC,winner;

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'),subject,winner;