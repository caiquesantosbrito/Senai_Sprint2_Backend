using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Inlock_games_WebApi.Domains;
using Inlock_games_WebApi.Interfaces;
using Inlock_games_WebApi.Repositories;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Inlock_games_WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {
        private IUsuarioRepository _usuarioRepository { get; set; }

        public UsuariosController()
        {
            _usuarioRepository = new UsuarioRepository();
        }

        /// <summary>
        /// Faz login de um usuario
        /// </summary>
        /// <param name="usuarioLogado">email e senha do usuario</param>
        /// <returns>Ok e token do usuario</returns>
        [HttpPost]
        public IActionResult Login(UsuarioDomain usuarioLogado)
        {
            UsuarioDomain usuarioLogin = _usuarioRepository.Login(usuarioLogado.email, usuarioLogado.senha);

            if (usuarioLogin == null)
            {
                return StatusCode(400, "email nao preenchido");
            }

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Email, usuarioLogin.email),
                new Claim(JwtRegisteredClaimNames.Jti, usuarioLogin.idUsuario.ToString()),
                new Claim(ClaimTypes.Role, usuarioLogin.tipoUsuario)
            };

            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes("inlock_games_tarde"));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: "Inlock_games",
                audience: "Inlock_games",
                claims: claims,
                expires: DateTime.Now.AddMinutes(1),
                signingCredentials: creds
                );

            return Ok(new
            {
                token = new JwtSecurityTokenHandler().WriteToken(token)
            });
        }
    }
}
