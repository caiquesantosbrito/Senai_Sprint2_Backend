using Inlock_games_WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Interfaces
{
    interface ITipoUsuarioRepository
    {
        TipoUsuarioDomain BuscarPorId(int id);
    }
}
