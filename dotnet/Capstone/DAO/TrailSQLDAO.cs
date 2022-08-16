using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class TrailSQLDAO: ITrailDAO
    {
        private readonly string connectionString;

        public TrailSQLDAO(string dbCOnnectionString)
        {
            connectionString = dbCOnnectionString;
        }
        public List<Trail> GetAllTrails()
        {
            List<Trail> allTrails = new List<Trail>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM trails", conn);

                SqlDataReader reader = cmd.ExecuteReader();

                while(reader.Read())
                {
                    Trail trail = CreateTrailFromReader(reader);
                    allTrails.Add(trail);
                }
            }

            return allTrails;
        }

        public Trail GetTrailByTrailID(int trailID)
        {
            Trail trail = new Trail();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM trails WHERE trail_id = @TRAILID", conn);
                cmd.Parameters.AddWithValue("@TRAILID", trailID);

                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    trail = CreateTrailFromReader(reader);
                }
            }

            return trail;
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

        public void CreateTrailUserForCompletedTrails(int trailID, int userID)
        {

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO trail_user (trail_id, user_id) OUTPUT.INSERTED trail_user_id VALUES (trail_id = @TRAILID, user_id = @USERID", conn);
                cmd.Parameters.AddWithValue("@TRAILID", trailID);
                cmd.Parameters.AddWithValue("@USERID", userID);
            }
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
