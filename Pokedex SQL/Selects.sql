-- Mostra todas as colunas e todos os Pokémon
SELECT *
FROM pokemon;

-- Mostra os dados do Pokémon de número 25
SELECT *
FROM pokemon
WHERE Pokedex_Number = 25;

-- Mostra Pokémon cujo peso é maior que 100 kg
SELECT Name, Weight
FROM pokemon
WHERE Weight > 100;

-- Ordena os Pokémon do mais pesado para o mais leve
SELECT Name, Weight
FROM pokemon
ORDER BY Weight DESC;

-- Ordena pelo peso e mostra somente os 10 primeiros
SELECT Name, Weight
FROM pokemon
ORDER BY Weight DESC
LIMIT 10;

-- Seleciona Pokémon pertencentes às três primeiras regiões
SELECT Name, Region_ID
FROM pokemon
WHERE Region_ID IN (1, 2, 3);

-- Procura Pokémon do tipo Fire
-- e que também pesam mais de 100 kg
SELECT p.Name, p.Weight
FROM pokemon p
JOIN pokemon_type pt ON p.Pokemon_ID = pt.Pokemon_ID
JOIN type t ON pt.Type_ID = t.Type_ID
WHERE t.Type_Name = 'Fire'
AND p.Weight > 100;

-- Junta Pokémon com sua região
SELECT
    p.Pokedex_Number,
    p.Name,
    r.Name AS Region
FROM pokemon p
JOIN region r ON p.Region_ID = r.Region_ID;

-- Mostra Pokémon pertencentes à região de Sinnoh
SELECT
    p.Pokedex_Number,
    p.Name,
    r.Name AS Region
FROM pokemon p
JOIN region r ON p.Region_ID = r.Region_ID
WHERE r.Name = 'Sinnoh';

-- Conta quantos Pokémon existem em cada região
SELECT
    r.Name AS Region,
    COUNT(p.Pokemon_ID) AS Total_Pokemon
FROM region r
JOIN pokemon p ON r.Region_ID = p.Region_ID
GROUP BY r.Region_ID, r.Name;

-- Conta quantos Pokémon possuem cada tipo
SELECT
    t.Type_Name,
    COUNT(pt.Pokemon_ID) AS Total_Pokemon
FROM type t
JOIN pokemon_type pt ON t.Type_ID = pt.Type_ID
GROUP BY t.Type_ID, t.Type_Name
ORDER BY Total_Pokemon DESC;

-- Agrupa por tipo e mostra somente os tipos
-- que possuem mais de 100 Pokémon
SELECT
    t.Type_Name,
    COUNT(pt.Pokemon_ID) AS Total_Pokemon
FROM type t
JOIN pokemon_type pt ON t.Type_ID = pt.Type_ID
GROUP BY t.Type_ID, t.Type_Name
HAVING COUNT(pt.Pokemon_ID) > 100;

-- Junta Pokémon com suas estatísticas
-- e mostra aqueles com Attack superior a 120
SELECT
    p.Name,
    s.Attack
FROM pokemon p
JOIN stats s ON p.Pokemon_ID = s.Pokemon_ID
WHERE s.Attack > 120
ORDER BY s.Attack DESC;

-- Soma todos os atributos de cada Pokémon
-- e mostra os 10 com maior total
SELECT
    p.Name,
    (s.HP + s.Attack + s.Defense +
     s.Special_Attack + s.Special_Defense + s.Speed) AS Total_Stats
FROM pokemon p
JOIN stats s ON p.Pokemon_ID = s.Pokemon_ID
ORDER BY Total_Stats DESC
LIMIT 10;

-- Mostra Pokémon Dragon que possuem Attack acima de 100
SELECT
    p.Name,
    t.Type_Name,
    s.Attack
FROM pokemon p
JOIN pokemon_type pt ON p.Pokemon_ID = pt.Pokemon_ID
JOIN type t ON pt.Type_ID = t.Type_ID
JOIN stats s ON p.Pokemon_ID = s.Pokemon_ID
WHERE t.Type_Name = 'Dragon'
AND s.Attack > 100
ORDER BY s.Attack DESC;

-- Procura Pokémon que possuem simultaneamente
-- os tipos Fire e Flying
SELECT
    p.Name
FROM pokemon p
JOIN pokemon_type pt ON p.Pokemon_ID = pt.Pokemon_ID
JOIN type t ON pt.Type_ID = t.Type_ID
WHERE t.Type_Name IN ('Fire', 'Flying')
GROUP BY p.Pokemon_ID, p.Name
HAVING COUNT(DISTINCT t.Type_ID) = 2;

-- Mostra Pokémon que possuem Mega
SELECT
    Pokedex_Number,
    Name,
    Mega
FROM pokemon
WHERE Mega = 'Sim';

-- Mostra os Pokémon do tipo Dragon
-- com Attack acima de 100,
-- mostrando também sua região e Generation
SELECT
    p.Pokedex_Number,
    p.Name,
    t.Type_Name,
    r.Name AS Region,
    r.Generation,
    s.Attack
FROM pokemon p
JOIN pokemon_type pt ON p.Pokemon_ID = pt.Pokemon_ID
JOIN type t ON pt.Type_ID = t.Type_ID
JOIN region r ON p.Region_ID = r.Region_ID
JOIN stats s ON p.Pokemon_ID = s.Pokemon_ID
WHERE t.Type_Name = 'Dragon'
AND s.Attack > 100
ORDER BY s.Attack DESC;

-- Mostra cada Pokémon em uma única linha
-- e junta seus tipos na mesma coluna
SELECT
    p.Pokedex_Number,
    p.Name,
    GROUP_CONCAT(t.Type_Name ORDER BY t.Type_ID SEPARATOR ' / ') AS Types
FROM pokemon p
JOIN pokemon_type pt ON p.Pokemon_ID = pt.Pokemon_ID
JOIN type t ON pt.Type_ID = t.Type_ID
GROUP BY p.Pokemon_ID, p.Pokedex_Number, p.Name
ORDER BY p.Pokedex_Number;

-- Mostra os tipos em duas colunas separadas
SELECT
    p.Pokedex_Number,
    p.Name,
    MAX(CASE WHEN pt.Type_ID = (
        SELECT MIN(pt2.Type_ID)
        FROM pokemon_type pt2
        WHERE pt2.Pokemon_ID = p.Pokemon_ID
    ) THEN t.Type_Name END) AS Type_1,
    MAX(CASE WHEN pt.Type_ID = (
        SELECT MAX(pt2.Type_ID)
        FROM pokemon_type pt2
        WHERE pt2.Pokemon_ID = p.Pokemon_ID
    ) THEN t.Type_Name END) AS Type_2
FROM pokemon p
JOIN pokemon_type pt ON p.Pokemon_ID = pt.Pokemon_ID
JOIN type t ON pt.Type_ID = t.Type_ID
GROUP BY p.Pokemon_ID, p.Pokedex_Number, p.Name
ORDER BY p.Pokedex_Number;