-- SQL

CREATE DATABASE `pokemon`;
CREATE TABLE `pokemon`.`data` (
  `id_number` INT NOT NULL,
  `pokedex_number` INT NULL,
  `name` VARCHAR(256) NULL,
  `generation` INT NULL,
  `status` VARCHAR(45) NULL,
  `species` VARCHAR(45) NULL,
  `type_1` VARCHAR(45) NULL,
  `type_2` VARCHAR(45) NULL,
  `height_m` DOUBLE NULL,
  `weight_kg` VARCHAR(45) NULL,
  `ability_1` VARCHAR(45) NULL,
  `ability_2` VARCHAR(45) NULL,
  `ability_hidden` VARCHAR(45) NULL,
  `hp` INT NULL,
  `attack` INT NULL,
  `defense` INT NULL,
  `sp_attack` INT NULL,
  `sp_defense` INT NULL,
  `speed` INT NULL,
  `catch_rate` VARCHAR(45) NULL,
  `base_friendship` VARCHAR(45) NULL,
  `base_experience` VARCHAR(45) NULL,
  `growth_rate` TEXT NULL,
  `egg_type_1` VARCHAR(45) NULL,
  `eggtype_2` VARCHAR(45) NULL,
  `percentage_male` VARCHAR(45) NULL,
  `egg_cycles` VARCHAR(45) NULL,
  PRIMARY KEY (`id_number`));
  
CREATE TABLE `pokemon`.`natures` (
  `nature` VARCHAR(45) NOT NULL,
  `stat_increased` TEXT NULL,
  `stat_decreased` TEXT NULL,
  `flavor_favorite` TEXT NULL,
  `flavor_disliked` TEXT NULL,
  PRIMARY KEY (`nature`));
  
  
CREATE TABLE `pokemon`.`pokemon` (
  `name` VARCHAR(255) NOT NULL,
  `generation` INT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`name`));
  
CREATE TABLE `pokemon`.`pokedex_entry` (
  `pokedex_number` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `species` TEXT NULL,
  `type_1` TEXT NULL,
  `type_2` TEXT NULL,
  `height_m` DOUBLE NULL,
  `weight_kg` VARCHAR(45) NULL,
  `ability_1` TEXT NULL,
  `ability_2` TEXT NULL,
  `ability_hidden` TEXT NULL,
  `egg_type_1` TEXT NULL,
  `egg_type_2` TEXT NULL,
  PRIMARY KEY (`pokedex_number`,`name`), -- composite primary key
  FOREIGN KEY (`name`) REFERENCES pokemon(name));
  
CREATE TABLE `pokemon`.`stats` (
  `hp` INT NULL,
  `attack` INT NULL,
  `defense` INT NULL,
  `sp_attack` INT NULL,
  `sp_defense` INT NULL,
  `speed` INT NULL,
  `id_number` INT NOT NULL,
  PRIMARY KEY (id_number));
  
  
CREATE TABLE `pokemon`.`move` (
    `Index_number` INT NOT NULL,
    `Name` VARCHAR(256) NOT NULL,
    `Type` VARCHAR(45) NULL,
    `Category` VARCHAR(45) NULL,
    `Contest` VARCHAR(45) NULL,
    `PP` VARCHAR(45) NULL,
    `Power` VARCHAR(45) NULL,
    `Accuracy` VARCHAR(45) NULL,
    `Generation` INT NULL,
    PRIMARY KEY (`Index_number` , name)
);
  
  
  CREATE TABLE `pokemon`.`pc_entry` (
  `Nickname` VARCHAR(256) NOT NULL,
  `name` VARCHAR(256) NOT NULL,
  `natures` VARCHAR(45) NOT NULL,
  `stats` INT NOT NULL,
  `move` INT NOT NULL,
  PRIMARY KEY (Nickname, `name`),
  FOREIGN KEY (natures) REFERENCES Natures(nature),
  FOREIGN KEY (stats) REFERENCES stats(`id_number`),
  FOREIGN KEY (move) REFERENCES move(Index_number));
  
/*
LOAD DATA INFILE 'pokemon.csv' INTO TABLE pokemon
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';
-- IGNORE 1 LINES

*/


LOAD DATA INFILE 'completed - pokedex_(Update_05.20) - pokedex_(Update_05.20).csv' INTO TABLE pokemon.data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'natures.csv' INTO TABLE pokemon.natures
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'move-data.csv' INTO TABLE pokemon.move
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

INSERT INTO pokemon.pokemon (name, generation, status)
SELECT name, generation, status
FROM pokemon.data;
 
INSERT INTO pokemon.stats (hp, attack, defense, sp_attack, sp_defense, speed, id_number)
SELECT hp, attack, defense, sp_attack, sp_defense, speed, id_number
FROM pokemon.data;

INSERT INTO pokemon.pokedex_entry (name, pokedex_number, species, type_1, type_2, height_m, weight_kg, ability_1, ability_2, ability_hidden)
SELECT name, pokedex_number, species, type_1, type_2, height_m, weight_kg, ability_1, ability_2, ability_hidden
FROM pokemon.data;



