--DDL

CREATE DATABASE SENAI_HROADS_TARDE;

USE SENAI_HROADS_TARDE;


CREATE TABLE Tipos
(
	idTipo INT PRIMARY KEY IDENTITY
	,Tipo VARCHAR(50)
);

CREATE TABLE Habilidades
(
	idHabilidade INT PRIMARY KEY IDENTITY
	,idTipo INT FOREIGN KEY REFERENCES Tipos(idTipo)
	,Habilidade VARCHAR(70)
);

CREATE TABLE Classes
(
	idClasse INT PRIMARY KEY IDENTITY
	,Classe VARCHAR(50)
);

CREATE TABLE ClassesHabilidades
(
	idClasse INT FOREIGN KEY REFERENCES Classes(idClasse)
	,idHabilidade INT FOREIGN KEY REFERENCES Habilidades(idHabilidade)
);

CREATE TABLE Personagens 
(
	idPersonagem INT PRIMARY KEY IDENTITY
	,idClasse INT FOREIGN KEY REFERENCES Classes(idClasse)
	,Nome VARCHAR(100)
	,CapMaxVida DECIMAL(7,2)
	,CapMaxMana DECIMAL(7,2)
	,DataAtualizacao DATE
	,DataCriacao DATE
);