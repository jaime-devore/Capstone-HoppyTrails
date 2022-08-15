<template>
  <div class="container-fluid">
    <div>
        <h1>{{brewery.name}}</h1>
            <img class="img-thumbnail" v-bind:src="brewery.image" /> 
            <div id="quick-info">
            <p><i class="bi bi-telephone-fill"></i><span class="fw-bold" >  PHONE: </span>{{brewery.phoneNumber}}</p>
            <p><i class="bi bi-laptop"></i><span class="fw-bold" > WEBSITE: </span>{{brewery.webSite}}</p>
            <p><i class="bi bi-building"></i><span class="fw-bold" > ADDRESS:</span> {{brewery.address}}</p>
            </div>
        <h4>ABOUT</h4>
            <p id="about-section">{{brewery.about}}</p>
        <h4>FEATURED BEERS</h4>
            <ul>
                <li v-for="b in beer" v-bind:key="b.beerid"> <strong>{{b.name}}</strong> -- {{b.type}} -- {{b.abv}}% ABV </li>
            </ul>
        
      </div> 
    <div>
        <review-form/>
    </div>
    <div id="reviews-section">
        <h5> Reviews From Other Hoppers </h5>
        <review-card/>
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
    margin-left: 20px;
    margin-right: 20px;
}

#reviews-section > h5 {
    margin-left: 15px;
    text-decoration: underline;
}

#info-block > img {
    display: block;
    width: 50%;
    margin-left: auto;
    margin-right: auto;
    padding-bottom: 20px
}
</style>