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
            <div>
                <review-form/>
            </div>
            <div id="reviews-section">
                <h5> Reviews From Other Hoppers </h5>
                <review-card />
            </div>
        </div>
  
</div>
</template>

<script>
import ReviewForm from '../components/ReviewForm.vue';
import ReviewCard from '../components/ReviewCard.vue'
import BreweryAPI from "../services/BreweryService"

export default {
  name: "brewerydetail",
  components: { ReviewForm, ReviewCard },

  data(){
      return{
          brewery: {},
          beer: []
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
</style>