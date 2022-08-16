<template>
  <div class="view-root p-1">
    <!-- <h1 class="text-center">All Breweries</h1> -->
    
  <div class="row justify-content-center">

      <div class="flip-card col-lg-3 mb-4" v-for="brewery in allBreweries" v-bind:key="brewery.id">
        <div class="flip-card-inner">
          <div class="flip-card-front">
            
              <!-- *********** FRONTCARD *********** -->
                  <div class="bckCard">
                          <div class="card border border-secondary w-100 p-2 h-100" >
                              <div class="card-header bg-HunterGreen text-white ">
                                  <h5 class="card-title">{{brewery.name}}</h5>
                              </div>
                              <div class="card-body brewery-card-body">
                                  <img class="img-thumbnail brewery-card-image mb-3" v-bind:src="brewery.image" />
                                  
                                  <div class="d-flex">
                                      <i class="bi bi-telephone"></i>
                                      <span class="fw-bold px-2" >  PHONE: </span>
                                          <span class="text-small" >{{brewery.phoneNumber}}</span>
                                  </div>
                                  <div class="d-flex">
                                    <i class="bi bi-signpost"></i>
                                    <span class="fw-bold px-2" >  ADDRESS:</span> 
                                        <span class="text-small" >{{brewery.address}}</span>
                                  </div>
                                  <div class="d-flex">
                                    <i class="bi bi-building"></i>
                                    <span class="fw-bold px-2" >  City:</span> 
                                        <span class="text-small" >{{brewery.city}}</span>
                                  </div>
                                  <div class="d-flex">
                                    <span class="fw-bold px-2" >  Star Rating:</span> 
                                        <span class="text-small" >{{brewery.rating}}</span>
                                  </div>
                                  
                              </div>
                          </div>
                      </div><!-- end of BS card -->

            
          </div><!-- end of FRONT -->
          <div class="flip-card-back">
            

                  <div class="bckCard">
                          <div class="card border border-secondary w-100 p-2 h-100" >
                              <div class="card-header ">
                                  <h5 class="card-title"> 
                                    {{brewery.name}}
                                  </h5>
                              </div>
                              <div class="card-body brewery-card-body">
                                  <h4 class="fw-bold" > ABOUT </h4>
                                  <router-link 
                                      v-bind:to="{name: 'brewerydetail', params: {id: brewery.breweryId}}" 
                                      class="h-link" >
                                  <small class="">
                                      
                                      <i class="bi bi-info-circle"></i>
                                      See Details
                                    
                                      </small>
                                      </router-link>
                                  <p class="card-text mh-25 ">{{brewery.about}}</p>
                                  
                              </div>
                          </div>
                      </div>



          </div><!-- end of back card -->
        </div><!-- end of flippy card inner container div -->
      </div><!-- end of Flippy Card container div -->


  </div><!--- END of BS row --->


    
  </div><!-- end of root div --->
</template>

<script>

import BreweryAPI from "../services/BreweryService"



export default {
    
    data() {
        return{
            allBreweries: [],
            hover: false,
        }
    },
  methods: {
  debug (event) {
    console.log(event.target.name)
  }
},
    
    created(){
        BreweryAPI.getAllBreweries().then((response) => {
            this.allBreweries = response.data;
        });

    }

};
</script>


<style scoped>

.flip-card {
  background-color: transparent;
  width: 400px;
  height: 400px;
  perspective: 1000px;
}
.brewery-card-image {
  height: 200px;
  width: 375px;
}

.flip-card-inner {
  position: relative;
  width: 100%;
  height: 400px;
  text-align: center;
  transition: transform 0.6s;
  transform-style: preserve-3d;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}

.flip-card:hover .flip-card-inner {
  
  transform: rotateY(180deg);
  position: absolute;
  
}

.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 300px;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.flip-card-front {
  /* background-color: #bbb; */
  color: black; 
  
}

.flip-card-back {
  /* background-color: #2980b9;
  color: white; */
  transform: rotateY(180deg);
  
}
.bckCard{
  height: 400px;
}
.bg-HunterGreen{
 background-color: #2a453d;
}

.h-link{
  cursor: pointer;
}

.brewery-card-body{
  padding: 8px;
}
</style>