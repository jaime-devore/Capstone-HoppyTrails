<template>
    <div class="container">
        <div class="row w-75 mx-auto">
            <h3 class="legend1 rounded-top mx-auto fs-2">
                <img class="image" src="../img/Hop-Only-White.png"  width="42px" />
                Account Details
            </h3>
            <fieldset class="ht-fieldset border  border-dark rounded">
                
                <div class="mb-3">
                    <span for="formGroupExampleInput" class="fw-bold fs-4">
                        <i class="bi bi-person-circle fs-4"></i>
                        UserName:
                    </span>
                    <span class="ms-3 fw-semibold fs-4">{{$store.state.user.username}}</span>
                    
                </div>
                
                <div class="py-1 fs-4 text-center">
                    <i class="bi bi-sign-turn-right fs-4"></i>
                    <span class="fw-bold px-2" >Trails Completed: </span>
                    <!-- <span class="text-small" >x, y, z</span> -->
                </div>
                <div class="py-1 d-flex justify-content-evenly">
                    <div class="" v-for="picName in userTrails" v-bind:key="picName.id">
                        <img class="" width="150px" 
                        v-if='picName.trailID == 6000'
                        src="../img/6000new.png"  />

                        <img class="" width="150px" 
                        v-if='picName.trailID == 6001'
                        src="../img/6001new.png"  />

                        <img class="" width="150px" 
                        v-if='picName.trailID == 6002'
                        src="../img/6002new.png"  />

                        <img class="" width="150px" 
                        v-if='picName.trailID == 6003'
                        src="../img/6003new.png"  />
                        
                  
                    </div>
                    

                </div>
            </fieldset>

           <!-- ****************************************************************************** -->

            <!--************************************************************************** -->

        </div><!--end of inner container-->

        <div class="row">
    <div class="col-lg-4 mb-2" v-for="review in allReviews" v-bind:key="review.id">


        <div class="card">
            <div class="card-header">
                <h5 class="">
                    <img v-bind:src="'https://avatars.dicebear.com/api/bottts/'+$store.state.user.username+'.svg'"
                        width="54px" height="54px" alt="avatar" 
                        class="border border-dark border-3 rounded-circle p-1 align-center me-4"     
                    />
                    {{review.breweryName}}
                </h5>
            </div>
            <div class="card-body">
                
                <h6 class="card-subtitle mb-2 d-flex justify-content-between ">
                    <span class="text-muted">{{new Date(review.date).toDateString()}}</span>
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
// import BreweryAPI from "../services/BreweryService"
import TrailsAPI from "../services/TrailService"

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
            userTrails:[],
            trailPics:{
                    6000: '@/img/6000.png',
                    6001: '@/img/6001.png',
                    6002:  '@/img/6002.png',
                    6003:  '@/img/6003.png'
                 }
                
            
        }
    },
    computed:{
        
    },
    methods:{
        starrating(index){
            return this.stars[index];
        },
        getTrailImage(trailid){
            return this.trailPics[trailid];
        }
        
    },
    created(){
        ReviewAPI.getAllReviewsByUserId(this.$store.state.user.userId)
        .then((response) => {
            this.allReviews = response.data;
        }),
        
        TrailsAPI.getTrailsByUser(this.$store.state.user.userId)
            .then((response) => {
                this.userTrails = response.data;
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
font-family: 'Leckerli One', cursive;
}
</style>