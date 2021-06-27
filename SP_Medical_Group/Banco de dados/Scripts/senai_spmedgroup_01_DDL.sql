-- DDL

CREATE DATABASE SP_Medical_Group
GO

USE SP_Medical_Group
GO

CREATE TABLE tipoUsuario(
	IdTipoUsuario		INT PRIMARY KEY IDENTITY
	,TipoUsuario		VARCHAR(20) UNIQUE NOT NULL
);
GO

CREATE TABLE usuario(
	IdUsuario			INT PRIMARY KEY IDENTITY
	,IdTipoUsuario		INT FOREIGN KEY REFERENCES tipoUsuario(IdTipoUsuario)
	,Senha				VARCHAR(20) NOT NULL
	,Email				VARCHAR(50) NOT NULL
);
GO

CREATE TABLE especialidade(
	IdEspecialidade		INT PRIMARY KEY IDENTITY
	,Especialidade		VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE clinica(
	IdClinica			INT PRIMARY KEY IDENTITY
	,CNPJ				CHAR(18) UNIQUE NOT NULL
	,NomeClinica		VARCHAR(50) NOT NULL
	,RazaoSocial		VARCHAR(50) NOT NULL
	,Endereco			VARCHAR(150) 
);
GO

CREATE TABLE medico(
	IdMedico			INT PRIMARY KEY IDENTITY
	,IdUsuario			INT FOREIGN KEY REFERENCES usuario(IdUsuario)
	,IdEspecialidade	INT FOREIGN KEY REFERENCES especialidade(IdEspecialidade)
	,IdClinica			INT FOREIGN KEY REFERENCES clinica(IdClinica)
	,Nome				VARCHAR(100) NOT NULL
	,CRM				CHAR(8) UNIQUE NOT NULL
);
GO

CREATE TABLE paciente(
	IdPaciente			INT PRIMARY KEY IDENTITY
	,IdUsuario			INT FOREIGN KEY REFERENCES usuario(IdUsuario)
	,Nome				VARCHAR(155) NOT NULL
	,DataNascimento		DATE NOT NULL
	,Telefone			INT 
	,RG					VARCHAR(15) UNIQUE
	,CPF				VARCHAR(15) UNIQUE
	,Endereco			VARCHAR(100)
);
GO

CREATE TABLE situacao(
	IdSituacao			INT PRIMARY KEY IDENTITY
	,Situacao			VARCHAR(50) UNIQUE DEFAULT('Agendada')
);
GO

CREATE TABLE consulta(
	IdConsulta			INT PRIMARY KEY IDENTITY
	,IdPaciente			INT FOREIGN KEY REFERENCES paciente(IdPaciente)
	,IdMedico			INT FOREIGN KEY REFERENCES medico(IdMedico)
	,IdSituacao			INT FOREIGN KEY REFERENCES situacao(IdSituacao) DEFAULT(1)
	,DataConsulta		DATETIME NOT NULL
	,Descricao			VARCHAR(255)
);
GO