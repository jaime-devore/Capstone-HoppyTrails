<template>
  <div>
    <div>
        <h1>{{brewery.name}}</h1>
        <img class="img-thumbnail" v-bind:src="brewery.image" /> 
            <p><span class="fw-bold" >PHONE: </span>{{brewery.phoneNumber}}</p>
            <p><span class="fw-bold" >WEBSITE: </span>{{brewery.webSite}}</p>
            <p><span class="fw-bold" >ADDRESS:</span> {{brewery.address}}</p>
            <h4> ABOUT</h4>
            <p>{{brewery.about}}</p>
      </div> 
    <div>
        <review-form/>
    </div>
    <div>
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
          brewery: {}
      }
  },

 created(){
      BreweryAPI.getBreweryById(this.$route.params.id).then((response) => {
             this.brewery = response.data;
         });

     }
}
</script>

<style>

</style>