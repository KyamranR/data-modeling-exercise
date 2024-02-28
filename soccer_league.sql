CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INT REFERENCES teams(id)
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(id),
    game_id INT REFERENCES matches(id),
    goals_scored INT NOT NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE matches 
(
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams(id),
    away_team_id INT REFERENCES teams(id),
    referee_id INT REFERENCES referees(id),
    match_date DATE NOT NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

INSERT INTO teams (name)
VALUES ('Los Angeles'), ('Oregon Ducks');

INSERT INTO players (name, team_id)
VALUES ('Muhamedali', 1), ('Elif', 2);

INSERT INTO goals (player_id, game_id, goals_scored)
VALUES (1, 1, 5), (2,1, 3);

INSERT INTO referees (name)
VALUES ('Kyamran');

INSERT INTO matches (home_team_id, away_team_id, referee_id, match_date)
VALUES(1, 2, 1, '2024-01-01');

INSERT INTO seasons (start_date, end_date)
VALUES ('2024-01-01', '2024-03-15');