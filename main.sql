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
  WHERE name IN('France', 'Germany', 'Italy');

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

SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG';

SELECT * FROM nobel
WHERE winner = "EUGENE O\'NEILL";

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC,winner;

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'),subject,winner;

-- Tutorial 4

SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia');

SELECT name
FROM world
WHERE continent = 'Europe' AND
gdp/population > ( SELECT gdp/population FROM world WHERE name = 'United Kingdom');

SELECT name, continent FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina')
or continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name;

SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Polonia');

SELECT name, 
concat(round(100*population/(SELECT population FROM world WHERE name = 'Germany')),'%')
FROM world
WHERE continent = 'Europe';

SELECT name FROM world 
WHERE gdp > (SELECT max(gdp) FROM world WHERE continent = 'Europe');

SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent
AND area>0);

SELECT continent, min(name) as name FROM world
GROUP BY continent
ORDER BY continent;

SELECT continent, sum(population) as pop FROM world a
GROUP BY continent;

-- Tutorial 5

SELECT SUM(population)
FROM world;

SELECT continent FROM world
GROUP BY continent;

SELECT sum(gdp) FROM world
WHERE continent = 'Africa';

SELECT count(name) FROM world
WHERE area >= 1000000;

SELECT sum(population) FROM world
WHERE name IN('Estonia', 'Latvia', 'Lithuania');

SELECT continent, count(name) FROM world
GROUP BY continent;

SELECT continent, count(name) FROM world
WHERE population >= 10000000
GROUP BY continent;

SELECT continent FROM world a
WHERE 
(SELECT sum(population) FROM world WHERE continent = a.continent GROUP BY continent) >= 100000000
GROUP BY continent;

-- Tutorial 6

SELECT matchid, player FROM goal 
WHERE teamid = 'GER';

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE goal.teamid = 'GER';

SELECT team1, team2, player FROM game
JOIN goal ON id=matchid
WHERE player like 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON teamid=id
WHERE gtime<=10;

SELECT mdate, teamname FROM game
JOIN eteam ON team1=eteam.id
WHERE coach = 'Fernando Santos';

SELECT player FROM goal
JOIN game ON matchid=id
WHERE stadium = 'National Stadium, Warsaw';

SELECT distinct(player)
FROM game JOIN goal ON matchid = id 
WHERE (team1='GER' or team2='GER')
AND teamid != 'GER';

SELECT teamname, count(gtime)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY teamname;

SELECT stadium, count(gtime) FROM game
JOIN goal ON id=matchid
GROUP BY stadium;

SELECT matchid,mdate, count(gtime)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

SELECT matchid,mdate, count(gtime)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid = 'GER'
GROUP BY matchid, mdate;

SELECT id,mdate, team1,
CASE WHEN teamid=team1 THEN 
(SELECT count(gtime) FROM goal WHERE teamid = team1 AND matchid = id) else 0
END score1, team2,
CASE WHEN teamid=team2 THEN 
(SELECT count(gtime) FROM goal WHERE teamid = team2 AND matchid = id) else 0
END score2
FROM game x JOIN goal ON matchid = id
GROUP BY id, mdate, team1, teamid, team2
ORDER BY mdate;

-- Tutorial 7

SELECT id, title
FROM movie
WHERE yr=1962;

SELECT yr FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr FROM movie
WHERE title like '%Star Trek%'
ORDER BY yr;

SELECT id FROM actor
WHERE name = 'Glenn Close';

SELECT id FROM movie
WHERE title = 'Casablanca';

SELECT name FROM movie a
JOIN casting b ON a.id=b.movieid
JOIN actor c ON b.actorid=c.id
WHERE a.id=11768;

SELECT name FROM movie a
JOIN casting b ON a.id=b.movieid
JOIN actor c ON b.actorid=c.id
WHERE a.title = 'Alien';

SELECT title FROM movie a
JOIN casting b ON a.id=b.movieid
JOIN actor c ON b.actorid=c.id
WHERE c.name = 'Harrison Ford';

SELECT title FROM movie a
JOIN casting b ON a.id=b.movieid
JOIN actor c ON b.actorid=c.id
WHERE c.name = 'Harrison Ford'
AND b.ord !=1;

SELECT a.title, c.name FROM movie a
JOIN casting b ON a.id=b.movieid
JOIN actor c ON b.actorid=c.id
WHERE b.ord = 1;

SELECT yr,COUNT(title) FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- Tutorial 8 
-- Null

SELECT name from teacher
WHERE dept IS NULL;

SELECT teacher.name, dept.name
FROM teacher JOIN dept
ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id);

SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher;