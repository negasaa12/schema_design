




DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league




-- Part Three: Soccer League
-- Design a schema for a simple sports league. Your schema should keep track of

-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).



CREATE TABLE league (
    id SERIAL PRIMARY KEY,
    team TEXT NOT NULL
);

CREATE TABLE players(
    player TEXT NOT NULL,
    team_id INTEGER NOT NULL REFERENCES league,
    PRIMARY KEY (player, team_id)
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player TEXT NOT NULL,
    scores INTEGER NOT NULL,
    team_id INTEGER NOT NULL REFERENCES league (id)
);

INSERT INTO league (team) VALUES ('Red Ravens'), ('Rumpy Rollers'), ('Disaster Squad'), ('The Ayos');

INSERT INTO players (player, team_id) VALUES ('Markmen', 1), ('Johnson', 1 ), ('Derek', 2 ), ('Jasmine', 3 ),('Julian',1), ('Denise', 2 );

INSERT INTO goals (player, scores, team_id) VALUES ('Markmen', 24, 1);
