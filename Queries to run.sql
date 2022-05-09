
-- This query lets you see how many pokemon have each unique entry as their primary type. 
SELECT type_1, COUNT(type_1) AS count1
FROM pokemon.pokedex_entry
GROUP BY type_1
UNION ALL
SELECT 'SUM' type_1, COUNT(type_1)
FROM pokemon.pokedex_entry;

-- This query lets you see how many pokemon have each unique entry as their secondary type. 
SELECT type_2, COUNT(type_2) AS count
FROM pokemon.pokedex_entry
GROUP BY type_2
UNION ALL
SELECT 'SUM' type_2, COUNT(type_2)
FROM pokemon.pokedex_entry;

-- Inserts a few "captured" pokemon into the pc
INSERT INTO pc_entry (`Nickname`, `name`, `natures`,  `stats`, `move`)
VALUES ('Nugget', 'Squirtle', 'Bold', 7, 145);

INSERT INTO pc_entry (`Nickname`, `name`, `natures`,  `stats`, `move`)
VALUES ('Starbucks', 'Rapidash', 'Bold', 102, 172);

-- Query that updates the attack value and speed for a pc_entry after using a move for example

UPDATE stats
SET hp = 130, attack = 100, defense = 60, sp_attack = 150, sp_defense = 55, speed = 100
WHERE id_number = 102;
SELECT * FROM stats
WHERE id_number = 102;

SELECT `id_number`, `hp`, `attack`, `defense`, `sp_attack`, `sp_defense`, `speed`, 
`hp`+ `attack`+ `defense`+ `sp_attack`+ `sp_defense`+ `speed` AS total FROM stats;

SELECT Name,type,power
FROM move
WHERE Generation = 1 AND `type` = 'Normal'; 

SELECT * FROM pokemon WHERE `status` = 'Sub Legendary' 
OR `status` = 'Mythical' 
OR `status` = 'Legendary'
ORDER BY Generation;


