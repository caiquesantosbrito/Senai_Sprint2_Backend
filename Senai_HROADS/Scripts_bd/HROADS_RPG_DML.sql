--DML

USE SENAI_HROADS_TARDE;

INSERT INTO Classes (NomeClasse)
VALUES	('Barbaro'), ('Cruzada'), ('Caçadora de Demonios'),
		('Monge'), ('Necromante'), ('Feiticeiro'), ('Arcanista');

INSERT INTO Personagens (IdClasse, Nome, VidaMaxima, ManaMaxima, DataAtualizacao, DataCriacao)
VALUES	(1, 'DeuBug', 100, 80, '01/03/2021', '18/01/2019'),
		(4, 'BitBug', 70, 100, '02/03/2021', '17/03/2016'),
		(7,'Fer8', 75, 60, '03/03/2021', '18/03/2018');

INSERT INTO TipoHabilidade (QualTipoHabilidade)
VALUES	('Ataque'),('Defesa'), ('Cura'), ('Magia');

INSERT INTO Habilidades (IdTipoHabilidade, NomeHabilidade)
VALUES	(1, 'Lança Mortal'),
		(2, 'Escudo Supremo'),
		(3, 'Recuperar Vida');

INSERT INTO ClasseHabilidade (IdClasse, IdHabilidade)
VALUES	(1, 1),
		(1, 2),
		(2, 2),
		(3, 1),
		(4, 2),
		(4, 3),
		(6, 3);

UPDATE Personagens 
SET Nome = 'Fer7' WHERE IdPersonagem = 3;

UPDATE Classes
SET NomeCLasse = 'Necromante' WHERE IdClasse = 5;





