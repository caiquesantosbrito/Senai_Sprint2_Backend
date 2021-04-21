using Inlock_games_WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Interfaces
{
    interface IUsuarioRepository
    {
        /// <summary>
        /// Verifica se login e senha estao corretos
        /// </summary>
        /// <param name="email">email do usuario</param>
        /// <param name="senha">senha do usuario</param>
        /// <returns>UsuarioDomain</returns>
        UsuarioDomain Login(string email, string senha);
    }
}
