using Inlock_games_WebApi.Domains;
using Inlock_games_WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Repositories
{
    public class JogoRepository : IJogoRepository
    {
        private string stringConexao = "Data Source =LAPTOP-F5I3N75E\\SA; initial catalog=Inlock_games; user=sa; password=senai@132";
        public void CadastrarJogo(JogoDomain jogo)
        {
            using (SqlConnection con = new SqlConnection(stringConexao))
            {
                string queryInsert = "INSERT INTO Jogos (nomeJogo, idEstudio, descricao, valor) VALUES (@nomeJogo, @idEstudio, @descricao, @valor)";
                using (SqlCommand cmd = new SqlCommand(queryInsert, con))
                {
                    cmd.Parameters.AddWithValue("@nomeJogo", jogo.nomeJogo);
                    cmd.Parameters.AddWithValue("@idEstudio", jogo.idEstudio);
                    cmd.Parameters.AddWithValue("@descricao", jogo.descricao);
                    cmd.Parameters.AddWithValue("@valor", jogo.valor);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public List<JogoDomain> ListarJogos()
        {
            using (SqlConnection con = new SqlConnection(stringConexao))
            {
                string QueryListar = "SELECT Jogos.idJogo, Jogos.nomeJogo, Jogos.idEstudio, Jogos.descricao, Jogos.valor, Estudios.nomeEstudio FROM Jogos LEFT JOIN Estudios ON Jogos.idEstudio = Estudios.idEstudio";

                using (SqlCommand cmd = new SqlCommand(QueryListar, con))
                {
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    List<JogoDomain> Jogos = new List<JogoDomain>();
                    while (rdr.Read())
                    {
                        JogoDomain jogo = new JogoDomain()
                        {
                            idJogo = Convert.ToInt32(rdr["idJogo"]),
                            nomeJogo = rdr["nomeJogo"].ToString(),
                            idEstudio = Convert.ToInt32(rdr["idEstudio"]),
                            descricao = rdr["descricao"].ToString(),
                            valor = Convert.ToDecimal(rdr["valor"]),
                            nomeEstudio = rdr["nomeEstudio"].ToString()
                        };
                        Jogos.Add(jogo);
                    }
                    return Jogos;
                }
            }
        }
    }
}

