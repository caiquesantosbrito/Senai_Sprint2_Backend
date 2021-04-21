CREATE DATABASE Inlock_games;
GO

USE Inlock_games;

CREATE TABLE Estudios
(
	idEstudio		INT PRIMARY KEY IDENTITY,
	nomeEstudio		VARCHAR(200)
);

CREATE TABLE Jogos
(
	idJogo			INT PRIMARY KEY IDENTITY,
	idEstudio		INT FOREIGN KEY REFERENCES Estudios (idEstudio),
	nomeJogo		VARCHAR(200),
	descricao		VARCHAR(200),
	dataLancamento	DATE,
	valor			DECIMAL(7,2),
);

CREATE TABLE TiposUsuarios
(
	idTipoUsuario	INT PRIMARY KEY IDENTITY,
	tipoUsuario		VARCHAR(200)
);

CREATE TABLE Usuarios
(
	idUsuario		INT PRIMARY KEY IDENTITY,
	idTipoUsuario	INT FOREIGN KEY REFERENCES TiposUsuarios (idTipoUsuario),
	email			VARCHAR(200),
	senha			VARCHAR(200)
);