using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IReviewDAO
    {
        //METHODS

        //I want a single Review by Review ID
        public Review GetReview(int reviewID);

        //I want a list of all Reviews
        public List<Review> GetAllReviews();

        //I want a list of all reviews by User ID
        public List<Review> GetReviewsByUserID(int userID);

        //I want a list of all review by Brewery ID
        public List<Review> GetReviewsByBreweryID(int breweryID);


    }
}
