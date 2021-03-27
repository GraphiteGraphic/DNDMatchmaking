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
    public class UserController : Controller
    {
        private readonly UserSqlDao userDAO;

        public UserController(UserSqlDao userDAO)
        {
            this.userDAO = userDAO;
        }

        [HttpGet]
        public IActionResult GetActiveUsers()
        {
            List<User> activePlayers = userDAO.GetActiveUsers();

            if (activePlayers != null)
            {
                return Ok(activePlayers);
            }

            return NotFound();
        }
    }
}
