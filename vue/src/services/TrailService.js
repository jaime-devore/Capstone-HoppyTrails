import axios from 'axios';

export default {

  getTrailsByUser(userID) {
    return axios.get(`/users/trails/${userID}`)
  }

}
