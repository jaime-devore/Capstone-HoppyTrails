using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Capstone.Models
{
    
    public class Review
    {
        public int ReviewId { get; set; }

        [Required(ErrorMessage = "Brewery ID is required.")]
        public int BreweryId { get; set; }

        [Required(ErrorMessage = "Rating is required.")]
        public decimal Rating { get; set; }
        public string Content { get; set; }
        public string BreweryName { get; set; }
        public DateTime Date { get; set; }
        public int UserID { get; set; }
    }
}
