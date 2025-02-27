create database Brasil;

create table regiao(
id_regiao int not null primary key,
sigla varchar(2),
nome varchar(100)
);

create table estado (
id_estado int not null primary key,
sigla varchar(2),
nome varchar(100),
id_regiao int 
);

alter table estado 
add foreign key (id_regiao) references regiao (id_regiao);

create table municipios (
id_municipio int not null primary key,
nome varchar(100),
id_estado int
);

alter table municipios
add foreign key (id_estado) references estado (id_estado);