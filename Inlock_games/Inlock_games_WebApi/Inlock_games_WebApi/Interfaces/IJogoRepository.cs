using Inlock_games_WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Interfaces
{
    interface IJogoRepository
    {
        void CadastrarJogo(JogoDomain jogo);

        List<JogoDomain> ListarJogos();
    }
}
