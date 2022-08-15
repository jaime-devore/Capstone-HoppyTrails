<template>
  <div>
      <div v-for="r in review" v-bind:key="r.id" id="card">
        <div id="username-display">{{ usernameDisplay(r.reviewId) }}</div>
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
            reviewUsers: []
        }
    },

    created() {
        
      ReviewAPI.getBrewReviews(this.$route.params.id).then((response) => {
          this.review = response.data;
          this.review.forEach(r => {
              this.getUsername(r);
          });
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
        },

        getUsername(currentReview){
           let currentUser = {} 
           ReviewAPI.getUser(currentReview.reviewId).then((response) => {
               console.log(response)
               currentUser = response.data;
               currentUser['reviewID'] = currentReview.reviewId
               this.reviewUsers.push(currentUser)
           })
        },

        usernameDisplay(reviewID){
            let displayUser = this.reviewUsers.filter((user) => {
                return user.reviewID == reviewID;
            })
            if(displayUser && displayUser.length > 0){
            return displayUser[0].username;
            } else return '';
        }

    }
}
</script>

<style>

div #card {
  border-radius: 25px;
  border: 2px solid #2a453d;
  margin: 10px;
  padding: 20px;
  width: 95vw;
  height: 1.5rm;
  background: rgb(224, 236, 224);
}

#username-display{
    font-weight: bold;
    text-decoration: underline;
}

</style>

<!-- stars -->
<!--
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-half"></i>
        <i class="bi bi-star"></i>
-->