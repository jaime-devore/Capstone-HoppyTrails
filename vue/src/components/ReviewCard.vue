<template>
  <div>
      <!-- <div v-for="r in review" v-bind:key="r.id" id="card">
        <div id="username-display">{{ usernameDisplay(r.reviewId) }}</div>
        <span v-for="n in getStars(r)" v-bind:key="n"><i class="bi bi-star-fill"></i></span>
        <span v-if="getHalfStars(r)"><i class="bi bi-star-half"></i></span>
        <div> {{ r.content }} </div>
      </div> -->


  <div class="row">
    <div class="col-lg-4 mb-2" v-for="r in review" v-bind:key="r.id">


        <div class="card">
            <div class="card-header">
                <h5 class="">
                    <img v-bind:src="'https://avatars.dicebear.com/api/bottts/'+ usernameDisplay(r.reviewId) +'.svg'"
                        width="54px" height="54px" alt="avatar" 
                        class="border border-dark border-3 rounded-circle p-1 align-center me-4"     
                    />
                    {{ usernameDisplay(r.reviewId) }}
                </h5>
            </div>
            <div class="card-body">
                
                <h6 class="card-subtitle mb-2 d-flex justify-content-between ">
                    <span class="text-muted">{{new Date(r.date).toDateString()}}</span>
                    <div id="star-container">
                        <span v-for="n in getStars(r)" v-bind:key="n" class="text-warning">
                            <i class="bi bi-star-fill"></i>
                        </span>
                        <span v-if="getHalfStars(r)" class="text-warning">
                            <i class="bi bi-star-half"></i>
                        </span>
                    </div>
                </h6>
                <figure>
                    <blockquote class="blockquote">
                        <p class="fs-6"><q>{{r.content}}</q></p>
                    </blockquote>
                    <!-- <figcaption class="blockquote-footer mt-3">
                        {{ usernameDisplay(r.reviewId) }}
                    </figcaption> -->
                </figure>
            </div>
        </div>

    </div>
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

/* div #card {
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
} */

</style>

<!-- stars -->
<!--
        <i class="bi bi-star-fill"></i>
        <i class="bi bi-star-half"></i>
        <i class="bi bi-star"></i>
-->