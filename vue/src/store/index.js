import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    trails: [
      {
        name: 'Family Friendly',
        id: 101,
        map_img: '',
        breweries: [
          {
            name: 'Bookhouse Brewing LLC',
            address: '1526 W 25th St',
            brewery_id: 1000
          },
          {
            name: 'Nano Brew Cleveland',
            address: '1859 W 25th St',
            brewery_id: 1014
          },
          {
            name: 'Market Garden Brewery',
            address: '1947 W 25th St', 
            brewery_id: 1012
          },
          {
            name: 'Platform Beer Co',
            address: '4125 Lorain Ave', 
            brewery_id: 1016
          }
        ]
      },
      {
        name: 'Pet Friendly',
        id: 102,
        map_img: '',
        breweries: [
          {
            name: 'Hansa Brewery',
            address: '2717 Lorain Ave', 
            brewery_id: 1010
          },
          {
            name: 'Great Lakes Brewing Co',
            address: '2516 Market Ave', 
            brewery_id: 1009
          },
          {
            name: 'Masthead Brewing Co',
            address: '1261 Superior Ave', 
            brewery_id: 1013
          },
          {
            name: 'Hofbrauhaus Cleveland',
            address: '1550 Chester Ave', 
            brewery_id: 1011
          }
        ]
      },
      {
        name: 'Patios',
        id: 103,
        map_img: '',
        breweries: [
          {
            name: 'The Jolly Scholar',
            address: '11111 Euclid Ave', 
            brewery_id: 1024
          },
          {
            name: 'Goldhorn Brewery',
            address: '1361 E 55th St', 
            brewery_id: 1008
          },
          {
            name: 'Noble Beast Brewing Co',
            address: '1470 Lakeside Ave', 
            brewery_id: 1015
          },
          {
            name: 'Terrestrial Brewing Company',
            address: '7524 Father Frascati Dr', 
            brewery_id: 1022
          }
        ]
      },
      {
        name: 'Budget',
        id: 104,
        map_img: '',
        breweries: [
          {
            name: 'The Cleveland Brewery',
            address: '777 E 185th St', 
            brewery_id: 1023
          },
          {
            name: 'Hofbrauhaus Cleveland',
            address: '1550 Chester Ave', 
            brewery_id: 1011
          },
          {
            name: 'Forest City Brewery',
            address: '2135 Columbus Rd', 
            brewery_id: 1007
          },
          {
            name: 'Brick and Barrel',
            address: '1844 Columbus Rd', 
            brewery_id: 1003
          }
        ]
      }
    ]
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    }
  }
})
