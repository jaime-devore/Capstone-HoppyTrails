<template>
  <div>
   <div><h1>{{trail.trailName}}</h1></div>
   <button>I've Done This One!</button>
   <div v-for="b in breweries" v-bind:key="b.id">
     <div id="brewery-logo"><img :src="b.logo"/></div>
   </div>
  </div>
</template>

<script>

import BreweryAPI from '../services/BreweryService'
import TrailAPI from '../services/TrailService'

export default {
  name: 'trail-details',
  
  data() {
    return {
      trail: {trailName: undefined},
      breweries: undefined
    }
  },

  created() {

    BreweryAPI.getBreweriesByTrailId(this.$route.params.trailID).then((response) => {
        this.breweries = response.data;
    }),

    TrailAPI.getTrailByTrailID(this.$route.params.trailID).then((response) => {
      this.trail = response.data;
    })

  }
}
</script>

<style scoped>


</style>