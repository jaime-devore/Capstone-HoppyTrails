<template>
  <div class="view-root row p-1">
    <h1>List Of All Breweries</h1>

    <div class="col-lg-3" v-for="(brewery, index) in allBreweries" v-bind:key="brewery.id">
        <div class="card border border-secondary w-100 p-2" >
            <div class="card-header  bg-success text-white ">
                <h5 class="card-title"> {{index}} - {{brewery.name}}</h5>
            </div>
            <div class="card-body">
                <img class="img-thumbnail" v-bind:src="brewery.image" />
                
                <p><span class="fw-bold" >PHONE: </span>{{brewery.phoneNumber}}</p>
                <p><span class="fw-bold" >WEBSITE: </span>{{brewery.webSite}}</p>
                <p><span class="fw-bold" >ADDRESS:</span> {{brewery.address}}</p>
                <h4 class="fw-bold" > ABOUT</h4>
                <p class="card-text">{{brewery.about}}</p>
                
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
            allBreweries: []
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

</style>