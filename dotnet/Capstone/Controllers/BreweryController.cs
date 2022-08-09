using system;
using system.collections.generic;
using system.linq;
using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;


namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BreweryController : ControllerBase
    {
        private IBreweryDao breweryDao;

        public BreweryController(IBreweryDao breweryDao)
        {
            this.breweryDao = breweryDao;
        }
        
        [HttpGet("/breweries")]
        public ActionResult<List<Brewery>> AllBreweries()
        {
            return Ok(breweryDao.GetAllBreweries());
        }

        [HttpGet("/breweries/{id}")]
        public ActionResult<Brewery> BreweryById(int id)
        {
            return Ok(breweryDao.GetBreweryByBreweryId(id));
        }
        [HttpGet("/breweries/{tag}")]
        public ActionResult<List<Brewery>> BreweryByTag(string tag)
        {
            return Ok(breweryDao.GetBreweryByTag(tag))
        }
    }
}