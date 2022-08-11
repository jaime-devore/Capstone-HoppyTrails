import axios from 'axios';

export default {

getAllBreweries(){
    return axios.get('/brewery')
},

getBreweryById(id){
    return axios.get(`/brewery/${id}`)
}
}