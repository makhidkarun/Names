

DROP TABLE if EXISTS humaniti_last;
DROP TABLE if EXISTS humaniti_female_first;
DROP TABLE if EXISTS humaniti_male_first;
DROP TABLE if EXISTS vargr;

CREATE TABLE if NOT EXISTS humaniti_last(
    name varchar[20] UNIQUE
);

.read humanitiLastNames.sql

CREATE TABLE if NOT EXISTS humaniti_female_first(
    name varchar[20] UNIQUE
);

.read humanitiFemaleFirstNames.sql


CREATE TABLE if NOT EXISTS humaniti_male_first(
    name varchar[20] UNIQUE
);

.read humanitiMaleFirstNames.sql

CREATE TABLE if NOT EXISTS vargr(
    name varchar[40] UNIQUE
);

