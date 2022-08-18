import axios from 'axios';

export default {

  getTrailsByUser(userID) {
    return axios.get(`/users/trails/${userID}`)
  },

  getTrailByTrailID(trailID) {
    return axios.get(`/trail/${trailID}`)
  },

  createCompletedTrail(comp) {
    return axios.post(`/trailuser`, comp)
  }
}
