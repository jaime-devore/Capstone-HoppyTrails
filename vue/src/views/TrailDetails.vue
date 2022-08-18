<template>
  <div>
   <span id="title"><h1>{{trail.trailName}}</h1></span>
   <div id="map">
      <img class="" width="600px"  height="250px"
              v-if="trail.trailName == 'Family Friendly'"
              src="../img/familyfriendly.png"  />


      <img class="" width="600px"  height="250px"
              v-if="trail.trailName == 'Pet Friendly'"
              src="../img/PetFriendly.png"  />
              
              <img class="" width="600px"  height="250px"
              v-if="trail.trailName == 'Patio'"
              src="../img/Patio.png"  />

              <img class="" width="600px"  height="250px"
              v-if="trail.trailName == 'Budget'"
              src="../img/budgetroute.png"  />


   </div>
   <div class="container d-flex justify-content-center">
      <span class="me-2 " v-if="trailCompleted">
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
          <circle class="path circle" fill="none" stroke="#73AF55" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1"/>
          <polyline class="path check" fill="none" stroke="#73AF55" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="100.2,40.2 51.5,88.8 29.8,67.5 "/>
        </svg>
      </span>

      <span id="button-span">
        <button class="btn rounded-pill text-white done" disabled v-if="trailCompleted">
              I've Done This One!
            </button>
          <button class="text-white btn rounded-pill" 
            v-else
            v-on:click="postCompleted()">
              Mark As Completed
            </button>
            
        </span>
   </div>

   <div id="brewery-cards">
    <div id="card-a" class="card">
      <div id="header"><img src="../img/pin-A.png" id="pin"><h3>{{breweries[0].name}}</h3></div>
      <div id="logo"><router-link v-bind:to="{name: 'brewerydetail', params: {id: breweries[0].breweryId}}" ><img :src="breweries[0].logo" width="200px"></router-link></div>
    </div>
    <div id="card-b" class="card">
      <div id="header"><img src="../img/pin-b.png" id="pin"><h3>{{breweries[1].name}}</h3></div>
      <div id="logo"><router-link v-bind:to="{name: 'brewerydetail', params: {id: breweries[1].breweryId}}"><img :src="breweries[1].logo" width="200px"></router-link></div>
    </div>
    <div id="card-c" class="card">
      <div id="header"><img src="../img/pin-c.png" id="pin"><h3>{{breweries[2].name}}</h3></div>
      <div id="logo"><router-link v-bind:to="{name: 'brewerydetail', params: {id: breweries[2].breweryId}}"><img :src="breweries[2].logo" width="200px"></router-link></div>
    </div>
    <div id="card-d" class="card">
      <div id="header"><img src="../img/pin-d.png" id="pin"><h3>{{breweries[3].name}}</h3></div>
      <div id="logo"><router-link v-bind:to="{name: 'brewerydetail', params: {id: breweries[3].breweryId}}"><img :src="breweries[3].logo" width="200px"></router-link></div>
    </div>
   </div>
  </div>
</template>

<script>

import BreweryAPI from '../services/BreweryService'
import TrailAPI from '../services/TrailService'

export default {
  name: 'trail-details',
  
  data() {
    return {
      trail: {},
      trailCompleted: false,
      completedTrails:[],
      comp: {
        trailID: undefined,
        userID: undefined,
      },
      loadingDone: false,
      breweries: [],
      userTrails: []
    }
  },
  methods:{

      postCompleted(){
              this.comp.trailID = this.$route.params.trailID;
              this.comp.userID = this.$store.state.user.userId;
            if(this.comp.userID != null){

            TrailAPI.createCompletedTrail(this.comp).then((response) =>{
                if(response.status == 201){
                  this.trailCompleted = true;
                }
            
            })}
            else{
              alert("Please sign in.")
            }
      }
  },

  created() {

    BreweryAPI.getBreweriesByTrailId(this.$route.params.trailID).then((response) => {
        this.breweries = response.data;
    }),

    TrailAPI.getTrailByTrailID(this.$route.params.trailID).then((response) => {
      this.trail = response.data;
    }),

    TrailAPI.getTrailsByUser(this.$store.state.user.userId)
        .then((response) => {
            this.userTrails = response.data;

            this.userTrails.forEach((trail) =>{
                  if(trail.trailID == this.$route.params.trailID ){
                    this.trailCompleted = true;
                  }
                });


            this.loadingDone = true;
        }) 


    

  }
}
</script>

<style scoped>

svg {
  width: 38px;
}

.path {
  stroke-dasharray: 1000;
  stroke-dashoffset: 0;
  }
  .circle {
    -webkit-animation: dash .9s ease-in-out;
    animation: dash .9s ease-in-out;
  }
  .line {
    stroke-dashoffset: 1000;
    -webkit-animation: dash .9s .35s ease-in-out forwards;
    animation: dash .9s .35s ease-in-out forwards;
  }
  .check {
    stroke-dashoffset: -100;
    -webkit-animation: dash-check .9s .35s ease-in-out forwards;
    animation: dash-check .9s .35s ease-in-out forwards;
  }

.done{
  /* visibility: hidden; */
  background-color: darkgray !important;
  color: white;
}

#title{
  display: flex;
  font-family: 'Leckerli One';
  color: #2a453d;
  justify-content: center;
}

#title > h1{
  background-color: rgb(224, 236, 224);
  padding: 8px;
  border-radius: 20px;
}

#map{
  display: flex;
  justify-content: center;
}

#button-span{
  display: flex;
  justify-content: center;
  font-family: 'Leckerli One', cursive;
  opacity: 0.9
}
#button-span:hover{
  opacity: 1;
}
  
#button-span > button{
  background-color: #2a453d
}
#button-span > button > p{
  font-size: 175%;
  font-family: 'Leckerli One';
  color: white;
  margin: 0px;
}
#brewery-cards{
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas:
  "a b"
  "c d";
  gap: 20px;
  padding: 10px;
  justify-items: center;
}

#card-a{
  grid-area: a;
}

#card-b{
  grid-area: b;
}

#card-c{
  grid-area: c;
}

#card-d{
  grid-area: d;
}

.card{
  border: 4px solid #2a453d;
  border-radius: 20px;
  background-color: white;
  padding: 0px;
  width: 90%;
}

#header{
  display: flex;
  flex-direction: row;
  background-color: rgb(224, 236, 224);
  align-items: center;
  justify-content: center;
  padding: 15px;
  margin: 0px;
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  border-bottom: 4px solid #2a453d;
}

#pin{
  display: flex;
  height: 50px;
}

#logo{
  background-color: white;
  margin-left: auto !important;
  margin-right: auto !important;
  object-fit: cover;
  border-radius: 20px;
}



@-webkit-keyframes dash {
  0% {
    stroke-dashoffset: 1000;
  }
  100% {
    stroke-dashoffset: 0;
  }
}

@keyframes dash {
  0% {
    stroke-dashoffset: 1000;
  }
  100% {
    stroke-dashoffset: 0;
  }
}

@-webkit-keyframes dash-check {
  0% {
    stroke-dashoffset: -100;
  }
  100% {
    stroke-dashoffset: 900;
  }
}

@keyframes dash-check {
  0% {
    stroke-dashoffset: -100;
  }
  100% {
    stroke-dashoffset: 900;
  }
}
</style>
