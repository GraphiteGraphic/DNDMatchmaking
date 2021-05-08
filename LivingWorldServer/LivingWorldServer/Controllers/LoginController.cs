using LivingWorldServer.Security;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LivingWorldServer.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class LoginController : Controller
    {
        private readonly ITokenGenerator tokenGenerator;
        private readonly IDiscordHasher discordHasher;

        public LoginController(ITokenGenerator _tokenGenerator, IDiscordHasher _discordHasher)
        {
            tokenGenerator = _tokenGenerator;
            discordHasher = _discordHasher;
        }

        [HttpPost]
        public IActionResult Authenticate()
        {
            return Ok();
        }

        [HttpPut("/register")]
        public IActionResult Register()
        {
            return Ok();
        }
    }
}

