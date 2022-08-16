using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class TrailUserDAO
    {
        private readonly string connectionString;

        public TrailUserDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
    }
}
