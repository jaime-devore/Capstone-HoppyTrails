<template>
  <div class="home">
      <div class="bgpic">
        <h1 class="about">Hoppy Trails To You!</h1>
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
  height: 75vh;
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover; /* Resize the background image to cover the entire container */
}
.about{
  color:white;
  background-color: #2a453d;
  margin: auto;
  position: relative;
  top: 40%;
  width: 90%; 
  text-align: center;
  border: 6px solid white;
}
</style>