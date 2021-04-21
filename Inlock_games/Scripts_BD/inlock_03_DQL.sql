USE Inlock_games;

SELECT Usuarios.email, Usuarios.senha, TipoUsuario FROM Usuarios 
LEFT JOIN TiposUsuarios
ON Usuarios.idTipoUsuario = TiposUsuarios.idTipoUsuario;

SELECT * FROM Estudios;

SELECT * FROM Jogos;

SELECT Jogos.idJogo, Jogos.nomeJogo, Estudios.nomeEstudio, Jogos.descricao, Jogos.valor FROM Jogos
LEFT JOIN Estudios
ON Jogos.idEstudio = Estudios.idEstudio;

SELECT Estudios.nomeEstudio, Jogos.nomeJogo FROM Estudios
FULL OUTER JOIN Jogos
ON Estudios.idEstudio = Jogos.idJogo;

SELECT * FROM Usuarios
WHERE email = 'cliente@cliente.com' AND senha = 'cliente';

SELECT * FROM Jogos
WHERE idJogo = 1;

SELECT * FROM Estudios
WHERE idEstudio = 1;