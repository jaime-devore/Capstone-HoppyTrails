<template>
  <div class="view-root">
    <h1>List Of All Breweries</h1>

        <div class="card border border-secondary" v-for="brewery in allBreweries" v-bind:key="brewery.id">
        <div class="card-header  bg-success text-white ">
             <h5 class="card-title">{{brewery.name}}</h5>
           </div>
        <div class="card-body">
            <!-- <img class="brewery-image" {{brewery.image-url}}/> -->
            <h5 class="card-title">Ipsum Lorum</h5>
            <p><span class="fw-bold" >PHONE: </span>{{brewery.phoneNumber}}</p>
            <p><span class="fw-bold" >WEBSITE: </span>{{brewery.webSite}}</p>
            <p><span class="fw-bold" >ADDRESS:</span> {{brewery.address}}</p>
            <h4 class="fw-bold" > ABOUT</h4>
            <p class="card-text">{{brewery.about}}</p>
            <div class="" > 


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
  
    
    created(){
        BreweryAPI.getAllBreweries().then((response) => {
            this.allBreweries = response.data;
        });

    }

};
</script>


<style scoped>

</style>