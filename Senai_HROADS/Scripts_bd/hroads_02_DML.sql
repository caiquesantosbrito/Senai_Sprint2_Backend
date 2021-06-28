--DML

USE SENAI_HROADS_TARDE;

INSERT INTO Tipos(Tipo)
VALUES  ('Ataque')
	   ,('Defesa')
	   ,('Cura')
	   ,('Magia');

INSERT INTO Habilidades(idTipo, Habilidade)
VALUES  (1, 'Lança Mortal')
		,(2, 'Escudo Supremo')
		,(3, 'Recuperar Vida');

INSERT INTO Classes(Classe)
VALUES   ('Barbaro')
		 ,('Cruzada')
		 ,('Caçadora de Demonios')
		 ,('Monge')
		 ,('Necromante')
		 ,('Feiticeiro')
		 ,('Arcanista');

INSERT INTO ClassesHabilidades(idClasse, idHabilidade)
VALUES   (1,	1)
		,(1,	2)
		,(2,	2)
		,(3,	1)
		,(4,	2)
		,(4,	3)
		,(6,	3);

INSERT INTO Personagens(idClasse, Nome, CapMaxVida, CapMaxMana, DataAtualizacao, DataCriacao)
VALUES	 (1,	'DeuBug',	100,	80,		CONVERT (DATE, GETDATE()),	'2019-01-18')
		,(4,	'BitBug',	70,		100,	CONVERT (DATE, GETDATE()),	'2016-03-17')
		,(7,	'Fer8',		75,		60,		CONVERT (DATE, GETDATE()),	'2018-03-18')

-- Atualizar o nome do personagem Fer8 para Fer7;
UPDATE Personagens
SET Nome = 'Fer7'
WHERE idPersonagem = 3

-- Atualizar o nome da classe de Necromante para Necromancer;
UPDATE Classes
SET Classe = 'Necromancer'
WHERE idClasse = 5