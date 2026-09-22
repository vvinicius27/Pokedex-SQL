-- Criar Database
create database Pokedex
default character set utf8mb4
default collate utf8mb4_general_ci;

-- Selecionar Database
use pokedex;

-- Criar tabelas
create table region(
region_id int primary key not null auto_increment,
name varchar(15) not null,
generation int not null
) default charset = utf8mb4;

create table pokemon(
Pokemon_id int primary key not null auto_increment,
National_dex_number int unique not null,
Name varchar(15) not null,
Height decimal(3,1) not null,
Weight decimal(5,1) not null,
Mega varchar(3) not null,
Region_ID int not null
) default charset = utf8mb4;

alter table pokemon
add foreign key (Region_ID) references region(Region_ID);

describe pokemon;

create table type(
Type_ID int not null primary key,
Type_Name varchar(10) not null
)default charset = utf8mb4;

describe type;

create table pokemon_type(
Pokemon_ID int not null,
Type_ID int not null,
primary key (Pokemon_ID, Type_ID),
foreign key (Pokemon_ID) references pokemon (Pokemon_ID),
foreign key (Type_ID) references type (Type_ID)
) default charset = utf8mb4;

describe pokemon_type;

create table stats(
Pokemon_ID int not null,
HP int not null,
Attack int not null,
Defense int not null,
Special_Attack int not null,
Special_Defense int not null,
Speed int not null,
primary key (Pokemon_ID),
foreign key (Pokemon_ID) references pokemon (Pokemon_ID)
) default charset = utf8mb4;

describe stats;
