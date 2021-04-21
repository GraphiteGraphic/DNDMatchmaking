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
    public class FilterController : Controller
    {
        private readonly FilterSqlDao filterDAO;

        public FilterController(FilterSqlDao filterDAO)
        {
            this.filterDAO = filterDAO;
        }

        [HttpGet("/faction")]
        public IActionResult GetFactions()
        {
            List<String> factions = filterDAO.GetFactions();

            if (factions != null)
            {
                return Ok(factions);
            }

            return NotFound();
        }

        [HttpGet("/race")]
        public IActionResult GetRaces()
        {
            List<String> races = filterDAO.GetRaces();

            if (races != null)
            {
                return Ok(races);
            }

            return NotFound();
        }

        [HttpGet("/origin")]
        public IActionResult GetOrigins()
        {
            List<String> origins = filterDAO.GetOrigins();

            if (origins != null)
            {
                return Ok(origins);
            }

            return NotFound();
        }

        [HttpGet("/suborigin")]
        public IActionResult GetSubOrigins()
        {
            List<String> suborigins = filterDAO.GetSubOrigins();

            if (suborigins != null)
            {
                return Ok(suborigins);
            }

            return NotFound();
        }

        [HttpGet("/subrace")]
        public IActionResult GetSubRaces()
        {
            List<SubRace> subraces = filterDAO.GetSubRaces();

            if (subraces != null)
            {
                return Ok(subraces);
            }

            return NotFound();
        }

        [HttpGet("/deity")]
        public IActionResult GetDeities()
        {
            List<String> deities = filterDAO.GetDeities();

            if (deities != null)
            {
                return Ok(deities);
            }

            return NotFound();
        }
    }
}

