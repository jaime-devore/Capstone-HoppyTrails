using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class TagDAO : ITagDAO
    {
        //FIELDS
        //a field for the connection string
        private readonly string connectionString;

        //CONSTRUCTOR
        public TagDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        //METHODS
        //I need a method to get a Tag based on ID. When we allow users to search by Tag, they will select a tag from a list, which will call this method and return the tag object so we can read the type
        public Tag GetTagByTagID(int tagID)
        {
            Tag tag = new Tag();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM tag WHERE tag_id = @TAGID", conn);
                cmd.Parameters.AddWithValue("@TAGID", tagID);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    tag = CreateTagFromReader(reader);
                }
            }

            return tag;
        }

        public List<Tag> GetAllTags()
        {
            List<Tag> allTags = new List<Tag>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM tag", conn);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Tag tag = CreateTagFromReader(reader);
                    allTags.Add(tag);
                }
            }

            return allTags;
        }


        public List<Brewery> GetBreweriesByTagID(int tagID)
        {
            List<Brewery> allBreweries = new List<Brewery>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM brewery JOIN brewery_tag ON brewery_tag.brewery_id = brewery.id JOIN tag ON tag.tag_id = brewery_tag.tag_id WHERE tag.tag_id = @TAGID", conn);
                cmd.Parameters.AddWithValue("@TAGID", tagID);

                SqlDataReader reader = cmd.ExecuteReader();

                while( reader.Read() )
                {
                    Brewery brewery = CreateBreweryFromReader(reader);

                    allBreweries.Add(brewery);
                }
            }
            return allBreweries;
        }
        
        private Tag CreateTagFromReader(SqlDataReader reader)
        {
            Tag tag = new Tag();

            tag.TagId = Convert.ToInt32(reader["tag_id"]);
            tag.TagType = Convert.ToString(reader["type"]);

            return tag;
        }

        private Brewery CreateBreweryFromReader(SqlDataReader reader)
        {
            Brewery brewery = new Brewery();
            brewery.BreweryId = Convert.ToInt32(reader["id"]);
            brewery.Name = Convert.ToString(reader["name"]);
            brewery.PhoneNumber = Convert.ToString(reader["phone"]);
            brewery.About = Convert.ToString(reader["about"]);
            brewery.WebSite = Convert.ToString(reader["website"]);
            brewery.Address = Convert.ToString(reader["address"]);
            brewery.Image = Convert.ToString(reader["image"]);
            brewery.Hours = Convert.ToString(reader["hours"]);
            brewery.City = Convert.ToString(reader["city"]);
            brewery.State = Convert.ToString(reader["state"]);
            brewery.ZipCode = Convert.ToString(reader["zip"]);

            return brewery;
        }

    }
}
