using Inlock_games_WebApi.Domains;
using Inlock_games_WebApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Repositories
{
    public class TipoUsuarioRepository : ITipoUsuarioRepository
    {
        private string stringConexao = "Data Source=LAPTOP-F5I3N75E\\SA; initial catalog=Inlock_games; user=sa; password=senai@132;";

        public TipoUsuarioDomain BuscarPorId(int id)
        {
            using (SqlConnection con = new SqlConnection(stringConexao))
            {
                string Query = "SELECT * FROM TiposUsuarios WHERE @id = idTipoUsuario";
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader rdr = cmd.ExecuteReader();

                    if (rdr.Read())
                    {
                        TipoUsuarioDomain tipoUsuario = new TipoUsuarioDomain()
                        {
                            idTipoUsuario = Convert.ToInt32(rdr["idTipoUsuario"]),
                            tipoUsuario = rdr["tipoUsuario"].ToString()
                        };
                        return tipoUsuario;
                    }
                    return null;
                }
            }
        }
    }
}
