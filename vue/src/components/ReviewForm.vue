<template>
  <div id = "full-review-field">
      
      <h4 id="review-header"> Leave them a review!</h4>
      <form>
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
        <br/>
        <label for="review-body">Review:</label><br/>
        <input type="text" name="review-body" id="review-body" v-model="review.Content">
        <button v-on:click.prevent="submitReview()">Submit!</button> <button v-on:click="cancelReview()">Cancel</button>
      </form>
  </div>
</template>

<script>

import ReviewAPI from '../services/ReviewService'

export default {
    name: "review-form",

    data(){
        return{
        review:{
  
            BreweryId: this.$route.params.id,
            UserId: this.$store.state.user.userId,
            Rating: undefined,
            Content: ''
        }
      }
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
                alert(
                    "Review not created. Please sign in."
                )
                console.log(error);
                this.$router.push({name: 'login'});
            })

            //this.$router.push(`/brewerydetail/${this.$route.params.id}`);
        }

    }
}
</script>

<style>

form{
    margin-left: 10px;
}

label {
    font-weight: bold;
}

fieldset {
    margin-bottom: -10px;
}

#review-body {
    display: block;
    width: 95vw;
    height: 200px;
    border: 2px solid #2a453d;
    border-radius: 25px;
    margin-bottom: 20px;
}

#review-header {
    display: block;
    padding-top: 10px;
    margin-top: 10px;
    border-top: dashed 4px #2a453d;
    margin-left: 10px;
    margin-right: 10px;

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
input:checked ~ label, /* color current and previous stars on checked */
label:hover, label:hover ~ label { color: #fff407;  } /* color previous stars on hover */

/* Hover highlights */
input:checked + label:hover, input:checked ~ label:hover, /* highlight current and previous stars */
input:checked ~ label:hover ~ label, /* highlight previous selected stars for new rating */
label:hover ~ input:checked ~ label /* highlight previous selected stars */ { color: #ffc107;  } 

</style>