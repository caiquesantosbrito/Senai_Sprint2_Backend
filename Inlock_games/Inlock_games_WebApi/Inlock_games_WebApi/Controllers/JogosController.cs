using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Inlock_games_WebApi.Domains;
using Inlock_games_WebApi.Interfaces;
using Inlock_games_WebApi.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class JogosController : ControllerBase
    {
        private IJogoRepository _jogoRepository { get; set; }
        private ITipoUsuarioRepository _tipoUsuarioRepository { get; set; }

        public JogosController()
        {
            _jogoRepository = new JogoRepository();
        }

        /// <summary>
        /// Cadastra um jogo
        /// Apenas administradores podem utilizar
        /// </summary>
        /// <param name="jogo">jogo a ser cadastrado</param>
        /// <returns>jogo cadastrado</returns>
        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult CadastrarJogo(JogoDomain jogo)
        {
            //Fazer funcao buscar estudio para saber se ele existe
            _jogoRepository.CadastrarJogo(jogo);
            return StatusCode(201);
        }

        /// <summary>
        /// Lista os jogos
        /// apenas usuario logados podem utilizar
        /// </summary>
        /// <returns>OK e Lista de jogos ou NotFound</returns>
        [Authorize]
        [HttpGet]
        public IActionResult ListarJogos()
        {
            List<JogoDomain> Jogos = _jogoRepository.ListarJogos();

            if (Jogos == null)
            {
                return NotFound("Nenhum jogo encontrado");
            }
            return Ok(Jogos);
        }
    }
}
