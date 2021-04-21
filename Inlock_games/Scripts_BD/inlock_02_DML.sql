USE Inlock_games;

INSERT INTO TiposUsuarios (tipoUsuario)
VALUES ('Comum'), ('Administrador');

INSERT INTO Usuarios (email, senha, idTipoUsuario)
VALUES ('admin@admin.com', 'admin', 2), ('cliente@cliente.com', 'cliente', 1);

INSERT INTO Estudios (nomeEstudio)
VALUES ('Blizzard'), ('Rockstar Studios'), ('Square Enix');

INSERT INTO Jogos (nomeJogo, dataLancamento, descricao, idEstudio, valor)
VALUES ('Diablo 3', '2012-05-15', 'é um jogo que contém bastante ação e é viciante, seja você um novato ou um fã', 1, 99), ('Red Dead Redemption II', '2018-10-16', 'jogo eletrônico de ação-aventura western', 2, 120);

