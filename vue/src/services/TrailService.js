import axios from 'axios';

export default {

  getTrailsByUser(userID) {
    return axios.post(`/users/trails/${userID}`)
  }

}
