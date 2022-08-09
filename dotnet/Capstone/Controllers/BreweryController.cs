using system;
using system.collections.generic;
using system.linq;
using Microsoft.AspNetCore.Mvc;


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
            return Ok(breweryDao.GetBrewery(id));
        }
    }
}