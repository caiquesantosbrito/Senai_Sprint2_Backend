USE Inlock_games;

INSERT INTO TiposUsuarios (tipoUsuario)
VALUES ('Comum'), ('Administrador');

INSERT INTO Usuarios (email, senha, idTipoUsuario)
VALUES ('admin@admin.com', 'admin', 2), ('cliente@cliente.com', 'cliente', 1);

INSERT INTO Estudios (nomeEstudio)
VALUES ('Blizzard'), ('Rockstar Studios'), ('Square Enix');

INSERT INTO Jogos (nomeJogo, dataLancamento, descricao, idEstudio, valor)
VALUES ('Diablo 3', '2012-05-15', '� um jogo que cont�m bastante a��o e � viciante, seja voc� um novato ou um f�', 1, 99), ('Red Dead Redemption II', '2018-10-16', 'jogo eletr�nico de a��o-aventura western', 2, 120);

