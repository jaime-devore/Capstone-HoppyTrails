<template>
<div class="brewery-details">
  
    
        <div class="picture">
            <div id="info-block">
                <h1>{{brewery.name}}</h1>
                <img class="image" v-bind:src="brewery.image" />
            </div>
        </div>
        <div class="info">
            <div id="quick-info">
                <p><i class="bi bi-telephone-fill"></i><span class="fw-bold" >  PHONE: </span>{{brewery.phoneNumber}}</p>
                <p><i class="bi bi-laptop"></i><span class="fw-bold" > WEBSITE: </span>{{brewery.webSite}}</p>
                <p><i class="bi bi-building"></i><span class="fw-bold" > ADDRESS:</span> {{brewery.address}}</p>
            </div>
        </div>
     
        <div class="about">
            <h2>About</h2>
            <p id="about-section">{{brewery.about}}</p>
        </div>
        <div class="beer">
            <h2>Featured Beers</h2>
            <ul class="beer-list">
                <li v-for="b in beer" v-bind:key="b.beerid"> <strong>{{b.name}}</strong> -- {{b.type}} -- {{b.abv}}% ABV </li>
            </ul>
        </div>
       
    
    
        <div class="reviews">
            <div class="button-div">
        <button class="button" v-on:click="forceSignIn()">
          <router-link v-bind:to="{name: 'reviewformdisplay', params: {id: brewery.breweryId}}">
      <span class= "link-button">Leave A Review</span>
          </router-link>
      </button>
            </div>
            

            <div id="reviews-section">
                <h5> Reviews From Other Hoppers </h5>
                <review-card/>
            </div>
        </div>
  
</div>
</template>

<script>

import ReviewCard from '../components/ReviewCard.vue'
import BreweryAPI from "../services/BreweryService"

export default {
  name: "brewerydetail",
  components: { ReviewCard },

  data(){
      return{
          brewery: {},
          beer: []
      }
  },
  methods:{
      forceSignIn(){
          if(this.$store.state.user == {}){
              this.$route.push(`/login`);
          } else {
              this.$route.push(`/brewerydetail/${this.$route.params.id}/reviewformdisplay`)
          }
      }
  },

 created(){
        BreweryAPI.getBreweryById(this.$route.params.id).then((response) => {
            this.brewery = response.data;
        }),

        BreweryAPI.getBeersByBreweryId(this.$route.params.id).then((response) => {
            this.beer = response.data;
        })

    }
}
</script>

<style scoped>
.brewery-details{
    
    padding: 7px;
    display: grid;
    grid-auto-columns: 1fr 1fr;
    height: 100fr;
    grid-template-areas: 
    "picture picture"
    "info info"
    "beer about"
    "reviews reviews";
    gap: 7px;
}
.picture{
    grid-area: picture;
    
}
.info{
    grid-area: info;
}
.beer{
    grid-area: beer;
    height: 60vh;
 display: flex;
 flex-direction: column;
  color:white;
  background-color: #2a453d;
  padding: 20px;
  position: relative;
  width: 100%; 
  text-align: center;
  justify-content: space-evenly;
  border-radius: 2%;
  outline: 10px solid white;
  outline-style: inset;
  outline-offset: -30px;
}
.about{
    grid-area: about;
    height: 60vh;
    display: flex;
    flex-direction: column;
  color:#2a453d;
  background-color: white;
  margin: auto;
  position: relative;
  width: 100%; 
  text-align: center; 
  outline: 10px solid #2a453d;
  outline-style: inset;
  outline-offset: -30px;
  justify-content: space-evenly;
  border-radius: 2%;
}
.reviews{
    grid-area: reviews;
}
.brewery-details h2{
    font-family: 'Leckerli One';
    
}

.beer-list{
    list-style: none;
    font-size: x-large;
}
#quick-info {
    padding-top: 15px;
    display: block;
    text-align: center;
}
#quick-info > p {
    display: inline;
    margin-left: 50px;
}

#about-section{
    display: block;
    margin-left: 50px;
    margin-right: 50px;
    font-size: larger;
}

#reviews-section > h5 {
    margin-left: 15px;
    text-decoration: underline;
}

#info-block{
    display: flex;
    flex-direction: column;
    align-items: center;
}

#info-block > img {
    width: 60rem;
    margin-left: auto;
    margin-right: auto;
    padding-bottom: 20px;
}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: white;
  border: none;
  color: #2a453d;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  border: 5px solid #2a453d;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
.button-div{
  display: flex;
  justify-content: space-around;
}
.link-button{
  color: #2a453d
}
</style>