# Pokedex SQL

Um banco de dados relacional em SQL que recria uma Pokedex, com tabelas de Pokémon organizadas por região, tipos e dados gerais, além de consultas de exemplo para explorar os dados.

## Estrutura do projeto

```
Pokedex SQL/
├── Pokedex/
│   └── Pokedex.sql        # Criação do banco e das tabelas (pokemon, region, ...)
├── Region/
│   └── Region.sql         # Inserção das regiões (Kanto a Paldea)
├── Types/
│   └── Types.sql          # Inserção dos tipos de Pokémon (Fire, Water, Grass, ...)
├── Pokemon/
│   ├── Kanto.sql
│   ├── Johto.sql
│   ├── Hoenn.sql
│   ├── Sinnoh.sql
│   ├── Unova.sql
│   ├── Kalos.sql
│   ├── Alola.sql
│   ├── Galar.sql
│   ├── Hisui.sql
│   └── Paldea.sql         # Dados dos Pokémon de cada região
└── Selects.sql             # Consultas (SELECTs) de exemplo
```

## Tabelas

- **region** — id, nome e geração de cada região (Kanto, Johto, Hoenn, Sinnoh, Unova, Kalos, Alola, Galar, Hisui, Paldea)
- **pokemon** — número da Pokedex nacional, nome, altura, peso, se possui Mega Evolução e a região de origem (chave estrangeira para `region`)
- **type** — os 18 tipos de Pokémon (Normal, Fire, Water, Electric, etc.)

## Como usar

1. Rode o script `Pokedex/Pokedex.sql` para criar o banco de dados e as tabelas.
2. Rode `Region/Region.sql` e `Types/Types.sql` para popular as regiões e os tipos.
3. Rode os arquivos dentro de `Pokemon/` para popular os Pokémon de cada região.
4. Use `Selects.sql` como referência de consultas, como:
   - Listar todos os Pokémon
   - Buscar um Pokémon pelo número da Pokedex
   - Filtrar Pokémon por peso
   - Ordenar por peso (mais pesado → mais leve)
   - Filtrar Pokémon por região

## Tecnologia

- SQL (MySQL)

## Status

Projeto em desenvolvimento — novas regiões, tabelas e consultas podem ser adicionadas.
