using System;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public class UserSqlDao : IUserDao
    {
        private readonly string connectionString;

        public UserSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public User GetUser(string username)
        {
            User returnUser = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT user_id, username, password_hash, salt, user_role FROM users WHERE username = @username", conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        returnUser = GetUserFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnUser;
        }

        public User AddUser(string username, string password, string role)
        {
            IPasswordHasher passwordHasher = new PasswordHasher();
            PasswordHash hash = passwordHasher.ComputeHash(password);

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO users (username, password_hash, salt, user_role) VALUES (@username, @password_hash, @salt, @user_role)", conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password_hash", hash.Password);
                    cmd.Parameters.AddWithValue("@salt", hash.Salt);
                    cmd.Parameters.AddWithValue("@user_role", role);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return GetUser(username);
        }

        //I want to get a username from a review 
        public User GetUserFromReview(int reviewID)
        {
            User user = new User();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM users JOIN user_review ON users.user_id = user_review.user_id JOIN review ON user_review.review_id = review.review_id WHERE review.review_id = @REVIEWID", conn);
                cmd.Parameters.AddWithValue("@REVIEWID", reviewID);

                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    user = GetUserFromReader(reader);
                }
            }

            return user;
        }

        public List<Trail> GetTrailsByUserID(int userID)
        {
            List<Trail> allTrails = new List<Trail>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM trails JOIN trail_user ON trails.trail_id = trail_user.trail_id JOIN users ON trail_user.user_id = users.user_id WHERE users.user_id = @USERID", conn);
                cmd.Parameters.AddWithValue("@USERID", userID);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Trail trail = CreateTrailFromReader(reader);
                    allTrails.Add(trail);
                }
            }

            return allTrails;
        }

        public Trail MarkTrailCompleted(Trail trail)
        {
            int trailID = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("UPDATE trails SET is_completed = @ISCOMPLETED WHERE trails.trail_id = @TRAILID", conn);
                cmd.Parameters.AddWithValue("@ISCOMPLETED", trail.Is_Completed);
                cmd.Parameters.AddWithValue("@TRAILID", trail.TrailID);
            }

            return null;
        }

        private User GetUserFromReader(SqlDataReader reader)
        {
            User u = new User()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                Username = Convert.ToString(reader["username"]),
                PasswordHash = Convert.ToString(reader["password_hash"]),
                Salt = Convert.ToString(reader["salt"]),
                Role = Convert.ToString(reader["user_role"]),
            };

            return u;
        }

        private Trail CreateTrailFromReader(SqlDataReader reader)
        {
            Trail trail = new Trail();

            trail.TrailID = Convert.ToInt32(reader["trail_id"]);
            trail.TrailName = Convert.ToString(reader["type"]);

            return trail;
        }


    }
}
