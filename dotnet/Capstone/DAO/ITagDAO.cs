using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;


namespace Capstone.DAO
{
    public interface ITagDAO
    {
        //METHODS
        //I want to get a single Tag by ID
        public Tag GetTagByTagID(int tagID);

        //I want to get all tags by ID
        public List<Tag> GetAllTags();

        //I want to get all Breweries with a certain tag ID
        public List<Brewery> GetBreweriesByTagID(int tagID);
    }
}
