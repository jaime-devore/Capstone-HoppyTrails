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
        public Trail GetAllTrails()
        {
            Trail trail = new Trail();
        }
        public Trail GetTrailByTrailID(int trailID);
        public Trail CreateNewTrail(Trail trail);
        public Trail UpdateTrail(Trail trail);
    }
}
