using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Route
    {
        public string Name { get; set; }
        public string Image { get; set; }
        public List<Brewery> BreweryRoute { get; set; }
    }
}
