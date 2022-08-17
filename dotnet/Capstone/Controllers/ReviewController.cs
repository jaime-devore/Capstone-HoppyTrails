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
    public class ReviewController : ControllerBase
    {
        private readonly IReviewDAO reviewDao;


        public ReviewController(IReviewDAO _reviewDao)
        {
            reviewDao = _reviewDao;
          
        }

        [HttpGet()]
        public ActionResult<List<Review>> AllReviews()
        {
            return Ok(reviewDao.GetAllReviews());
        }

        [HttpGet("breweries/{breweryID}")]
        public ActionResult<List<Review>> ReviewsByBreweryID(int breweryID)
        {
            return Ok(reviewDao.GetReviewsByBreweryID(breweryID));
        }

        [HttpGet("{reviewId}")]
        public ActionResult<Review> SingleReviewById(int reviewId)
        {
            return Ok(reviewDao.GetReview(reviewId));
        }

        [HttpGet("users/{userID}")]
        public ActionResult<List<Review>> GetAllReviewsByUserID(int userID)
        {
            List<Review> allReviews = reviewDao.GetReviewsByUserID(userID);

            return Ok(allReviews);
        }

        [HttpPost()]
        public ActionResult<Review> CreateNewReview(Review review)
        {
            
            Review newReview = reviewDao.CreateReview(review);

            return Created($"{newReview.ReviewId}", newReview);
        }

    }
}