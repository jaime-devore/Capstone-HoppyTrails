using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class ReviewDAO : IReviewDAO
    {
        //FIELDS
        //The connection string
        private readonly string connectionString;

        //CONSTRUCTOR
        public ReviewDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        //METHODS
        //I want a single Review by Review ID
        public Review GetReview(int reviewID)
        {
            Review review = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM review WHERE review_id = @REVIEWID", conn);
                cmd.Parameters.AddWithValue("@REVIEWID", reviewID);

                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    review = CreateReviewFromReader(reader);

                }
            }
            return review;
        }

        //I want a list of all Reviews
        public List<Review> GetAllReviews()
        {
            List<Review> allReviews = new List<Review>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM review",conn);

                SqlDataReader reader = cmd.ExecuteReader();

                while(reader.Read())
                {
                    Review review = CreateReviewFromReader(reader);
                    allReviews.Add(review);
                }
            }
            return allReviews;
        }

        //I want a list of all reviews by User ID
        public List<Review> GetReviewsByUserID(int userID)
        {
            List<Review> allReviews = new List<Review>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM review JOIN user_review ON review.review_id = user_review.review_id JOIN users ON user_review.user_id = users.user_id JOIN brewery ON review.brewery_id = brewery.id WHERE users.user_id = @USERID", conn);
                cmd.Parameters.AddWithValue("@USERID", userID);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Review review = CreateReviewFromReaderWithBrewery(reader);
                    allReviews.Add(review);
                }
            }

            return allReviews;
        }

        //I want a list of all review by Brewery ID
        public List<Review> GetReviewsByBreweryID(int breweryID)
        {
            List<Review> allReviews = new List<Review>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM review WHERE brewery_id = @BREWERYID", conn);
                cmd.Parameters.AddWithValue("@BREWERYID", breweryID);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Review review = CreateReviewFromReader(reader);
                    allReviews.Add(review);
                }
            }

            return allReviews;
        }

        //I want to create a new Review and push it to the DB
        public Review CreateReview(Review review)
        {
            int newReviewID = 0;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO review (brewery_id, rating, content, date) OUTPUT INSERTED.review_id VALUES (@BREWERYID, @RATING, @CONTENT, GETDATE())", conn);
                    cmd.Parameters.AddWithValue("@BREWERYID", review.BreweryId);
                    cmd.Parameters.AddWithValue("@RATING", review.Rating);
                    cmd.Parameters.AddWithValue("@CONTENT", review.Content);

                    newReviewID = Convert.ToInt32(cmd.ExecuteScalar());
                }

            Review newReview = GetReview(newReviewID);

            return newReview;
        }

        


        private Review CreateReviewFromReader(SqlDataReader reader)
        {
            Review review = new Review();

            review.ReviewId = Convert.ToInt32(reader["review_id"]);
            review.BreweryId = Convert.ToInt32(reader["brewery_id"]);
            review.Rating = Convert.ToDecimal(reader["rating"]);       
            review.Content = Convert.ToString(reader["content"]);
            //review.Date = Convert.ToDateTime(reader["date"]);

            return review;
        }

        private Review CreateReviewFromReaderWithBrewery(SqlDataReader reader)
        {
            Review review = new Review();

            review.ReviewId = Convert.ToInt32(reader["review_id"]);
            review.BreweryId = Convert.ToInt32(reader["brewery_id"]);
            review.Rating = Convert.ToDecimal(reader["rating"]);
            review.Content = Convert.ToString(reader["content"]);
            //review.Date = Convert.ToDateTime(reader["date"]);
            //review.BreweryName = Convert.ToString(reader["name"]);

            return review;
        }
    }
}
