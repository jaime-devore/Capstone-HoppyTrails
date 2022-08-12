<template>
  <div>
      <div v-for="r in review" v-bind:key="r.id" id="card">
        <span v-for="n in getStars(r)" v-bind:key="n"><i class="bi bi-star-fill"></i></span>
        <span v-if="getHalfStars(r)"><i class="bi bi-star-half"></i></span>
        <div> {{ r.content }} </div>
      </div>
  </div>
</template>

<script>

import ReviewAPI from '../services/ReviewService'

export default {
    name: "review-card",

    data(){
        return{
            review: undefined,
        }
    },

    created() {
        
      ReviewAPI.getBrewReviews(this.$route.params.id).then((response) => {
          this.review = response.data;
      });

    },

    methods: {

        getStars(currentReview){
            if(currentReview.rating % 2 === 0){
                return currentReview.rating / 2;
            } else return (currentReview.rating - 1) / 2;
        },

        getHalfStars(currentReview){
            return currentReview.rating % 2 === 1;
        }

    }
}
</script>

<style>

div #card {
  border-radius: 25px;
  border: 2px solid #73AD21;
  margin: 10px;
  padding: 20px;
  width: 95vw;
  height: 1.5rm;
}

</style>

<!-- stars -->
<!--
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-half"></i>
        <i class="bi bi-star"></i>
-->