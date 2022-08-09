using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IBreweryDAO
    {
        //method to return all breweries
        List<Brewery> GetAllBreweries();

        //method to get a single brewery by Brewery ID
        Brewery GetBreweryByBreweryID(int breweryID);


    }
}
