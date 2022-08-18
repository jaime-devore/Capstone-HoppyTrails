
<template>
<div class="trails">
<link href='https://fonts.googleapis.com/css?family=Leckerli One' rel='stylesheet'>
<div class="container-fluid bgpic">
   <div id="cards-div" class="container-fluid">
     <div class="row pt-5">
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  hoppytrails-bg text-white ">
             <h5 class="card-title">Family Friendly</h5>
           </div>
           <router-link class="ht-link" :to="{ name: 'traildetails', params: { trailID: 6001 } }">
           <div class="card-body">
              <img src="../route-img/fam-route.png" id="fam-route-img"/>
           </div>
           </router-link>
         </div>
       </div>
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  hoppytrails-bg text-white ">
              <h5 class="card-title">Pet Friendly</h5>
             </div>
             <router-link class="ht-link" :to="{ name: 'traildetails', params: { trailID: 6000 } }">
           <div class="card-body">
             <img src="../route-img/pet-route.png" id="pet-route-img"/>
           </div>
           </router-link>
         </div>
       </div>
     </div>

     <div class="row pt-5">
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  hoppytrails-bg text-white ">
             <h5 class="card-title">Patios</h5>
           </div>
           <router-link class="ht-link" :to="{ name: 'traildetails', params: { trailID: 6003 } }">
           <div class="card-body">
             <img src="../route-img/patio-route.png" id="patio-route-img"/>
           </div>
           </router-link>
         </div>
       </div>
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  hoppytrails-bg text-white ">
             <h5 class="card-title">Budget</h5>
           </div>
           <router-link class="ht-link" :to="{ name: 'traildetails', params: { trailID: 6002 } }">
           <div class="card-body">
             <img src="../route-img/budget-route.png" id="budget-route-img"/>
           </div>
           </router-link>
         </div>
       </div>
     </div>
   </div>
   </div><!-- end of cards container -->



<footer class="footer">
        <p>© BrewHaHa LLC, 2022</p>
      </footer>
  </div>
</template>

<script>
export default {
  name: "trails",
  data(){
    return {
      auth: false,

}
  },
  methods: {
  say(message) {
    alert(message)
  }
}
};
</script>
<style scoped>
.card-body > img{
  width: 100%;
  size: 150%
}

#title-div{
  left: 25%;
  top: 30%;
}
.bgpic{
  background-image: url('../img/AleSmith-Tasting-Room.jpg');
  height: 100vh;
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover; /* Resize the background image to cover the entire container */
}
.hoppytrails-bg{
  background-color: #2a453d;
}
.card-title{
  display:flex;
  color: white !important;
  align-items: center;
  justify-content: center;
  font-size: 300%;
  font-family: 'Leckerli One';
}
.footer{
    text-align: center;
padding-top: 10px;
}
</style>
