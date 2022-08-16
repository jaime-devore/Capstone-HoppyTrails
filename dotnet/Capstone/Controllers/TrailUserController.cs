using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using Capstone.DAO;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TrailUserController : ControllerBase
    {
        private readonly ITrailUserDAO trailUserDAO;

        public TrailUserController(ITrailUserDAO _trailUserDAO)
        {
            trailUserDAO = _trailUserDAO;
        }

        [HttpGet("{trailUserID}")]
        public ActionResult<TrailUser> GetTrailUser(int trailUserID)
        {

            TrailUser trailUser = trailUserDAO.GetTrailUser(trailUserID);

            return Ok(trailUser);
        }

        [HttpPost()]
        public ActionResult<TrailUser> CreateTrailUser(TrailUser trailUser)
        {
            TrailUser newTrailUser = trailUserDAO.CreateTrailUser(trailUser);

            return Created($"{newTrailUser.TrailUserID}", newTrailUser);
        }
    }
}
