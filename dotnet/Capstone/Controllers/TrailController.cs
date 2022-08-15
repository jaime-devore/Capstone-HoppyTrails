using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Capstone.Models;
using Capstone.DAO;


namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TrailController : ControllerBase
    {
        private readonly ITrailDAO trailDao;

        public TrailController(ITrailDAO _trailDao)
        {
            trailDao = _trailDao;
        }

        [HttpGet()]
        public ActionResult<List<Trail>> AllTrails()
        {
            return Ok(trailDao.GetAllTrails());
        }

        [HttpGet("{trailID}")]
        public ActionResult<List<Review>> TrailsByTrailID(int trailID)
        {
            return Ok(trailDao.GetTrailByTrailID(trailID));
        }

        //[HttpPost()]
        //public IActionResult InsertIntoTrailUserTable(int trailID, int userID)
        //{

        //}

    }
}