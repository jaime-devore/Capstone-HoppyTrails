import axios from 'axios';

export default {

getBrewReviews(breweryId){
    return axios.get(`/review/breweries/${breweryId}`)
},

getUser(reviewID){
    return axios.get(`/users/reviews/${reviewID}`)
},

getAllReviewsByUserId(userID){
    return axios.get(`/review/users/${userID}`)
}
}