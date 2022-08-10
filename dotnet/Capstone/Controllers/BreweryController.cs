using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;



namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BreweryController : ControllerBase
    {
        private readonly IBreweryDAO breweryDao;

        public BreweryController(IBreweryDAO _breweryDao)
        {
            breweryDao = _breweryDao;
        }
        
        [HttpGet()]
        public ActionResult<List<Brewery>> AllBreweries()
        {
            return Ok(breweryDao.GetAllBreweries());
        }

        [HttpGet("{breweryID}")]
        public ActionResult<Brewery> BreweryById(int breweryID)
        {
            return Ok(breweryDao.GetBreweryByBreweryID(breweryID));
        }

        [HttpGet("beers/{breweryID}")]
        public ActionResult<List<Beer>> BeersByBreweryID(int breweryID)
        {
            return Ok(breweryDao.GetBeersByBreweryID(breweryID));
        }
    }
}