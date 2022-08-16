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
            return Ok(reviewDao.GetAllTrails());
        }

        [HttpGet("/{trailID}")]
        public ActionResult<List<Review>> TrailsByTrailID(int trailID)
        {
            return Ok(reviewDao.GetTrailsByTrailID(trailID));
        }

        [HttpPut()]
        public IActionResult TrailPut(Trail trailParam)
        {
            IActionResult result;

            Trail trail = trailDao.updateTrail(trailParam.isCompleted);
            if (trail != null)
            {
                result = Created(trail.Name, null); //values aren't read on client
            }
            else
            {
                result = BadRequest(new { message = "An error occurred and trail was not updated." });
            }

            return result;
        }
    }
}