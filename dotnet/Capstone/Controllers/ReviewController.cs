using system;
using system.collections.generic;
using system.linq;
using Microsoft.AspNetCore.Mvc;
using Capstone.Models;
using Capstone.DAO;


namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ReviewController : ControllerBase
    {
        private IReviewDao reviewDao;

        public BreweryController(IReviewDao reviewDao)
        {
            this.reviewDao = reviewDao;
        }
        
        [HttpGet("/routes/reviews")]
        public ActionResult<List<Review>> AllReviews()
        {
            return Ok(reviewDao.GetAllReviews());
        }

        [HttpGet("/routes/{id}/reviews")]
        public ActionResult<List<Review>> ReviewsByRouteId(int id)
        {
            return Ok(reviewDao.GetReviews(id));
        }

        [HttpGet("/routes/reviews/{reviewId}")]
        public ActionResult<Review> SingleReviewById(int reviewId)
        {
            return Ok(reviewDao.GetReviews(reviewId));
        }

    }
}