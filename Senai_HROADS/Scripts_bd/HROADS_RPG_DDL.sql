--DDL

CREATE DATABASE SENAI_HROADS_TARDE;

USE SENAI_HROADS_TARDE;

CREATE TABLE Classes
(
	IdClasse			INT PRIMARY KEY IDENTITY,
	NomeClasse			VARCHAR(200),
);
CREATE TABLE Personagens
(
	IdPersonagem		INT PRIMARY KEY IDENTITY,
	IdClasse			INT FOREIGN KEY REFERENCES Classes(IdClasse),
	Nome				VARCHAR(200),
	VidaMaxima			INT,
	ManaMaxima			INT,
	DataAtualizacao		DATE,
	DataCriacao			DATE,
);
CREATE TABLE TipoHabilidade
(
	IdTipoHabilidade	INT PRIMARY KEY IDENTITY,
	QualTipoHabilidade	VARCHAR(200),
);
CREATE TABLE Habilidades
(
	IdHabilidade		INT PRIMARY KEY IDENTITY,
	NomeHabilidade		VARCHAR(200),
	IdTipoHabilidade	INT FOREIGN KEY REFERENCES TipoHabilidade(IdTipoHabilidade),
);
CREATE TABLE ClasseHabilidade
(
	IdClasse			INT FOREIGN KEY REFERENCES Classes(IdClasse),
	IdHabilidade		INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade),
);

