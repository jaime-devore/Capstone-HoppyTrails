<template>
    <div class="container">
        <div class="row w-50 mx-auto">
            <h3 class="legend1 rounded-top">Account Details</h3>
            <fieldset class="ht-fieldset border  border-dark rounded">
                
                <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">
                    <i class="bi bi-person-circle fs-4"></i>
                    UserName:
                </label>
                <span class="ms-3">{{$store.state.user.username}}</span>
                <input type="text" class="form-control visually-hidden" 
                    id="formGroupExampleInput" v-bind:value="$store.state.user.username">
                </div>
                <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">
                    <i class="bi bi-envelope fs-4"></i>
                    Email Address
                </label>
                <span class="ms-3">{{$store.state.user.role}}</span>
                <input type="text" class="form-control  visually-hidden" 
                    id="formGroupExampleInput2" v-bind:value="$store.state.user.role">
                </div>
                <div class="py-1">
                    <i class="bi bi-sign-turn-right fs-4"></i>
                    <span class="fw-bold px-2" >Trails Completed: </span>
                    <span class="text-small" >x, y, z</span>
                </div>
            </fieldset>

           <!-- ****************************************************************************** -->

            <!--************************************************************************** -->

        </div><!--end of inner container-->

        <div class="row">
    <div class="col-sm" v-for="review in allReviews" v-bind:key="review.id">


        <div class="card" >
            <div class="card-header">
                <h5 class="">
                    <img v-bind:src="'https://avatars.dicebear.com/api/bottts/'+$store.state.user.username+'.svg'"
                        width="54px" height="54px" alt="avatar" 
                        class="border border-dark border-3 rounded-circle p-1 align-center me-4"     
                    />PLACEHOLDER
                    {{review.brewery}}
                </h5>
            </div>
            <div class="card-body">
                
                <h6 class="card-subtitle mb-2 ">
                    <span class="text-warning text-end" v-html="starrating(review.rating-1)" >
                        
                    </span>
                </h6>
                <figure>
                    <blockquote class="blockquote">
                        <p class="fs-6"><q>{{review.content}}</q></p>
                    </blockquote>
                    <figcaption class="blockquote-footer mt-3">
                        {{$store.state.user.username}}
                    </figcaption>
                </figure>
            </div>
        </div>

    </div>
</div>

    </div><!--end of root container-->
  
</template>

<script>
import ReviewAPI from "../services/ReviewService"
import BreweryAPI from "../services/BreweryService"

export default {
    name: "account",
    data() {
        return{
            allReviews: [],
            stars: [
                '<i class="bi bi-star-half"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star"></i><i class="bi bi-star"></i><i class="bi bi-star"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i><i class="bi bi-star"></i><i class="bi bi-star"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star"></i><i class="bi bi-star"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i><i class="bi bi-star"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i>',
                '<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>',                
            ],
        }
    },
    computed:{
        
    },
    methods:{
        starrating(index){
            return this.stars[index];
        }
        
    },
    created(){
        ReviewAPI.getAllReviewsByUserId(this.$store.state.user.userId)
        .then((response) => {
            this.allReviews = response.data;
        })
        .then(()=>{
            for(const review of this.allReviews){
                // console.log(review.breweryId);
                 BreweryAPI.getBreweryById(review.breweryId)
                    .then((response) => {
                        review.brewery = response.data;
                        // console.log(review.brewery.name);
                    });
                }
        })        

    }

}
</script>

<style scoped>
.ht-fieldset {
border: thick solid #000;
margin: 0;
margin-bottom: 10px;
}
.legend1 {
color: #FFF;
background-color: #2a453d;
font-size: 1.5em;
padding: 5px 0 5px 16px;
width: 100%;
margin-bottom: 0;
}
</style>