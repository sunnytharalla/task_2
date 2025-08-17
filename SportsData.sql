-- Create Teams Table
CREATE DATABASE IF NOT EXISTS SportsData;
USE SportsData;

CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(100) NOT NULL
);

-- Create Players Table
CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Create Matches Table
CREATE TABLE Matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    team1_id INT,
    team2_id INT,
    match_date DATE,
    FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES Teams(team_id)
);

-- Create Results Table
CREATE TABLE Results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT UNIQUE,
    winning_team_id INT,
    score VARCHAR(20),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (winning_team_id) REFERENCES Teams(team_id)
);