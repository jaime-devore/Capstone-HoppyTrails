<template>

  <div>
      <h1>{{Brewery.name}}</h1>
      <h2>{{Brewery.address}}</h2>
  </div>
  
</template>

<script>

export default {
    name: 'trail-brewery-card',
    props: ['Brewery']
}

</script>

<style>

</style>