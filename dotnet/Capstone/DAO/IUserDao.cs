using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IUserDao
    {
        User GetUser(string username);
        User AddUser(string username, string password, string role);

        //I want the username associated with a Review
        public User GetUserFromReview(int reviewID);


    }
}
