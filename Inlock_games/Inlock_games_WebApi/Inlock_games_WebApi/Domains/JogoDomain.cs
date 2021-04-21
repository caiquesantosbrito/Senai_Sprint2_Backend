using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Domains
{
    public class JogoDomain
    {
        public int idJogo { get; set; }

        [Required(ErrorMessage = "Informe o estúdio")]
        public int idEstudio { get; set; }

        public string nomeEstudio { get; set; }

        [Required(ErrorMessage = "Informe o nome do jogo")]
        public string nomeJogo { get; set; }

        [Required(ErrorMessage = "Informe a descricao do jogo")]
        public string descricao { get; set; }

        [Required(ErrorMessage = "Informe o valor do jogo")]
        public decimal valor { get; set; }
    }
}
