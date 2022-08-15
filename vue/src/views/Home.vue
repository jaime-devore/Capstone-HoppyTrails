<template>
  <div class="home">
      <div class="bgpic"></div>
      <div class="aboutimg"></div>
      <div class="description">
        <h1>About us</h1>
        <h4 class="words">Having a thriving local beer scene is key to any growing city. By drinking locally brewed beer you're keeping money within your community and supporting jobs within your town. That is why we have created a way to enjoy them based on what makes them so great.</h4>
      </div>
      <div class="breweries">
        <h1>Breweries</h1>
        <h4>See a full list of breweries</h4>
        <div class="button-div">
        <button class="button">
      <span>Explore</span>
      </button>
      </div>
      </div>
      <div class="trails">
        <h1>Trails</h1>
        <h4>See trails we think you will like</h4>

      <div class="button-div">
        <button class="button">
      <span>Explore</span>
      </button>
      </div>
      </div>
      <footer class="footer">
        <p>© BrewHaHa LLC, 2022</p>
      </footer>
  </div>
</template>

<script>
window.navigator.geolocation
  .getCurrentPosition(console.log, console.log);
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
.home{
  padding: 7px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    height: 100vh;
    grid-template-areas:
    "pic pic"
    "about sub-pic"
    "breweries trails"
    "footer footer";
    gap: 7px;
}

.bgpic{
  grid-area: pic;
}
.description{
  grid-area: about;
}
.aboutimg{
  grid-area: sub-pic;
}
.breweries{
  grid-area: breweries;
}
.trails{
  grid-area: trails;
}
.footer{
  grid-area: footer;
}


.bgpic{
  background-image: url('../img/AleSmith-Tasting-Room.jpg');
  height: 100vh;
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover; /* Resize the background image to cover the entire container */
}
.aboutimg{
  display: flex;
  background-image: url('../img/ammon-20180716-old_brewery-1024.jpg');
  border-radius: 1%;
  height: 100%;
  background-size: cover;
  border: 25px solid white;
}
.description{
  height: 60vh;
 display: flex;
 flex-direction: column;
  color:white;
  background-color: #2a453d;
  padding: 20px;
  position: relative;
  width: 100%; 
  text-align: center;
  justify-content: space-evenly;
  border-radius: 1%;
  outline: 5px solid white;
  outline-style: inset;
  outline-offset: -30px;
  

}
.words{
padding: 40px
}
.breweries{
  height: 60vh;
 display: flex;
 flex-direction: column;
  color:#2a453d;
  background-color: white;
  margin: auto;
  position: relative;
  width: 100%; 
  text-align: center; 
  outline: 5px solid #2a453d;
  outline-style: inset;
  outline-offset: -30px;
  justify-content: space-evenly;
  border-radius: 1%;
}
.trails{
    height: 60vh;
 display: flex;
 flex-direction: column;
  color:white;
  background-color: #2a453d;
  margin: auto;
  position: relative;
  width: 100%; 
  text-align: center; 
  outline: 5px solid white; 
  outline-style: inset;
  outline-offset: -30px;
  justify-content: space-evenly;
  border-radius: 1%;
}
.footer{
text-align: center;
padding-top: 10px;
}
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: white;
  border: none;
  color: #2a453d;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  border: 5px solid #2a453d;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
.button-div{
  display: flex;
  justify-content: space-around;
}

</style>