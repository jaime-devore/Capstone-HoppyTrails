<template>
  <div class="home">
      <div class="bgpic">
        <h1 class="about">Test Test Test</h1>
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
.about{
  text-align: center;
  color: #2a453d;
  text-size-adjust: 50px;
}
</style>