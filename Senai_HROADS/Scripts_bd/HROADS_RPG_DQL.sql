--DQL

USE SENAI_HROADS_TARDE;

--Selecionar todos os personagens
SELECT * FROM Personagens;

--Selecionar todos as classes
SELECT * FROM Classes;

--Selecionar somente o nome das classes
SELECT NomeClasse FROM Classes;

--Selecionar todas as habilidades
SELECT * FROM Habilidades;

--Realizar a contagem de quantas habilidades estão cadastradas
SELECT COUNT (IdHabilidade) AS QuantHabilidades FROM Habilidades;

--Selecionar somente os id’s das habilidades classificando-os por ordem crescente
SELECT IdHabilidade FROM Habilidades ORDER BY IdHabilidade;

--Selecionar todos os tipos de habilidades;
SELECT NomeHabilidade FROM Habilidades;

--Selecionar todas as habilidades e a quais tipos de habilidades elas fazem parte
SELECT Habilidades.NomeHabilidade, TipoHabilidade.QualTipoHabilidade
FROM Habilidades
LEFT JOIN TipoHabilidade
ON Habilidades.IdTipoHabilidade = TipoHabilidade.IdTipoHabilidade;

--Selecionar todos os personagens e suas respectivas classes
SELECT Personagens.Nome, Classes.NomeClasse
FROM Personagens
LEFT JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse;

--Selecionar todos os personagens e as classes (mesmo que elas não tenham correspondência em personagens)
SELECT Personagens.Nome, Classes.NomeClasse
FROM Personagens
RIGHT JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse

--Selecionar todas as classes e suas respectivas habilidades
SELECT Classes.NomeClasse, Habilidades.NomeHabilidade
FROM ClasseHabilidade
INNER JOIN Classes
ON ClasseHabilidade.IdClasse = Classes.IdClasse
INNER JOIN Habilidades
ON ClasseHabilidade.IdHabilidade = Habilidades.IdHabilidade

--Selecionar todas as habilidades e suas classes (somente as que possuem correspondência)
SELECT Habilidades.NomeHabilidade, Classes.NomeClasse
FROM ClasseHabilidade
INNER JOIN Habilidades
ON ClasseHabilidade.IdHabilidade = Habilidades.IdHabilidade
INNER JOIN Classes
ON ClasseHabilidade.IdClasse = Classes.IdClasse


--Selecionar todas as habilidades e suas classes (mesmo que elas não tenham correspondência)
SELECT Habilidades.NomeHabilidade, Classes.NomeClasse
FROM ClasseHabilidade
FULL OUTER JOIN Habilidades
ON ClasseHabilidade.IdHabilidade = Habilidades.IdHabilidade
FULL OUTER JOIN Classes
ON ClasseHabilidade.IdClasse = Classes.IdClasse 