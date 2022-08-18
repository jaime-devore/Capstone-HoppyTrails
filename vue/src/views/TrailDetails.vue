<template>
  <div>
  <link href='https://fonts.googleapis.com/css?family=Leckerli One' rel='stylesheet'>
   <span id="title"><h1>{{trail.trailName}}</h1></span>
   <div id="map">
      <img class="" width="600px"  height="250px"
              v-if="trail.trailName == 'Family Friendly'"
              src="../img/FamilyFriendly.png"  />


      <img class="" width="600px"  height="250px"
              v-if="trail.trailName == 'Pet Friendly'"
              src="../img/PetFriendly.png"  />
              
              <img class="" width="600px"  height="250px"
              v-if="trail.trailName == 'Patio'"
              src="../img/Patio.png"  />

              <img class="" width="600px"  height="250px"
              v-if="trail.trailName == 'Budget'"
              src="../img/BudgetRoute.png"  />


   </div>
   <span id="button-span"><button v-bind:class="{ done: trailCompleted }" v-on:click="postCompleted()"><p>I've Done This One!</p></button></span>
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
      breweries: []
    }
  },
  methods:{

      postCompleted(){
              this.comp.trailID = this.$route.params.trailID;
              this.comp.userID = this.$store.state.user.userId;


            TrailAPI.createCompletedTrail(this.comp).then((response) =>{
                if(response.status == 201){
                  this.trailCompleted = true;
                }

            })
      }
  },

  created() {

    BreweryAPI.getBreweriesByTrailId(this.$route.params.trailID).then((response) => {
        this.breweries = response.data;
    }),

    TrailAPI.getTrailByTrailID(this.$route.params.trailID).then((response) => {
      this.trail = response.data;
    })

    

  }
}
</script>

<style scoped>

.done{
  visibility: hidden;
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
</style>