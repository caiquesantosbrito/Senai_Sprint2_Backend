-- DQL

USE SP_Medical_Group
GO

-- Função que calcula a quantidade de médicos dado certa especialidade.
CREATE FUNCTION CalcularMedicos(
	@NomeEspecialidade VARCHAR(50)
)
RETURNS INT
	AS
		BEGIN
			DECLARE @QuantMedicos AS INT
			SET @QuantMedicos = (SELECT COUNT(medico.Nome)
			FROM medico
			INNER JOIN especialidade
			ON especialidade.IdEspecialidade = medico.IdEspecialidade
			WHERE especialidade.Especialidade = @NomeEspecialidade)
			RETURN @QuantMedicos
		END
GO
SELECT NumeroMedicos = dbo.CalcularMedicos('Anestesiologia')

-- Select simples que mostra a idade de todos os pacientes.
SELECT paciente.Nome, paciente.DataNascimento, DATEDIFF(YEAR, paciente.DataNascimento, GETDATE())
AS IdadeAtual FROM paciente;
GO

-- Stored procedure que calcula e mostra a idade dado o nome do paciente.
CREATE PROCEDURE CalcularIdade @NomePaciente VARCHAR(50)
	AS
	SELECT paciente.Nome, paciente.DataNascimento, DATEDIFF(YEAR, paciente.DataNascimento, GETDATE())
	AS IdadeAtual FROM paciente WHERE Nome = @NomePaciente
EXEC CalcularIdade @NomePaciente = 'Alexandre'

-- Selects universais.
SELECT * FROM tipoUsuario
SELECT * FROM usuario
SELECT * FROM especialidade
SELECT * FROM clinica
SELECT * FROM medico
SELECT * FROM paciente
SELECT * FROM situacao
SELECT * FROM consulta

-- Select mostrando todas as informações dos usuários.
SELECT tipoUsuario.TipoUsuario, usuario.Email, usuario.Senha FROM usuario
INNER JOIN tipoUsuario
ON usuario.IdTipoUsuario = tipoUsuario.IdTipoUsuario

-- Select mostrando todas as informações dos médicos.
SELECT usuario.Email, especialidade.Especialidade, clinica.NomeClinica, medico.Nome, medico.Crm FROM medico
INNER JOIN clinica
ON clinica.IdClinica = medico.IdClinica
INNER JOIN especialidade
ON especialidade.IdEspecialidade = medico.IdEspecialidade
INNER JOIN usuario
ON usuario.IdUsuario = medico.IdUsuario

-- Select mostrando todas as informações dos pacientes.
SELECT usuario.Email, paciente.Nome, paciente.DataNascimento, paciente.Telefone, paciente.RG, paciente.CPF, paciente.Endereco FROM paciente
INNER JOIN usuario
ON usuario.IdUsuario = paciente.IdUsuario

-- Select mostrando todas as informações das consultas.
SELECT paciente.Nome, medico.Nome, situacao.Situacao, consulta.DataConsulta, consulta.Descricao FROM consulta
INNER JOIN situacao
ON situacao.IdSituacao = consulta.IdSituacao
INNER JOIN medico
ON medico.IdMedico = consulta.IdMedico
INNER JOIN paciente
ON paciente.IdPaciente = consulta.IdPaciente