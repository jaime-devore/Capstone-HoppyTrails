import axios from 'axios';

export default {

getBrewReviews(breweryId){
    return axios.get(`/review/breweries/${breweryId}`)
}
}