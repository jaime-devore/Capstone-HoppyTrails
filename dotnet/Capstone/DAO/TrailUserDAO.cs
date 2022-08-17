using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO
{
    public class TrailUserDAO : ITrailUserDAO
    {
        private readonly string connectionString;

        public TrailUserDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public TrailUser GetTrailUser(int trailUserID)
        {
            TrailUser trailUser = new TrailUser();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM trail_user WHERE trail_user_id = @TRAILUSER", conn);
                cmd.Parameters.AddWithValue("@TRAILUSER", trailUserID);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    trailUser = CreateTrailUserFromReader(reader);
                }
            }

            return trailUser;
        }

        public TrailUser CreateTrailUser(TrailUser trailUser)
        {
            int newTrailID = 0;

            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO trail_user (trail_id, user_id) OUTPUT INSERTED.trail_user_id VALUES (@TRAILID, @USERID)", conn);
                cmd.Parameters.AddWithValue("@TRAILID", trailUser.TrailID);
                cmd.Parameters.AddWithValue("@USERID", trailUser.UserID);

                newTrailID = Convert.ToInt32(cmd.ExecuteScalar());

            }

            return GetTrailUser(newTrailID);
        }

        private TrailUser CreateTrailUserFromReader(SqlDataReader reader)
        {
            TrailUser trailUser = new TrailUser();

            trailUser.TrailUserID = Convert.ToInt32(reader["trail_user_id"]);
            trailUser.TrailID = Convert.ToInt32(reader["trail_id"]);
            trailUser.UserID = Convert.ToInt32(reader["user_id"]);

            return trailUser;
        }
    }
}
