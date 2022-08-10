using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.DAO;
using Capstone.Models;

namespace Capstone.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TagController : Controller
    {
        //FIELDS
        //A field to hold an instance of the TagDAO
        private readonly ITagDAO tagDAO;

        //CONSTRUCTOR
        //Creates the Controller and Dependecy Injects the DAO

        public TagController(ITagDAO _tagDAO)
        {
            tagDAO = _tagDAO;
        }

        //METHODS
        [HttpGet("{tagID}")]
        public ActionResult<Tag> GetTagByTagID(int tagID)
        {
            Tag tag = tagDAO.GetTagByTagID(tagID);

            return Ok(tag);
        }

        [HttpGet()]
        public ActionResult<List<Tag>> GetAllTags()
        {
            List<Tag> allTags = tagDAO.GetAllTags();

            return Ok(allTags);
        }

        [HttpGet("{tagID}/breweries")]
        public ActionResult<List<Brewery>> GetBreweriesByTagID(int tagID)
        {
            List<Brewery> allBreweriesWithTag = tagDAO.GetBreweriesByTagID(tagID);

            return Ok(allBreweriesWithTag);
        }
    }
}
