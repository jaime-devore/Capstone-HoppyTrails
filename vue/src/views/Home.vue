<template>
  <div class="home">
      <div class="bgpic">
      </div>
  </div>
</template>

<script>

export default {
  
  name: "home",
  data(){
    return {
      auth: false,

}
  },
}
</script>

<style>
.bgpic{
  background-image: url('../img/AleSmith-Tasting-Room.jpg');
  height: 100vh;
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover; /* Resize the background image to cover the entire container */
}
</style>