using Inlock_games_WebApi.Domains;
using Inlock_games_WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Repositories
{
    public class UsuarioRepository : IUsuarioRepository
    {
        private string stringConexao = "Data Source=LAPTOP-F5I3N75E\\SA; initial catalog=Inlock_games; user=sa; password=senai@132";

        public UsuarioDomain Login(string email, string senha)
        {
            using (SqlConnection con = new SqlConnection(stringConexao))
            {
                string queryBuscarEmailSenha = "SELECT Usuarios.idUsuario, Usuarios.idTipoUsuario, Usuarios.email, Usuarios.senha, TiposUsuarios.tipoUsuario FROM Usuarios INNER JOIN TiposUsuarios ON Usuarios.idTipoUsuario = TiposUsuarios.idTipoUsuario AND Usuarios.email = @email AND Usuarios.senha = @senha";
                using (SqlCommand cmd = new SqlCommand(queryBuscarEmailSenha, con))
                {
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@senha", senha);

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();

                    if (rdr.Read())
                    {
                        UsuarioDomain usuario = new UsuarioDomain
                        {
                            idUsuario = Convert.ToInt32(rdr["idUsuario"]),
                            idTipoUsuario = Convert.ToInt32(rdr["idTipoUsuario"]),
                            tipoUsuario = rdr["tipoUsuario"].ToString(),
                            email = rdr["email"].ToString(),
                            senha = rdr["senha"].ToString()
                        };

                        return usuario;
                    }
                    return null;
                }
            }
        }
    }
}
