<template>
  <div class="view-root row p-1">
    <h1>List Of All Breweries</h1>

<div class="flip-card col-lg-3" v-for="brewery in allBreweries" v-bind:key="brewery.id">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      
        <!-- *********** FRONTCARD *********** -->
            <div class="">
                    <div class="card border border-secondary w-100 p-2" >
                        <div class="card-header  bg-success text-white ">
                            <h5 class="card-title">{{brewery.name}}</h5>
                        </div>
                        <div class="card-body">
                            <img class="img-thumbnail" v-bind:src="brewery.image" />
                            
                            <p><span class="fw-bold" >PHONE: </span>{{brewery.phoneNumber}}</p>
                            <p><span class="fw-bold" >ADDRESS:</span> {{brewery.address}}</p>
                            
                        </div>
                    </div>
                </div><!-- end of BS card -->


      
    </div>
    <div class="flip-card-back">
      

            <div class="bckCard">
                    <div class="card border border-secondary w-100 p-2" >
                        <div class="card-header ">
                            <h5 class="card-title"> {{brewery.name}}</h5>
                        </div>
                        <div class="card-body">
                             <h4 class="fw-bold" > ABOUT</h4>
                            <p class="card-text mh-25 ">{{brewery.about}}</p>
                            
                        </div>
                    </div>
                </div>






    </div>
  </div>
</div>


    
  </div>
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
  width: 300px;
  height: 400px;
  perspective: 1000px;
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
</style>