using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Brewery
    {
        public int BreweryId { get; set; }
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public string About { get; set; }
        public string WebSite { get; set; }
        public string Address { get; set; }
        public string Image { get; set; }
        public string Hours { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
    }
}
