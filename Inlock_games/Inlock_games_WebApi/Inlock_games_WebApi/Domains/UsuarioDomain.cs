using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Domains
{
    public class UsuarioDomain
    {
        public int idUsuario { get; set; }

        [Required(ErrorMessage = "Informe o tipo de usuario")]
        public int idTipoUsuario { get; set; }

        public string tipoUsuario { get; set; }

        [Required(ErrorMessage = "Informe o email")]
        public string email { get; set; }

        [Required(ErrorMessage = "Informe a senha")]
        public string senha { get; set; }
    }
}
