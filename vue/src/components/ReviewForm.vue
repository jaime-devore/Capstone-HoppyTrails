<template>
  <div id = "row">
      <div class="w-50 mx-auto mt-5 border border-dark rounded " >
        <div class="bg-HunterGreen">
            
            <h3 class="text-white p-3 text-center">
                <img class="img-thumbnail" v-bind:src="brewery.logo" width="48px" />
                
                {{brewery.name}}
            </h3>
        </div>
        <h1 class="h3 mb-3 fw-normal mx-auto text-center"> Leave them a review!</h1>
        <form class="p-4">
            <label for="rating" id="starlabel">Star Rating:</label><br/>
            <fieldset class="rate">
                <input type="radio" id="rating10" name="rating" value="10" v-model="review.Rating" /><label for="rating10" title="5 stars"></label>
                <input type="radio" id="rating9" name="rating" value="9" v-model="review.Rating" /><label class="half" for="rating9" title="4 1/2 stars"></label>
                <input type="radio" id="rating8" name="rating" value="8" v-model="review.Rating" /><label for="rating8" title="4 stars"></label>
                <input type="radio" id="rating7" name="rating" value="7" v-model="review.Rating" /><label class="half" for="rating7" title="3 1/2 stars"></label>
                <input type="radio" id="rating6" name="rating" value="6" v-model="review.Rating" /><label for="rating6" title="3 stars"></label>
                <input type="radio" id="rating5" name="rating" value="5" v-model="review.Rating" /><label class="half" for="rating5" title="2 1/2 stars"></label>
                <input type="radio" id="rating4" name="rating" value="4" v-model="review.Rating" /><label for="rating4" title="2 stars"></label>
                <input type="radio" id="rating3" name="rating" value="3" v-model="review.Rating" /><label class="half" for="rating3" title="code1 1/2 stars"></label>
                <input type="radio" id="rating2" name="rating" value="2" v-model="review.Rating" /><label for="rating2" title="1 star"></label>
                <input type="radio" id="rating1" name="rating" value="1" v-model="review.Rating" /><label class="half" for="rating1" title="1/2 star"></label>
            </fieldset>
            <div class="form-floating">
                <!-- <label for="review-body">Review:</label>
                
                <textarea class="form-control" 
                    id="reviewContentArea" 
                    v-model="review.Content"
                    rows="10">
                </textarea> -->

            <div class="form-floating">
                <textarea class="form-control"  
                    v-model="review.Content"
                placeholder="Leave a comment here" 
                id="review-body" 
                style="height: 100px"></textarea>
                <label for="review-body">Comments</label>
            </div>




            </div>
            <div class="container mt-3">
                <button v-on:click.prevent="submitReview()" class=" me-3 btn rounded-pill btn-outline-dark">Submit!</button> 
                <button v-on:click="cancelReview()"  class="btn rounded-pill btn-outline-dark">Cancel</button>
            </div>
        </form>
      </div><!-- form container -->
  </div><!-- end of root row -->
</template>

<script>

import ReviewAPI from '../services/ReviewService'
import BreweryAPI from "../services/BreweryService"

export default {
    name: "review-form",

    data(){
        return{
        brewery: {},
        review:{
  
            BreweryId: this.$route.params.id,
            UserId: this.$store.state.user.userId,
            Rating: undefined,
            Content: ''
        }
      }
    }, 
    created(){
            BreweryAPI.getBreweryById(this.$route.params.id).then((response) => {
            this.brewery = response.data;
        })
    },

    methods: {
        cancelReview(){
            this.$router.push(`/brewerydetail/${this.$route.params.id}`);
        },
        
        
        submitReview(){
            
            let newReview = {
            ReviewId: 0,
            BreweryId: Number(this.$route.params.id),
            Rating: Number(this.review.Rating),
            Content: this.review.Content,
            UserId: Number(this.$store.state.user.userId)
           
            }

            ReviewAPI
            .postNewReview(newReview)
            .then(response=> {
                if(response.status === 201){
                    this.$router.push(`/brewerydetail/${this.$route.params.id}`);
                }
            })
            .catch((error) => {
                if(newReview.UserId == null){
                alert(
                    "Review not created. Please sign in."
                )
                console.log(error);
                this.$router.push({name: 'login'});
                }
                else{
                    alert("Review not created.")
                }
        })

            //this.$router.push(`/brewerydetail/${this.$route.params.id}`);
        }

    }
}
</script>

<style>
#review-body {
  
  font-size: 16px;
  resize: none;
}


.bg-HunterGreen{
 background-color: #2a453d;
}
/* Base setup */
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

/* Ratings widget */
.rate {
    display: inline-block;
    border: 0;
}
/* Hide radio */
.rate > input {
    display: none;
}
/* Order correctly by floating highest to the right */
.rate > label {
    float: right;
}
/* The star of the show */
.rate > label:before {
    display: inline-block;
    font-size: 2rem;
    padding: .3rem .2rem;
    margin: 0;
    cursor: pointer;
    font-family: FontAwesome;
    content: "\f005 "; /* full star */
}

/* Half star trick */
.rate .half:before {
    content: "\f089 "; /* half star no outline */
    position: absolute;
    padding-right: 0;
}
/* Click + hover color */
.rate input:checked ~ label, /* color current and previous stars on checked */
.rate label:hover, label:hover ~ label { color: #fff407;  } /* color previous stars on hover */

/* Hover highlights */
.rate input:checked + label:hover, input:checked ~ label:hover, /* highlight current and previous stars */
.rate input:checked ~ label:hover ~ label, /* highlight previous selected stars for new rating */
.rate label:hover ~ input:checked ~ label /* highlight previous selected stars */ { color: #ffc107;  } 

</style>