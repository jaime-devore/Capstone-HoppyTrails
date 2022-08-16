<template>
  <div>
    <trail-details></trail-details>
  </div>
</template>

<script>

import TrailDetails from '../components/TrailDetails.vue'

export default {
  data(){

  },
  components: { TrailDetails },
  //this is where you would match the route.params.trailID to the this.store.state.trails.id so that the trail-details component can take it as a prop upon creation


}
</script>

<style scoped>

</style>