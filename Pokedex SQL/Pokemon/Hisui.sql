-- Hisui's Pokemons
INSERT INTO pokemon
(Pokedex_Number, Name, Height, Weight, Mega, Region_ID)
VALUES
(899, 'Wyrdeer', 1.8, 95.1, 'Não', 9),
(900, 'Kleavor', 1.8, 89.0, 'Não', 9),
(901, 'Ursaluna', 2.4, 290.0, 'Não', 9),
(902, 'Basculegion', 3.0, 110.0, 'Não', 9),
(903, 'Sneasler', 1.3, 43.0, 'Não', 9),
(904, 'Overqwil', 2.5, 60.5, 'Não', 9),
(905, 'Enamorus', 1.6, 48.0, 'Não', 9);

-- Pokemon's Types
INSERT INTO pokemon_type (Pokemon_ID, Type_ID)
VALUES
(899, 1),
(899, 11),
(900, 12),
(900, 13),
(901, 9),
(901, 1),
(902, 3),
(902, 14),
(903, 7),
(903, 8),
(904, 16),
(904, 8),
(905, 18),
(905, 10);

-- Stats
INSERT INTO stats
(Pokemon_ID, HP, Attack, Defense, Special_Attack, Special_Defense, Speed)
VALUES
(899, 103, 105, 72, 105, 75, 65),
(900, 70, 135, 95, 45, 70, 85),
(901, 130, 140, 105, 45, 80, 50),
(902, 120, 112, 65, 80, 75, 78),
(903, 80, 130, 60, 40, 80, 120),
(904, 85, 115, 95, 65, 65, 85),
(905, 74, 115, 70, 135, 80, 106);