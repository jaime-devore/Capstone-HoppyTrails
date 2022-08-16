<template>
  <div>
    <!--display the trail name-->
    <h1 id="trail-name">
      {{currentTrail.name}}

    </h1>
    <!--display the trail map image-->
    <h2 id="trail-map">
      Insert Map Image Here
    </h2>
    <!--importing the brewery cards for this trail's breweries-->
    <trail-brewery-card id="brewery-card" v-bind:brewery="brewery" v-for="brewery in currentTrail.breweries" v-bind:key="brewery.id"></trail-brewery-card>
  </div>
</template>

<script>

  import TrailBreweryCard from './TrailBreweryCard.vue'

export default {
  name: 'trail-details',
  components: { TrailBreweryCard },
  //props: ['currentTrail'] which would come from the router-link to the traildetails view instead of coming from the setCurrentTrail method here
  methods:{
    //none of this will be necessary once we switch to pulling the trails from the store within traildetails.vue
    //the trails exist in the store so we need to go get the one with the matching trailID being passed in, except I just hard-coded in 101 for testing
    setCurrentTrailFromStore()
    {
      var currentTrail = this.$store.state.trails.find((t) => {return t.id == 101});
      return currentTrail;
    }
  },
  computed: {
    currentTrail(){
      return this.setCurrentTrailFromStore();
    },

  },
  //upon creation, call the method that pulls the matching trail from the store
  created(){
    this.setCurrentTrailFromStore();
  }

}
</script>

<style scoped>
/* random styling 
#trail-name{
  background-color: red;
  border-color: black;
}
#trail-map{
  background-color: blue;
  border-color: orangered;
}
*/


</style>