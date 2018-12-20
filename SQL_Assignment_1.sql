#1 Farthest destination
SELECT dest as "Farthest Airport"
FROM flights# as farthest
ORDER BY distance DESC
LIMIT 1;

#1 Question - Why doesnt something like this work? how can it be done using the MAX paradigm?
-- SELECT dest
-- FROM flights
-- WHERE distance = MAX(distance);

-- #2 Diff num engines, attempt to include the seat max column, 
select engines, seats, manufacturer, model
from planes
where seats = (select max(seats) from planes where engines = 1)
AND engines = 1
UNION
select engines, seats, manufacturer, model
from planes
where seats = (select max(seats) from planes where engines = 2)
AND engines = 2
UNION
select engines, seats, manufacturer, model
from planes
where seats = (select max(seats) from planes where engines = 3)
AND engines = 3
UNION
select engines, seats, manufacturer, model
from planes
where seats = (select max(seats) from planes where engines = 4);


SELECT model, seats, engines
FROM planes# as max_mod
ORDER BY seats DESC
LIMIT 1;

#3 Show Total number of flights
SELECT COUNT(*) as "Total Flights"
FROM flights;

#4 Show Total number of flights by airline
SELECT carrier, COUNT(*) as "Total Flights"
FROM flights
GROUP BY carrier;

#5 All airlines ordered by flights desc
SELECT carrier, COUNT(*) as "Total Flights"
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;

#6 All airlines ordered by flights desc top 5
SELECT carrier, COUNT(*) as "Total Flights"
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

#7 All airlines ordered by flights over 1000 distance desc top 5
SELECT carrier, COUNT(*) as "Total Flights"
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;


#8 Create question: What is the average wind speed per airport rounded to nearest MPH?
SELECT origin, ROUND(AVG(wind_speed),0) as "Average Wind Speed"
FROM weather
GROUP BY origin;