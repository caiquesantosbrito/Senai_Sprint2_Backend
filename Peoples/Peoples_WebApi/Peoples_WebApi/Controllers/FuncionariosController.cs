using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Peoples_WebApi.Domains;
using Peoples_WebApi.Interfaces;
using Peoples_WebApi.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peoples_WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class FuncionariosController : ControllerBase
    {
        private IFuncionarioRepository _funcionarioRepository { get; set; }

        public FuncionariosController()
        {
            _funcionarioRepository = new FuncionarioRepository();
        }

        /// <summary>
        /// Lista todos os funcionarios
        /// </summary>
        /// <returns>Uma lista de funcionarios e um status code 200 - Ok</returns>
        /// dominio/api/Funcionarios
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_funcionarioRepository.Listar());
        }

        /// <summary>
        /// Cadastra um novo funcionário
        /// </summary>
        /// <param name="novoFuncionario">Objeto novoFuncionario que será cadastrado</param>
        /// <returns>Retorna os dados que foram enviados para cadastro e um status code 201 - Created</returns>
        /// dominio/api/Funcionarios
        [HttpPost]
        public IActionResult Post(FuncionarioDomain novoFuncionario)
        {
            if (novoFuncionario.Nome == null)
            {
                return BadRequest("O nome do funcionário é obrigatório!");
            }
            _funcionarioRepository.Cadastrar(novoFuncionario);

            // Retorna o status code 201 - Created com a URI e o objeto cadastrado
            return Created("http://localhost:5000/api/Funcionarios", novoFuncionario);
        }

        /// <summary>
        /// Busca um funcionário através do seu ID
        /// </summary>
        /// <param name="id">ID do funcionário que será buscado</param>
        /// <returns>Retorna um funcionário buscado ou NotFound caso nenhum seja encontrado</returns>
        /// dominio/api/Funcionarios/1
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            FuncionarioDomain funcionarioBuscado = _funcionarioRepository.BuscarPorId(id);

            if (funcionarioBuscado != null)
            {
                return Ok(funcionarioBuscado);
            }

            return NotFound("Nenhum funcionário encontrado para o identificador informado");
        }

        /// <summary>
        /// Atualiza um funcionário existente
        /// </summary>
        /// <param name="id">ID do funcionário que será atualizado</param>
        /// <param name="funcionarioAtualizado">Objeto funcionarioAtualizado que será atualizado</param>
        /// <returns>Retorna um status code</returns>
        /// dominio/api/Funcionarios/1
        [HttpPut("{id}")]
        public IActionResult Put(int id, FuncionarioDomain funcionarioAtualizado)
        {
            FuncionarioDomain funcionarioBuscado = _funcionarioRepository.BuscarPorId(id);

            if (funcionarioBuscado != null)
            {
                try
                {
                    _funcionarioRepository.Atualizar(id, funcionarioAtualizado);

                    return NoContent();
                }
                catch (Exception erro)
                {
                    return BadRequest(erro);
                }

            }

            return NotFound
                (
                    new
                    {
                        mensagem = "Funcionário não encontrado",
                        erro = true
                    }
                );
        }

        /// <summary>
        /// Deleta um funcionário
        /// </summary>
        /// <param name="id">ID do funcionário que será deletado</param>
        /// <returns>Retorna um status code com uma mensagem de sucesso ou erro</returns>
        /// dominio/api/Funcionarios/1
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            FuncionarioDomain funcionarioBuscado = _funcionarioRepository.BuscarPorId(id);

            if (funcionarioBuscado != null)
            {
                _funcionarioRepository.Deletar(id);

                return Ok($"O funcionário {id} foi deletado com sucesso!");
            }

            return NotFound("Nenhum funcionário encontrado para o identificador informado");
        }

        /// <summary>
        /// Lista todos os funcionários através de uma palavra-chave
        /// </summary>
        /// <param name="busca">Palavra-chave que será utilizada na busca</param>
        /// <returns>Retorna uma lista de funcionários encontrados</returns>
        /// dominio/api/Funcionarios/pesquisar/palavra-chave
        [HttpGet("buscar/{busca}")]
        public IActionResult GetByName(string busca)
        {
            return Ok(_funcionarioRepository.BuscarPorNome(busca));
        }

        /// <summary>
        /// Lista todos os funcionários com os nomes completos
        /// </summary>
        /// <returns>Retorna uma lista de funcionários</returns>
        /// dominio/api/Funcionarios/nomescompletos
        [HttpGet("nomescompletos")]
        public IActionResult GetFullName()
        {
            return Ok(_funcionarioRepository.ListarNomeCompleto());
        }

        /// <summary>
        /// Lista todos os funcionários de maneira ordenada pelo nome
        /// </summary>
        /// <param name="ordem">String que define a ordenação (crescente ou descrescente)</param>
        /// <returns>Retorna uma lista ordenada de funcionários</returns>
        /// dominio/api/Funcionarios/ordenacao/asc
        [HttpGet("ordenacao/{ordem}")]
        public IActionResult GetOrderBy(string ordem)
        {
            if (ordem != "ASC" && ordem != "DESC")
            {
                return BadRequest("Não é possível ordenar da maneira solicitada. Por favor, ordene por 'ASC' ou 'DESC'");
            }

            return Ok(_funcionarioRepository.ListarOrdenado(ordem));
        }
    }
}
