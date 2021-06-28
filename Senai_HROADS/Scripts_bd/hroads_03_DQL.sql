--DQL 

USE SENAI_HROADS_TARDE

-- 6.Selecionar todos os personagens;
SELECT Personagens.Nome, Personagens.CapMaxVida, Personagens.CapMaxMana
FROM Personagens;

--7.Selecionar todos as classes;
SELECT * From Classes;

--8.Selecionar somente o nome das classes;
SELECT Classes.Classe From Classes;

--9.Selecionar todas as habilidades;
SELECT Habilidades.Habilidade FROM Habilidades;

--10.Realizar a contagem de quantas habilidades estão cadastradas;
SELECT COUNT (*) AS Numero_de_Habilidades FROM Habilidades;

--11.Selecionar somente os id’s das habilidades classificando-os por ordem crescente;
SELECT Habilidades.idHabilidade FROM Habilidades ORDER BY idHabilidade;

--12.Selecionar todos os tipos de habilidades;
SELECT Habilidades.Habilidade FROM Habilidades;

--13.	Selecionar todas as habilidades e a quais tipos de habilidades elas fazem parte;
SELECT Habilidades.Habilidade, Tipos.Tipo
FROM Habilidades
LEFT JOIN Tipos
ON Tipos.idTipo = Habilidades.idTipo;

--14.	Selecionar todos os personagens e suas respectivas classes;
SELECT Personagens.Nome, Classes.Classe
FROM Personagens
LEFT JOIN Classes
ON Classes.idClasse = Personagens.idClasse;

--15.Selecionar todos os personagens e as classes (mesmo que elas não tenham correspondência em personagens);
SELECT Personagens.Nome, Classes.Classe
FROM Personagens
RIGHT JOIN Classes
ON Classes.idClasse = Personagens.idClasse;

--16.Selecionar todas as classes e suas respectivas habilidades;
SELECT Classes.Classe, Habilidades.Habilidade
FROM ClassesHabilidades
LEFT JOIN Classes
ON Classes.idClasse = ClassesHabilidades.idClasse
LEFT JOIN Habilidades
ON Habilidades.idHabilidade = ClassesHabilidades.idHabilidade;

--17.	Selecionar todas as habilidades e suas classes (somente as que possuem correspondência);
SELECT Habilidades.Habilidade, Classes.Classe
FROM ClassesHabilidades
LEFT JOIN Habilidades
ON Habilidades.idHabilidade = ClassesHabilidades.idHabilidade
LEFT JOIN Classes
ON Classes.idClasse = ClassesHabilidades.idClasse;

--18.Selecionar todas as habilidades e suas classes (mesmo que elas não tenham correspondência).
SELECT Habilidades.Habilidade, Classes.Classe
FROM ClassesHabilidades
FULL OUTER JOIN Habilidades
ON Habilidades.idHabilidade = ClassesHabilidades.idHabilidade
FULL OUTER JOIN Classes
ON Classes.idClasse = ClassesHabilidades.idClasse;