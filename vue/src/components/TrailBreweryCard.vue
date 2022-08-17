<template>

  <div>
      <h1 id="brewery-name"><router-link v-bind:to="{name: 'brewerydetail', params: {id: brewery.breweryId}}" >{{brewery.name}}</router-link></h1>
      <h2 id="brewery-address">{{brewery.address}}</h2>
  </div>
  
</template>

<script>

export default {
    name: 'trail-brewery-card',
    props: ['brewery']
}

</script>

<style scoped>
#brewery-name{
  background-color: saddlebrown;
  border-color: gray;
  text-decoration-color: steelblue;
}
#brewery-address{
  background-color: tan;
  border-color: tomato;
  text-decoration-color: chartreuse;
}

</style>