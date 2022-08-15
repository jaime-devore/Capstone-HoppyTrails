
<template>
<div class="trails">
    
<div class="container-fluid bgpic">
   <div id="cards-div" class="container-fluid">
     <div class="row pt-5">
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  bg-success text-white ">
             <h5 class="card-title"><router-link :to="{ name: 'traildetails', params: { trailID: 101 } }"> Family Friendly</router-link></h5>
           </div>
           <div class="card-body">
             <ul class="list-group list-group-flush">
               <li class="list-group-item">
                 Bookhouse Brewing LLC,
                 <span class="mx-auto">1526 W 25th St </span>
                 <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span>
               </li>
               <li class="list-group-item">Nano Brew Cleveland,
                 <span class="mx-auto">1859 W 25th St </span>
                 <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
               <li class="list-group-item">Market Garden Brewery,
                 <span class="mx-auto">1947 W 25th St </span>
                 <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
               <li class="list-group-item">Platform Beer Co,
                 <span class="mx-auto">4125 Lorain Ave </span>
                 <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             </ul>
<!--             <a href="#" class="btn btn-success">Go somewhere</a>-->
           </div>
         </div>
       </div>
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  bg-success text-white ">
              <h5 class="card-title"><router-link :to="{ name: 'traildetails', params: { trailID: 102 } }">Pet Friendly</router-link></h5>
             </div>
           <div class="card-body">
             <ul class="list-group list-group-flush">
             <li class="list-group-item">
               Hansa Brewery,
               <span class="mx-auto">2717 Lorain Ave </span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span>
             </li>
             <li class="list-group-item">Great Lakes Brewing Co,
               <span class="mx-auto">2516 Market Ave </span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Masthead Brewing Co,
               <span class="mx-auto">1261 Superior Ave </span>
               <span class="text-warning text-end" >
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Hofbrauhaus Cleveland,
               <span class="mx-auto">1550 Chester Ave </span>
               <span class="text-warning text-end" >
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             </ul>
           </div>
         </div>
       </div>
     </div>

     <div class="row pt-5">
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  bg-success text-white ">
             <h5 class="card-title"><router-link :to="{ name: 'traildetails', params: { trailID: 103 } }">Patios</router-link></h5>
           </div>
           <div class="card-body">
             <ul class="list-group list-group-flush">
             <li class="list-group-item">
               The Jolly Scholar,
               <span class="mx-auto">11111 Euclid Ave </span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span>
             </li>
             <li class="list-group-item">Goldhorn Brewery,
               <span class="mx-auto">1361 E 55th St </span>
               <span class="text-warning text-end" >
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Noble Beast Brewing Co,
               <span class="mx-auto">1470 Lakeside Ave </span>
               <span class="text-warning text-end" >
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Terrestrial Brewing Company,
               <span class="mx-auto">7524 Father Frascati Dr </span>
               <span class="text-warning text-end" >
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             </ul>
           </div>
         </div>
       </div>
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  bg-success text-white ">
             <h5 class="card-title"><router-link :to="{ name: 'traildetails', params: { trailID: 104 } }">Budget</router-link></h5>
           </div>
           <div class="card-body">
             <ul class="list-group list-group-flush">
             <li class="list-group-item">
               The Cleveland Brewery,
               <span class="mx-auto">777 E 185th St </span>
               <span class="text-warning text-end" >
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span>
             </li>
             <li class="list-group-item">Hofbrauhaus Cleveland,
               <span class="mx-auto">1550 Chester Ave </span>
               <span class="text-warning text-end" >
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Forest City Brewery,
               <span class="mx-auto">2135 Columbus Rd </span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Brick and Barrel,
               <span class="mx-auto">1844 Columbus Rd </span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             </ul>
           </div>
         </div>
       </div>
     </div>
   </div>
   </div><!-- end of cards container -->




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


</style>
