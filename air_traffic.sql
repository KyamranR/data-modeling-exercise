-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE aiports
(
  code VARCHAR(3) PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE airlines
(
  code VARCHAR(3) PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_code VARCHAR(3) REFERENCES airlines(code),
  from_airport_code VARCHAR(3) REFERENCES aiports(code),
  to_airport_code VARCHAR(3) REFERENCES airports(code)
);

INSERT INTO airports (code, city, country)
VALUES
  ('IAD', 'Washington DC', 'United States'),
  ('SEA', 'Seattle', 'United States'),
  ('HND', 'Tokyo', 'Japan'),
  ('LHR', 'London', 'United Kingdom'),
  ('LAX', 'Los Angeles', 'United States'),
  ('LAS', 'Las Vegas', 'United States'),
  ('CDG', 'Paris', 'France'),
  ('CMN', 'Casablanca', 'Morocco'),
  ('DXB', 'Dubai', 'UAE'),
  ('PEK', 'Beijing', 'China'),
  ('JFK', 'New York', 'United States'),
  ('CLT', 'Charlotte', 'United States'),
  ('CID', 'Cedar Rapids', 'United States'),
  ('MSY', 'New Orleans', 'United States'),
  ('GRU', 'Sao Paolo', 'Brazil'),
  ('SCL', 'Santiago', 'Chile');

INSERT INTO airlines (code, name)
VALUES
  ('UAL', 'United'),
  ('BAW', 'British Airways'),
  ('DAL', 'Delta'),
  ('DLH', 'Lufthansa'),
  ('CCA', 'Air China'),
  ('AAL', 'American Airlines'),
  ('TUI', 'TUI Fly Belgium'),
  ('AVA', 'Avianca Brasil');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_code, from_airport_code, to_airport_code)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'UAL', 'IAD', 'SEA'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'BAW', 'HND', 'LHR'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'DAL', 'LAX', 'LAS'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'DAL', 'SEA', 'MEX'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI', 'CDG', 'CMN'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'CCA', 'DXB', 'PEK'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'UAL', 'JFK', 'CLT'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'AAL', 'CID', 'ORD'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'AAL', 'CLT', 'MSY'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'AVA', 'GRU', 'SCL');
