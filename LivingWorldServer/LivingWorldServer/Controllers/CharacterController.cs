using LivingWorldServer.DAO;
using LivingWorldServer.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LivingWorldServer.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CharacterController : Controller
    {
        private readonly CharacterSqlDao characterDao;

        public CharacterController(CharacterSqlDao characterDao)
        {
            this.characterDao = characterDao;
        }

        [HttpGet]
        public IActionResult GetActiveCharacters()
        {
            List<Character> activeCharacters = characterDao.GetActiveCharacters();

            if (activeCharacters != null)
            {
                return Ok(activeCharacters);
            }

            return NotFound();
        }
    }
}
