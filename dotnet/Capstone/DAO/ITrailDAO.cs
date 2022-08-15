using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface ITrailDAO
    {
        public Trail GetAllTrails();
        public Trail GetTrailByTrailID(int trailID);
        public Trail CreateNewTrail(Trail trail);
        public Trail UpdateTrail(Trail trail);

    }
}
